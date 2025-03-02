/datum/donate_info
	var/name
	var/path_to
	var/cost = 0
	var/special = null
	var/stock = 30

/datum/donate_info/New(name, path, cost, special = null, stock = 30)
	src.name = name
	src.path_to = path
	src.cost = cost
	src.special = special
	src.stock = stock

/client/verb/new_donates_panel()
	set name = "Donations panel"
	set category = "Special Verbs"


	if(!SSticker || SSticker.current_state < GAME_STATE_PLAYING)
		to_chat(src,"<span class='warning'>Not so fast, game didn't started yet!</span>")
		return

	if (!GLOB.donators[ckey]) //If it doesn't exist yet
		load_donator(ckey)

	var/datum/donator/D = GLOB.donators[ckey]
	if(D)
		D.ShowPanel(src)
	else
		to_chat(src,"<span class='warning'>Donate first.</span>")

GLOBAL_LIST_EMPTY(donate_icon_cache)
GLOBAL_LIST_EMPTY(donators)

#define DONATIONS_SPAWN_WINDOW 18000

/datum/donator
	var/ownerkey
	var/money = 0
	var/maxmoney = 0
	var/allowed_num_items = 20

/datum/donator/New(ckey, money)
	..()
	ownerkey = ckey //for fast processing
	src.money = money
	maxmoney = money
	GLOB.donators[ckey] = src


/datum/donator/proc/ShowPanel(mob/user)
	var/list/dat = list("<center>")
	dat += "Hubbologs tribute!"
	dat += "</center>"

	dat += "<HR>"
	dat += "<h3>DONATION MACHINE. Balance: [money]</h3>"
	dat += "<div class='statusDisplay'>"
	dat += "<table>"
	for(var/L in GLOB.donations_list)
		dat += "<tr><td></td><td><center><b>[L]</b></center></td><td></td><td></td></tr>"
		for(var/datum/donate_info/prize in GLOB.donations_list[L])
			dat += "<tr><td><img src='data:image/jpeg;base64,[GetIconForProduct(prize)]'/></td><td>[prize.name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];getdonate=\ref[prize]'>Get</A></td></tr>"
	dat += "</table>"
	dat += "</div>"

	var/datum/browser/popup = new(user, "miningvendor", "Donations Panel", 340, 700)
	popup.set_content(dat.Join())
	popup.open()

/datum/donator/proc/GetIconForProduct(datum/donate_info/P)
	if(GLOB.donate_icon_cache[P.path_to])
		return GLOB.donate_icon_cache[P.path_to]

	var/product = new P.path_to()
	GLOB.donate_icon_cache[P.path_to] = icon2base64(getFlatIcon(product, no_anim = TRUE))
	qdel(product)
	return GLOB.donate_icon_cache[P.path_to]

/datum/donator/Topic(href, href_list)
	var/datum/donate_info/prize = locate(href_list["getdonate"])
	var/mob/living/carbon/human/user = usr

	if(!SSticker || SSticker.current_state < 3)
		to_chat(user,"<span class='warning'>Game didn't started yet!</span>")
		return 0

	if((world.time-SSticker.round_start_time)>DONATIONS_SPAWN_WINDOW && !istype(get_area(user), /area/f13/bar))
		to_chat(user,"<span class='warning'>You should be in Bar.</span>")
		return 0

	if(prize.cost > money)
		to_chat(user,"<span class='warning'>Not enough money.</span>")
		return 0

	if(!allowed_num_items)
		to_chat(user,"<span class='warning'>Maximum items.</span>")
		return 0

	if(!user)
		to_chat(user,"<span class='warning'>You should be alive.</span>")
		return 0

	if(!ispath(prize.path_to))
		return 0

	if(user.stat)
		return 0

	if(prize.stock <= 0)
		to_chat(user,"<span class='warning'>Supplies of <b>[prize.name]</b> ended.</span>")
		return 0

	if(prize.special)
		if (prize.special != user.ckey)
			to_chat(user,"<span class='warning'>This item are specially for <b>[prize.special]</b>.</span>")
			return 0

	var/list/slots = list(
		"backpack" = SLOT_IN_BACKPACK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE,
		"hand" = SLOT_GENERC_DEXTROUS_STORAGE
	)

	prize.stock--

	var/obj/spawned = new prize.path_to(user.loc)
	var/where = null

	if (ishuman(user))
		where = user.equip_in_one_of_slots(spawned, slots, qdel_on_fail=0)

	if (!where)
		to_chat(user,"<span class='info'>Your [prize.name] was created!</span>")
		spawned.anchored = FALSE
	else
		to_chat(user,"<span class='info'>Your [prize.name] was created in [where]!</span>")

	money -= prize.cost
	allowed_num_items--

	ShowPanel(user)
	return

/proc/load_donator(ckey)
	if(!SSdbcore.IsConnected())
		return 0

	var/datum/DBQuery/query_donators = SSdbcore.NewQuery("SELECT round(sum) FROM donations WHERE ckey='[ckey]'")
	query_donators.Execute()
	while(query_donators.NextRow())
		var/money = round(text2num(query_donators.item[1]))
		new /datum/donator(ckey, money)
	qdel(query_donators)
	return 1

/proc/check_donations(ckey)
	if (!GLOB.donators[ckey]) //If it doesn't exist yet
		return 0
	var/datum/donator/D = GLOB.donators[ckey]
	if(D)
		if (D.maxmoney >= 50)
			return 1
	return 0
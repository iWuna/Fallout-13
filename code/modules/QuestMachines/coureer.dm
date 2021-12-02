/obj/machinery/bounty_machine/courier
	/* Available item types and prices. [key] - item type< [value] - item price*/
	var/list/price_list = list()

	/* Will create one copy for each item in price list.*/
	var/list/items_ref_list = list()

	/* How many caps stored in machine */
	var/stored_caps = 0

	/* Only head of this faction will have access to machine */
	var/faction_id = "city"

	/* If true - everyone can use machine. If false - only a faction head */
	var/free_access = 0

	/* In vend mode user can buy items. If not - user can complete quests */
	var/vend_mode = 0

	var/locked = 1

	req_access = list(ACCESS_CLADMEN)
/*
================ Content =====================
*/
/*  COUREER */

/obj/machinery/bounty_machine/courier/post
	name = "Post Terminal"
	desc = "This terminal used by coureer to manage parcels."
	icon_state = "terminal"
	free_access = TRUE
	quest_type = /datum/bounty_quest/faction/courier
	price_list = list(
	/obj/item/parcel = 250,
	/obj/item/crafting/duct_tape = 50
					)

/*
================ Mechanics ======================
*/
/obj/machinery/bounty_machine/courier/New()
	..()
	for(var/i = 1; i <= price_list.len; i++)
		var/target_type = price_list[i]
		var/atom/A = new target_type(src)
		items_ref_list.Add(A)

/obj/machinery/bounty_machine/courier/Destroy()
	for(var/atom/Item in items_ref_list)
		qdel(Item)
	..()

/* Add caps */
/obj/machinery/bounty_machine/courier/proc/add_caps(var/obj/item/stack/f13Cash/bottle_cap/C)
	if(!C) return

	var/mob/character = usr
	if(character.doUnEquip(C))
		var/caps_count = C.amount
		stored_caps += caps_count
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "<span class='notice'>[stored_caps] caps added.</span>")
		qdel(C)

/* Spawn all caps on world and clear caps storage */
/obj/machinery/bounty_machine/courier/proc/remove_all_caps()
	if(stored_caps <= 0)
		return
	var/obj/item/stack/f13Cash/bottle_cap/C = new/obj/item/stack/f13Cash/bottle_cap
	if(stored_caps > C.max_amount)
		C.add(C.max_amount - 1)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps - 1)
		C.forceMove(src.loc)
		stored_caps = 0
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	src.ShowUI(usr)

/* Buy item */
/obj/machinery/bounty_machine/courier/proc/buy(var/item_index, var/mob/user)
	if(item_index > price_list.len)
		to_chat(usr, "<span class='warning'>Wrong item! *beep*</span>")
		return

	if(!connected_pod)
		to_chat(usr, "<span class='warning'>No pod connected</span>")
		return

	var/target_type = price_list[item_index]

	// Check price
	if(stored_caps >= price_list[target_type])
		// animation
		flick("tele0", connected_pod)

		//Remove caps
		stored_caps -= price_list[target_type]

		// Create item
		new target_type(connected_pod.loc)
		to_chat(usr, "<span class='notice'>Done. *beep-beep*</span>")
	else
		to_chat(usr, "<span class='warning'>Need more caps.</span>")

/*  INTERACTION */
/obj/machinery/bounty_machine/courier/attackby(var/obj/item/OtherItem, var/mob/living/carbon/human/user, parameters)

	if(OtherItem.GetID())
		if(allowed(user))
			locked = !locked
			to_chat(user, "<span class='notice'>You [src.locked ? "blocked" : "unblocked"] terminal.</span>")
			to_chat(user, "<span class='danger'>Don't forget to logoff terminal, Courier.</span>")
		else
			to_chat(user, "<span class='danger'>Access denied..</span>")
		return

	// CAPS
	if(istype(OtherItem, /obj/item/stack/f13Cash/bottle_cap))
		add_caps(OtherItem)

/* GUI */
/* Shop UI*/
/obj/machinery/bounty_machine/courier/proc/GetShopUI()
	var/dat = {"<meta charset="UTF-8">"}
	dat += "<h1>Parcels and goodies</h1>"
	dat += "<a href='?src=\ref[src];exit=1'>Exit</a><br><br>"
	dat += "<font color = 'green'>Balance: [stored_caps]</font>"
	dat += "<a href='?src=\ref[src];removecaps=1'>Withdrawl</a><br>"

	dat += "<div class='statusDisplay'>"
	for(var/i = 1; i <= price_list.len; i++)
		var/itm_type = price_list[i]
		var/atom/itm_ref = items_ref_list[i]
		var/price = price_list[itm_type]
		if(stored_caps < price_list[itm_type])
			dat += "<a href='?src=\ref[src];examine=[i]'>?</a>"
			dat += "<font color = 'grey'><b> [itm_ref] - [price] </b></font>"
			dat += "<a href='?src=\ref[src];buy=[i]'>Buy</a><br>"
		else
			dat += "<a href='?src=\ref[src];examine=[i]'>?</a>"
			dat += "<font color = 'green'><b> [itm_ref] - [price] </b></font>"
			dat += "<a href='?src=\ref[src];buy=[i]'>Buy</a><br>"
	dat += ""
	dat += "</div>"
	return dat

/* Quest UI */
/obj/machinery/bounty_machine/courier/proc/GetQuestUI()
	var/dat = {"<meta charset="UTF-8">"}
	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/bounty_employers)
	assets.send(usr)

	dat += "<h1>Wasteland Parcel Post</h1>"

	if(connected_pod)
		dat += "<font color='green'>Quantum pad connected!</font><br>"
		dat += "<a href='?src=\ref[src];findpod=1'>Scan</a>"
	else
		dat += "<font color='red'>Quantum pad not connected!</font><br>"
		dat += "<a href='?src=\ref[src];findpod=1'>Scan</a>"
	dat += "<a href='?src=\ref[src];shop=1'>Parcels and goodies</a><br>"
	dat += "<style>.leftimg {float:left;margin: 7px 7px 7px 0;}</style>"

	dat += "<h2>Contracts:</h2>"
	var/item_index = 1
	for(var/datum/bounty_quest/Q in active_quests)
		//usr << browse_rsc(Q.GetIconWithPath(), Q.employer_icon)
		dat += "<div class='statusDisplay'>"
		dat += "<font color='green'><b>ID: </b> [Q.name]</font><br>"
		dat += "<font color='green'><b>Employer: </b> [Q.employer]</font><br>"
		dat += "<font color='green'><b>Message:</b></font>"
		dat += "<font color='green'>[Q.desc]</font><br><br>"
		dat += "<font color='green'><b>Need: </b></font>"
		dat += "<font color='green'><i>[Q.need_message]. </i></font><br>"
		dat += "<font color='green'><b>Reward:</b></font>"
		dat += "<font color='green'> [Q.caps_reward] caps</font><br>"
		dat += "<a href='?src=\ref[src];completequest=[item_index]'>Send</a><br>"
		dat += "</div>"
		item_index++

	return dat

/obj/machinery/bounty_machine/courier/ShowUI()
	if(!locked)
		var/dat
		if(vend_mode)
			dat = GetShopUI()
		else
			dat = GetQuestUI()

		var/datum/browser/popup = new(usr, "bounty", "Wasteland Parcel Contracts Database", 640, 400) // Set up the popup browser window
		popup.set_content(dat)
		popup.set_title_image(usr.browse_rsc_icon(src.icon, src.icon_state))
		popup.open()
	else
		to_chat(usr, "<span class='danger'>Access denied.</span>")

/* Topic */
/obj/machinery/bounty_machine/courier/Topic(href, href_list)
	..()
	if(href_list["exit"])
		vend_mode = 0
	if(href_list["examine"])
		var/itm_index = text2num(href_list["examine"])
		var/obj/T = items_ref_list[itm_index]
		T.examine(usr)
	if(href_list["buy"])
		var/itm_index = text2num(href_list["buy"])
		buy(itm_index, usr)
	if(href_list["shop"])
		vend_mode = 1
	if(href_list["removecaps"])
		remove_all_caps()
	ShowUI()
// Fallout Gangs

// Names that serve as a blacklist to prevent inappropiate or duplicit gang names
GLOBAL_LIST_INIT(gang_names, list ( \
"raider", \
"raiders", \
"great khan", \
"great khans", \
"gang", \
"gangs", \
))

//Which social factions are allowed to join gangs?
GLOBAL_LIST_INIT(allowed_gang_factions, list ( \
"Raiders", \
))

// List of all existing gangs
GLOBAL_LIST_EMPTY(all_gangs)

//Great Khans
GLOBAL_DATUM_INIT(greatkhans, /datum/gang/greatkhans, new)

/datum/gang
	var/name = "gang"
	var/welcome_text = null //Shown text upon gang joining
	var/color = "#ff0000" //Red is a default gang color
	var/leader = null //Leader of this gang
	var/list/members = list()
	var/obj/item/device/gangtool/assigned_tool //Unique gangtool that the gang is using
	var/influence = 0 //Currency in the gangtool
	var/round_start = FALSE //Is this gang a round-start gang?
	var/boss_item_list
	var/list/boss_items = list(
		/datum/gang_item/equipment/pip_boy,
		/datum/gang_item/equipment/combat_injector,
		/datum/gang_item/equipment/bola,
		/datum/gang_item/equipment/emp,
		/datum/gang_item/equipment/toolbox,
		/datum/gang_item/equipment/frag,
		/datum/gang_item/equipment/c4,
		/datum/gang_item/equipment/gluon,

		/datum/gang_item/weapon/shuriken,
		/datum/gang_item/weapon/switchblade,

		/datum/gang_item/clothing/prostitute_dress,
		/datum/gang_item/clothing/hat,
		/datum/gang_item/clothing/glasses/sunglasses,

		/datum/gang_item/clothing/raider_uniform,
		/datum/gang_item/clothing/jester_uniform,
		/datum/gang_item/clothing/soviet_uniform,
		/datum/gang_item/clothing/biker_uniform,
		/datum/gang_item/clothing/chairmen_uniform
	)

//Round-start gangs
/datum/gang/greatkhans
	name = "Great Khans"
	color = "#b07f43"
	round_start = TRUE
	boss_items = list(
		/datum/gang_item/equipment/pip_boy,
		/datum/gang_item/equipment/combat_injector,
		/datum/gang_item/equipment/bola,
		/datum/gang_item/equipment/emp,
		/datum/gang_item/equipment/toolbox,
		/datum/gang_item/equipment/frag,
		/datum/gang_item/equipment/c4,

		/datum/gang_item/weapon/shuriken,
		/datum/gang_item/weapon/switchblade,
		/datum/gang_item/weapon/greasegun,

		/datum/gang_item/clothing/prostitute_dress,
		/datum/gang_item/clothing/hat,

		/datum/gang_item/clothing/khan_boots,
		/datum/gang_item/clothing/khan_helmet,
		/datum/gang_item/clothing/khan_uniform,
		/datum/gang_item/clothing/khan_jacket_armored,
		/datum/gang_item/clothing/glasses/sunglasses
	)

/datum/gang/New(starting_members, starting_leader)
	. = ..()
	if(starting_leader)
		add_leader(starting_leader)
	if(starting_members)
		if(islist(starting_members))
			for(var/mob/living/L in starting_members)
				add_member(L)
		else
			add_member(starting_members)

/datum/gang/proc/is_solo()
	return members.len == 1

/datum/gang/proc/add_leader(mob/living/carbon/new_leader)
	leader = new_leader
	new_leader.verbs -= /mob/living/proc/assumeleader
	new_leader.verbs |= /mob/living/proc/invitegang
	new_leader.verbs |= /mob/living/proc/removemember
	new_leader.verbs |= /mob/living/proc/transferleader
	new_leader.verbs |= /mob/living/proc/setwelcome
	if(!round_start)
		new_leader.verbs |= /mob/living/proc/setcolor
	new_leader.verbs |= /mob/living/proc/leavegang
	to_chat(new_leader, "<span class='notice'>Вы стали новым лидером [name]! Теперь вы можете управлять её участниками по своему желанию. Вы также получили устройство Gangtool, которое позволяет вам покупать специальное снаряжение для вас и вашей банды.</span>")

	var/obj/item/device/gangtool/gangtool = new(new_leader)
	gangtool.gang = new_leader.gang
	assigned_tool = gangtool

	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE
	)

	var/where = new_leader.equip_in_one_of_slots(gangtool, slots, FALSE)
	if(!where)
		gangtool.forceMove(get_turf(new_leader))

	if(assigned_tool)
		var/obj/item/device/gangtool/tool = assigned_tool
		tool.name = "[initial(tool.name)] - [name]"

/datum/gang/proc/remove_leader(mob/living/carbon/old_leader)
	leader = null
	old_leader.verbs -= /mob/living/proc/invitegang
	old_leader.verbs -= /mob/living/proc/removemember
	old_leader.verbs -= /mob/living/proc/transferleader
	old_leader.verbs -= /mob/living/proc/setwelcome
	if(!round_start)
		old_leader.verbs -= /mob/living/proc/setcolor
	old_leader.verbs |= /mob/living/proc/assumeleader
	to_chat(old_leader, "<span class='warning'>Теперь ты не лидер [name]!</span>")
	if(assigned_tool)
		assigned_tool.audible_message("<span class='warning'>[name] сменила своего владельца, [assigned_tool] самоуничтожается!</span>")
		qdel(assigned_tool)

/datum/gang/proc/add_member(mob/living/carbon/new_member)
	members |= new_member
	new_member.faction |= "[name]-gang"
	new_member.verbs -= /mob/living/proc/creategang
	new_member.verbs |= /mob/living/proc/leavegang
	new_member.verbs |= /mob/living/proc/assumeleader
	to_chat(new_member, "<span class='notice'>Теперь вы участник [name]!</span>")
	if(welcome_text)
		to_chat(new_member, "<span class='notice'>Текст приветствия: </span><span class='purple'>[welcome_text]</span>")

/datum/gang/proc/remove_member(mob/living/carbon/member)
	members -= member
	member.gang = null
	member.faction -= "[name]-gang"
	member.verbs -= /mob/living/proc/leavegang
	member.verbs -= /mob/living/proc/assumeleader
	member.verbs |= /mob/living/proc/creategang
	to_chat(member, "<span class='warning'>Вы больше не являетесь членом [name]!</span>")

	if(!members.len && !round_start)
		GLOB.gang_names -= lowertext(name)
		GLOB.all_gangs -= src
		qdel(src)

/mob/living/proc/invitegang()
	set name = "Invite To Gang"
	set desc = "Пригласите других в свою банду. Только независимые рейдеры могут быть приглашены!"
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.stat || !target.mind || !target.client)
			continue
		if(target.gang == gang)
			continue
		if(!(target.social_faction in GLOB.allowed_gang_factions))
			continue
		if(target.gang)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/mob/living/carbon/C
	C = input("Выбери, кого пригласить в свою банду!", "Gang invitation") as null|mob in possible_targets
	if(!C)
		return

	var/datum/gang/G = gang
	if(alert(C, "[src] приглашает вас в [G.name].", "Gang invitation", "Yes", "No") == "No")
		visible_message(C, "<span class='warning'>[C.name] отказался от предложения присоединиться к [G.name]!</span>")
		return
	else
		visible_message(C, "<span class='notice'>[C.name] принял приглашение присоедениться к [G.name]!</span>")

	G.add_member(C)
	C.gang = G

/mob/living/proc/creategang()
	set name = "Create Gang"
	set category = "Gang"

	var/input = input(src, "Введите название своей новой банды!", "Gang name") as text|null
	if(!input)
		return
	input = copytext(sanitize(input), 1, 30)
	if(lowertext(input) in GLOB.gang_names)
		to_chat(src, "<span class='notice'>Это название банды уже занято!</span>")
		return
	GLOB.gang_names |= lowertext(input)

	var/datum/gang/G = new()
	G.name = input
	GLOB.all_gangs |= G
	gang = G
	to_chat(src, "<span class='notice'>Вы создали [G.name]!</span>")

	G.add_member(src)
	G.add_leader(src)

/mob/living/proc/leavegang()
	set name = "Leave Gang"
	set category = "Gang"

	var/datum/gang/G = gang
	if(!G)
		to_chat(src, "Вы не состоите ни в одной банде!")
		return
	if(alert("Вы точно хотите покинуть [G.name]?", "Leave gang", "Yes", "No") == "No")
		return

	if(G.leader == src)
		G.remove_leader(src)
	G.remove_member(src)

/mob/living/proc/assumeleader()
	set name = "Assume Leadership"
	set desc = "Станьте новым лидером банды, если прошлый лидер пропал или мертв."
	set category = "Gang"

	var/datum/gang/G = gang
	if(G && G.leader)
		var/mob/living/L = G.leader
		if(L.stat != DEAD && L.client)
			to_chat(src, "<span class='warning'>Прошлый лидер ещё живой.</span>")
			return
		else
			G.remove_leader(L)
			G.add_leader(src)
	else if(G)
		G.add_leader(src)

/mob/living/proc/transferleader()
	set name = "Transfer Leadership"
	set desc = "Передайте лидерку другому члену банды в поле зрения."
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.stat || !target.mind || !target.client)
			continue
		if(target.gang != gang)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/mob/living/carbon/new_leader
		new_leader = input(src, "Выберите нового лидера банды [G.name]!", "Transfer Gang Leadership") as null|mob in possible_targets
		if(!new_leader || new_leader == src)
			return
		var/mob/living/H = new_leader
		to_chat(src, "<span class='notice'>Вы передали [G.name] в руки [H.real_name]!</span>")
		to_chat(H, "<span class='notice'>Вы получили [G.name] от [src.real_name]!</span>")
		G.remove_leader(src)
		G.add_leader(H)

/mob/living/proc/removemember()
	set name = "Remove Member"
	set desc = "Убрать члена банды в поле зрения из банды."
	set category = "Gang"

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		if(target.gang != gang)
			continue
		if(target.stat == DEAD)
			continue
		possible_targets += target

	if(!possible_targets.len)
		return

	var/datum/gang/G = gang
	if(G && G.leader == src)
		var/mob/living/carbon/kicked_member
		kicked_member = input(src, "Выберите члена банды, из которого хотите уволить [G.name]!", "Gang member removal") as null|mob in possible_targets
		if(!kicked_member || kicked_member == src)
			return

		var/mob/living/H = kicked_member
		to_chat(src, "<span class='notice'>Вы уволили [H.real_name] из [G.name]!</span>")
		to_chat(H, "<span class='warning'>[src.real_name] выгнал тебя из [G.name]!</span>")
		G.remove_member(H)

/mob/living/proc/setwelcome()
	set name = "Set Welcome Text"
	set desc = "Установите приветственный текст, который будет отображаться для всех новых членов банды при вступлении в неё."
	set category = "Gang"

	var/datum/gang/G = gang
	var/input = input(src, "Установите приветственный текст для новых членов банды!", "Welcome text", G.welcome_text) as text|null
	if(!input)
		return
	input = copytext(sanitize(input), 1, 300)
	G.welcome_text = input

	to_chat(src, "<span class='notice'>Вы установили приветственный текст для новых членов банды!</span>")

/mob/living/proc/setcolor()
	set name = "Choose Gang Color"
	set desc = "Установите цвет вашей банды, который будет виден членам банды при осмотре."
	set category = "Gang"

	var/datum/gang/G = gang
	var/picked_color = input(src, "", "Choose Color", color) as color|null
	if(!picked_color)
		return
	G.color = sanitize_color(picked_color)

	to_chat(src, "<span class='notice'>Вы выбрали новый цвет банды!</span>")

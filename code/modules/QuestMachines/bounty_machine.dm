/* Code by Tienn */

#define STATE_IDLE 0
#define STATE_VEND 1

/obj/machinery/bounty_machine
	name = "Wastland Bounty Machine"
	desc = "This is Wastland Bounty Machine"
	icon = 'icons/fallout/machines/terminals.dmi'
	icon_state = "bounty"
	anchored = 1
	density = 1
	verb_say = "beeps"
	verb_ask = "beeps"
	verb_exclaim = "beeps"
	obj_integrity = 300
	max_integrity = 300
	integrity_failure = 100
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 70)

	/* This items can be sold in this terminal */
	var/obj/item/items_to_sell[0]

	/* Subtypes will be selected for all quest list */
	var/quest_type = /datum/bounty_quest/faction/wasteland

	/* All quest */
	var/list/all_quests = list()

	/* Currently active quests */
	var/datum/bounty_quest/active_quests[0]

	/* Max active quest count */
	var/quest_limit = 4

	/* Connected bounty pod */
	var/obj/machinery/bounty_pod/connected_pod

	/* How far this machine will finde pod */
	var/pod_distance = 2

	// to debug
	var/last_rand = -1

/* Initialization */
/obj/machinery/bounty_machine/New()
	InitQuestList()
	FindPod(pod_distance)
	UpdateActiveQuests()


/*	---
 *	Quest management
 */

/* Create all quests list */
/obj/machinery/bounty_machine/proc/InitQuestList()
	all_quests = get_all_quests()
	all_quests.Remove(quest_type)

/obj/machinery/bounty_machine/proc/get_all_quests()
	return typesof(quest_type)

/* Returns random quest from database */
/obj/machinery/bounty_machine/proc/GetRandomQuest()
	if(all_quests.len == 0) return null
	var/random_index = rand(1, all_quests.len)
	var/quest_type = all_quests[random_index]
	var/Q = new quest_type()
	last_rand = random_index
	return Q

/* Create new quests until its count not equal to quest limit */
/obj/machinery/bounty_machine/proc/UpdateActiveQuests()
	var/i
	for(i = active_quests.len; i < quest_limit; i++)
		active_quests += GetRandomQuest()

/* Destroy all active quests. If create_new = 1, will generate new quests */
/obj/machinery/bounty_machine/proc/ClearActiveQuests(var/create_new = 0)
	for(var/Qst in active_quests)
		del Qst
	active_quests.Cut()
	if(create_new)
		UpdateActiveQuests()

/* Check quest objectives and complete it. */
/obj/machinery/bounty_machine/proc/ProcessQuestComplete(var/quest_index, var/mob/user)
	quest_index = text2num(quest_index)
	if(quest_index > active_quests.len)
		return 0

	// Check for connected pod
	if(!connected_pod)
		return 0

	var/turf/location = get_turf(connected_pod)
	var/quest_objects[0]
	var/datum/bounty_quest/current_quest = active_quests[quest_index]

	// Create list of all object of taget types
	for(var/atom/Itm in location.contents)
		if(current_quest.ItsATarget(Itm))
			quest_objects.Add(Itm)

	// If no target objects - fail to complete
	if(quest_objects.len == 0)
		return 0

	var/list/target_items = current_quest.target_items.Copy()
	for(var/atom/Itm in quest_objects)
		for(var/target_type in target_items)
			if(istype(Itm, target_type))
				target_items[target_type] -= 1

	// If objective not completed - fail
	for(var/Itm in target_items)
		if(target_items[Itm] > 0)
			return 0

	// Here we know - quest is complete
	// 1. Remove quest objects. ALL QUEST OBJECTS WILL BE REMOVED! IF YOU PUT 2 GHOULS AND QUEST NEEDS ONLY ONE - ALL GHOULES ON POD TURF WILL BE DESTROYED
	flick("tele0", connected_pod)
	for(var/Itm in quest_objects)
		qdel(Itm)

	// 2. Spawn reward
	var/obj/item/stack/f13Cash/bottle_cap/C = new /obj/item/stack/f13Cash/bottle_cap
	C.add(current_quest.caps_reward - 1)
	C.forceMove(connected_pod.loc)

	// 3. Delete quest
	to_chat(user, current_quest.end_message)
	active_quests -= current_quest
	qdel(current_quest)

	// 4. Update active quests
	UpdateActiveQuests()

	return 1
	// -- END

/*
 *	Pod management
*/

/* Find and assign firs pod in distance */
/obj/machinery/bounty_machine/proc/FindPod(var/distance = 1)
	for(var/Obj in view(distance, src))
		if(istype(Obj, /obj/machinery/bounty_pod))
			connected_pod = Obj
			break

/*
 *	GUI
*/
/obj/machinery/bounty_machine/proc/ShowUI()
	var/dat = ""
	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/bounty_employers)
	assets.send(usr)

	dat += "<h1>Станция Контрактов Пустоши</h1>"
	if(connected_pod)
		dat += "<font color='green'>Квантовый телепортатор найден</font><br>"
		dat += "<a href='?src=\ref[src];findpod=1'>Сканировать</a><br>"
	else
		dat += "<font color='red'>Квантовый телепортатор не найден</font>"
		dat += "<a href='?src=\ref[src];findpod=1'>Сканировать</a><br>"

	dat += "<style>.leftimg {float:left;margin: 7px 7px 7px 0;}</style>"

	dat += "<h2>Контракты:</h2>"
	var/item_index = 1
	for(var/datum/bounty_quest/Q in active_quests)
		dat += "<div class='statusDisplay'>"
		dat += "<img src='[Q.employer_icon]' class='leftimg' width = 59 height = 70></img>"
		dat += "<font color='green'><b>Название: </b> [Q.name]</font><br>"
		dat += "<font color='green'><b>Заказчик: </b> [Q.employer]</font><br>"
		dat += "<font color='green'><b>Сообщение:</b></font>"
		dat += "<font color='green'>[Q.desc]</font><br>"
		dat += "<font color='green'><b>Надо: </b></font>"
		dat += "<font color='green'><i>[Q.need_message]. </i></font><br>"
		dat += "<font color='green'><b>Награда:</b></font>"
		dat += "<font color='green'> [Q.caps_reward] caps</font> "
		dat += "<a href='?src=\ref[src];completequest=[item_index]'>Отправить</a>"
		dat += "</div>"
		item_index++

	var/datum/browser/popup = new(usr, "bounty", "База Данных Контрактов Пустоши", 640, 400) // Set up the popup browser window
	popup.set_content(dat)
	popup.set_title_image(usr.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/machinery/bounty_machine/Topic(href, href_list)
	if(href_list["completequest"])
		if(connected_pod)
			var/result_msg = ProcessQuestComplete(href_list["completequest"], usr)
			to_chat(usr, result_msg)
		else
			to_chat(usr, "Квантовый телепортатор не найден")
		ShowUI()

	if(href_list["findpod"])
		FindPod(pod_distance)
		ShowUI()

/*
 * Interaction
*/
/obj/machinery/bounty_machine/attack_hand(mob/user)
	ShowUI()
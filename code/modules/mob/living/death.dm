/mob/living/gib(no_brain, no_organs, no_bodyparts, lowgibs)
	var/prev_lying = lying
	if(stat != DEAD)
		death(1)

	if(!prev_lying)
		gib_animation()

	spill_organs(no_brain, no_organs, no_bodyparts)

	if(!no_bodyparts)
		spread_bodyparts(no_brain, no_organs)

	if(lowgibs)
		spawn_lowgibs()
	else
		spawn_gibs(no_bodyparts)

	qdel(src)

/mob/living/proc/gib_animation()
	return

/mob/living/proc/spawn_gibs()
	new /obj/effect/gibspawner/generic(drop_location(), null, get_static_viruses())

/mob/living/proc/spawn_lowgibs()
	new /obj/effect/decal/cleanable/blood(drop_location())

/mob/living/proc/spill_organs()
	return

/mob/living/proc/spread_bodyparts()
	return

/mob/living/dust(just_ash = FALSE, drop_items = FALSE)
	death(TRUE)

	if(drop_items)
		unequip_everything()

	if(buckled)
		buckled.unbuckle_mob(src,force=1)

	dust_animation()
	spawn_dust(just_ash)
	QDEL_IN(src,5) // since this is sometimes called in the middle of movement, allow half a second for movement to finish, ghosting to happen and animation to play. Looks much nicer and doesn't cause multiple runtimes.

/mob/living/proc/dust_animation()
	return

/mob/living/proc/spawn_dust(just_ash = FALSE)
	new /obj/effect/decal/cleanable/ash(loc)


/mob/living/death(gibbed)
	stat = DEAD
	unset_machine()
	timeofdeath = world.time
	tod = station_time_timestamp()
	var/turf/T = get_turf(src)
	for(var/obj/item/I in contents)
		I.on_mob_death(src, gibbed)
	if(mind && mind.name && mind.active && !istype(T.loc, /area/ctf))
		var/rendered = "<span class='deadsay'><b>[mind.name]</b> has died at <b>[get_area_name(T)]</b>.</span>"
		deadchat_broadcast(rendered, follow_target = src, turf_target = T, message_type=DEADCHAT_DEATHRATTLE)
	if(mind)
		mind.store_memory("Time of death: [tod]", 0)
	GLOB.alive_mob_list -= src
	if(!gibbed)
		GLOB.dead_mob_list += src
	set_drugginess(0)
	set_disgust(0)
	SetSleeping(0, 0)
	blind_eyes(1)
	reset_perspective(null)
	reload_fullscreen()
	update_action_buttons_icon()
	update_damage_hud()
	update_health_hud()
	update_canmove()
	med_hud_set_health()
	med_hud_set_status()
	if(!gibbed && !QDELETED(src))
		addtimer(CALLBACK(src, .proc/med_hud_set_status), (DEFIB_TIME_LIMIT * 10) + 1)
	stop_pulling()

	if(client)
		client.move_delay = initial(client.move_delay)
		client.screen += new /obj/screen/fullscreen/death
		if(getToxLoss() > 20)
			switch(rand(1,2))
				if(1)
					to_chat(src, sound('sound/f13effects/NAR_7.ogg',0,1,90))
				else
					to_chat(src, sound('sound/f13effects/NAR_5.ogg',0,1,90))
		else
			to_chat(src, sound('sound/f13effects/NAR_6.ogg',0,1,90))
	for(var/s in ownedSoullinks)
		var/datum/soullink/S = s
		S.ownerDies(gibbed)
	for(var/s in sharedSoullinks)
		var/datum/soullink/S = s
		S.sharerDies(gibbed)

	set_typing_indicator(FALSE) //SKYRAT CHANGE
	change_combat_indicator(FALSE)

	return TRUE
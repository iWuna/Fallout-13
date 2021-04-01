/obj/item/gun/ballistic/automatic
	w_class = WEIGHT_CLASS_NORMAL
	var/alarmed = 0
	var/select = 1
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_BULKY
	burst_size = 1
	fire_delay = 2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	force = 20
	var/auto_eject = 0
	var/auto_eject_sound = null
	equipsound = 'sound/f13weapons/equipsounds/riflequip.ogg'

/obj/item/gun/ballistic/automatic/proto
	name = "compact submachine gun"
	desc = "A prototype three-round burst 9mm submachine gun, designated 'SABR'. Has a threaded barrel for suppressors."
	icon_state = "saber"
	burst_size = 3
	mag_type = /obj/item/ammo_box/magazine/smgm9mm
	pin = null

/obj/item/gun/ballistic/automatic/proto/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/update_icon()
	..()
	if(!select)
		add_overlay("[initial(icon_state)]semi")
	if(select == 1)
		add_overlay("[initial(icon_state)]burst")
	if(gun_icon_state)//It's a custom gun, it plays by its own rules
		icon_state = "[gun_icon_state][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
	else
		icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/automatic/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/ammo_box/magazine))
		var/obj/item/ammo_box/magazine/AM = A
		if(istype(AM, mag_type))
			var/obj/item/ammo_box/magazine/oldmag = magazine
			if(user.transferItemToLoc(AM, src))
				magazine = AM
				if(oldmag)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the magazine.</span>")
					oldmag.dropped()
					oldmag.forceMove(get_turf(src.loc))
					oldmag.update_icon()
				else
					to_chat(user, "<span class='notice'>You insert the magazine into \the [src].</span>")

				playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/ballistic/automatic/ui_action_click()
	burst_select()

/obj/item/gun/ballistic/automatic/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		burst_size = 1
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		burst_size = initial(burst_size)
		if (customburst>1)
			burst_size = customburst
		if (burst_improvement)
			burst_size = 1 + initial(burst_size)
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/can_shoot()
	return get_ammo()

/obj/item/gun/ballistic/automatic/proc/empty_alarm()
	if(!chambered && !get_ammo() && !alarmed)
		playsound(src.loc, 'sound/weapons/smg_empty_alarm.ogg', 40, 1)
		update_icon()
		alarmed = 1
	return

/obj/item/gun/ballistic/automatic/afterattack(atom/target, mob/living/user)
	..()
	if(auto_eject && magazine && magazine.stored_ammo && !magazine.stored_ammo.len && !chambered)
		magazine.dropped()
		user.visible_message(
			"[magazine] falls out and clatters on the floor!",
			"<span class='notice'>[magazine] falls out and clatters on the floor!</span>"
		)
		if(auto_eject_sound)
			playsound(user, auto_eject_sound, 40, 1)
		magazine.forceMove(get_turf(src.loc))
		magazine.update_icon()
		magazine = null
		update_icon()

/obj/item/gun/ballistic/automatic/c20r
	name = "tactical submachine gun"
	desc = "A bullpup three-round burst .45 SMG, can be suppressed."
	icon_state = "c20r"
	item_state = "c20r"
	mag_type = /obj/item/ammo_box/magazine/smgm45
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	fire_delay = 1
	burst_size = 3
	pin = /obj/item/firing_pin
	can_bayonet = TRUE
	knife_x_offset = 26
	knife_y_offset = 12

/obj/item/gun/ballistic/automatic/c20r/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/ballistic/automatic/c20r/afterattack()
	. = ..()
	empty_alarm()
	return

/obj/item/gun/ballistic/automatic/c20r/update_icon()
	..()
	icon_state = "c20r[magazine ? "-[CEILING(get_ammo(0)/4, 1)*4]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/automatic/wt550
	name = "manufactured submachine gun"
	desc = "A very advanced SMG that can be suppressed, takes unique ammo and starts off with a advanced firing pin."
	icon_state = "wt550"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/wt550m9
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	automatic = 1
	actions_types = list()
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 12
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/wt550/update_icon()
	..()
	icon_state = "wt550[magazine ? "-[CEILING(get_ammo(0)/4, 1)*4]" : ""]"

/obj/item/gun/ballistic/automatic/m90
	name = "\improper M90gl Carbine"
	desc = "A three-round burst 5.56 toploading carbine, designated 'M-90gl'. Has an attached underbarrel grenade launcher which can be toggled on and off."
	icon_state = "m90"
	item_state = "m90"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	var/obj/item/gun/ballistic/revolver/grenadelauncher/underbarrel
	burst_size = 3
	fire_delay = 2
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher(src)
	update_icon()

/obj/item/gun/ballistic/automatic/m90/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/unrestricted/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted(src)
	update_icon()

/obj/item/gun/ballistic/automatic/m90/afterattack(atom/target, mob/living/user, flag, params)
	if(select == 2)
		underbarrel.afterattack(target, user, flag, params)
	else
		. = ..()
		return
/obj/item/gun/ballistic/automatic/m90/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self()
			underbarrel.attackby(A, user, params)
	else
		..()
/obj/item/gun/ballistic/automatic/m90/update_icon()
	..()
	cut_overlays()
	switch(select)
		if(0)
			add_overlay("[initial(icon_state)]semi")
		if(1)
			add_overlay("[initial(icon_state)]burst")
		if(2)
			add_overlay("[initial(icon_state)]gren")
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"]"
	return
/obj/item/gun/ballistic/automatic/m90/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = initial(burst_size)
			fire_delay = initial(fire_delay)
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 2
			to_chat(user, "<span class='notice'>You switch to grenades.</span>")
		if(2)
			select = 0
			burst_size = 1
			fire_delay = 0
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/ar
	name = "combat rifle mark II"
	desc = "An assault rifle used by American Special Forces towards the end of the war."
	icon_state = "arg"
	item_state = "arg"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	burst_size = 2
	fire_delay = 1
	pin = /obj/item/firing_pin

// Bulldog shotgun //

/obj/item/gun/ballistic/automatic/shotgun/bulldog
	name = "assault shotgun"
	desc = "A semi-auto, mag-fed shotgun for combat in narrow corridors. Compatible only with specialized 8-round drum magazines."
	icon_state = "bulldog"
	item_state = "bulldog"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/m12g
	fire_sound = 'sound/weapons/gunshot.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 7
	pin = /obj/item/firing_pin
	actions_types = list()

/obj/item/gun/ballistic/automatic/shotgun/bulldog/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/shotgun/bulldog/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/ballistic/automatic/shotgun/bulldog/update_icon()
	cut_overlays()
	if(magazine)
		add_overlay("[magazine.icon_state]")
	icon_state = "bulldog[chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/shotgun/bulldog/afterattack()
	. = ..()
	empty_alarm()
	return



// L6 SAW //

/obj/item/gun/ballistic/automatic/l6_saw
	name = "\improper L6 SAW"
	desc = "A heavily modified 1.95x129mm light machine gun, designated 'L6 SAW'. Has 'Aussec Armoury - 2531' engraved on the receiver below the designation."
	icon_state = "l6closed100"
	item_state = "l6closedmag"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = 0
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/mm195x129
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	var/cover_open = FALSE
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/l6_saw/unrestricted
	pin = /obj/item/firing_pin


/obj/item/gun/ballistic/automatic/l6_saw/examine(mob/user)
	..()
	if(cover_open && magazine)
		to_chat(user, "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the magazine.</span>")


/obj/item/gun/ballistic/automatic/l6_saw/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()


/obj/item/gun/ballistic/automatic/l6_saw/update_icon()
	icon_state = "l6[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/12.5, 1)*25 : "-empty"][suppressed ? "-suppressed" : ""]"
	item_state = "l6[cover_open ? "openmag" : "closedmag"]"


/obj/item/gun/ballistic/automatic/l6_saw/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
	else
		. = ..()
		update_icon()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/gun/ballistic/automatic/l6_saw/attack_hand(mob/user)
	if(loc != user)
		..()
		return	//let them pick it up
	if(!cover_open || (cover_open && !magazine))
		..()
	else if(cover_open && magazine)
		//drop the mag
		magazine.update_icon()
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine = null
		update_icon()
		to_chat(user, "<span class='notice'>You remove the magazine from [src].</span>")
		playsound(user, 'sound/weapons/magout.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/l6_saw/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s cover is closed! You can't insert a new mag.</span>")
		return
	..()

/obj/item/gun/ballistic/automatic/l6_saw/m38
	name = "M38 LMG"
	desc = "A special LMG generally used to lay down suppressive fire."
	icon_state = "M38"
	item_state = "M38"
	slot_flags = 0
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/mm762
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 3
	burst_delay = 3
	slowdown = 1.0
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 20
	randomspread = 1

/obj/item/gun/ballistic/automatic/l6_saw/m38/update_icon()
	icon_state = "M38[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/20, 1)*20 : "-empty"][suppressed ? "-suppressed" : ""]"
	item_state = "M38[cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"

/obj/item/gun/ballistic/automatic/l6_saw/m38/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 30
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select += 1
			burst_size = 3
			spread = 40
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(2)
			select += 1
			burst_size = 4
			spread = 50
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(3)
			select = 0
			burst_size = 1
			spread = 20
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

// SNIPER //

/obj/item/gun/ballistic/automatic/sniper_rifle
	name = "anti materiel rifle"
	desc = "A long ranged weapon that does significant damage. No, you can't quickscope."
	icon_state = "sniper-mag"
	item_state = "sniper"
	recoil = 2
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_delay = 40
	burst_size = 1
	can_unsuppress = FALSE
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_BULKY
	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 13
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	force = 25
	projectile_speed = 0


/obj/item/gun/ballistic/automatic/sniper_rifle/update_icon()
	if(magazine)
		icon_state = "sniper-mag"
	else
		icon_state = "sniper"


/obj/item/gun/ballistic/automatic/sniper_rifle/syndicate
	name = "anti materiel rifle mark II"
	desc = "A modified .50 cal sniper rifle with suppression compatibility. Quickscoping still doesn't work."
	fire_sound = 'sound/f13weapons/antimaterielfire.ogg'
	projectile_speed = 0

// Old Semi-Auto Rifle //

/obj/item/gun/ballistic/automatic/surplus
	name = "semi automatic rifle"
	desc = "One of countless obsolete ballistic rifles that still sees use as a cheap deterrent. Uses 10mm ammo and its bulky frame prevents one-hand firing."
	icon_state = "surplus"
	item_state = "moistnugget"
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/m10mm/rifle
	fire_delay = 10
	burst_size = 1
	can_unsuppress = FALSE
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()

/obj/item/gun/ballistic/automatic/surplus/update_icon()
	if(magazine)
		icon_state = "surplus"
	else
		icon_state = "surplus-e"


// Laser rifle (rechargeable magazine) //

/obj/item/gun/ballistic/automatic/laser
	name = "laser rifle"
	desc = "Though sometimes mocked for the relatively weak firepower of their energy weapons, the logistic miracle of rechargeable ammunition has given it's users a decisive edge over many a foe."
	icon_state = "oldrifle"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/recharge
	fire_delay = 2
	can_suppress = FALSE
	burst_size = 0
	actions_types = list()
	fire_sound = 'sound/weapons/laser.ogg'
	casing_ejector = FALSE

/obj/item/gun/ballistic/automatic/laser/update_icon()
	..()
	icon_state = "oldrifle[magazine ? "-[CEILING(get_ammo(0)/4, 1)*4]" : ""]"
	return

/obj/item/gun/ballistic/automatic/mini_uzi
	spawnwithmagazine = FALSE
	name = "\improper Type U3 Uzi"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon_state = "mini-uzi"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	can_scope = TRUE
	scopestate = "AEP7_scope"
	scope_x_offset = 9
	scope_y_offset = 21
	burst_size = 2
	burst_delay = 2
	fire_delay = 5
	force = 15
	spread = 10
	can_attachments = TRUE
	can_suppress = TRUE

/obj/item/gun/ballistic/automatic/mini_uzi/mid
	name = "\improper Type U3 Uzi (improved)"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	fire_delay = 4
	extra_penetration = 0
	extra_damage = 0
	randomspread = 0

/obj/item/gun/ballistic/automatic/mini_uzi/high
	name = "\improper Type U3 Uzi (masterwork)"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	fire_delay = 3
	extra_damage = 5
	extra_penetration = 5
	randomspread = 0

/obj/item/gun/ballistic/automatic/mini_uzi/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 18
			if (burst_improvement)
				burst_size = 3
			if (recoil_decrease)
				spread = 10
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			if (recoil_decrease)
				spread = 0
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/pps
	spawnwithmagazine = FALSE
	name = "\improper PPSh-41"
	desc = "An extremely fast firing, innacurate SMG from past wars. Low fire rate and low damage. Uses 9mm rounds."
	icon_state = "pps"
	mag_type = /obj/item/ammo_box/magazine/pps9mm
	w_class = WEIGHT_CLASS_NORMAL
	//can_scope = TRUE
	//scopestate = "AEP7_scope"
	//scope_x_offset = 9
	//scope_y_offset = 21
	burst_size = 3
	burst_delay = 2
	fire_delay = 6
	force = 15
	spread = 20
	can_attachments = TRUE
	randomspread = 10
	extra_damage = -9
	extra_penetration = -5

/obj/item/gun/ballistic/automatic/pps/mid
	name = "\improper PPSh-41 (improved)"
	burst_delay = 1.5
	fire_delay = 5
	can_attachments = TRUE
	extra_damage = -9
	extra_penetration = 0
	randomspread = 0

/obj/item/gun/ballistic/automatic/pps/high
	name = "\improper PPSh-41 (masterwork)"
	burst_size = 3
	extra_damage = 0
	extra_penetration = 5
	burst_delay = 1.5
	randomspread = 0
	can_attachments = TRUE
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT

/obj/item/gun/ballistic/automatic/pps/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 3
			spread = 28
			if (burst_improvement)
				burst_size = 4
			if (recoil_decrease)
				spread = 20
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 10
			if (recoil_decrease)
				spread = 2
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/tommygun
	name = "\improper Thompson SMG"
	desc = "Based on the classic 'Chicago Typewriter'."
	icon_state = "tommygun"
	item_state = "tommygun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	burst_delay = 2
	automatic = 1
	can_attachments = TRUE

/obj/item/gun/ballistic/automatic/autopipe
	name = "\improper auto pipe rifle"
	desc = "An improvised rifle improved with automatic capability, highly innacurate and slow to fire"
	icon_state = "auto_pipe_rifle"
	item_state = "improvshotgun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/autopipe
	fire_sound = 'sound/weapons/Gunshot.ogg'
	can_suppress = FALSE
	burst_size = 4
	fire_delay = 30
	burst_delay = 3
	automatic = 1
	spread = 24

/obj/item/gun/ballistic/automatic/autopipe/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 4
			spread = 24
			fire_delay = 25
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 5
			fire_delay = 8
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/smg10mm
	spawnwithmagazine = FALSE
	name = "10mm submachine gun"
	desc = "A select fire open bolt 10mm submachine gun. The serial number and manufactuer markings have been scratched off."
	icon_state = "smg10mm"
	item_state = "smg10mm"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m10mm_auto
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM //You should be able to dual-wield these.
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	burst_size = 2
	fire_delay = 4
	burst_delay = 3
	can_suppress = FALSE //we dont have sprites therefore cease
	force = 15
	spread = 18
	can_attachments = TRUE
	can_disassemble = FALSE

/obj/item/gun/ballistic/automatic/smg10mm/mid
	name = "10mm submachine gun (improved)"
	randomspread = 0
	extra_penetration = 0
	extra_damage = 0

/obj/item/gun/ballistic/automatic/smg10mm/high
	name = "10mm submachine gun (masterwork)"
	randomspread = 0
	burst_size = 2
	fire_delay = 2
	burst_delay = 2
	extra_damage = 6
	extra_penetration = 6
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT


/obj/item/gun/ballistic/automatic/smg10mm/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 18
			if (recoil_decrease)
				spread = 10
			if (burst_improvement)
				burst_size = 3
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			if (recoil_decrease)
				spread = 0
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/assault_carbine
	name = "assault carbine"
	desc = "A variant of the R81 with increased rate of fire and a matte black exterior."
	icon_state = "assault_carbine"
	item_state = "assault_carbine"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'
	burst_size = 2
	fire_delay = 3
	burst_delay = 2.0
	spread = 16
	automatic = 1
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	can_attachments = TRUE

/obj/item/gun/ballistic/automatic/assault_carbine/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 14
			if (recoil_decrease)
				spread = 6
			if (burst_improvement)
				burst_size = 3
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			if (recoil_decrease)
				spread = 0
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/assault_rifle
	spawnwithmagazine = FALSE
	name = "assault rifle"
	desc = "A standard R91 assault rifle, out of use around the time of the Great War."
	icon_state = "assault_rifle"
	item_state = "fnfal"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle/assault
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	burst_size = 2
	automatic = 1
	fire_delay = 3
	burst_delay = 2
	spread = 8
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	can_attachments = TRUE
	randomspread = 10
	bayonetstate = "rifles"
	can_bayonet = TRUE
	knife_x_offset = 23
	knife_y_offset = 11

/obj/item/gun/ballistic/automatic/assault_rifle/mid
	name = "assault rifle (improved)"
	randomspread = 0
	fire_delay = 3
	extra_penetration = 0
	extra_damage = 0
	burst_delay = 2

/obj/item/gun/ballistic/automatic/assault_rifle/high
	name = "assault rifle (masterwork)"
	randomspread = 0
	fire_delay = 3
	extra_damage = 6
	extra_penetration = 6
	burst_delay = 2
	weapon_weight = WEAPON_LIGHT

/obj/item/gun/ballistic/automatic/assault_rifle/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 8
			if (recoil_decrease)
				spread = 0
			if (burst_improvement)
				burst_size = 3
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			if (recoil_decrease)
				spread = 0
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/assault_rifle/infiltrator
	name = "infiltrator"
	desc = "A customized R91 assault rifle, with an integrated suppressor, cut down stock and polymer furniture."
	icon_state = "infiltrator"
	item_state = "fnfal"
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle
	suppressed = 1
	burst_size = 1
	fire_delay = 3
	spread = 1
	automatic = 1
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'
	weapon_weight = WEAPON_HEAVY
	can_attachments = TRUE
	can_bayonet = FALSE
	force = 15


/obj/item/gun/ballistic/automatic/infiltrator/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 0
			burst_size = 1
			spread = 1
			if (recoil_decrease)
				spread = 0
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/type93
	name = "type 93 assault rifle"
	desc = "The Type 93 Chinese assault rifle was designed and manufactured by a Chinese industrial conglomerate for the People's Liberation Army during the Resource Wars, for the purpose of equipping the Chinese infiltrators and American fifth-columnists. Chambered in 5.56x45."
	icon_state = "type93"
	item_state = "handmade_rifle"
	w_class = WEIGHT_CLASS_BULKY
	can_suppress = FALSE
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle/assault
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	burst_size = 2
	fire_delay = 3
	spread = 10
	weapon_weight = WEAPON_HEAVY
	extra_damage = 2

/obj/item/gun/ballistic/automatic/marksman
	name = "marksman carbine"
	desc = "A R94 marksman carbine, chambered in 5.56x45. Seen heavy usage in pre-war conflicts. This one isn't a select fire variant."
	icon_state = "marksman_rifle"
	item_state = "marksman"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_sound = 'sound/f13weapons/marksman_rifle.ogg'
	can_suppress = FALSE
	fire_delay = 6
	burst_size = 1
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	weapon_weight = WEAPON_HEAVY
	actions_types = null
	select = 0
	can_attachments = TRUE
	bayonetstate = "rifles"
	can_bayonet = TRUE
	knife_x_offset = 23
	knife_y_offset = 10

/obj/item/gun/ballistic/automatic/marksman/sniper
	name = "sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert."
	icon_state = "sniper_rifle"
	item_state = "sniper_rifle"
	mag_type = /obj/item/ammo_box/magazine/w308
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	fire_delay = 10
	burst_size = 1
	projectile_speed = 0 //basically hitscan
	can_bayonet = FALSE

/obj/item/gun/ballistic/automatic/marksman/sniper/gold
	name = "golden sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester. This one has a gold trim and the words 'Old Cassius' engraved into the stock."
	icon_state = "gold_sniper"
	item_state = "gold_sniper"

/obj/item/gun/ballistic/automatic/marksman/servicerifle
	spawnwithmagazine = FALSE
	name = "service rifle"
	desc = "A 5.56x45 semi-automatic service rifle manufactured by the NCR and issued to all combat personnel."
	icon_state = "service_rifle"
	item_state = "servicerifle"
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	fire_delay = 5
	extra_damage = -6
	extra_penetration = -6
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	zoomable = FALSE
	weapon_weight = WEAPON_HEAVY
	//bayonetstate = "rifles"
	randomspread = 10
	knife_x_offset = 22
	knife_y_offset = 12

/obj/item/gun/ballistic/automatic/marksman/servicerifle/mid
	name = "service rifle (improved)"
	randomspread = 0
	fire_delay = 4
	extra_damage = 0
	extra_penetration = 0

/obj/item/gun/ballistic/automatic/marksman/servicerifle/high
	name = "service rifle (masterwork)"
	randomspread = 0
	fire_delay = 3
	extra_damage = 10
	extra_penetration = 10
	weapon_weight = WEAPON_LIGHT


/obj/item/gun/ballistic/automatic/marksman/servicerifle/r82
	name = "R82 heavy service rifle"
	desc = "A top of the line 5.56x45 automatic service rifle manufactured by the NCR and issued to high ranking personnel."
	fire_delay = 1 //faster ROF, superior to regular service rifle
	projectile_speed = 0.6 //faster velocity, superior to regular service rifle
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	icon_state = "R82"
	item_state = "R82"
	automatic = 1
	burst_size = 2
	can_bayonet = FALSE

/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint
	name = "varmint rifle"
	desc = "A low powered 5.56, easy to use rifle."
	icon_state = "varmint_rifle"
	item_state = "varmintrifle"
	fire_delay = 8
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle/small
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	can_bayonet = FALSE

/obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint/ratslayer
	name = "ratslayer"
	desc = "A modified Varmint Rifle with better stopping power, a scope, and suppressor. Oh, don't forget the sick paint job."
	icon_state = "rat_slayer"
	item_state = "ratslayer"
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'

/obj/item/gun/ballistic/automatic/minigun
	name = "M134 Minigun"
	desc = "The M134 is a 7.62Ã—51mm, six-barrel rotary machine gun with a rate of fire between 2,000 and 6,000 rounds per minute."
	icon_state = "arg"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	burst_size = 3
	fire_delay = 0.2
	automatic = 1
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/shotgun/pancor
	name = "Pancor Jackhammer"
	desc = "A select fire automatic shotgun, the pinnacle of turning things into swiss cheese."
	icon_state = "pancor"
	item_state = "cshotgun1"
	fire_sound = 'sound/f13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	burst_size = 2 //Who keeps nerfing this? S.B.
	automatic = 1
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/shotgun/caws
	name = "H&K CAWS"
	desc = "A select fire automatic shotgun, a modern variant of the Pancor Jackhammer."
	icon_state = "caws"
	item_state = "cshotgun1"
	fire_sound = 'sound/f13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	burst_size = 2
	fire_delay = 4
	automatic = 1
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/shotgun/riot
	name = "breacher shotgun" //name changed to distinguish from /obj/item/gun/ballistic/shotgun/riot
	desc = "A compact riot shotgun designed to fight in close quarters."
	icon_state = "riot_shotgun"
	item_state = "huntingshotgun"
	fire_sound = 'sound/f13weapons/riot_shotgun.ogg'
	burst_size = 1
	fire_delay = 4
	mag_type = /obj/item/ammo_box/magazine/d12g
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 40

/obj/item/gun/ballistic/automatic/greasegun
	spawnwithmagazine = FALSE
	name = "M3A1 Grease Gun"
	desc = "An inexpensive .45 ACP submachine gun. Slow fire rate means less waste of ammo and controllable bursts."
	icon_state = "grease_gun"
	item_state = "smg9mm"
	mag_type = /obj/item/ammo_box/magazine/greasegun
	fire_sound = 'sound/f13weapons/greasegun.ogg'
	can_suppress = FALSE
	weapon_weight = WEAPON_MEDIUM
	burst_size = 2
	fire_delay = 3
	burst_delay = 3
	force = 15
	spread = 10
	randomspread = 10
	can_attachments = TRUE

/obj/item/gun/ballistic/automatic/greasegun/mid
	name = "M3A1 Grease Gun (improved)"
	randomspread = 0
	fire_delay = 3
	burst_delay = 3
	can_disassemble = FALSE

/obj/item/gun/ballistic/automatic/greasegun/high
	name = "M3A1 Grease Gun (masterwork)"
	fire_delay = 2
	burst_delay = 2
	extra_penetration = 5
	extra_damage = 5
	randomspread = 0
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	can_disassemble = FALSE

/obj/item/gun/ballistic/automatic/greasegun/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 18
			if (recoil_decrease)
				spread = 10
			if (burst_improvement)
				burst_size = 3
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			if (recoil_decrease)
				spread = 0
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/bozar
	name = "Bozar"
	desc = "The ultimate refinement of the sniper's art, the Bozar is a scoped, accurate, light machine gun that will make nice big holes in your enemy. Uses 5.56."
	icon_state = "bozar"
	item_state = "sniper"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	burst_size = 2
	fire_delay = 3
	automatic = 1
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/f13weapons/bozar_fire.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_attachments = TRUE

/obj/item/gun/ballistic/automatic/bozar/handmade
	burst_size = 1

/obj/item/gun/ballistic/automatic/m72
	name = "\improper M72 gauss rifle"
	desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed... and pierce almost any obstacle. Its range, accuracy and stopping power is almost unparalleled."
	icon_state = "m72"
	item_state = "shotgun"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m2mm
	fire_sound = 'sound/f13weapons/gauss_rifle.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 15
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	projectile_speed = 0
	recoil = 2

/obj/item/gun/ballistic/automatic/lsw
	name = "L86A1 LSW"
	desc = "A british variant of the L86 platform. This one was designed as a light support weapon, featuring a bipod and fluted barrel."
	icon_state = "lsw"
	item_state = "l6closedmag"
	slot_flags = 0
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 5
	fire_delay = 0.3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/lmg
	name = "R84 LMG"
	desc = "A post war lmg, traditionally manufactured by NCR forces. It is designed as a suppressive support weapon, generally granted to Heavy Troopers to compliment their stripped power armor."
	icon_state = "R84"
	item_state = "R84"
	slot_flags = 0
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/lmg
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 3
	burst_delay = 3
	slowdown = 1.0
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 25
	randomspread = 1

/obj/item/gun/ballistic/automatic/lmg/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 35
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select += 1
			burst_size = 3
			spread = 45
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(2)
			select = 0
			burst_size = 1
			spread = 25
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/mg34
	name = "\improper Maschinengewehr 34"
	desc = "An old light machine gun, manufactured over 100 years ago still in use by some NCR forces today."
	icon_state = "mg34"
	item_state = "R84"
	slot_flags = 0
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/mg34
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 7
	burst_delay = 4
	slowdown = 1.2
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	spread = 25
	//randomspread = 5

/obj/item/gun/ballistic/automatic/mg34/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 1
			spread = 15
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
		if(1)
			select = 0
			burst_size = 4
			spread = 30
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/m1garand
	name = "battle rifle"
	desc = "The WWII American Classic. Still has that satisfiying ping."
	icon_state = "m1garand"
	item_state = "rifle"
	mag_type = /obj/item/ammo_box/magazine/garand308
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	fire_delay = 6
	burst_size = 1
	en_bloc = 1
	auto_eject = 1
	auto_eject_sound = 'sound/f13weapons/garand_ping.ogg'
	can_bayonet = TRUE
	bayonetstate = "lasmusket"
	knife_x_offset = 22
	knife_y_offset = 21

/obj/item/gun/ballistic/automatic/m1garand/update_icon()
	..()
	icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/m1garand/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return

/obj/item/gun/ballistic/automatic/m1garand/oldglory
	name = "Old Glory"
	desc = "This Machine kills communists!"
	icon_state = "oldglory"
	extra_damage = 10

/obj/item/gun/ballistic/automatic/m1garand/republicspride
	name = "Republic's Pride"
	desc = "A well-tuned scoped M1C rifle crafted by master gunsmith from the Gunrunners. Proudly issued to Scout Captains and packs a mean punch. Chambered in 7.62x51."
	icon_state = "republics_pride"
	item_state = "scoped308"
	extra_damage = 8
	extra_penetration = 5
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_scope = FALSE

/obj/item/gun/ballistic/automatic/rangemaster
	name = "Colt Rangemaster"
	desc = "A Colt Rangemaster semi-automatic rifle, chambered for 7.62x51. Single-shot only."
	icon_state = "rangemaster"
	item_state = "308"
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/m762
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	burst_size = 1
	fire_delay = 5
	extra_penetration = -10
	extra_damage = -10
	can_attachments = TRUE
	can_scope = TRUE
	can_bayonet = TRUE
	bayonetstate = "lasmusket"
	knife_x_offset = 24
	knife_y_offset = 21
	randomspread = 10
	can_disassemble = FALSE


/obj/item/gun/ballistic/automatic/rangemaster/scoped
	name = "Scoped Colt Rangemaster"
	desc = "Nothing's better than seeing that surprised look on your target's face. The Loophole x20 Scope on this hunting rifle makes it easier than ever before. Accurate from first shot to last, no matter what kind of game you're gunning for."
	icon_state = "rangemaster"
	item_state = "scoped308"
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_scope = FALSE

/obj/item/gun/ballistic/automatic/rangemaster/scoped/mid
	name = "Scoped Colt Rangemaster (improved)"
	randomspread = 0
	extra_penetration = 0
	extra_damage = 0

/obj/item/gun/ballistic/automatic/rangemaster/scoped/high
	name = "Scoped Colt Rangemaster (masterwork)"
	randomspread = 0
	fire_delay = 4
	extra_penetration = 7
	extra_damage = 7


/obj/item/gun/ballistic/automatic/fnfal
	name = "FN FAL"
	desc = "This rifle has been more widely used by armed forces than any other rifle in history. It's a reliable assault weapon for any terrain or tactical situation."
	icon_state = "fnfal"
	item_state = "fnfal"
	burst_size = 2
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/m762
	init_mag_type = /obj/item/ammo_box/magazine/m762
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 10
	fire_delay = 3

/obj/item/gun/ballistic/automatic/p90
	name = "FN P90c"
	desc = "The Fabrique Nationale P90c was just coming into use at the time of the war. The weapon's bullpup layout, and compact design, make it easy to control. The durable P90c is prized for its reliability, and high firepower in a ruggedly-compact package. Chambered in 10mm."
	icon_state = "p90"
	item_state = "m90"
	burst_size = 3
	fire_delay = 1
	burst_delay = 1
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/m10mm_p90
	init_mag_type = /obj/item/ammo_box/magazine/m10mm_p90
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	extra_damage = 5
	extra_penetration = 5

/obj/item/gun/ballistic/automatic/m1carbine
	name = "m1 carbine"
	desc = "The M1 Carbine is a renowned carbine that has been in service since WW2. Recently retired, these guns were transferred to National Guard Armouries and rechambered to 10mm."
	icon_state = "m1carbine"
	item_state = "rifle"
	burst_size = 1
	fire_delay = 2
	automatic = 0
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	extra_damage = 4
	extra_penetration = 4
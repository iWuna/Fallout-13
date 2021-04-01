/obj/item/grenade/bettermine
	name = "dummy mine"
	desc = "Better stay away from that thing."
	density = FALSE
	anchored = FALSE
	icon = 'icons/obj/betaadvanced.dmi'
	icon_state = "landmine"
	var/triggered = 0
	var/press_bolted = 1
	var/hidden = 0
	var/wire_cut = 0
	det_time = 0

/obj/item/grenade/bettermine/attack_self(mob/user)
	if(!active)
		to_chat(user, "<span class='warning'>You planted [name]!</span>")
		visible_message("<span class='danger'>[user] planted [src]!</span>")
		playsound(user.loc, 'sound/weapons/armbomb.ogg', 60, 1)

		var/turf/bombturf = get_turf(src)
		var/area/A = get_area(bombturf)
		var/message = "[ADMIN_LOOKUPFLW(user)]) has primed a [name] at [ADMIN_COORDJMP(bombturf)]"
		GLOB.bombers += message
		message_admins(message)
		log_game("[key_name(usr)] has primed a [name] for detonation at [A.name] [COORD(bombturf)].")

		if(user)
			user.deleteWornItem(src)
			var/obj/item/grenade/bettermine/explosive/planted/p = new(user.loc)
			p.add_fingerprint(user)

/obj/item/grenade/bettermine/proc/triggermine(mob/victim)
	if(triggered)
		return
	visible_message("<span class='danger'>[victim] sets off [icon2html(src, viewers(src))] [src]!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	mineEffect(victim)
	triggered = 1
	qdel(src)

/obj/item/grenade/bettermine/proc/mineEffect(mob/victim)
	to_chat(victim, "<span class='danger'>*click*</span>")

/obj/item/grenade/bettermine/Crossed(AM as mob|obj)
	if(istype(AM, /obj/effect))
		return
	if(active)
		if(isturf(loc))
			if(ismob(AM))
				var/mob/MM = AM
				if(!(MM.movement_type & FLYING))
					if(MM.special.trigger_mines)
						triggermine(AM)
					else
						to_chat(MM, "You move over [src] without stepping on it")
			else
				triggermine(AM)

/obj/item/grenade/bettermine/explosive
	name = "explosive mine"
	var/range_devastation = 0
	var/range_heavy = 1
	var/range_light = 1
	var/range_flash = 2

/obj/item/grenade/bettermine/explosive/planted
	active = 1
	anchored = 1
	icon_state = "landmine_active"


/obj/item/grenade/bettermine/explosive/planted/proc/add_appearance()
	var/image/I = image(icon = 'icons/obj/betaadvanced.dmi', icon_state = "landmine_active", loc = src)
	I.override = TRUE
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/landmines/ordinary, "landmine_ordinary", I)

	var/image/I2 = image(icon = 'icons/obj/betaadvanced.dmi', icon_state = "landmine_active", loc = src)
	I2.override = TRUE
	I2.add_overlay(mutable_appearance('icons/mob/talk.dmi', "combat"))
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/landmines/large, "landmine_large", I2)

	var/image/I3 = image(icon = 'icons/obj/betaadvanced.dmi', icon_state = "landmine_active", loc = src)
	I3.override = TRUE
	I3.alpha = 80
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/landmines/small, "landmine_small", I3)


/obj/item/grenade/bettermine/explosive/planted/proc/remove_appearance()
	remove_alt_appearance("landmine_small")
	remove_alt_appearance("landmine_ordinary")
	remove_alt_appearance("landmine_large")


/obj/item/grenade/bettermine/explosive/planted/New()
	. = ..()
	add_appearance()


/obj/item/grenade/bettermine/explosive/planted/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/shovel))
		if(hidden == 0)
			if(do_after(user, 20, target = loc))
				to_chat(user, "You covered landmine with some sand.")
				icon_state = "landmine_hidden"
				hidden = 1
				remove_appearance()
				return
		else
			if(do_after(user, 20, target = loc))
				to_chat(user, "You uncovered landmine.")
				icon_state = "landmine_active"
				hidden = 0
				add_appearance()
				return
	if(istype(I, /obj/item/screwdriver) && active)
		to_chat(user, "You started carefully removing bolts from detonating plate.")
		I.play_tool_sound(src, 75)
		if(do_after(user, 15, target = loc))
			to_chat(user, "You carefully remove bolts from detonating plate.")
			press_bolted = 0
			return
	if(istype(I, /obj/item/wirecutters) && press_bolted == 0)
		if(do_after(user, 15, target = loc))
			I.play_tool_sound(src, 75)
			to_chat(user, "You carefully cut wires inside of this mine, now it can be safely deconstructed...")
			wire_cut = 1
			active = 0
			return
	if(istype(I, /obj/item/wrench) && wire_cut == 1)
		to_chat(user, "You started dissassemble mine components.")
		I.play_tool_sound(src, 75)
		if(do_after(user, 25, target = loc))
			switch(rand(1,10))
				if(5)
					to_chat(user, "You successfuly disassembled mine and got all components!")
					new/obj/item/crafting/sensor/(get_turf(src), 1)
					new/obj/item/stack/sheet/metal/(get_turf(src), 1)
					new/obj/item/stack/cable_coil/(get_turf(src), 2)
					qdel(src)
				else
					to_chat(user, "Sadly, you didn't take anything useful from this mine...")
					qdel(src)

/obj/item/grenade/bettermine/explosive/mineEffect(mob/victim)
	// explosion(loc, range_devastation, range_heavy, range_light, range_flash)
	var/mob/living/target = victim

	explosion(target.loc, 0, 0, 0, 0, 3)
	var/turf/open/floor/T = get_turf(target)
	if(istype(T))
		if(prob(80))
			T.break_tile_to_plating()
		else
			T.break_tile()

	if(!isliving(victim))
		return

	if(target.health <= 1)
		target.gib(1, 1)
	else
		target.adjustBruteLoss(min(99,(target.health - 1)))
		target.Knockdown(400)
		target.stuttering = 20
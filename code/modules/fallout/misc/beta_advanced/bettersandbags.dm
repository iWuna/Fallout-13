#define METAL 1
#define WOOD 2
#define SAND 3

//Barricades/cover

/obj/structure/barricade/better
	name = "chest high wall"
	desc = "Looks like this would make good cover."
	anchored = 1
	density = 1
	obj_integrity = 350
	max_integrity = 350
	proj_pass_rate = 50 //How many projectiles will pass the cover. Lower means stronger cover
	material = METAL
	var/dirlike = FALSE
	var/canpass = FALSE
	var/obj_state = 4
	var/state_max = 4

/obj/structure/barricade/better/New()
	..()
	checkbarricade()
	max_integrity = state_max * 50
	if(dir == 2)
		layer = ABOVE_MOB_LAYER

/obj/structure/barricade/better/deconstruct(disassembled = TRUE)
	qdel(src)

/obj/structure/barricade/better/CanPass(atom/movable/mover, turf/target, height=0)//So bullets will fly over and stuff.
	if(height == 0 || density == FALSE)
		return TRUE

	if(dirlike && istype(mover, /mob/living))
		if(mover.throwing)
			return TRUE
		if(get_dir(loc, target) & dir)
			return FALSE
		return TRUE

	else if(locate(/obj/structure/barricade) in get_turf(mover))
		return 1
	else if(istype(mover, /obj/item/projectile))
		if(!anchored)
			return 1
		var/obj/item/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return 1
		if(prob(proj_pass_rate))
			return 1
		return 0
	else
		return !density

/obj/structure/barricade/better/CheckExit(atom/movable/O, turf/target)
	if(density == FALSE)
		return TRUE

	if(dirlike && istype(O, /mob/living))
		if(O.throwing)
			return TRUE

		if(get_dir(loc, target) & dir)
			return FALSE
		return TRUE
	else
		return TRUE

/obj/structure/barricade/better/take_damage()
	..()
	if(obj_integrity <= (obj_state - 1) * 50)
		obj_state --
		checkbarricade()
	return


/obj/structure/barricade/better/proc/checkbarricade()
	icon_state = initial(icon_state) + "_[obj_state]"
	if(obj_state <= 1)
		density = 0
		layer = LOW_OBJ_LAYER
		proj_pass_rate = 100

/////BARRICADE TYPES///////

/obj/structure/barricade/better/sandbags
	name = "sandbags"
	desc = "Good barricade, but.."
	icon = 'icons/Marine/barricades.dmi'
	icon_state = "sandbag"
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 20
	pass_flags = LETPASSTHROW
	material = SAND
	climbable = TRUE
	dirlike = TRUE
	pixel_y = -2
	layer = BELOW_OBJ_LAYER

/obj/structure/barricade/better/sandbags/Initialize()
	..()
	update_icon()

/obj/structure/barricade/setDir(newdir)
	. = ..()
	update_icon()

/obj/structure/barricade/better/sandbags/update_icon()
	. = ..()
	switch(dir)
		if(SOUTH)
			layer = ABOVE_MOB_LAYER
		if(NORTH)
			layer = initial(layer) - 0.01
		else
			layer = initial(layer)

/obj/structure/barricade/better/sandbags/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	user.visible_message("<span class='notice'>[user] starts to take down [src]...</span>", "<span class='notice'>You start to take down [src]...</span>")
	if(!has_buckled_mobs() && do_after(user, 80, target = src))
		to_chat("<span class='notice'>You take down [src].</span>")
		new /obj/item/stack/sheet/mineral/sandbags(src.loc)
		qdel(src)
		return
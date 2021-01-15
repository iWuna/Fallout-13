//Fallout 13 general indestructible floor directory

/turf
	var/baseturf_icon
	var/baseturf_dir = 0

/turf/open/indestructible/ground
	icon = 'icons/fallout/turfs/ground.dmi'
	name = "\proper ground"
	icon_state = "wasteland1"
	intact = 1
	planetary_atmos = TRUE

	var/flags = NONE
	var/obj/structure/flora/turfPlant = null

/turf/open/indestructible/ground/New()
	..()
	baseturfs = src.type
	baseturf_icon = icon_state
	baseturf_dir = dir

/turf/open/indestructible/ground/attack_paw(mob/user)
	return src.attack_hand(user)

/turf/open/indestructible/ground/attackby(obj/item/C, mob/user, params)
	if(istype(C,/obj/item/stack/tile/plasteel))
		var/obj/item/stack/tile/plasteel/S = C
		if(S.use(1))
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You build a floor.</span>")
			ChangeTurf(/turf/open/floor/plating)
		else
			to_chat(user, "<span class='warning'>You need one floor tile to build a floor!</span>")

///turf/ground/Entered(go/A)
//	..()

/turf/open/indestructible/ground/handle_slip()
	return

/turf/open/indestructible/ground/singularity_act()
	return

/turf/open/indestructible/ground/can_have_cabling()
	return 1

//////////////////////////////////////////////////////////////////////

/turf/open/indestructible/ground/outside
	var/pre_snow_state = null
	turf_light_range = 3
	turf_light_power = 0.75

/turf/open/indestructible/ground/outside/Initialize()
	. = ..()
	flags_2 |= GLOBAL_LIGHT_TURF_2

#define GRASS_SPONTANEOUS_GROUND 		2
#define GRASS_WEIGHT_GROUND			4
#define LUSH_PLANT_SPAWN_LIST_GROUND list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_mesquite = 4, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_punga = 5, /obj/structure/flora/wasteplant/wild_coyote = 5, /obj/structure/flora/wasteplant/wild_tato = 5, /obj/structure/flora/wasteplant/wild_yucca = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_prickly = 5, /obj/structure/flora/wasteplant/wild_datura = 5, /obj/structure/flora/wasteplant/wild_buffalogourd = 5, /obj/structure/flora/wasteplant/wild_pinyon = 3, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)
#define DESOLATE_PLANT_SPAWN_LIST_GROUND list(/obj/structure/flora/grass/wasteland = 1)

/obj/structure/snow/pile
	gender = PLURAL
	anchored = TRUE
	name = "pile of snow"
	var/max_digs = 4

	desc = "Dont eat the yellow snow"
	icon = 'icons/effects/blood.dmi'
	icon_state = "snow_1"
	var/list/pre_init_sound

/obj/structure/snow/pile/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	pre_init_sound = T.step_sounds
	T.step_sounds = list("human" = "snowfootsteps")

/obj/structure/snow/pile/Destroy()
	var/turf/T = get_turf(src)
	T.step_sounds = pre_init_sound
	. = ..()


/obj/structure/snow/pile/attack_hand(mob/user)
	to_chat(user, "<span class='notice'>You begin digging the [src] with your hands.</span>")
	playsound(src, get_sfx("snowfootsteps"), 50)
	if(do_after(user, scale_agility(60, user), target = src))
		new/obj/item/stack/sheet/mineral/snow(user.loc, rand(0, 2))
		to_chat(user, "<span class='notice'>You dig some snow.</span>")
		max_digs -= 1
		if(max_digs <= 0)
			Destroy()
	else
		..()

/obj/structure/snow/pile/attackby(obj/item/shovel/I, mob/living/user)
	to_chat(user, "<span class='notice'>You begin digging the [src] with [I].</span>")
	playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1)
	if(do_after(user, scale_agility(30, user), target = loc))
		new/obj/item/stack/sheet/mineral/snow(user.loc, rand(0, 3))
		to_chat(user, "<span class='notice'>You dig some snow.</span>")
		max_digs -= 2
		if(max_digs <= 0)
			Destroy()
	else
		..()

/obj/structure/snow/pile/Initialize()
	. = ..()
	icon_state = "snow_[rand(1,5)]"

/turf/open/indestructible/ground/outside/desert
	name = "desert"
	icon_state = "wasteland"
	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/feracactus, /obj/item/seeds/corn,/obj/item/seeds/shroom, /obj/item/seeds/agave)
	slowdown = 1
	flags_1 = CAN_HAVE_NATURE | ADJACENCIES_OVERLAY
	var/dug = FALSE				//FALSE = has not yet been dug, TRUE = has already been dug
	var/pit_sand = 1
	var/storedindex = 0			//amount of stored items
	var/mob/living/gravebody	//is there a body in the pit?
	var/obj/structure/closet/crate/coffin/gravecoffin //or maybe a coffin?
	var/pitcontents = list()
	var/obj/dugpit/mypit
	var/unburylevel = 0
	var/list/sides = list()

/turf/open/indestructible/ground/outside/snow_act()
	snow = TRUE
	pre_snow_state = icon_state
	icon_state = "[pre_snow_state]_s"
	step_sounds = list("human" = "snowfootsteps")

/turf/open/indestructible/ground/outside/heat_act()
	snow = FALSE
	icon_state = pre_snow_state
	icon = initial(icon)
	step_sounds = list("human" = "dirtfootsteps")

/turf/open/indestructible/ground/outside/desert/Initialize()
	. = ..()
	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	icon_state = "wasteland[rand(1,31)]"
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open/water))
			var/obj/effect/overlay/desert_side/DS = new /obj/effect/overlay/desert_side(src)
			sides += DS
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)
		if(istype(turf_to_check, /turf/open/indestructible/ground/outside/water))
			var/obj/effect/overlay/desert_side/DS = new /obj/effect/overlay/desert_side(src)
			sides += DS
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)


/turf/open/indestructible/ground/outside/desert/Destroy()
	for(var/obj/effect/overlay/DS in sides)
		sides -= DS
		DS.Destroy()
	. = ..()

/obj/effect/overlay/desert_side
	name = "desert"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "wasteland_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/outside/desert/snow_act()
	snow = TRUE
	pre_snow_state = icon_state
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow[rand(0,12)]"
	step_sounds = list("human" = "snowfootsteps")

/turf/open/indestructible/ground/outside/desert/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS_GROUND))
		randPlant = pickweight(LUSH_PLANT_SPAWN_LIST_GROUND) //Create a new grass object at this location, and assign var
		turfPlant = new randPlant(src)
		. = TRUE //in case we ever need this to return if we spawned
		return .

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/indestructible/ground/outside/desert/T in RANGE_TURFS(3, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (5 * GRASS_WEIGHT))
			randPlant = pickweight(LUSH_PLANT_SPAWN_LIST_GROUND)
		else
			randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST_GROUND)
		turfPlant = new randPlant(src)
		. = TRUE

/turf/open/indestructible/ground/outside/desert/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

//Make sure we delete the plant if we ever change turfs
/turf/open/indestructible/ground/outside/desert/ChangeTurf()
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

/turf/open/indestructible/ground/outside/dirt
	name = "dirt"
	icon_state = "dirtfull"
	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /ob7j/item/seeds/agave)
	slowdown = 0.2
	flags_1 = CAN_HAVE_NATURE
	air = /datum/gas_mixture/turf

/turf/open/indestructible/ground/outside/dirt/snow_act()
	snow = TRUE
	pre_snow_state = icon_state
	icon_state = "[pre_snow_state]_s"
	step_sounds = list("human" = "snowdirtfootsteps")

/turf/open/indestructible/ground/outside/road
	name = "\proper road"
	icon_state = "innermiddle"
	icon = 'icons/turf/f13road.dmi'
	step_sounds = list("human" = "erikafootsteps")
	snow_trail = FALSE

/turf/open/indestructible/ground/outside/road/snow_act()
	snow = TRUE
	icon = 'icons/turf/f13road_snow.dmi'

/turf/open/indestructible/ground/outside/road/heat_act()
	snow = FALSE
	icon = initial(icon)

/turf/open/indestructible/ground/outside/sidewalk
	name = "\proper sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/turf/f13road.dmi'
	step_sounds = list("human" = "erikafootsteps")
	snow_trail = FALSE

/turf/open/indestructible/ground/outside/sidewalk/snow_act()
	snow = TRUE
	icon = 'icons/turf/f13road_snow.dmi'

/turf/open/indestructible/ground/outside/sidewalk/heat_act()
	snow = FALSE
	icon = initial(icon)

/obj/effect/overlay/sidewalk_side
	name = "desert"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "sidewalk_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/overlay/sidewalk_side/corner
	icon_state = "sidewalk_corner"

/turf/open/indestructible/ground/outside/ruins
	name = "ruins"
	desc = "It's just a pile of concrete rubble."
	icon_state = "rubblefull"
	icon = 'icons/fallout/turfs/ground.dmi'
	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/wood
	name = "\proper wood planks"
	icon_state = "housewood1"
	icon = 'icons/turf/floors.dmi'
	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/wood/snow_act()
	return

/turf/open/indestructible/ground/outside/wood/heat_act()
	return

/turf/open/indestructible/ground/outside/water
	gender = PLURAL
	name = "river water"
	desc = "Shallow river water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	slowdown = 2
	step_sounds = list("human" = "waterfootsteps")

/turf/open/indestructible/ground/outside/water/snow_act()
	return
	
/turf/open/indestructible/ground/outside/water/heat_act()
	return

/turf/open/indestructible/ground/outside/water/Initialize()
	. = ..()
	update_icon()

/turf/open/indestructible/ground/outside/snow
	initial_gas_mix = "o2=22;n2=82;TEMP=285"
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	desc = "Looks cold."
	icon_state = "snow"

/turf/open/indestructible/ground/outside/ruins/ex_act(severity, target)
	contents_explosion(severity, target)
	switch(severity)
		if(4)
			if(prob(5))
				ChangeTurf(baseturfs)
		if(3)
			if(prob(25))
				ChangeTurf(baseturfs)
		if(2)
			if(prob(50))
				ChangeTurf(baseturfs)
		if(1)
			ChangeTurf(baseturfs)

/////////////////////////////////////////////////////////

#define SHROOM_SPAWN_GROUND	1

/turf/open/indestructible/ground/inside/mountain
	name = "cave"
	icon_state = "rockfloor1"
	icon = 'icons/fallout/turfs/mining.dmi'
//	allowed_plants = list(/obj/item/seeds/glow)
	step_sounds = list("human" = "erikafootsteps")
	var/list/sides = list()

/turf/open/indestructible/ground/inside/mountain/Initialize()
	. = ..()
	//If no fences, machines, etc. try to plant mushrooms
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantShrooms()
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open))
			var/obj/effect/overlay/rockfloor_side/DS = new /obj/effect/overlay/rockfloor_side(src)
			sides += DS
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)

/turf/open/indestructible/ground/inside/mountain/Destroy()
	for(var/obj/effect/overlay/DS in sides)
		sides -= DS
		DS.Destroy()
	. = ..()

/obj/effect/overlay/rockfloor_side
	name = "cave"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "rockfloor_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/inside/mountain/proc/plantShrooms()
	if(prob(SHROOM_SPAWN_GROUND))
		turfPlant = new /obj/structure/flora/wasteplant/wild_fungus(src)
		. = TRUE //in case we ever need this to return if we spawned
		return.

/turf/open/indestructible/ground/inside/mountain/New()
	..()
	icon_state = "rockfloor[rand(1,2)]"

/turf/open/indestructible/ground/inside/dirt
	name = "dirt"
	icon_state = "dirtfull"
	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /obj/item/seeds/agave)
	slowdown = 0.2
	flags_1 = CAN_HAVE_NATURE

/turf/open/indestructible/ground/inside/subway
	name = "subway tunnel"
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "railsnone"
	var/list/sides = list()

/turf/open/indestructible/ground/inside/subway/Initialize()
	. = ..()
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open))
			var/obj/effect/overlay/railsnone_side/DS = new /obj/effect/overlay/railsnone_side(src)
			sides += DS
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)

/turf/open/indestructible/ground/inside/subway/Destroy()
	for(var/obj/effect/overlay/DS in sides)
		sides -= DS
		DS.Destroy()
	. = ..()

/obj/effect/overlay/railsnone_side
	name = "cave"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "railsnone_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/overlay/sand_w_side
	name = "sand"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "sand_water_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/overlay/sand_w_side/corner
	icon_state = "sand_water_corner"
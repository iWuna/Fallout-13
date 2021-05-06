/obj/effect/overlay
	name = "overlay"

/obj/effect/overlay/singularity_act()
	return

/obj/effect/overlay/singularity_pull()
	return

/obj/effect/overlay/beam//Not actually a projectile, just an effect.
	name="beam"
	icon='icons/effects/beam.dmi'
	icon_state="b_beam"
	var/atom/BeamSource

/obj/effect/overlay/beam/Initialize()
	. = ..()
	QDEL_IN(src, 10)

/obj/effect/overlay/palmtree_r
	name = "palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm1"
	density = TRUE
	layer = WALL_OBJ_LAYER
	anchored = TRUE

/obj/effect/overlay/palmtree_l
	name = "palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm2"
	density = TRUE
	layer = WALL_OBJ_LAYER
	anchored = TRUE

/obj/effect/overlay/coconut
	gender = PLURAL
	name = "coconuts"
	icon = 'icons/misc/beach.dmi'
	icon_state = "coconuts"

/obj/effect/overlay/sparkles
	gender = PLURAL
	name = "sparkles"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shieldsparkles"
	anchored = TRUE

/obj/effect/overlay/temp/impact_effect/plasma
	icon_state = "greenshatter2"

/obj/effect/overlay/beam/temp/impact_effect/plasma/Initialize()
	. = ..()
	QDEL_IN(src, 10)

/obj/effect/overlay/wateredge
	name = "sand overlay"
	desc = "water goes brrrr."
	icon = 'icons/effects/turf_overlay.dmi'
	icon_state = "sand_overlay"
	anchored = TRUE
	layer = ABOVE_OPEN_TURF_LAYER

/obj/effect/overlay/light_visible
	name = ""
	icon = 'icons/effects/light_overlays/light_32.dmi'
	icon_state = "light"
	layer = O_LIGHTING_VISUAL_LAYER
	plane = O_LIGHTING_VISUAL_PLANE
	appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	alpha = 0
	vis_flags = NONE

/obj/effect/overlay/light_cone
	name = ""
	icon = 'icons/effects/light_overlays/light_cone.dmi'
	icon_state = "light"
	layer = O_LIGHTING_VISUAL_LAYER
	plane = O_LIGHTING_VISUAL_PLANE
	appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	vis_flags = NONE
	alpha = 110

/obj/effect/overlay/wateredge/sandwater
	name = "sand water overlay"
	icon_state = "sand_water_overlay"

/obj/effect/overlay/wateredge/waterwood
	name = "water wood overlay"
	icon_state = "water_wood_overlay"

/obj/effect/overlay/wateredge/dirtwater
	name = "dirt water overlay"
	icon_state = "dirt_water_overlay"

/obj/effect/overlay/wateredge/dirtedge
	name = "dirt overlay"
	icon_state = "dirt_overlay"

/obj/effect/overlay/wateredge/watergrasss
	name = "water grass overlay"
	icon_state = "water_grass_overlay"

/obj/effect/overlay/rubbleoverlay
	name = "rubble overlay"
	desc = "rubble goes brrrr."
	icon = 'icons/effects/turf_overlay.dmi'
	icon_state = "rubble_overlay"
	anchored = TRUE
	layer = FLY_LAYER

/obj/effect/overlay/rubbleoverlay/bottomleft
	name = "rubble overlay"
	icon_state = "0,0"

/obj/effect/overlay/rubbleoverlay/bottomright
	name = "rubble overlay"
	icon_state = "1,0"

/obj/effect/overlay/rubbleoverlay/topleft
	name = "rubble overlay"
	icon_state = "0,1"

/obj/effect/overlay/rubbleoverlay/topright
	name = "rubble overlay"
	icon_state = "1,1"
/obj/landmark/vertibird
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x"
	anchored = 1
	invisibility = INVISIBILITY_ABSTRACT

/obj/landmark/vertibird/New()
	..()
	vertibirdLandZone += src

/obj/landmark/vertibird/flare/New()
	..()
	var/message = "Long-range scanners detected new emergency signal. Landing locations updated"
	for(var/obj/machinery/computer/vertibird_console/C in vertibird_console)
		C.radio.talk_into(src, message, C.channel, get_spans(), get_default_language())
		C.say("Long-range scanners detected new emergency signal. Landing locations updated")

/obj/landmark/vertibird_enter
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x"
	anchored = 1
	invisibility = INVISIBILITY_ABSTRACT

/obj/landmark/vertibird_enter/New()
	vertibirdEnterZone = locate(src.x, src.y, src.z)
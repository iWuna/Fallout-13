/obj/wreckage/vertibird
	name = "VB-02"
	icon = 'icons/fallout/vehicles/vertibird.dmi'
	icon_state = "vb-crashed"
	pixel_x = -128
	pixel_y = -64
	layer = 4

/obj/vertibird
	name = "VB-02"
	icon = 'icons/fallout/vehicles/vertibird.dmi'
	icon_state = "vb-static"
	pixel_x = -128
	pixel_y = -64
	layer = 4
	obj_integrity = 10000
	max_integrity = 10000
	var/engine = FALSE
	var/locked = TRUE
	var/inFly = FALSE
	anchored = TRUE
	var/obj/machinery/camera/all/builtInCamera

/obj/vertibird/New()
	..()
	var/obj/item/start = new /obj/landmark/vertibird()
	start.name = "Camp Navarro"
	start.loc = loc
	vertibird = src
	builtInCamera = new (src)
	builtInCamera.network = list("vertibird")
	builtInCamera.c_tag = "VB-02"

	builtInCamera.view_range = 12

/obj/vertibird/Destroy(force)
	builtInCamera.Destroy()
	. = ..()

/obj/vertibird/attack_hand(mob/user)
	if(locked)
		to_chat(usr, "It's locked.")
		return

	if(inFly)
		return

	getIn(user)

/obj/vertibird/proc/toggleLock(var/mob/user)
	if(locked)
		locked = FALSE
		to_chat(user, "You unlock the vertibird.")
	else
		locked = TRUE
		to_chat(user, "You lock the vertibird.")

/obj/vertibird/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/key/vertibird))
		toggleLock(user)
	else
		return ..()

/obj/vertibird/MouseDrop_T(obj/O, mob/user)
	if(locked)
		to_chat(usr, "It's locked.")
		return

	moveIn(O)

/obj/vertibird/proc/getIn(mob/U)
	src.visible_message("[U] enters the vertibird.")
	U.forceMove(vertibirdEnterZone)

/obj/vertibird/proc/moveIn(obj/O)
	O.forceMove(vertibirdEnterZone)

/obj/vertibird/proc/ejectTurf()
	return locate(src.x, src.y + 6, src.z)

obj/vertibird/proc/getLocationsHTML()
	var/html
	for(var/I = 1 to vertibirdLandZone.len)
		var/obj/landmark/vertibird/mark = vertibirdLandZone[I]
		html += "<a href='?src=\ref[src];fly=true;x=[mark.x];y=[mark.y];z=[mark.z];name=[mark.name]'>[mark.name]</a><br>"
	return html

obj/vertibird/proc/flew(targetX, targetY, targetZ)

	x = targetX
	y = targetY
	z = targetZ

	playsound(src, "sound/f13machines/vertibird_land.ogg", 100)
	playsound(vertibirdEnterZone, "sound/f13machines/vertibird_land.ogg", 50)

	spawn(100)
		inFly = FALSE
		src.icon_state = "vb-slow"

	spawn(300)
		if(src.icon_state == "vb-slow")
			src.icon_state = "vb-static"

obj/vertibird/proc/beginFly()
	var/datum/browser/popup = new(usr, "vending", (name))
	popup.set_content(getLocationsHTML())
	popup.open()

obj/vertibird/proc/flyGlobal()
	to_chat(world, "<font size='3' color='orange'>The ever increasing roar of an aircraft tearing through the skies above enters your ears.</font>")
	sound_to_playing_players("sound/f13machines/vertibird_global.ogg", 50, 0)


obj/vertibird/proc/fly(targetX, targetY, targetZ, name="")
	if(inFly)
		return

	playsound(src, "sound/f13machines/vertibird_takeoff.ogg", 100)
	playsound(vertibirdEnterZone, "sound/f13machines/vertibird_takeoff.ogg", 50)
	inFly = TRUE
	icon_state = "vb-fast"
	for(var/obj/machinery/computer/vertibird_console/C in vertibird_console)
		var/message = "Now departing."
		if(name)
			message += " Destination: [name]."
		message += " Please stand by"
		C.say(message)


	spawn(60)
		playsound(src, "sound/f13machines/vertibird_local.ogg", 100)
		playsound(vertibirdEnterZone, "sound/f13machines/vertibird_local.ogg", 50)

		flyGlobal()

		spawn(100)
			flew(targetX, targetY, targetZ)
			for(var/obj/machinery/computer/vertibird_console/C in vertibird_console)
				C.say("Destination point reached. Doors safeties disabled")

/obj/vertibird/Topic(href, href_list)
	if(..())
		return

	if(href_list["fly"])
		var/name = href_list["name"]
		var/x = text2num(href_list["x"])
		var/y = text2num(href_list["y"])
		var/z = text2num(href_list["z"])
		fly(x, y, z, name)

/obj/machinery/computer/vertibird_console
	name = "Vertibird control"
	desc = "Used to control the autopilot on linked vertibirds."
	icon = 'icons/fallout/machines/terminals.dmi'
	icon_state = "enclave"
	icon_screen = "enclave_on"
	var/obj/item/radio/radio
	var/radio_key = /obj/item/encryptionkey/headset_enclave
	var/channel = "Enclave"
	var/common_channel = null

/obj/machinery/computer/vertibird_console/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	radio = new(src)
	vertibird_console += src


/obj/machinery/computer/vertibird_console/attack_hand(mob/user)
	vertibird:beginFly()


/obj/machinery/computer/vertibird_console/Destroy()
	vertibird_console -= src
	. = ..()
/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 16,"energy" = 16, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	strip_delay = 60
	resistance_flags = NONE
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR
	var/hud_type = null

	dog_fashion = /datum/dog_fashion/head/helmet

/obj/item/clothing/head/helmet/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_HEAD))

/obj/item/clothing/head/helmet/sec
	can_flashlight = 1

/obj/item/clothing/head/helmet/sec/attackby(obj/item/I, mob/user, params)
	if(issignaler(I))
		var/obj/item/assembly/signaler/S = I
		if(F) //Has a flashlight. Player must remove it, else it will be lost forever.
			to_chat(user, "<span class='warning'>The mounted flashlight is in the way, remove it first!</span>")
			return

		if(S.secured)
			qdel(S)
			var/obj/item/bot_assembly/secbot/A = new
			user.put_in_hands(A)
			to_chat(user, "<span class='notice'>You add the signaler to the helmet.</span>")
			qdel(src)
			return
	return ..()

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	item_state = "helmetalt"
	armor = list("melee" = 35, "bullet" = 55, "laser" = 35, "energy" = 35, "bomb" = 55, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)
	can_flashlight = 1
	dog_fashion = null

/obj/item/clothing/head/helmet/old
	name = "degrading helmet"
	desc = "Standard issue security helmet. Due to degradation the helmet's visor obstructs the users ability to see long distances."
	tint = 2

/obj/item/clothing/head/helmet/blueshirt
	icon_state = "blueshift"
	item_state = "blueshift"

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	armor = list("melee" = 60, "bullet" = 25, "laser" = 25,"energy" = 25, "bomb" = 25, "bio" = 2, "rad" = 0, "fire" = 50, "acid" = 50)
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dog_fashion = null

/obj/item/clothing/head/helmet/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src]")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

			if(active_sound)
				while(up)
					playsound(src.loc, "[active_sound]", 100, 0, 4)
					sleep(15)

/obj/item/clothing/head/helmet/justice
	name = "helmet of justice"
	desc = "WEEEEOOO. WEEEEEOOO. WEEEEOOOO."
	icon_state = "justice"
	toggle_message = "You turn off the lights on"
	alt_toggle_message = "You turn on the lights on"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	can_toggle = 1
	toggle_cooldown = 20
	active_sound = 'sound/items/weeoo1.ogg'
	dog_fashion = null

/obj/item/clothing/head/helmet/justice/escape
	name = "alarm helmet"
	desc = "WEEEEOOO. WEEEEEOOO. STOP THAT MONKEY. WEEEOOOO."
	icon_state = "justice2"
	toggle_message = "You turn off the light on"
	alt_toggle_message = "You turn on the light on"

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "A robust and strong SWAT helmet, particularly good at defending against melee weapons."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25,"energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/swat/nanotrasen
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet with the Nanotrasen logo emblazoned on the top."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "thunderdome"
	item_state = "thunderdome"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 25,"energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 50, "acid" = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/roman
	name = "roman helmet"
	desc = "An ancient helmet made of bronze and leather."
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	armor = list("melee" = 25, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	resistance_flags = FIRE_PROOF
	icon_state = "roman"
	item_state = "roman"
	strip_delay = 100
	dog_fashion = null

/obj/item/clothing/head/helmet/roman/fake
	desc = "An ancient helmet made of plastic and leather."
	armor = list("melee" = 15, "bullet" = 10, "laser" = 15, "energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 10, "acid" = 0)

/obj/item/clothing/head/helmet/roman/legionaire
	name = "roman legionaire helmet"
	desc = "An ancient helmet made of bronze and leather. Has a red crest on top of it."
	icon_state = "roman_c"
	item_state = "roman_c"

/obj/item/clothing/head/helmet/roman/legionaire/fake
	desc = "An ancient helmet made of plastic and leather. Has a red crest on top of it."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	item_state = "gladiator"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	dog_fashion = null

/obj/item/clothing/head/helmet/redtaghelm
	name = "red laser tag helmet"
	desc = "They have chosen their own end."
	icon_state = "redtaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "redtaghelm"
	armor = list("melee" = 10, "bullet" = 16, "laser" = 25,"energy" = 25, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/bluetaghelm
	name = "blue laser tag helmet"
	desc = "They'll need more men."
	icon_state = "bluetaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "bluetaghelm"
	armor = list("melee" = 10, "bullet" = 16, "laser" = 25,"energy" = 25, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "A classic metal helmet."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list("melee" = 60, "bullet" = 25, "laser" = 25,"energy" = 25, "bomb" = 25, "bio" = 2, "rad" = 0, "fire" = 0, "acid" = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null


/obj/item/clothing/head/helmet/knight/Initialize(mapload)
	. = ..()
	var/datum/component = GetComponent(/datum/component/wearertargeting/earprotection)
	qdel(component)

/obj/item/clothing/head/helmet/knight/blue
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/head/helmet/knight/yellow
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/head/helmet/knight/red
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/head/helmet/skull
	name = "skull helmet"
	desc = "An intimidating tribal helmet, it doesn't look very comfortable."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES
	armor = list("melee" = 40, "bullet" = 15, "laser" = 10, "energy" = 10, "bomb" = 25, "bio" = 5, "rad" = 20, "fire" = 40, "acid" = 20)
	icon_state = "skull"
	item_state = "skull"
	strip_delay = 100

/obj/item/clothing/head/helmet/durathread//F13: Needs numbers tuned and perhaps icon.
	name = "makeshift helmet"
	desc = "A hardhat with strips of leather and durathread for additional blunt protection."
	icon_state = "durathread"
	item_state = "durathread"
	armor = list("melee" = 25, "bullet" = 10, "laser" = 20,"energy" = 10, "bomb" = 30, "bio" = 15, "rad" = 20, "fire" = 50, "acid" = 50)
	strip_delay = 60

//Fallout 13
/obj/item/clothing/head/helmet/knight/fluff/metal
	name = "metal helmet"
	desc = "An iron helmet forged by tribal warriors, with a unique design to protect the face from arrows and axes."
	icon_state = "metalhelmet"
	item_state = "metalhelmet"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	armor = list("melee" = 40, "bullet" = 25, "laser" = 25, "energy" = 20, "bomb" = 16, "bio" = 0, "rad" = 0)

/obj/item/clothing/head/helmet/knight/fluff/metal/reinforced
	name = "reinforced metal helmet"
	icon_state = "metalhelmet_r"
	item_state = "metalhelmet_r"
	armor = list("melee" = 45, "bullet" = 35, "laser" = 40, "energy" = 25, "bomb" = 16, "bio" = 0, "rad" = 0)

/obj/item/clothing/head/helmet/knight/fluff/metal/strange
	name = "strange helmet"
	desc = "A steel helmet forged by tribal warriors, with additional plating to protect again projectile and laser fire."
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 25, "bomb" = 16, "bio" = 0, "rad" = 0)

/obj/item/clothing/head/helmet/knight/fluff/rider
	name = "rider helmet" //Not raider. Rider.
	desc = "It's a fancy dark metal helmet with orange spray painted flames."
	icon_state = "rider"
	item_state = "rider"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/riot/vaultsec
	name = "security helmet"
	desc = "A standard issue vault security helmet, pretty robust."

//Remnants
/obj/item/clothing/head/donor/enclave
	name = "enclave forge cap"
	desc = "A resistant, black forage cap issued to Enclave soldiers."
	icon_state = "enclave_cap"
	item_state = "enclave_cap"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 20, "energy" = 20, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

//Raider
/obj/item/clothing/head/helmet/f13/raider
	name = "base raider helmet"
	desc = "for testing"
	icon_state = "supafly"
	item_state = "supafly"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 35, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 30, "bio" = 20, "rad" = 0, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/f13/raider/supafly
	name = "supa-fly raider helmet"
	desc = "It's a makeshift raider helmet, made of leather. It heavily smells with chems and sweat."
	icon_state = "supafly"
	item_state = "supafly"

/obj/item/clothing/head/helmet/f13/raider/supafly/Initialize() //HQ parts reinforcement
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/raider/arclight
	name = "raider arclight helmet"
	desc = "This will protect you against flashes."
	icon_state = "arclight"
	item_state = "arclight"
	dynamic_hair_suffix = ""
	flash_protect = 2
	tint = 1
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/f13/raider/arclight/attack_self(mob/user)
	weldingvisortoggle(user)

/obj/item/clothing/head/helmet/f13/raider/arclight/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/raider/blastmaster
	name = "raider blastmaster helmet"
	icon_state = "blastmaster"
	item_state = "blastmaster"
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/raider/blastmaster/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/raider/yankee
	name = "yankee raider helmet"
	desc = "Long time ago, it has belonged to a football player, now it belongs to wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/head/helmet/f13/raider/yankee/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/raider/eyebot
	name = "eyebot helmet"
	desc = "It is a dismantled eyebot, hollowed out to accommodate for a humanoid head."
	icon_state = "eyebot"
	item_state = "eyebot"
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	strip_delay = 50
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/raider/eyebot/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/raider/psychotic
	name = "psycho-tic raider helmet"
	desc = "A leather skullcap with tufts of hair sticking from each side."
	icon_state = "psychotic"
	item_state = "psychotic"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR

/obj/item/clothing/head/helmet/f13/raider/psychotic/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/raider/ant
	name = "AntAgonizer's cowl"
	desc = "A handmade cowl made from the chitin of oversized ants. Seriously looks like something out of a comic book. Could probably be reinforced, if you're so inclined."
	icon_state = "anthelm"
	item_state = "anthelm"

/obj/item/clothing/head/helmet/f13/raider/ant/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/*
/obj/item/clothing/head/helmet/f13/raider/r
	name = "reinforced base raider helmet"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 35, "energy" = 35, "bomb" = 40, "bio" = 20, "rad" = 0, "fire" = 50, "acid" = 0)

/obj/item/clothing/head/helmet/f13/raider/r/supafly
	name = "reinforced supa-fly raider helmet"

/obj/item/clothing/head/helmet/f13/raider/r/arclight
	name = "reinforced raider arclight helmet"

/obj/item/clothing/head/helmet/f13/raider/r/blastmaster
	name = "reinforced raider blastmaster helmet"

/obj/item/clothing/head/helmet/f13/raider/r/yankee
	name = "reinforced yankee raider helmet"

/obj/item/clothing/head/helmet/f13/raider/r/eyebot
	name = "reinforced eyebot helmet"

/obj/item/clothing/head/helmet/f13/raider/r/psychotic/
	name = "reinforced psycho-tic raider helmet"
	desc = "A leather skullcap with tufts of Yaoguai hair sticking from each side."
*/

//Combat armor

/obj/item/clothing/head/helmet/f13/combat
	name = "combat helmet"
	desc = "An old military grade pre-war combat helmet."
	desc = "A pre-war ceramic and kevlar helmet designed to absorb kinetic impacts and stop projectiles from entering the users skull. Has the words BORN TO KILL written on the outside in chalk."
	icon_state = "combat_helmet"
	item_state = "combat_helmet"
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 40, "bomb" = 50, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20)
	strip_delay = 50
	flags_inv = HIDEEARS|HIDEHAIR
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/combat/dark
	name = "combat helmet"
	desc = "An old military grade pre-war combat helmet."
	color = "#302E2E" // Dark Grey

/obj/item/clothing/head/helmet/f13/combat/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/f13/combat/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/head/helmet/f13/combat/mk2
	name = "reinforced combat helmet"
	desc = "An advanced pre-war titanium plated, ceramic coated, kevlar, padded helmet designed to withstand extreme punishment of all forms."
	icon_state = "combat_helmet_mk2"
	item_state = "combat_helmet_mk2"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 40, "bomb" = 39, "bio" = 70, "rad" = 70, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/combat/remnant
    desc = "A dark helmet with yellow lenses, used commonly in espionage or shadow ops. Worn by CAG or OS members."
    icon_state = "remnant_helmet"
    item_state = "remnant_helmet"

/obj/item/clothing/head/helmet/f13/combat/mk2/dark
	name = "reinforced combat helmet"
	color = "#302E2E" // Dark Grey

/obj/item/clothing/head/helmet/f13/combat/brotherhood
	name = "brotherhood combat helmet"
	desc = "An improved combat helmet, bearing the symbol of the Knights."
	icon_state = "brotherhood_helmet"
	item_state = "brotherhood_helmet"
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/head/helmet/f13/combat/brotherhood/senior
	name = "brotherhood senior knight combat helmet"
	desc = "An improved combat helmet, bearing the symbol of the Knights in silver."
	icon_state = "brotherhood_helmet_senior"
	item_state = "brotherhood_helmet_senior"

/obj/item/clothing/head/helmet/f13/combat/environmental
	name = "environmental armor helmet"
	desc = "A full head helmet and gas mask, developed for use in heavily contaminated environments."
	icon_state = "env_helmet"
	item_state = "env_helmet"
	flags_inv = HIDEMASK|HIDEEARS|HIDEFACE|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 45, "bomb" = 55, "bio" = 70, "rad" = 100, "fire" = 60, "acid" = 50)
	strip_delay = 60
	equip_delay_other = 60
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/f13/combat/environmental/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_NO_INSULATION, TRUE, FALSE)

/obj/item/clothing/head/helmet/f13/atomzealot
	name = "zealot helm"
	desc = "The helmet of an agent of the Division."
	icon_state = "atomzealot"
	item_state = "atomzealot"
	armor = list("melee" = 30, "bullet" = 35, "laser" = 30, "energy" = 30, "bomb" = 30, "bio" = 70, "rad" = 100, "fire" = 65, "acid" = 30)

/obj/item/clothing/head/helmet/f13/shamanhead
	name = "ritual headress"
	desc = "Hand carved skull headress, uniquely suited for the spiritual leader of the Wayfarer Tribe."
	icon_state = "shamanhead"
	item_state = "shamanhead"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 5, "energy" = 5, "bomb" = 20, "bio" = 70, "rad" = 10, "fire" = 20, "acid" = 0)

/obj/item/clothing/head/helmet/f13/atombeliever
	name = "believer headdress"
	desc = "The headwear of the true faith."
	icon_state = "atombeliever"
	item_state = "atombeliever"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 5, "energy" = 5, "bomb" = 20, "bio" = 70, "rad" = 100, "fire" = 20, "acid" = 0)

/obj/item/clothing/head/helmet/f13/deathskull
	name = "eerie helm"
	desc = "A helmet fastened from the skull of a deer. Something about it doesn't look right."
	icon_state = "shamskull"
	item_state = "shamskull"
	armor = list("melee" = 15, "bullet" = 20, "laser" = 15, "energy" = 20, "bomb" = 30, "bio" = 20, "rad" = 10, "fire" = 10, "acid" = 0)

/obj/item/clothing/head/helmet/f13/hoodedmask
	name = "hooded mask"
	desc = "A gask mask with the addition of a hood."
	icon_state = "Hooded_Gas_Mask"
	item_state = "Hooded_Gas_Mask"
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 65, "acid" = 30)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/f13/jasonmask
	name = "jasons mask"
	desc = "A metal mask made specifically for jason."
	icon_state = "jasonmask"
	item_state = "jasonmask"
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 65, "acid" = 30)

/obj/item/clothing/head/helmet/f13/brahmincowboyhat
	name = "brahmin leather cowboy hat"
	desc = "A cowboy hat made from brahmin hides."
	icon_state = "brahmin_leather_cowboy_hat"
	item_state = "brahmin_leather_cowboy_hat"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 15, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 70, "acid" = 15)

/obj/item/clothing/head/helmet/f13/rustedcowboyhat
	name = "Rusted Cowboy Hat"
	desc = "A cowboy hat made from tanned leather hides."
	icon_state = "rusted_cowboy"
	item_state = "rusted_cowboy"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 15, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 70, "acid" = 15)

/obj/item/clothing/head/helmet/f13/raidercombathelmet
	name = "raider combat helmet"
	desc = "A combat helmet modified with metal plating"
	icon_state = "raider_combat_helmet"
	item_state = "raider_combat_helmet"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 35, "energy" = 35, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 65, "acid" = 30)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR


/obj/item/clothing/head/helmet/f13/raidercombathelmet/mk2
	name = "reinforced raider combat helmet"
	desc = "A combat helmet modified with high quality armor plating"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 40, "bomb" = 39, "bio" = 70, "rad" = 70, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/combat/knightcap
	name = "knight-captain combat helmet"
	desc = "The specialized combat helmet of the Knight-Captain, with a golden crest."
	icon_state = "knightcap"
	item_state = "knightcap"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 60, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/head/helmet/f13/combat/enclave
	name = "enclave combat helmet"
	desc = "An intimidating helmet that is issued with it's corresponding suit."
	icon_state = "enclave_helmet"
	item_state = "enclave_helmet"
	armor = list("melee" = 50, "bullet" = 39, "laser" = 25, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 20)

/obj/item/clothing/head/helmet/f13/combat/swat
	name = "SWAT combat helmet"
	desc = "A prewar combat helmet issued to S.W.A.T. personnel."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"

//Sulphite Helm

/obj/item/clothing/head/helmet/f13/sulphitehelm
	name = "Sulphite Helmet"
	desc = "A sulphite raider helmet, affixed with thick anti-ballistic glass over the eyes."
	icon_state = "sulphite_helm"
	item_state = "sulphite_helm"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 35, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 20)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

//Strange Combat Helm

/obj/item/clothing/head/helmet/f13/rangerbroken
	name = "broken riot helmet"
	icon_state = "ranger_broken"
	desc = "An old riot police helmet, out of use around the time of the war."
	armor = list("melee" = 50, "bullet" = 50, "laser" = 40, "energy" = 50, "bomb" = 39, "bio" = 20, "rad" = 20, "fire" = 30, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flash_protect = 1

/obj/item/clothing/head/helmet/f13/rangercustomflicker
	name = "broken riot helmet"
	icon_state = "rangercustom"
	item_state = "rangercustom"
	desc = "A broken old riot police helmet, out of use around the time of the war. The visor of this one has been spray-painted orange and the lower half a deep red."
	armor = list("melee" = 40, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = LAVA_PROOF | FIRE_PROOF

//Legion
/obj/item/clothing/head/helmet/f13/legion
	name = "legion helmet"
	desc = "Unadorned legion helmet"
	icon_state = "legrecruit"
	item_state = "legrecruit"
	lefthand_file = ""
	righthand_file = ""
	armor = list("melee" = 40, "bullet" = 25, "laser" = 10, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/f13/legion/recruit
	name = "legion recruit helmet"
	desc = "It's a leather legion recruit helmet."
	icon_state = "legrecruit"
	item_state = "legrecruit"

/obj/item/clothing/head/helmet/f13/legion/recruit/scout
	name = "legion scout hood"
	desc = "It's a leather hood worn by legion scouts."
	icon_state = "legscout"
	item_state = "legscout"

/obj/item/clothing/head/helmet/f13/legion/prime
	name = "legion prime helmet"
	desc = "A helmet belonging to a legion prime, it looks sturdier than a normal legion recruit helmet."
	item_state = "legprime"
	icon_state = "legprime"
	armor = list("melee" = 50, "bullet" = 35, "laser" = 15, "energy" = 15, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/prime/alt
	name = "legion prime helmet"
	desc = "A helmet belonging to a legion prime, it looks sturdier than a normal legion recruit helmet. Comes with a pair of goggles."
	item_state = "leglineman"
	icon_state = "leglineman"

/obj/item/clothing/head/helmet/f13/legion/prime/alt/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src]")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

			if(active_sound)
				while(up)
					playsound(src.loc, "[active_sound]", 100, 0, 4)
					sleep(15)

/obj/item/clothing/head/helmet/f13/legion/vet
	name = "legion veteran helmet"
	desc = "It's a metal legion veteran helmet, looks pretty sturdy."
	icon_state = "legvet"
	item_state = "legvet"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/vet/jonesarmorhelmet
	name= "Galea Articuli"
	desc = "A hand-forged helmet seemingly made for a veteran legionary, taking into account the general shape and similarity to the standard-issue helmet. Not only does it look sturdy as hell, it also looks absolutely beautiful to the average engraving enjoyer. The patterns of the engravings are elegant, curving and twisting around the helmet with the utmost grace as to not sully a helmet of such high quality. In place of the standard red stripe going down the middle of the helmet, there's a gold one instead. It shines beautifully in light, and hides the wearer well in darkness. Upon closer inspection, there's a small space carved out inside the helmet. It's not rough or makeshift, in fact, it looks like it was designed with that space in mind. As a result of not being solid metal, the area the space resides in is slightly thinner and provides less protection than a normal helmet. The space is similar in size to that of a fedora's, but without the capacity to store guns or other large items due to the rigidity of the helmet. Don't worry, though. It's been loosened around the neck area, so you can still tip it."
	icon_state = "jonesarmorhelmet"
	item_state = "jonesarmorhelmet"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small/detective

/obj/item/clothing/head/helmet/f13/legion/vet/jonesarmorhelmet/decan
	name = "Galea Plumosus Articuli"
	desc = "A hand-forged helmet seemingly made for a veteran legionary, taking into account the general shape and similarity to the standard-issue helmet. Not only does it look sturdy as hell, it also looks absolutely beautiful to the average engraving enjoyer. The patterns of the engravings are elegant, curving and twisting around the helmet with the utmost grace as to not sully a helmet of such high quality. In place of the standard red stripe going down the middle of the helmet, there's a gold one instead. It shines beautifully in light, and hides the wearer well in darkness. Upon closer inspection, there's a small space carved out inside the helmet. It's not rough or makeshift, in fact, it looks like it was designed with that space in mind. As a result of not being solid metal, the area the space resides in is slightly thinner and provides less protection than a normal helmet. The space is similar in size to that of a fedora's, but without the capacity to store guns or other large items due to the rigidity of the helmet. Don't worry, though. It's been loosened around the neck area, so you can still tip it. In addition, a large amount of feathers have been added to the helmet. They're not useful for much, except for both denoting the rank of a veteran decanus due to the differing feather colors, and serving to cover up the area of thin metal around the helmet's storage space."
	icon_state = "jonesarmordecan"
	item_state = "jonesarmordecan"

/obj/item/clothing/head/helmet/f13/legion/heavy
	name = "legion veteran decan helmet"
	desc = "It's a metal legion helmet, with a plume, denoting veteran Decanus status."
	icon_state = "legheavy"
	item_state = "legheavy"
	armor = list("melee" = 65, "bullet" = 45, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/vet/explorer
	name = "legion explorer hood"
	desc = "It's a leather hood worn by legion explorers. It looks carefully crafted and reinforced."
	icon_state = "legexplorer"
	item_state = "legexplorer"

/obj/item/clothing/head/helmet/f13/legion/vet/vexil
	name = "legion fox vexillarius helmet"
	desc = "It's leather legion vexillarius helmet."
	icon_state = "legvexil"
	item_state = "legvexil"

/obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	name = "legion bear vexillarius helmet"
	desc = "It's leather legion vexillarius helmet."
	icon_state = "legvexil_alt"
	item_state = "legvexil_alt"

/obj/item/clothing/head/helmet/f13/legion/venator
	name = "legion venator hood"
	desc = "It's a leather hood worn by legion venators. It looks carefully crafted and reinforced."
	icon_state = "legvenator"
	item_state = "legvenator"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/venator/diohelmet
	name = "stilio oculatus helmet"
	desc = "The hollowed head of a deadly golden gecko carefully affixed over a reinforced legion helmet. Its ghastly appearance serves as an intimidating gesture to those who do not yet fear the Lizard King."
	icon_state = "diohelmet"
	item_state = "diohelmet"

/obj/item/clothing/head/helmet/f13/legion/libritor
	name = "legion libritor helmet"
	desc = "A metal legion veteran helmet with an inverted color scheme for libritors"
	icon_state = "legheavy"
	item_state = "legheavy"
	armor = list("melee" = 65, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/head/helmet/f13/legion/recruit/decan
	name = "legion recruit decanus helmet"
	desc = "It's a leather legion helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers."
	icon_state = "legdecan"
	item_state = "legdecan"

/obj/item/clothing/head/helmet/f13/legion/prime/decan
	name = "legion prime decanus helmet"
	desc = "It's a leather legion helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers. This one has a few small white feathers woven inside of it aswell."
	item_state = "legdecanprim"
	icon_state = "legdecanprim"

/obj/item/clothing/head/helmet/f13/legion/vet/decan/alt
	name = "legion veteran decanus helmet"
	desc = "This is a metal helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers. This one has several large white and black feathers sewn along side the rest of the feathers aswell. There is also a ballistic face-shield attached to the helmet that protects the face from physical blows and small pistol calibers."
	item_state = "vetdecalt"
	icon_state = "vetdecalt"

/obj/item/clothing/head/helmet/f13/legion/vet/decan/alt/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src]")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

			if(active_sound)
				while(up)
					playsound(src.loc, "[active_sound]", 100, 0, 4)
					sleep(15)

/obj/item/clothing/head/helmet/f13/legion/vet/decan
	name = "legion veteran decanus helmet"
	desc = "It's a leather legion helmet that's been reinforced with stronger leather patches and anointed with a array of red and dark red feathers. This one has several large white and black feathers sewn along side the rest of the feathers aswell."
	icon_state = "legdecanvet"
	item_state = "legdecanvet"

/obj/item/clothing/head/helmet/f13/legion/centurion
	name = "legion centurion helmet"
	desc = "It's a large forged and case hardened bronze helmet with a steel insert around the skull and back of the neck. It has a large plume of red horse hair across the top of it going horizontally, symbolizing the position of a Centurion."
	icon_state = "legcenturion"
	item_state = "legcenturion"
	armor = list("melee" = 60, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)
	resistance_flags = LAVA_PROOF | FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legion/rangercent
	name = "ranger-hunter centurion helmet"
	desc = "The helmet of an NCR ranger, repurposed to fit the needs of the Ranger Hunter Centurion. It features a large plume of dyed-red donkey hair, denoting rank."
	icon_state = "rangercent"
	item_state = "rangercent"
	armor = list("melee" = 60, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)
	resistance_flags = LAVA_PROOF | FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legion/palacent
	name = "paladin-slayer centurion helmet"
	desc = "The once-marvelous helmet of the T-45d power armor set, repurposed by the Legion into a symbol of its might. It has a large plume of red horse hair across the top of it going horizontally, donoting the rank of Centurion."
	icon_state = "palacent"
	item_state = "palacent"
	armor = list("melee" = 75, "bullet" = 50, "laser" = 35, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)
	resistance_flags = LAVA_PROOF | FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legion/palacent/custom_excess
	name = "Champion of Kanab's Helm"
	desc = "A custom forged steel full helmet made for the Conqueror and Champion of Kanab. It has a large plume of red horse hair across the top of it going horizontally, symbolizing the position of a Centurion."
	icon_state = "palacent_excess"
	item_state = "palacent_excess"

/obj/item/clothing/head/helmet/f13/legion/legate
	name = "legion legate helmet"
	desc = "A custom forged steel full helmet complete with abstract points and arches. The face is extremely intimidating, as it was meant to be. This particular one was ordered to be forged by Caesar, given to his second legate in exchange for his undying loyalty to Caesar."
	icon_state = "leglegat"
	item_state = "leglegat"
	armor = list("melee" = 75, "bullet" = 60, "laser" = 55, "energy" = 40, "bomb" = 45, "bio" = 60, "rad" = 60, "fire" = 80, "acid" = 0)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR
	resistance_flags = LAVA_PROOF | FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legion/legate/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/f13/legion/marsheaddress
	name = "priestess' headdress"
	desc = "A headdress made of feathers and decorated with two golden tassles."
	icon_state = "mars_headdress"
	item_state = "mars_headdress"
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/helmet/f13/roma
	name = "roma legionary helmet"
	desc = "A well-forged metal helmet standard issue to all Roma Legionaries and Auxilia."
	icon_state = "roma_helmet"
	item_state = "roma_helmet"
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)
	lefthand_file = ""
	righthand_file = ""
	flags_inv = HIDEHAIR
	strip_delay = 50
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

//Ranger Armors
/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	name = "ranger combat helmet"
	desc = "An old combat helmet, out of use around the time of the war."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flash_protect = 1
	glass_colour_type = /datum/client_colour/glass_colour/red
	lighting_alpha = LIGHTING_PLANE_ALPHA_LOWLIGHT_VISION
	darkness_view = 128

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/rigscustom
	name = "11th armored calvary helmet"
	desc = "An advanced combat helmet used by the 11th Armored Calvary Regiment before the war. There is a worn and faded 11th Armored Calvary Regiment's insignia just above the visor. The helmet itself has some scratches and dents sustained from battle."
	icon_state = "rigscustom_helmet"
	item_state = "rigscustom_helmet"
	icon = 'icons/fallout/clothing/hats.dmi'

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/mosshelmet
	name = "veteran patrol stetson"
	desc = "A weathered campaign hat tightly fitted over the viscera of a ranger combat helmet. The old stetson is faded with age and heavy use, having seen the green shores of California to the white peaks of the rockies."
	icon_state = "mosshelmet"
	item_state = "mosshelmet"
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert
	name = "desert ranger combat helmet"
	desc = "An U.S Marine Corps helmet, used by the legendary Desert Rangers."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"
	// armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 40, "acid" = 0)

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/eliteriot
	name = "elite riot gear helmet"
	desc = "An old combat helmet seen in the divide, repurposed for higher ranking Rangers."
	icon_state = "elite_riot"
	item_state = "elite_riot"
	// armor = list("melee" = 70, "bullet" = 60, "laser" = 40, "energy" = 60, "bomb" = 55, "bio" = 60, "rad" = 60, "fire" = 40, "acid" = 0)


/obj/item/clothing/head/helmet/f13/rangercombat/eliteriot/reclaimed
	name = "reclaimed desert ranger gear"
	desc = "A refurbished and personalized set of pre-unification desert ranger gear."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"
	// armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 30, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
//Metal masks

/obj/item/clothing/head/helmet/f13/raidermetal
	name = "raider metal helmet"
	desc = "A metal helmet, rusty and awful."
	icon_state = "raidermetal"
	item_state = "raidermetal"
	can_toggle = TRUE
	armor = list("melee" = 50, "bullet" = 35, "laser" = 35, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 20, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	strip_delay = 80
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/f13/metalmask
	name = "metal mask"
	desc = "A crudely formed metal hockey mask."
	icon_state = "metal_mask"
	item_state = "metal_mask"
	toggle_message = "You lower"
	alt_toggle_message = "You raise"
	can_toggle = 1
	armor = list("melee" = 50, "bullet" = 35, "laser" = 35, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 20, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/f13/metalmask/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/f13/metalmask/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/head/helmet/f13/metalmask/mk2
	name = "reflective metal mask"
	desc = "A reflective metal hockey mask."
	icon_state = "metal_mask2"
	item_state = "metal_mask2"
	armor = list("melee" = 50, "bullet" = 35, "laser" = 50, "energy" = 50, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 30, "acid" = 0)

/obj/item/clothing/head/helmet/f13/tesla
	name = "tesla helmet"
	desc = "A prewar armor design by Nikola Tesla before being confinscated by the U.S. government. Provides the high energy weapons resistance."
	icon_state = "tesla_helmet"
	item_state = "tesla_helmet"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 55, "energy" = 55, "bomb" = 35, "bio" = 0, "rad" = 10, "fire" = 30, "acid" = 80)
	var/hit_reflect_chance = 70
	strip_delay = 10

/obj/item/clothing/head/helmet/f13/tesla/IsReflect(def_zone)
	if(!(def_zone in list("head"))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return 0
	if (prob(hit_reflect_chance))
		return 1

//Power armor helmets

/obj/item/clothing/head/helmet/f13/power_armor/
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	ispowerarmor = 1 //TRUE
	strip_delay = 200
	equip_delay_self = 20
	slowdown = 0.1
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEMASK|HIDEJUMPSUIT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	clothing_flags = THICKMATERIALPORT
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	item_flags = SLOWS_WHILE_IN_HAND
	flash_protect = 2
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	speechspan = SPAN_ROBOT //makes you sound like a robot
	darkness_view = 128 //Literally NV
	lighting_alpha = LIGHTING_PLANE_ALPHA_LOWLIGHT_VISION
	var/emped = 0
	var/requires_training = TRUE
	light_range = 4 //luminosity when the light is on
	light_on = FALSE
	var/on = FALSE
	light_color = LIGHT_COLOR_YELLOW
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	actions_types = list(/datum/action/item_action/toggle_light)

/obj/item/clothing/head/helmet/f13/power_armor/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/f13/power_armor/attack_self(mob/user)
	on = !on
//	icon_state = "[initial(icon_state)][on]"
	user.update_inv_head()	//so our mob-overlays update

	set_light_on(on)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/f13/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
	var/mob/living/carbon/human/H = user
	if(src == H.head) //Suit is already equipped
		return ..()
	if (!H.has_trait(TRAIT_PA_WEAR) && !istype(src, /obj/item/clothing/head/helmet/f13/power_armor/t45b) && slot == SLOT_HEAD && requires_training)
		to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
		return 0
	if(slot == SLOT_HEAD)
		return ..()
	return

/obj/item/clothing/head/helmet/f13/power_armor/emp_act(mob/living/carbon/human/owner, severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		to_chat(loc, "<span class='warning'>Warning: an electromagnetic pulse detected, but was absorbed by the TESLA system.</span>")
		return
	if(emped == 0)
		if(ismob(loc))
			to_chat(loc, "<span class='warning'>Warning: electromagnetic surge detected in helmet. Rerouting power to emergency systems.</span>")
			tint += 2
			if(istype(loc, /mob/living/carbon))
				var/mob/living/carbon/M = loc
				M.update_tint()
			armor = armor.modifyRating(melee = -20, bullet = -20, laser = -20)
			emped = 1
			spawn(50) //5 seconds of being blind and weak
				to_chat(loc, "<span class='warning'>Helmet power reroute successful. All systems operational.</span>")
				tint -= 2
				if(istype(loc, /mob/living/carbon))
					var/mob/living/carbon/M = loc
					M.update_tint()
				armor = armor.modifyRating(melee = 20, bullet = 20, laser = 20)
				emped = 0

/obj/item/clothing/head/helmet/f13/power_armor/t45b
	name = "salvaged T-45b helmet"
	desc = "It's a salvaged T-45b power armor helmet."
	icon_state = "t45bhelmet"
	item_state = "t45bhelmet"
	armor = list("melee" = 75, "bullet" = 60, "laser" = 30, "energy" = 50, "bomb" = 48, "bio" = 60, "rad" = 50, "fire" = 80, "acid" = 0)
	darkness_view = 0 //No NV
	slowdown = 0.2 //No servo
	lighting_alpha = null
	requires_training = FALSE


/obj/item/clothing/head/helmet/f13/power_armor/t45d/medical/equipped(mob/living/carbon/human/user, slot)
	..()
	if(hud_type && slot == SLOT_HEAD)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.add_hud_to(user)

/obj/item/clothing/head/helmet/f13/power_armor/t45d/medical/dropped(mob/living/carbon/human/user)
	..()
	if(hud_type && istype(user) && user.head == src)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.remove_hud_from(user)

/obj/item/clothing/head/helmet/f13/power_armor/t45d/medical /* Пока я писал код заново, проклял Феню несколько раз*/
	name = "MP-47/A power helmet"
	desc = "Prototype of a medical power helmet. It's pretty fresh inside and pleasant to breathe."
	icon_state = "t45dhelmet"
	item_state = "t45dhelmet"
	armor = list("melee" = 65, "bullet" = 65, "laser" = 55, "energy" = 65, "bomb" = 65, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 100)
	hud_type = DATA_HUD_MEDICAL_ADVANCED
/*---------------------------------------------------------------КОНЕЦ КОДА МЕД ШЛЕМА, ДА Я БЫДЛО--------------------------------------------------------------------*/
/obj/item/clothing/head/helmet/f13/power_armor/raiderpa_helm
	name = "raider T-45b power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it have lost most of its capability to protect the wearer from harm. This helmet seems to be heavily modified, heavy metal banding fused to the helmet"
	icon_state = "raiderpa_helm"
	item_state = "raiderpa_helm"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 30, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 0)
	darkness_view = 0 //No NV
	slowdown = 0.2 //No servo
	lighting_alpha = null
	requires_training = FALSE

/obj/item/clothing/head/helmet/f13/power_armor/raiderpa_helm/attack_self(mob/user)
	return FALSE

/obj/item/clothing/head/helmet/f13/power_armor/hotrod
	name = "hotrod T-45b power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it have lost most of its capability to protect the wearer from harm."
	icon_state = "t45hotrod_helm"
	item_state = "t45hotrod_helm"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 30, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 50, "fire" = 0, "acid" = 0)
	darkness_view = 110 //Some worse NV
	light_color = COLOR_RED_LIGHT
	lighting_alpha = null
	requires_training = FALSE

/obj/item/clothing/head/helmet/f13/power_armor/advanced
	name = "advanced power helmet"
	desc = "It's an advanced power armor Mk I helmet, typically used by the Enclave. It looks somewhat threatening."
	icon_state = "advhelmet1"
	item_state = "advhelmet1"
	darkness_view = 150 // Advanced NV
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 75, "bomb" = 72, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/advanced/mk2
	name = "advanced power helmet MK2"
	desc = "It's an improved model of advanced power armor used exclusively by the Enclave military forces, developed after the Great War.<br>Like its older brother, the standard advanced power armor, it's matte black with a menacing appearance, but with a few significant differences - it appears to be composed entirely of lightweight ceramic composites rather than the usual combination of metal and ceramic plates.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "advhelmet2"
	item_state = "advhelmet2"
	darkness_view = 170 // Advanced NV II
	armor = list("melee" = 90, "bullet" = 90, "laser" = 60, "energy" = 90, "bomb" = 72, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/tesla
	name = "tesla power helmet"
	desc = "A helmet typically used by Enclave special forces.<br>There are three orange energy capacitors on the side."
	darkness_view = 160 // Advanced NV
	icon_state = "tesla"
	item_state = "tesla"
	armor = list("melee" = 90, "bullet" = 50, "laser" = 95, "energy" = 95, "bomb" = 62, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)
	light_color = COLOR_DARK_CYAN


/obj/item/clothing/head/helmet/f13/power_armor/tesla/Initialize()
	. = ..()
	AddComponent(/datum/component/empprotection, EMP_PROTECT_SELF | EMP_PROTECT_WIRES | EMP_PROTECT_CONTENTS)

/obj/item/clothing/head/helmet/f13/power_armor/t51b
	name = "T-51b power helmet"
	desc = "It's a T-51b power helmet, typically used by the Brotherhood. It looks somewhat charming."
	icon_state = "t51bhelmet"
	item_state = "t51bhelmet"
	darkness_view = 135 // Advanced NV
	armor = list("melee" = 70, "bullet" = 65, "laser" = 55, "energy" = 65, "bomb" = 62, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/t51b/duster
	name = "T-51b duster power helmet"
	desc = "It's a T-51b duster power helmet, typically used by the Brotherhood. Dark sight behind the lense."
	icon_state = "t51bhelmet_duster"
	item_state = "t51bhelmet_duster"

/obj/item/clothing/head/helmet/f13/power_armor/t51b/ultra
	name = "Ultracite power helmet"
	desc = "It's a T-51b power helmet, typically used by the Brotherhood. It looks somewhat charming. Now enhanced with ultracite."
	icon_state = "ultracitepa_helm"
	item_state = "ultracitepa_helm"
	slowdown = 0
	light_color = COLOR_DARK_CYAN

/obj/item/clothing/head/helmet/f13/power_armor/x03
	name = "Hellfire power helmet"
	desc = "It's a X-03 power helmet with very light and fiery gaze, that scares anyone."
	icon_state = "x03helmet"
	item_state = "x03helmet"
	darkness_view = 135 // Advanced NV
	armor = list("melee" = 70, "bullet" = 65, "laser" = 55, "energy" = 65, "bomb" = 62, "bio" = 100, "rad" = 99, "fire" = 100, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT

/obj/item/clothing/head/helmet/f13/power_armor/x03/alt
	icon_state = "x03helmet_alt"
	item_state = "x03helmet_alt"

/obj/item/clothing/head/helmet/f13/power_armor/t60
	name = "T-60a power helmet"
	desc = "The T-60 powered helmet, equipped with targetting software suite, Friend-or-Foe identifiers, dynamic HuD, and an internal music player."
	icon_state = "t60helmet"
	item_state = "t60helmet"
	darkness_view = 145 // Advanced NV
	armor = list("melee" = 75, "bullet" = 70, "laser" = 60, "energy" = 70, "bomb" = 82, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/t60/tesla
	name = "T-60a power helmet"
	desc = "The T-60 powered helmet, equipped with targetting software suite, Friend-or-Foe identifiers, dynamic HuD, and an internal music player. <br>There are three orange energy capacitors on the side."
	icon_state = "t60helmet_tesla"
	item_state = "t60helmet_tesla"
	darkness_view = 145 // Advanced NV
	armor = list("melee" = 60, "bullet" = 55, "laser" = 75, "energy" = 75, "bomb" = 82, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/t60/tesla/Initialize()
	. = ..()
	AddComponent(/datum/component/empprotection, EMP_PROTECT_SELF | EMP_PROTECT_WIRES | EMP_PROTECT_CONTENTS)

/obj/item/clothing/head/helmet/f13/power_armor/t45d
	name = "T-45d power helmet"
	desc = "It's an old pre-War power armor helmet. It's pretty hot inside of it."
	icon_state = "t45dhelmet"
	item_state = "t45dhelmet"
	armor = list("melee" = 65, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR

/obj/item/clothing/head/helmet/f13/power_armor/t45d/medical
	name = "MP-47/A power helmet"
	desc = "Prototype of a medical power helmet. It's pretty fresh inside and pleasant to breathe."
	icon_state = "t45dhelmet_med"
	item_state = "t45dhelmet_med"
	armor = list("melee" = 65, "bullet" = 65, "laser" = 55, "energy" = 65, "bomb" = 65, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 100)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR

/obj/item/clothing/head/helmet/f13/power_armor/t45d/gunslinger
	name = "Gunslinger T-51b Helm"
	desc = "With most of the external plating stripped to allow for internal thermal and night vision scanners, as well as aided targeting assist via onboard systems, this helm provides much more utility then protection. To support these systems, secondary power cells were installed into the helm, and covered with a stylish hat."
	icon_state = "t51bgs"
	item_state = "t51bgs"
	slowdown = 0
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR

/obj/item/clothing/head/helmet/f13/power_armor/t45d/outcast
	name = "Outcast T-45d power helmet"
	desc = "It's an outcast power armor helmet."
	icon_state = "t45dhelmet_outcast"
	item_state = "t45dhelmet_outcast"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR

/obj/item/clothing/head/helmet/f13/power_armor/t45d/military
	name = "Military T-45d power helmet"
	desc = "A military power armor helmet, that was popular in militia and army. MRE not included."
	icon_state = "t45dhelmet_military"
	item_state = "t45dhelmet_military"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR

/obj/item/clothing/head/helmet/f13/power_armor/t45d/foil
	name = "Foil T-45d power helmet"
	desc = "Very effective against aliens."
	icon_state = "t45dhelmet_foil"
	item_state = "t45dhelmet_foil"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	armor = list("melee" = 10, "bullet" = 10, "laser" = 15, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)
	darkness_view = 0 //No NV
	slowdown = 0.2 //No servo
	lighting_alpha = null
	requires_training = FALSE

/obj/item/clothing/head/helmet/f13/power_armor/midwest
	name = "midwestern power helmet"
	desc = "This helmet once belonged to the Mid Western branch of the Brotherhood of Steel now residing wherever it's user currently is situated."
	icon_state = "midwestpa_helm"
	item_state = "midwestpa_helm"
	armor = list("melee" = 65, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/midwest/hardened
	name = "hardened midwestern power helmet"
	desc = "This helmet once belonged to the Mid Western branch of the Brotherhood of Steel now residing wherever it's user currently is situated. This particular one has gone through a chemical hardening process, increasing it's armor capabilities."
	armor = list("melee" = 70, "bullet" = 65, "laser" = 55, "energy" = 65, "bomb" = 62, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/power_armor/excavator
	name = "excavator power helmet"
	desc = "The helmet of the excavator power armor suit."
	icon_state = "excavator"
	item_state = "excavator"
	armor = list("melee" = 60, "bullet" = 55, "laser" = 45, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)

//LightToggle

/obj/item/clothing/head/helmet/update_icon()
	var/state = "[initial(icon_state)]"
	if(F)
		if(F.on)
			state += "-flight-on" //"helmet-flight-on" // "helmet-cam-flight-on"
		else
			state += "-flight" //etc.

	icon_state = state

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()

/obj/item/clothing/head/helmet/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_helmet_flashlight))
		toggle_helmlight()
	else
		..()

/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/flashlight/seclite))
		var/obj/item/flashlight/seclite/S = I
		if(can_flashlight)
			if(!F)
				if(!user.transferItemToLoc(S, src))
					return
				to_chat(user, "<span class='notice'>You click [S] into place on [src].</span>")
				if(S.on)
					set_light_on(FALSE)
				F = S
				update_icon()
				update_helmlight(user)
				verbs += /obj/item/clothing/head/helmet/proc/toggle_helmlight
				var/datum/action/A = new /datum/action/item_action/toggle_helmet_flashlight(src)
				if(loc == user)
					A.Grant(user)
		return

	if(istype(I, /obj/item/screwdriver))
		if(F)
			for(var/obj/item/flashlight/seclite/S in src)
				to_chat(user, "<span class='notice'>You unscrew the seclite from [src].</span>")
				F = null
				S.forceMove(user.drop_location())
				update_helmlight(user)
				S.update_brightness(user)
				update_icon()
				usr.update_inv_head()
				verbs -= /obj/item/clothing/head/helmet/proc/toggle_helmlight
			for(var/datum/action/item_action/toggle_helmet_flashlight/THL in actions)
				qdel(THL)
			return

	return ..()

/obj/item/clothing/head/helmet/proc/toggle_helmlight()
	set name = "Toggle Helmet Light"
	set category = "Object"
	set desc = "Click to toggle your helmet's attached flashlight."

	if(!F)
		return

	var/mob/user = usr
	if(user.incapacitated())
		return
	F.on = !F.on
	to_chat(user, "<span class='notice'>You toggle the helmetlight [F.on ? "on":"off"].</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_helmlight(user)

/obj/item/clothing/head/helmet/proc/update_helmlight(mob/user = null)
	if(F)
		if(F.on)
			set_light_on(TRUE)
		else
			set_light_on(FALSE)
		update_icon()

	else
		set_light_on(FALSE)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

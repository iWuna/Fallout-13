/obj/item/clothing/suit/armor
	allowed = null
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	equip_delay_other = 40
	max_integrity = 250
	resistance_flags = NONE
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	allowed = list(/obj/item/gun)

/obj/item/clothing/suit/armor/Initialize()
	. = ..()
	if(!allowed)
		allowed = GLOB.security_vest_allowed

/obj/item/clothing/suit/armor/vest
	name = "armor vest"
	desc = "A slim Type I armored vest that provides decent protection against most types of damage."
	icon_state = "vault_security"
	item_state = "vault_security"
	blood_overlay_type = "armor"
	dog_fashion = /datum/dog_fashion/back

/obj/item/clothing/suit/armor/vest/alt
	desc = "A Type I armored vest that provides decent protection against most types of damage."
	icon_state = "armor"
	item_state = "armor"

/obj/item/clothing/suit/armor/vest/old
	name = "degrading armor vest"
	desc = "Older generation Type 1 armored vest. Due to degradation over time the vest is far less maneuverable to move in."
	icon_state = "armor"
	item_state = "armor"

/obj/item/clothing/suit/armor/vest/blueshirt
	icon_state = "blueshift"
	item_state = "blueshift"

/obj/item/clothing/suit/armor/hos
	name = "armored greatcoat"
	desc = "A greatcoat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	icon_state = "hos"
	item_state = "greatcoat"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 40, "bullet" = 25, "laser" = 20, "energy" = 20, "bomb" = 45, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80

/obj/item/clothing/suit/armor/hos/trenchcoat
	name = "armored trenchoat"
	desc = "A trenchcoat enchanced with a special lightweight kevlar. The epitome of tactical plainclothes."
	icon_state = "hostrench"
	item_state = "hostrench"
	flags_inv = 0
	strip_delay = 80

/obj/item/clothing/suit/armor/vest/warden
	name = "warden's jacket"
	desc = "A navy-blue armored jacket with blue shoulder designations and '/Warden/' stitched into one of the chest pockets."
	icon_state = "warden_alt"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	strip_delay = 70
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/warden/alt
	name = "warden's armored jacket"
	desc = "A red jacket with silver rank pips and body armor strapped on top."
	icon_state = "warden_jacket"

/obj/item/clothing/suit/armor/vest/leather
	name = "security overcoat"
	desc = "Lightly armored leather overcoat meant as casual wear for high-ranking officers. Bears the crest of Vault-Tec Security."
	icon_state = "leathercoat-sec"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/capcarapace
	name = "captain's carapace"
	desc = "A fireproof armored chestpiece reinforced with ceramic plates and plasteel pauldrons to provide additional protection whilst still offering maximum mobility and flexibility. Issued only to the station's finest, although it does chafe your nipples."
	icon_state = "capcarapace"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 50, "bullet" = 39, "laser" = 25, "energy" = 25, "bomb" = 39, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 90)
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/vest/capcarapace/syndicate
	name = "syndicate captain's vest"
	desc = "A sinister looking vest of advanced armor worn over a black and red fireproof jacket. The gold collar and shoulders denote that this belongs to a high ranking syndicate officer."
	icon_state = "syndievest"

/obj/item/clothing/suit/armor/vest/capcarapace/alt
	name = "captain's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "capformal"
	item_state = "capspacesuit"

/obj/item/clothing/suit/armor/riot
	name = "riot suit"
	desc = "A suit of semi-flexible polycarbonate body armor with heavy padding to protect against melee attacks."
	icon_state = "riot"
	item_state = "swat_suit"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 60, "bullet" = 35, "laser" = 16, "energy" = 16, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	strip_delay = 80
	equip_delay_other = 60

/obj/item/clothing/suit/armor/bone
	name = "bone armor"
	desc = "A tribal armor plate, crafted from animal bone."
	icon_state = "bonearmor"
	item_state = "bonearmor"
	blood_overlay_type = "armor"
	armor = list("melee" = 40, "bullet" = 25, "laser" = 15, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/obj/item/clothing/suit/armor/bulletproof
	name = "bulletproof armor"
	desc = "A Type III heavy bulletproof vest that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 35, "bullet" = 55, "laser" = 35, "energy" = 35, "bomb" = 55, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)
	strip_delay = 70
	equip_delay_other = 50

/obj/item/clothing/suit/armor/locustjacket
	name = "locust jacket"
	desc = "A reinforced jacket used primarily by the locust mercenaries"
	icon_state = "locustjacket"
	item_state = "locustjacket"
	blood_overlay_type = "armor"
	armor = list("melee" = 35, "bullet" = 55, "laser" = 35, "energy" = 35, "bomb" = 55, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)
	strip_delay = 70
	equip_delay_other = 50

/obj/item/clothing/suit/armor/laserproof
	name = "tesla armor"
	desc = "A prewar armor design by Nikola Tesla before being confinscated by the U.S. government. Provides the high energy weapons resistance."
	icon_state = "tesla_armor"
	item_state = "tesla_armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 60, "energy" = 60, "bomb" = 40, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	body_parts_covered = CHEST|GROIN|ARMS
	var/hit_reflect_chance = 40

/obj/item/clothing/suit/armor/laserproof/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return 0
	if (prob(hit_reflect_chance))
		return 1

/obj/item/clothing/suit/armor/vest/det_suit
	name = "detective's armor vest"
	desc = "An armored vest with a detective's badge on it."
	icon_state = "detective-armor"
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/det_suit/Initialize()
	. = ..()
	allowed = GLOB.detective_vest_allowed

//All of the armor below is mostly unused

/obj/item/clothing/suit/armor/centcom
	name = "\improper CentCom armor"
	desc = "A suit that protects against some damage."
	icon_state = "centcom"
	item_state = "centcom"
	w_class = WEIGHT_CLASS_BULKY
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/gun/energy, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	clothing_flags = THICKMATERIAL
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 3
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 39, "laser" = 25, "energy" = 25, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 50, "acid" = 50)

/obj/item/clothing/suit/armor/tdome
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	clothing_flags = THICKMATERIAL
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/obj/item/clothing/suit/armor/tdome/red
	name = "thunderdome suit"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"

/obj/item/clothing/suit/armor/tdome/green
	name = "thunderdome suit"
	desc = "Pukish armor."	//classy.
	icon_state = "tdgreen"
	item_state = "tdgreen"

/obj/item/clothing/suit/armor/riot/knight
	name = "plate armour"
	desc = "A classic suit of plate armour, highly effective at stopping melee attacks."
	icon_state = "knight_green"
	item_state = "knight_green"

/obj/item/clothing/suit/armor/riot/knight/yellow
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/suit/armor/riot/knight/blue
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/suit/armor/riot/knight/red
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/suit/armor/vest/durathread
	name = "makeshift vest"
	desc = "A vest made of durathread with strips of leather acting as trauma plates."
	icon_state = "durathread"
	item_state = "durathread"
	strip_delay = 60
	equip_delay_other = 40
	max_integrity = 200
	resistance_flags = FLAMMABLE
	armor = list("melee" = 20, "bullet" = 10, "laser" = 30, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)

//Fallout 13

/obj/item/clothing/suit/armor/f13/leather_jacket
	name = "leather jacket"
	icon_state = "leather_jacket"
	item_state = "leather_jacket"
	desc = "A black, heavy leather jacket."
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list("melee" = 20, "bullet" = 15, "laser" = 15, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)

/obj/item/clothing/suit/armor/f13/leather_jacket/combat
	name = "combat leather jacket"
	icon_state = "combat_jacket"
	item_state = "combat_jacket"
	desc = "This heavily padded leather jacket is unusual in that it has two sleeves. You'll definitely make a fashion statement whenever, and wherever, you rumble."
	armor = list("melee" = 30, "bullet" = 30, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

/obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat
	name = "combat leather coat"
	icon_state = "combat_coat"
	item_state = "combat_coat"
	desc = "A combat leather jacket, outfitted with a special armored leather coat."
	armor = list("melee" = 40, "bullet" = 43, "laser" = 40, "energy" = 35, "bomb" = 45, "bio" = 30, "rad" = 5, "fire" = 50, "acid" = 35)

/obj/item/clothing/suit/armor/f13/leather_jacket/combat/riotpolice
	name = "combat body armor"
	icon_state = "combat_coat"
	item_state = "combat_coat"
	desc = "A heavy armor with ballistic inserts, sewn into a padded riot police coat."
	armor = list("melee" = 50, "bullet" = 50, "laser" = 40, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 35)

/obj/item/clothing/suit/armor/f13/kit
	name = "armor kit"
	desc = "Separate armor parts you can wear over the clothing to get the most basic protection from the dangers of wasteland.<br>It is unable to reflect laser beams and probably won't shield you from a random bullet, but it sure is better than going into the battle without any armor at all."
	icon_state = "armorkit"
	item_state = "armorkit"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 20, "bullet" = 15, "laser" = 15, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)
	strip_delay = 30

/obj/item/clothing/suit/armor/f13/kit/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/leatherarmor
	name = "leather armor"
	desc = "Your basic all leather apparel. Finely crafted from tanned brahmin hide."
	icon_state = "leather_armor"
	item_state = "leather_armor"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 40, "bullet" = 35, "laser" = 25, "energy" = 25, "bomb" = 32, "bio" = 0, "rad" = 10, "fire" = 30, "acid" = 35)
	strip_delay = 40

/obj/item/clothing/suit/armor/f13/leatherarmor/reinforced
	name = "reinforced leather armor"
	icon_state = "leather_armor_2"
	item_state = "leather_armor_2"
	desc = "An enhanced version of the basic leather armor with extra layers of protection. Finely crafted from tanned brahmin hide."
	armor = list("melee" = 40, "bullet" = 40, "laser" = 30, "energy" = 30, "bomb" = 35, "bio" = 0, "rad" = 15, "fire" = 40, "acid" = 35)

/obj/item/clothing/suit/armor/f13/metalarmor
	name = "metal armor"
	desc = "A set of plates formed together to form a crude chestplate."
	icon_state = "metal_chestplate"
	item_state = "metal_chestplate"
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list("melee" = 45, "bullet" = 40, "laser" = 45, "energy" = 40, "bomb" = 40, "bio" = 30, "rad" = 15, "fire" = 60, "acid" = 0)
	slowdown = 0.25
	strip_delay = 10

/obj/item/clothing/suit/armor/f13/metalarmor/militia
	name = "ODF armor"
	desc = "A suit of metal armor issued to members of the Oasis Defense Force."
	item_color = "#5D4037"
	color = "#5D4037"

/obj/item/clothing/suit/armor/fluff/chestplate/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armor/fluff/chestplate/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/armor/f13/metalarmor/reinforced
    name = "metal armor mark 2"
    desc = "A set of polished plates formed together to form a reflective chestplate specially effective agaisnt energy weaponry."
    icon_state = "metal_chestplate2"
    item_state = "metal_chestplate2"
    body_parts_covered = CHEST|GROIN|ARMS|LEGS
    armor = list("melee" = 45, "bullet" = 45, "laser" = 55, "energy" = 50, "bomb" = 40, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
    slowdown = 0
    strip_delay = 10

/obj/item/clothing/suit/armor/f13/metalarmor/strange
    name = "strange metal armor"
    desc = "A set of metal plates formed together to form a robust chestplate, designed to resist both projectile and laser weaponry."
    icon_state = "metal_chestplate2"
    item_state = "metal_chestplate2"
    body_parts_covered = CHEST|GROIN|ARMS|LEGS
    armor = list("melee" = 45, "bullet" = 50, "laser" = 50, "energy" = 40, "bomb" = 40, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
    slowdown = 0
    strip_delay = 10

/obj/item/clothing/suit/armor/f13/raider
	name = "base raider armor"
	desc = "for testing"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 35, "bullet" = 30, "laser" = 35, "energy" = 35, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	strip_delay = 40

/obj/item/clothing/suit/armor/f13/raider/supafly
	name = "supa-fly raider armor"
	desc = "Fabulous mutant powers were revealed to me the day I held aloft my bumper sword and said...<br>BY THE POWER OF NUKA-COLA, I AM RAIDER MAN!"
	icon_state = "supafly"
	item_state = "supafly"

/obj/item/clothing/suit/armor/f13/raider/supafly/Initialize() //HQ parts reinforcement
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/sadist
	name = "sadist raider armor"
	desc = "A bunch of metal chaps adorned with severed hands at the waist with a leather plate worn on the left shoulder. Very intimidating."
	icon_state = "sadist"
	item_state = "sadist"

/obj/item/clothing/suit/armor/f13/raider/sadist/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/blastmaster
	name = "blastmaster raider armor"
	desc = "A suit composed largely of blast plating, though there's so many holes it's hard to say if it will protect against much."
	icon_state = "blastmaster"
	item_state = "blastmaster"
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	flash_protect = 2

/obj/item/clothing/suit/armor/f13/raider/blastmaster/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/yankee
	name = "yankee raider armor"
	desc = "A set of armor made from bulky plastic and rubber. A faded sports team logo is printed in various places. Go Desert Rats!"
	icon_state = "yankee"
	item_state = "yankee"

/obj/item/clothing/suit/armor/f13/raider/yankee/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/badlands
	name = "badlands raider armor"
	desc = "A leather top with a bandolier over it and a straps that cover the arms."
	icon_state = "badlands"
	item_state = "badlands"

/obj/item/clothing/suit/armor/f13/raider/badlands/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/painspike
	name = "painspike raider armor"
	desc = "A particularly unhuggable armor, even by raider standards. Extremely spiky."
	icon_state = "painspike"
	item_state = "painspike"

/obj/item/clothing/suit/armor/f13/raider/painspike/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/localranger
	name = "Deserters Duster"
	desc = "A worn NCR duster, ravaged by the sands and time. A large red X marks the back."
	icon_state = "localranger"
	item_state = "localranger"

/obj/item/clothing/suit/armor/f13/raider/localranger/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/combatduster
    name = "Combat Duster"
    desc = "An old military-grade pre-war combat armor under a weathered duster. It appears to be fitted with metal plates to replace the crumbling ceramic."
    icon_state = "combatduster"
    item_state = "combatduster"

/obj/item/clothing/suit/armor/f13/raider/combatduster/Initialize()
    . = ..()
    AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/iconoclast
	name = "iconoclast raider armor"
	desc = "A rigid armor set that appears to be fashioned from a radiation suit, or a mining suit."
	icon_state = "iconoclast"
	item_state = "iconoclast"

/obj/item/clothing/suit/armor/f13/raider/iconoclast/Initialize()
    . = ..()
    AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/harbingermantle
	name = "Harbinger's Mantle"
	desc = "An eerie, silken cloth that seems to be dripping with a thick mist. It is in truth a high-tech stealth device that allows for psionic amplification. The capacitors and manipulators in it utilise quantum technology and are highly volatile."
	icon_state = "scloak"
	item_state = "scloak"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 55, "bullet" = 55, "laser" = 55, "energy" = 55, "bomb" = 45, "bio" = 45, "rad" = 45, "fire" = 45, "acid" = 0)


/obj/item/clothing/suit/armor/f13/raider/iconoclast/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/ant
	name = "AntAgonizer's suit"
	desc = "Coming to a wasteland near you: replica armor, right out of Grognak the Barbarian. Hand-sewn from only the finest insect chitin around, it'll inspire gasps at the next costume party, guaranteed!"
	icon_state = "antsuit"
	item_state = "antsuit"

/obj/item/clothing/suit/armor/f13/raider/ant/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/*
/obj/item/clothing/suit/armor/f13/raider/r/
	name = "reinforced base raider armor"
	armor = list("melee" = 40, "bullet" = 45, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)

/obj/item/clothing/suit/armor/f13/raider/r/supafly
	name = "reinforced supa-fly raider armor"
	desc = "Fabulous mutant powers were revealed to me the day I held aloft my bumper sword and said...<br>BY THE POWER OF NUKA-COLA, I AM RAIDER MAN!"
	icon_state = "supafly"
	item_state = "supafly"

/obj/item/clothing/suit/armor/f13/raider/r/sadist
	name = "reinforced sadist raider armor"
	desc = "a bunch of metal chaps adorned with severed hands at the waist with a leather plate worn on the left shoulder"
	icon_state = "sadist"
	item_state = "sadist"

/obj/item/clothing/suit/armor/f13/raider/r/blastmaster
	name = "reinforced blastmaster raider armor"
	desc = "A bunch of leather straped around the torso that support a tire worn on the left shoulder. "
	icon_state = "blastmaster"
	item_state = "blastmaster"
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	flash_protect = 2

/obj/item/clothing/suit/armor/f13/raider/r/yankee
	name = "yankee raider armor"
	desc = "A set of armor made from football player protective wear. Together we play."
	icon_state = "yankee"
	item_state = "yankee"

/obj/item/clothing/suit/armor/f13/raider/r/badlands
	name = "badlands raider armor"
	desc = "A leather top with a bandolier over it and a straps that cover the arms"
	icon_state = "badlands"
	item_state = "badlands"

/obj/item/clothing/suit/armor/f13/raider/r/painspike
	name = "painspike raider armor"
	desc = "A particularly unhuggable armor, even by raider standards."
	icon_state = "painspike"
	item_state = "painspike"

/obj/item/clothing/suit/armor/f13/raider/r/iconoclast/
	name = "iconoclast raider armor"
	desc = "A rigid armor set that appears to be fashioned from a radiation suit, or a mining suit."
	icon_state = "iconoclast"
	item_state = "iconoclast"
*/

/obj/item/clothing/suit/armor/f13/combat
	name = "combat armor"
	desc = "An old military grade pre war combat armor. Protective plates cover the chest, legs, and arms."
	icon_state = "combat_armor"
	item_state = "combat_armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 40, "bomb" = 50, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/brahmin_leather_duster
	name = "brahmin leather duster"
	desc = "A duster fashioned with tanned brahmin hide. It appears to be more durable than a normal duster. The leather is laser resistant."
	icon_state = "brahmin_leather_duster"
	item_state = "brahmin_leather_duster"
	armor = list("melee" = 20, "bullet" = 25, "laser" = 45, "energy" = 35, "bomb" = 35, "bio" = 40, "rad" = 10, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/rustedcowboy
	name = "rusted cowboy outfit"
	desc = "A weather treated leather cowboy outfit.  Yeehaw Pard'!"
	icon_state = "rusted_cowboy"
	item_state = "rusted_cowboy"
	armor = list("melee" = 22, "bullet" = 24, "laser" = 45, "energy" = 35, "bomb" = 35, "bio" = 40, "rad" = 10, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/raider/raidercombat
	name = "raider combat armor"
	desc = "An old military-grade pre-war combat armor. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "raider_combat"
	item_state = "raider_combat"
	armor = list("melee" = 42, "bullet" = 40, "laser" = 35, "energy" = 30, "bomb" = 50, "bio" = 50, "rad" = 10, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/raider/raidermetal
	name = "raider metal armor"
	desc = "A suit of welded, fused metal plates. Looks bulky, with great protection."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("melee" = 40, "bullet" = 40, "laser" = 35, "energy" = 35, "bomb" = 50, "bio" = 50, "rad" = 10, "fire" = 60, "acid" = 10)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/f13/combatrusted
	name = "rusted combat armor"
	desc = "An old military grade pre war combat armor.This set has seen better days, weathered by time. The composite plates look sound and intact still."
	icon_state = "rusted_combat_armor"
	item_state = "rusted_combat_armor"
	armor = list("melee" = 38, "bullet" = 43, "laser" = 38, "energy" = 38, "bomb" = 48, "bio" = 58, "rad" = 10, "fire" = 58, "acid" = 18)

/obj/item/clothing/suit/armor/f13/combatrusted/boneyard
	name = "Boneyard Carapace"
	desc = "Old, all covered in dust set of body armor, military grade. There is a big label on the right shoulder, reading \"L.A\" and a big, white typed number \"17\""
	icon_state = "rusted_combat_armor"
	item_state = "rusted_combat_armor"
	armor = list("melee" = 40, "bullet" = 45, "laser" = 34, "energy" = 35, "bomb" = 45, "bio" = 58, "rad" = 12, "fire" = 58, "acid" = 18)

/obj/item/clothing/suit/armor/f13/reconarmor
	name = "recon armor"
	desc = "An old military grade pre war combat armor. It's well-fitted for good all-around protection."
	icon_state = "recon_armor"
	item_state = "recon_armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 40, "bomb" = 50, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20)
	icon = 'icons/fallout/clothing_w/suit.dmi'

/obj/item/clothing/suit/armor/f13/combatmk2
	name = "combat armor mk2"
	desc = "An old military grade pre war combat armor, reinforced with additional plates around the arms and legs. It fits snugly."
	icon_state = "combat_armor_mk2"
	item_state = "combat_armor_mk2"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/combatmk2ncr
	name = "combat armor mk2"
	desc = "An old military grade pre war combat armor, modified to the NCR's standard."
	icon_state = "combat_armor_mk2_ncr"
	item_state = "combat_armor_mk2_ncr"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)
	icon = 'icons/fallout/clothing_w/suit.dmi'

/obj/item/clothing/suit/armor/f13/gunnerplates
	name = "gunner armor"
	desc = "An old military grade pre war combat armor. This armor has a skull painted on the back to symbolize the gunners."
	icon_state = "GunnerPlates"
	item_state = "GunnerPlates"
	slowdown = 0
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	icon = 'icons/fallout/clothing_w/suit.dmi'
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/combatmk2leg
	name = "legatus armor mk2"
	desc = "An old military grade pre war combat armor, specially designed for a Legionary Legatus."
	icon_state = "combat_armor_mk2_leg"
	item_state = "combat_armor_mk2_leg"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)
	icon = 'icons/fallout/clothing_w/suit.dmi'

/obj/item/clothing/suit/armor/f13/combatbosrein
	name = "reinforced brotherhood combat armor"
	desc = "A heavily-reinforced combat suit of prewar design, but postwar influence. It's marked in deep black with the insignia of the Brotherhood of Steel."
	icon_state = "combat_armor_reinforced_bos"
	item_state = "combat_armor_reinforced_bos"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)
	icon = 'icons/fallout/clothing_w/suit.dmi'

/obj/item/clothing/suit/armor/f13/combatrein
	name = "reinforced combat armor"
	desc = "An old military grade suit of prewar design. This one's been reinforced with additional plating and welded metal bars."
	icon_state = "combat_armor_reinforced"
	item_state = "combat_armor_reinforced"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)
	icon = 'icons/fallout/clothing_w/suit.dmi'

/obj/item/clothing/suit/armor/f13/scoutarmor
	name = "light scout armor"
	desc = "A prewar design for lightweight, battle-ready armor designed to be easily used in the field or in reconnaissance situations where mobility is required."
	icon_state = "scout_armor_lt"
	item_state = "scout_armor_lt"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/atomzealot
	name = "zealot armor"
	desc = "The armor of those true to the Division."
	icon_state = "atomzealot"
	item_state = "atomzealot"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 30, "bullet" = 35, "laser" = 40, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 100, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/atomwitch
	name = "atomic seer robes"
	desc = "The robes worn by female seers of the Division."
	icon_state = "atomwitch"
	item_state = "atomwitch"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 10, "bullet" = 15, "laser" = 10, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 100, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/caeserpelt
	name = "Caesars' Pelt"
	desc = "A pelt fit for Caeser himself. Ave!"
	icon = 'icons/fallout/clothing_w/suit.dmi'
	icon_state = "caesar_pelt"
	item_state = "caeser_pelt"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/combat/dark
	name = "combat armor"
	desc = "An old military grade pre war combat armor. Now in dark, and extra-crispy!"
	color = "#514E4E"

/obj/item/clothing/suit/armor/f13/combat/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armor/f13/combat/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/armor/f13/combat/mk2
	name = "reinforced combat armor"
	desc = "A reinforced set of bracers, greaves, and torso plating of prewar design. This one is kitted with additional plates."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "combat_armor_mk2"
	item_state = "combat_armor_mk2"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/suit/armor/f13/combat/mk2/dark
	name = "reinforced combat armor"
	desc = "A reinforced model based of the pre-war combat armor. Now in dark, light, and smoky barbeque!"
	color = "#302E2E"

/obj/item/clothing/suit/armor/f13/combat/ncr
	name = "ranger patrol armor"
	desc = "A set of standard issue ranger patrol armor that provides defense similar to a suit of pre-war combat armor. It's got NCR markings, making it clear who it was made by."
	icon_state = "ncr_patrol"
	item_state = "ncr_patrol"

/obj/item/clothing/suit/armor/f13/combat/brotherhood
	name = "brotherhood combat armor"
	desc = "A superior combat armor set made by the Brotherhood of Steel, standard issue for all Knights. It bears a red stripe."
	icon_state = "brotherhood_armor"
	item_state = "brotherhood_armor"
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior
	name = "brotherhood senior knight combat armor"
	desc = "A superior combat armor set made by the Brotherhood of Steel, standard issue for all Senior Knights. It bears a silver stripe, and the crest of the Brotherhood of Steel."
	icon_state = "brotherhood_armor_senior"
	item_state = "brotherhood_armor_senior"

/obj/item/clothing/suit/armor/f13/combat/knightcap
	name = "knight-captain combat armor"
	desc = "A customized set of combat armor designed for the Knight-Captain, with golden embroidery."
	icon_state = "knightcap"
	item_state = "knightcap"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 60, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/suit/armor/f13/combat/environmental
	name = "environmental armor"
	desc = "A pre-war suit developed for use in heavily contaminated environments, and is prized in the Wasteland for its ability to protect against biological threats."
	icon_state = "environmental_armor"
	item_state = "environmental_armor"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/geiger_counter, /obj/item/gun)
	armor = list("melee" = 40, "bullet" = 45, "laser" = 45,"energy" = 45, "bomb" = 55, "bio" = 70, "rad" = 100, "fire" = 60, "acid" = 50)
	strip_delay = 60
	equip_delay_other = 60
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/f13/combat/environmental/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_NO_INSULATION, TRUE, FALSE)

/obj/item/clothing/suit/armor/f13/combat/enclave
	name = "enclave combat armor"
	desc = "An old set of pre-war combat armor, painted black."
	icon_state = "enclave_armor"
	item_state = "enclave_armor"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 75, "bomb" = 70, "bio" = 80, "rad" = 80, "fire" = 80, "acid" = 50)

/obj/item/clothing/suit/armor/f13/combat/remnant
	name = "combat armor"
	desc = "A dark armor, used commonly in espionage or shadow ops. Worn by CAG or OS members."
	icon_state = "remnant"
	item_state = "remnant"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 75, "bomb" = 70, "bio" = 80, "rad" = 80, "fire" = 80, "acid" = 50)

/obj/item/clothing/suit/armor/f13/combat/swat
	name = "SWAT combat armor"
	desc = "A custom version of the pre-war combat armor, slimmed down and minimalist for domestic S.W.A.T. teams. It gives excellent protection, but only to the chest."
	icon_state = "armoralt"
	item_state = "armoralt"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/suit/armor/f13/combat/chinese
	name = "chinese combat armor"
	desc = "An uncommon suit of pre-war Chinese combat armor. It's a very basic and straightforward piece of armor that covers the front of the user."
	icon_state = "chicom_armor"
	item_state = "chicom_armor"
	armor = list("melee" = 24, "bullet" = 25, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 10)

/obj/item/clothing/suit/armor/f13/rangercombat
	name = "veteran ranger combat armor"
	desc = "The NCR veteran ranger combat armor, or black armor consists of a pre-war L.A.P.D. riot suit under a duster with rodeo jeans. Considered one of the most prestigious suits of armor to earn and wear while in service of the NCR Rangers."
	icon_state = "ranger"
	item_state = "ranger"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	flags_inv = HIDENECK
	armor = list("melee" = 55, "bullet" = 55, "laser" = 55, "energy" = 40, "bomb" = 55, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 20)

/obj/item/clothing/suit/armor/f13/rangercombat/rigscustom
	name = "11th armored calvary armor"
	desc = "A suit of special military grade riot control gear and a duster, worn by 11th Armored Calvary Regiment members in The Divide before the war. Yellow markings are painted on the shoulderpads and forearm guards."
	icon_state = "rigscustom_suit"
	item_state = "rigscustom_suit"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/rangercombat/mossarmor
	name = "veteran patrol armor"
	desc = "A full suit of ballistic patrol ranger armor, weathered and faded with age. This set has been modified heavily, with added layering on exposed or vital areas and with a thick rawhide duster worn over."
	icon_state = "mossarmor"
	item_state = "mossarmor"

/obj/item/clothing/suit/armor/f13/rangercombat/desert
	name = "desert ranger combat armor"
	desc = "This is the original armor the NCR Ranger Combat armor was based off of. An awe inspiring suit of armor used by the legendary Desert Rangers."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"

/obj/item/clothing/suit/armor/f13/rangercombat/eliteriot
	name = "elite riot gear"
	desc = "A heavily reinforced set of military grade armor, commonly seen in the Divide now repurposed and reissued to Chief Rangers."
	icon_state = "elite_riot"
	item_state = "elite_riot"
	armor = list("melee" = 65, "bullet" = 60, "laser" = 60, "energy" = 60, "bomb" = 70, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 50)
	icon = 'icons/fallout/clothing_w/suit.dmi'


/obj/item/clothing/suit/armor/f13/rangercombat/eliteriot/reclaimed
	name = "reclaimed desert ranger overcoat"
	desc = "A refurbished and personalized set of pre-unification desert ranger gear."
	icon_state = "reclaimed_desert_ranger"
	item_state = "reclaimed_desert_ranger"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 30, "acid" = 30)
	icon = 'icons/fallout/clothing_w/suit.dmi'

/obj/item/clothing/suit/armor/f13/chitinarmor
	name = "insect chitin armor"
	desc = "A set of light armor made of insect chitin. Tough and light, it provides some moderate protection from trauma while allowing the user to remain mobile and protected from the elements. This set appears to be stripped of a majority of its protective kevlar and plating, a shell mostly remaining."
	icon_state = "insect_armor"
	item_state = "insect_armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 55, "bullet" = 30, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 70, "rad" = 65, "fire" = 80, "acid" = 100)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 40
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear)

/obj/item/clothing/suit/armor/f13/tribe_armor
	name = "light tribal armor"
	desc = "Light armor made of leather stips and a large, flat piece of turquoise.Armor commonplace among the Wayfinders."
	icon_state = "tribal_armor"
	item_state = "tribal_armor"
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list("melee" = 45, "bullet" = 30, "laser" = 35, "energy" = 25, "bomb" = 25, "bio" = 70, "rad" = 65, "fire" = 80, "acid" = 100)
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear)

/obj/item/clothing/suit/armor/f13/tribe_heavy_armor
	name = "heavy tribal armor"
	desc = "Heavy armor make of sturdy leather and pieces of bone. Worn by seasoned veterans within the Wayfinder tribe."
	icon_state = "heavy_tribal_armor"
	item_state = "heavy_tribal_armor"
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)
	flags_inv = HIDEJUMPSUIT
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear)

/obj/item/clothing/suit/armor/f13/sulphitearmor
	name = "sulphite armor"
	desc = "An combination of what seems to be raider metal armor with a jerry-rigged flame-exhaust system and ceramic plating."
	icon_state = "sulphitearmor"
	item_state = "sulphitearmor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 40, "bullet" = 45, "laser" = 40, "energy" = 40, "bomb" = 50, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20)

/*
/obj/item/clothing/suit/armor/f13/bmetalarmor
	name = "metal armor"
	desc = "A set of sturdy metal armor made from various bits of scrap metal. It looks heavy and impairs movement"
	icon_state = "bmetalarmor"
	item_state = "bmetalarmor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 60, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 90, "acid" = 0)
	slowdown = 0.75

/obj/item/clothing/suit/armor/f13/kit/terrible
	name = "scorched armor kit"
	desc = "A few football pads and a belt. At this point, it's really just for looks."
	armor = list("melee" = 1, "bullet" = 1, "laser" = 0, "energy" = 0, "bomb" = 1, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/f13/leatherarmor/terrible
	name = "battered leather armor"
	desc = "A set of heavily worn brahmin leather armor. It looks like it's about to fall apart."
	armor = list("melee" = 3, "bullet" = 3, "laser" = 0, "energy" = 0, "bomb" = 3, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/f13/bmetalarmor/terrible
	name = "rusting metal armor"
	desc = "A set of rusting metal armor made from various bits of scrap metal. Several bullet holes have weakened it."
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ibmetalarmor
	name = "reflective metal armor"
	desc = "A set of reflective metal armor made from various bits of scrap metal.<br>Will protect against bullets and dissipate lasers a lot better, still slowing you down."
	icon_state = "bmetalarmor"
	item_state = "bmetalarmor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 65, "bullet" = 40, "laser" = 50, "energy" = 60, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 90, "acid" = 0)
	slowdown = 0.75
*/
// salvaged/broken power armor, does not require PA training



/obj/item/clothing/suit/armor/f13/power_armor
	w_class = WEIGHT_CLASS_HUGE
	slowdown = 0.4 //+0.1 from helmet = total 0.5
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	//flags_inv = HIDEJUMPSUIT
	item_flags = SLOWS_WHILE_IN_HAND
	clothing_flags = THICKMATERIAL
	equip_delay_self = 50
	equip_delay_other = 60
	strip_delay = 200
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/emped = 0
	var/requires_training = TRUE
	flags_inv = HIDEJUMPSUIT|HIDENECK|HIDEEYES|HIDEEARS|HIDEFACE|HIDEMASK|HIDEGLOVES|HIDESHOES
	var/traits = list(TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	var/hit_reflect_chance = 5 //Делаем рефлекты к ПА, по умолчанию 5 процентов.
	block_chance = 10 //Делаем блок шансы, за неименим Порога Урона, по умолчанию 10% шанса.

/obj/item/clothing/suit/armor/f13/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
    var/mob/living/carbon/human/H = user
    if(src == H.wear_suit) //Suit is already equipped
        return TRUE
    if (!H.has_trait(TRAIT_PA_WEAR) && slot == SLOT_WEAR_SUIT && requires_training)
        to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
        return 0
    if(slot == SLOT_WEAR_SUIT)
        for(var/trait in traits)
            H.add_trait(trait)
        return ..()

/obj/item/clothing/suit/armor/f13/power_armor/dropped(mob/user)
    var/mob/living/carbon/human/H = user
    for(var/trait in traits)
        H.remove_trait(trait)
    return ..()

/obj/item/clothing/suit/armor/f13/power_armor/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return 0
	if (prob(hit_reflect_chance))
		return 1

/*/obj/item/clothing/suit/armor/f13/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
    var/mob/living/carbon/human/H = user
    if(src == H.wear_suit) //Suit is already equipped
        return TRUE
    if (!H.has_trait(TRAIT_PA_WEAR) && slot == SLOT_WEAR_SUIT && requires_training)
        to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
        return 0
    if(slot == SLOT_WEAR_SUIT)
        H.add_trait(TRAIT_STUNIMMUNE)
        H.add_trait(TRAIT_PUSHIMMUNE)
        H.add_trait(TRAIT_IRONFIST)
        return ..()

/obj/item/clothing/suit/armor/f13/power_armor/dropped(mob/user)
	var/mob/living/carbon/human/H = user
	H.remove_trait(TRAIT_STUNIMMUNE)
	H.remove_trait(TRAIT_PUSHIMMUNE)
	H.remove_trait(TRAIT_IRONFIST)

	return ..()
	*/ //Вернуть после теста

/obj/item/clothing/suit/armor/f13/power_armor/emp_act(mob/living/carbon/human/owner, severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(emped == 0)
		if(ismob(loc))
			to_chat(loc, "<span class='warning'>Warning: electromagnetic surge detected in armor. Rerouting power to emergency systems.</span>")
			slowdown += 15
			armor = armor.modifyRating(melee = -20, bullet = -20, laser = -20)
			emped = 1
			spawn(50) //5 seconds of being slow and weak
				to_chat(loc, "<span class='warning'>Armor power reroute successful. All systems operational.</span>")
				slowdown -= 15
				armor = armor.modifyRating(melee = 20, bullet = 20, laser = 20)
				emped = 0

/obj/item/clothing/suit/armor/f13/power_armor/t45b
	name = "salvaged T-45b power armor"
	desc = "It's a set of early-model T-45 power armor with a custom air conditioning module and stripped out servomotors. Bulky and slow, but almost as good as the real thing."
	icon_state = "t45bpowerarmor"
	item_state = "t45bpowerarmor"
	armor = list("melee" = 75, "bullet" = 65, "laser" = 35, "energy" = 50, "bomb" = 48, "bio" = 60, "rad" = 30, "fire" = 80, "acid" = 0)
	requires_training = FALSE
	slowdown = 1.35
	traits = list()
	hit_reflect_chance = 0 // Не настоящая ПА - не рефлектит
	block_chance = 5 //Не ПА, но всё ещё ценная

/obj/item/clothing/suit/armor/f13/power_armor/ncr
	name = "salvaged NCR power armor"
	desc = "It's a set of T-45b power armor with a air conditioning module installed, it however lacks servomotors to enhance the users strength. This one has brown paint trimmed along the edge and a two headed bear painted onto the chestplate."
	icon_state = "ncrpowerarmor"
	item_state = "ncrpowerarmor"
	armor = list("melee" = 75, "bullet" = 65, "laser" = 35, "energy" = 50, "bomb" = 48, "bio" = 60, "rad" = 30, "fire" = 80, "acid" = 0)
	requires_training = FALSE
	slowdown = 1.35
	traits = list()
	hit_reflect_chance = 0 // Не настоящая ПА - не рефлектит
	block_chance = 5 //Не ПА, но всё ещё ценная

/obj/item/clothing/suit/armor/f13/power_armor/raiderpa
	name = "raider T-45b power armor"
	desc = "It's a set of T-45b power armor with some of its plating heavily reconditioned. This set has seen better days, metal scrap has been spot welded to the chassis "
	icon_state = "raiderpa"
	item_state = "raiderpa"
	armor = list("melee" = 65, "bullet" = 65, "laser" = 35, "energy" = 50, "bomb" = 48, "bio" = 60, "rad" = 30, "fire" = 80, "acid" = 0)
	slowdown = 1.35
	heat_protection = 1046
	requires_training = FALSE
	traits = list()
	hit_reflect_chance = 0 // Не настоящая ПА - не рефлектит
	block_chance = 5 //Не ПА, но всё ещё ценная

/obj/item/clothing/suit/armor/f13/power_armor/hotrod
	name = "hotrod T-45b power armor"
	desc = "It's a set of T-45b power armor with a with some of its plating removed. This set has exhaust pipes piped to the pauldrons, flames erupting from them."
	icon_state = "t45hotrod"
	item_state = "t45hotrod"
	armor = list("melee" = 60, "bullet" = 65, "laser" = 35, "energy" = 50, "bomb" = 48, "bio" = 60, "rad" = 30, "fire" = 80, "acid" = 0)
	slowdown = 0.65 // No servo, but faster.
	requires_training = FALSE
	traits = list()
	hit_reflect_chance = 0 // Не настоящая ПА - не рефлектит
	block_chance = 5 //Не ПА, но всё ещё ценная

/obj/item/clothing/suit/armor/f13/power_armor/excavator
	name = "excavator power armor"
	desc = "Developed by Garrahan Mining Co. in collaboration with West Tek, the Excavator-class power armor was designed to protect miners from rockfalls and airborne contaminants while increasing the speed at which they could work. "
	icon_state = "excavator"
	item_state = "excavator"
	slowdown = 0.5 //+0.1 from helmet
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 60, "bullet" = 55, "laser" = 45, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)

/obj/item/clothing/suit/armor/f13/power_armor/t45d
	name = "T-45d power armor"
	desc = "Originally developed and manufactured for the United States Army by American defense contractor West Tek, the T-45d power armor was the first version of power armor to be successfully deployed in battle."
	icon_state = "t45dpowerarmor"
	item_state = "t45dpowerarmor"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 65, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)

/obj/item/clothing/suit/armor/f13/power_armor/t45d/gunslinger
	name = "Gunslinger T-51b"
	desc = "What was once a suit of T-51 Power Armor is now an almost unrecognizable piece of art or garbage, depending on who you ask. Almost all of the external plating has either been removed or stripped to allow for maximum mobility, and overlapping underplates protect the user from small arms fire. Whoever designed this had a very specific purpose in mind: mobility and aesthetics over defense."
	icon_state = "t51bgs"
	item_state = "t51bgs"
	slowdown = 0 //Okay??
	hit_reflect_chance = 50 //Щитспавнернская броня, осторожно при выдаче.
	//flags_inv = HIDEJUMPSUIT|HIDENECK
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)

/obj/item/clothing/suit/armor/f13/power_armor/t45d/sierra
	name = "sierra power armor"
	desc = "A captured set of T-45d power armor put into use by the NCR, it's been heavily modified and decorated with the head of a bear and intricate gold trimming. A two headed bear is scorched into the breastplate."
	icon_state = "sierra"
	item_state = "sierra"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)

/obj/item/clothing/suit/armor/f13/power_armor/t45d/knightcaptain
	name = "Knight-Captain's T-45d Power Armour"
	desc = "A classic set of T-45d Power Armour only to be used in armed combat, it signifies the Knight Captain and their place in the Brotherhood. A leader, and a beacon of structure in a place where chaos reigns. All must rally to his call, for he is the Knight Captain and your safety is his duty."
	icon_state = "t45dkc"
	item_state = "t45dkc"
	slowdown = 0.16
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 65, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)

/obj/item/clothing/suit/armor/f13/power_armor/t60
	name = "T-60a power armor"
	desc = "Developed in early 2077 after the Anchorage Reclamation, the T-60 series of power armor was designed to eventually replace the T-51b as the pinnacle of powered armor technology in the U.S. military arsenal."
	icon_state = "t60powerarmor"
	item_state = "t60powerarmor"
	slowdown = 0.16
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 75, "bullet" = 70, "laser" = 60, "energy" = 70, "bomb" = 82, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 0)
	hit_reflect_chance = 20

/obj/item/clothing/suit/armor/f13/power_armor/t51b
	name = "T-51b power armor"
	desc = "The pinnacle of pre-war technology. This suit of power armor provides substantial protection to the wearer."
	icon_state = "t51bpowerarmor"
	item_state = "t51bpowerarmor"
	slowdown = 0.15 //+0.1 from helmet = total 0.25
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 70, "bullet" = 75, "laser" = 55, "energy" = 65, "bomb" = 62, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 0)
	hit_reflect_chance = 15

/obj/item/clothing/suit/armor/f13/power_armor/t51b/ultra
	name = "Ultracite power armor"
	desc = "The pinnacle of pre-war technology. This suit of power armor provides substantial protection to the wearer. Now ultracite enhanced."
	icon_state = "ultracitepa"
	item_state = "ultracitepa"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	slowdown = 0
	hit_reflect_chance = 10

/obj/item/clothing/suit/armor/f13/power_armor/advanced
	name = "advanced power armor"
	desc = "An advanced suit of armor typically used by the Enclave.<br>It is composed of lightweight metal alloys, reinforced with ceramic castings at key stress points.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "advpowerarmor1"
	item_state = "advpowerarmor1"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 75, "bomb" = 72, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)
	hit_reflect_chance = 20

/obj/item/clothing/suit/armor/f13/power_armor/advanced/mk2
	name = "advanced power armor mark II"
	desc = "It's an improved model of advanced power armor used exclusively by the Enclave military forces, developed after the Great War.<br>Like its older brother, the standard advanced power armor, it's matte black with a menacing appearance, but with a few significant differences - it appears to be composed entirely of lightweight ceramic composites rather than the usual combination of metal and ceramic plates.<br>Additionally, like the T-51b power armor, it includes a recycling system that can convert human waste into drinkable water, and an air conditioning system for it's user's comfort."
	icon_state = "advpowerarmor2"
	item_state = "advpowerarmor2"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 90, "bullet" = 90, "laser" = 60, "energy" = 90, "bomb" = 72, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)
	hit_reflect_chance = 25

/obj/item/clothing/suit/armor/f13/power_armor/tesla
	name = "tesla power armor"
	desc = "A variant of the Enclave's advanced power armor Mk I, jury-rigged with a Tesla device that is capable of dispersing a large percentage of the damage done by directed-energy attacks.<br>As it's made of complex composite materials designed to block most of energy damage - it's notably weaker against kinetic impacts."
	icon_state = "tesla"
	item_state = "tesla"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 35, "bullet" = 35, "laser" = 95, "energy" = 95, "bomb" = 62, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 0)
	hit_reflect_chance = 50 //Что не зарефлектит, то зарезистит

/obj/item/clothing/suit/armor/f13/power_armor/midwest
	name = "midwestern power armor"
	desc = "This set of power armor once belonged to the Mid Western branch of the Brotherhood of Steel now residing wherever it's user currently is situated."
	icon_state = "midwestpa"
	item_state = "midwestpa"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 65, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 62, "bio" = 100, "rad" = 90, "fire" = 90, "acid" = 0)
	hit_reflect_chance = 15

/obj/item/clothing/suit/armor/f13/power_armor/midwest/reinforced
	name = "hardened midwestern power armor"
	desc = "This set of power armor once belonged to the Mid Western branch of the Brotherhood of Steel now residing wherever it's user currently is situated. This particular one has gone through a chemical hardening process, increasing it's armor capabilities."
	slowdown = 0.15 //+0.1 from helmet = total 0.25
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)
	armor = list("melee" = 70, "bullet" = 65, "laser" = 55, "energy" = 65, "bomb" = 62, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 0)
	hit_reflect_chance = 15

/obj/item/clothing/suit/armor/f13/legion
	name = "legion armor"
	desc = "Unadorned Legion armor."
	icon_state = "legrecruit"
	item_state = "legarmor"
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	allowed = list(/obj/item/gun, /obj/item/claymore, /obj/item/throwing_star/spear, /obj/item/restraints/legcuffs/bola, /obj/item/twohanded)
	armor = list("melee" = 40, "bullet" = 25, "laser" = 10, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/recruit
	name = "legion recruit armor"
	desc = "Legion recruit armor is a common light armor, supplied to recruit legionaries and to recruit decanus units. Like most Legion armor, it is made from repurposed sports equipment, consisting of a football player's protective shoulder and chest pads reinforced with additional leather padding and worn over a baseball catcher's vest."
	icon_state = "legrecruit"
	slowdown = -0.15

/obj/item/clothing/suit/armor/f13/legion/recruit/scout
	name = "legion scout armor"
	desc = "A modified set of recruit armor with the chestplate removed to provide greater agility and reduce weight."
	icon_state = "legscout"

/obj/item/clothing/suit/armor/f13/legion/prime
	name = "legion prime armor"
	desc = "It's a legion prime armor, supplied to recruits who have survived several skirmishes, and are more worthy of sturdier equipment."
	icon_state = "legprime"
	slowdown = -0.13
	armor = list("melee" = 50, "bullet" = 35, "laser" = 15, "energy" = 15, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/vet
	name = "legion veteran armor"
	desc = "Armor worn by veteran legionaries who have proven their combat prowess in many battles, its hardened leather is sturdier than that of previous ranks."
	icon_state = "legvet"
	slowdown = -0.1
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/vet/jonesarmormain
	name = "Lorica Articuli"
	desc = "A refurbished set of battle-worn veteran armor. Still made of leather and steel, it's relatively simple, but the modifications aren't. The metal has been engraved with exquisite patterns and wording, some of which is so small that you'd need a magnifying glass to properly see. Even still, it provides a noticeable improvement in aesthetics, though the engravings provide no tactical advantage whatsoever. The pauldrons have been plated with brass and engraved as well, providing the ultimate combination of protection and aesthetics. Just under the neck, an absolutely beautiful gemstone has been securely placed on the armor. To the trained eye or informed mind, it appears to be zircon. Red zircon. A steel, brass-plated belt goes around the midsection of the armor. 'Victoria Odds Contra Omnes' has been engraved into the belt in relatively large and fancy lettering, noticeable without having to get on your knees and go in for a whiff of the wearer's crotch in order to see."
	icon_state = "jonesarmormain"
	item_state = "jonesarmormain"

/obj/item/clothing/suit/armor/f13/legion/heavy
	name = "legion veteran decan armor"
	desc = "Heavy metal armor worn by the Veteran Decanii retinue of the region."
	icon_state = "legmetal"
	item_state = "legmetal"
	slowdown = -0.1
	armor = list("melee" = 65, "bullet" = 45, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/vet/explorer
	name = "legion explorer armor"
	desc = "A modified set of veteran armor with much of the metal replaced by layered strips of laminated linen and leather."
	icon_state = "legexplorer"

/obj/item/clothing/suit/armor/f13/legion/vet/vexil
	name = "legion vexillarius armor"
	slowdown = -0.12
	desc = "The armor appears to be based off of a suit of Legion veteran armor, with the addition of circular metal plates attached to the torso, as well as a banner displaying the flag of the Legion worn on the back."
	icon_state = "legvexil"

/obj/item/clothing/suit/armor/f13/legion/venator
	name = "legion venator armor"
	desc = "The armor appears to be based off of a suit of Legion veteran armor, with the addition of bracers and a chainmail skirt."
	icon_state = "legvenator"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/vet/orator
	name = "legion orator armor"
	desc = "The armor appears to be based off of a suit of Legion veteran armor, with the addition of bracers, a chainmail skirt, and large pauldrons.  A tabard emblazoned with the bull is loosely draped over the torso."
	icon_state = "legheavy"
	armor = list("melee" = 65, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/centurion
	name = "legion centurion armor"
	desc = "The Legion centurion armor is by far the strongest suit of armor available to Caesar's Legion. The armor is composed from other pieces of armor taken from that of the wearer's defeated opponents in combat."
	icon_state = "legcenturion"
	slowdown = -0.13
	armor = list("melee" = 60, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/palacent
	name = "paladin-slayer centurion armor"
	desc = "The armor of a Centurion who has bested one or more Brotherhood Paladins, adding pieces of his prizes to his own defense. The symbol of the Legion is crudely painted on this once-marvelous suit of armor."
	icon_state = "palacent"
	armor = list("melee" = 75, "bullet" = 50, "laser" = 35, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/palacent/custom_excess
	name = "Champion of Kanab's Armor"
	desc = "The armor of the Champion and Conqueror of the city in Utah named Kanab. The armor is made up of pieces of Power Armor and pre-war Riot Gear, the shin guards are spraypainted a dark crimson and the Power Armour pauldron has a red trim. The symbol of a Pheonix is carefully engraved and painted upon the chest piece... I wonder what it means.."
	icon_state = "palacent_excess"
	item_state = "palacent_excess"

/obj/item/clothing/suit/armor/f13/legion/rangercent
	name = "ranger-hunter centurion armor"
	desc = "A suit of armor collected over the years by the deaths of countless NCR rangers. It forfeits protection for added speed."
	icon_state = "rangercent"
	item_state = "rangercent"
	slowdown = -0.2
	armor = list("melee" = 55, "bullet" = 40, "laser" = 25, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/legate
	name = "legion legate armor"
	desc = "The armor appears to be a full suit of heavy gauge steel and offers full body protection. It also has a cloak in excellent condition, but the armor itself bears numerous battle scars and the helmet is missing half of the left horn. The Legate's suit appears originally crafted, in contrast to other Legion armor which consists of repurposed pre-War sports equipment."
	icon_state = "leglegat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("melee" = 85, "bullet" = 60, "laser" = 40, "energy" = 40, "bomb" = 45, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/roma
	name = "roma legion armor"
	desc = "A well-forged suit of lorica segmentata, standard issue to all Legionaries and Auxilia within the Roma Legion."
	icon_state = "roma_armor"
	item_state = "legarmor"
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	body_parts_covered = CHEST|GROIN
	allowed = list(/obj/item/gun, /obj/item/claymore, /obj/item/throwing_star/spear, /obj/item/restraints/legcuffs/bola, /obj/item/twohanded)
	armor = list("melee" = 60, "bullet" = 40, "laser" = 25, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/ncrarmor
	name = "NCR patrol vest"
	desc = "A standard issue NCR Infantry vest."
	icon_state = "ncr_infantry_vest"
	item_state = "ncr_infantry_vest"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 40, "bullet" = 35, "laser" = 20, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	name = "NCR mantle vest"
	desc = "A standard issue NCR Infantry vest with a mantle on the shoulder."
	icon_state = "ncr_standard_mantle"
	item_state = "ncr_standard_mantle"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 30, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	name = "NCR reinforced patrol vest"
	desc = "A standard issue NCR Infantry vest reinforced with a groinpad."
	icon_state = "ncr_reinforced_vest"
	item_state = "ncr_reinforced_vest"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 30, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	name = "NCR reinforced mantle vest"
	desc = "A standard issue NCR Infantry vest reinforced with a groinpad and a mantle."
	icon_state = "ncr_reinforced_mantle"
	item_state = "ncr_reinforced_mantle"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 35, "energy" = 20, "bomb" = 30, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/labcoat
	name = "NCR medical labcoat"
	desc = "An armored labcoat typically issued to NCR Medical Officers. It's a standard white labcoat with the Medical Officer's name stitched into the breast and a two headed bear sewn into the shoulder."
	icon_state = "ncr_labcoat"
	item_state = "ncr_labcoat"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 30, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	allowed = list(/obj/item/gun, /obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/soap, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)

/obj/item/clothing/suit/armor/f13/ncrarmor/captain
	name = "NCR reinforced officer vest"
	desc = "A heavily reinforced set of NCR mantle armour, the armor has been heavily patched and given ceramic inserts in vital areas to protect the wearer. The design indicates it belongs to a high ranking NCR officer."
	icon_state = "ncr_captain_armour"
	item_state = "ncr_captain_armour"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 40, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/scout
	name = "NCR 3rd Scout combat armor"
	desc = "A specialized variant of combat armor issued to members of the 3rd Scout Battalion."
	icon_state = "scoutarmor"
	item_state = "scoutarmor"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 30, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/scout/veteran
	name = "NCR 3rd Scout veteran combat armor"
	desc = "A specialized variant of combat armor issued to veteran members of the 3rd Scout Battalion."
	armor = list("melee" = 55, "bullet" = 45, "laser" = 35, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/scout/officer
	name = "NCR 3rd Scout officer combat armor"
	icon_state = "scout_armor_lt"
	item_state = "scout_armor_lt"
	desc = "A specialized variant of combat armor issued to officers of the 3rd Scout Battalion."
	armor = list("melee" = 60, "bullet" = 50, "laser" = 40, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrcfjacket
	name = "NCRCF jacket"
	icon_state = "ncrcfjacket"
	item_state = "ncrcfjacket"
	desc = "A cheap, standard issue teal canvas jacket issued to poor suckers who find themselves at the butt-end of the NCR's judiciary system."
	armor = list("melee" = 10, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ghostechoe
	name = "tattered peace coat"
	desc = "An old coat belonging to a Desert Ranger once. It has been stripped of most useful protection, and has seen better days. A crude peace symbol has been painted on the back in white."
	icon_state = "ghostechoe"
	item_state = "ghostechoe"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("melee" = 10, "bullet" = 16, "laser" = 0, "energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armor/f13/headscribe
    name = "brotherhood head scribe robe"
    desc = "A red cloth robe with gold trimmings, worn eclusively by the Head Scribe of a chapter."
    icon_state = "headscribe"
    item_state = "headscribe"
    body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
    armor = list("melee" = 15, "bullet" = 16, "laser" = 0, "energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)

/obj/item/clothing/suit/armor/f13/battlecoat
	name = "battlecoat"
	desc = "A padded leather coat with gold buttons. For style rather then protection."
	icon_state = "maxson_battlecoat"
	item_state = "maxson_battlecoat"
	body_parts_covered = CHEST
	armor = list("melee" = 15, "bullet" = 10, "laser" = 15, "energy" = 0, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed = list(/obj/item/gun)

/obj/item/clothing/suit/toggle/armor
	allowed = null
	body_parts_covered = CHEST
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	equip_delay_other = 40
	max_integrity = 250
	resistance_flags = NONE
	armor = list("melee" = 25, "bullet" = 25, "laser" = 16, "energy" = 16, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	allowed = list(/obj/item/gun)
	togglename = "collar"

/obj/item/clothing/suit/toggle/armor/f13/rangerrecon
	name = "ranger recon duster"
	desc = "A thicker than average duster worn by NCR recon rangers out in the field. It's not heavily armored by any means, but is easy to move around in and provides excellent protection from the harsh desert environment."
	icon_state = "duster_recon"
	item_state = "duster_recon"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1

/obj/item/clothing/suit/toggle/armor/f13/rangercustomdark
	name = "tattered recon duster"
	desc = "A thicker than average duster worn by rangers out in the field. This one has been dyed black and appears to be a little more heavily armoured."
	icon_state = "duster_recon_custom"
	item_state = "duster_recon_custom"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/trailranger
	name = "ranger vest"
	desc = "A quaint little jacket and scarf worn by NCR trail rangers."
	icon_state = "cowboyrang"
	item_state = "cowboyrang"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 20, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.14

/obj/item/clothing/suit/armor/f13/town
	name = "town trenchcoat"
	desc = "A non-descript black trenchcoat."
	icon_state = "towntrench"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 40, "bullet" = 30, "laser" = 20, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 30, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/town/mayor
	name = "mayor trenchcoat"
	desc = "A symbol of the mayor's authority (or lack thereof)."

/obj/item/clothing/suit/armor/f13/town/sheriff
	name = "sheriff trenchcoat"
	desc = "A trenchcoat which does not attempt to hide the full-body combat armor beneath it."
	icon_state = "towntrench_heavy"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/town/embroidered
	name = "embroidered trenchcoat"
	desc = "A custom armored trench coat with extra-length and a raised collar. There's a flower embroidered onto the back, although the color is a little faded."
	icon_state = "towntrench_special"
	item_state = "towntrench_special"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 25, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/town/deputy
	name = "deputy trenchcoat"
	desc = "An armored trench coat with added shoulderpads, a chestplate, and legguards."
	icon_state = "towntrench_medium"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 25, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/vaquero
	name = "vaquero suit"
	desc = "An ornate suit worn by Mexican gunfighters in the Old West, padded with leather for extra protection."
	icon_state = "vaquero"
	item_state = "vaquero"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 15, "energy" = 10, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armor/f13/harpercoat
	name = "outlaw coat"
	desc = "A combat duster"
	icon_state = "harperduster"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 25, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/raider/reptiliatenebris
	name = "Reptilia Tenebris"
	desc = "An old military-grade pre-war combat armor under a weathered duster. It appears to be fitted with metal plates to replace the crumbling ceramic. The color of this duster has been washed out time and time again, giving it a more faded look as if time gripped it heavily. Along with that, the duster has been dyed a deep shade of grey, and the body armor a darker shade of green."
	icon_state = "reptiliatenebris"
	item_state = "reptiliatenebris"

/obj/item/clothing/suit/armor/f13/raider/reptiliatenebris/Initialize()
    . = ..()
    AddComponent(/datum/component/armor_plate)
/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/enclave/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/job/enclave/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")

/*
Commander
*/
/datum/job/enclave/f13uscommander
	title = "US Commander"
	flag = F13USCOMMANDER
	department_flag = ENCLAVE
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the US Government"
	selection_color = "#aaaaf7"

	outfit = /datum/outfit/job/enclave/f13uscommander

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	exp_requirements = 5500
	exp_type = EXP_TYPE_NCR

/datum/outfit/job/enclave/f13uscommander
	name = "US Commander"
	jobtype = /datum/job/enclave/f13uscommander

	id = /obj/item/card/id/dogtag/enclave
	uniform =  /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	r_pocket = /obj/item/twohanded/binocs
	l_pocket = /obj/item/key/vertibird
	accessory = /obj/item/clothing/accessory/enclave/colonel
	ears = /obj/item/radio/headset/headset_enclave
	belt = /obj/item/gun/energy/laser/plasma/pistol
	suit = /obj/item/clothing/suit/f13/autumn
	back = /obj/item/storage/backpack/trekker
	pa_wear = TRUE
/*
Medic
*/
/datum/job/enclave/f13usmedic
	title = "US Medic"
	flag = F13USMEDIC
	department_flag = ENCLAVE
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usmedic

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	exp_requirements = 2500
	exp_type = EXP_TYPE_NCR

	loadout_options = list(
	/datum/outfit/loadout/enclave_medic_1,
	/datum/outfit/loadout/enclave_medic_2,
	/datum/outfit/loadout/enclave_medic_3
	)

/datum/outfit/job/enclave/f13usmedic
	name = "US Medic"
	jobtype = /datum/job/enclave/f13usmedic
	id = /obj/item/card/id/dogtag/enclave
	uniform =  /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/gun/energy/laser/plasma/pistol
	ears = /obj/item/radio/headset/headset_enclave
	back = /obj/item/storage/backpack/trekker
	pa_wear = FALSE
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers

/datum/outfit/loadout/enclave_medic_1
	name = "Enclave Medic"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit_store = /obj/item/gun/energy/laser/plasma/pistol
	back = /obj/item/storage/backpack/satchel/med
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3, /obj/item/stock_parts/cell/ammo/ec = 1)

/datum/outfit/loadout/enclave_medic_2
	name = "Enclave Surgeon"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit_store = /obj/item/gun/energy/laser/plasma/glock
	r_pocket = /obj/item/clothing/glasses/hud/health/sunglasses
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	back = /obj/item/storage/backpack/duffelbag/med/surgery
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/clothing/mask/surgical = 1,
		/obj/item/book/granter/trait/field_surgery = 1,
		  )

/datum/outfit/loadout/enclave_medic_3
	name = "Enclave Chemist"
	uniform = /obj/item/clothing/under/rank/chemist
	suit_store = /obj/item/gun/energy/laser/plasma/glock
	r_pocket = /obj/item/clothing/glasses/hud/health/sunglasses
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	back = /obj/item/storage/backpack/satchel/med
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/storage/box/beakers = 1
		)

/*
HEAVY!
*/


/datum/outfit/loadout/enclave_heavy_1
	name = "Tesla Heavy"
	suit_store = /obj/item/gun/energy/laser/plasma
	suit = /obj/item/clothing/suit/armor/f13/power_armor/tesla
	head =  /obj/item/clothing/head/helmet/f13/power_armor/tesla
	backpack_contents = list(
			/obj/item/stock_parts/cell/ammo/mfc = 3
		)

/datum/outfit/loadout/enclave_heavy_2
	name = "Ballistic Heavy"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/advanced
	head = /obj/item/clothing/head/helmet/f13/power_armor/advanced
	back = /obj/item/minigunpackbal


/datum/job/enclave/f13usheavy
	title = "US Heavy Soldier"
	flag = F13USPRIVATE
	department_flag = ENCLAVE
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usheavy

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	exp_requirements = 4500
	exp_type = EXP_TYPE_NCR

	loadout_options = list(
		/datum/outfit/loadout/enclave_heavy_1,
		/datum/outfit/loadout/enclave_heavy_2
	)

/datum/outfit/job/enclave/f13usheavy
	name = "US Heavy"
	jobtype = /datum/job/enclave/f13usheavy
	id = /obj/item/card/id/dogtag/enclave
	uniform =  /obj/item/clothing/under/f13/bdu
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_enclave
	belt = /obj/item/storage/belt/military
	pa_wear = TRUE

/*
Private
*/
/datum/job/enclave/f13usprivate
	title = "US Private"
	flag = F13USPRIVATE
	department_flag = ENCLAVE
	faction = "Enclave"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usprivate

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	exp_requirements = 3500
	exp_type = EXP_TYPE_NCR

	loadout_options = list(
	/datum/outfit/loadout/enclave_soldier_1,
	/datum/outfit/loadout/enclave_soldier_2,
	/datum/outfit/loadout/enclave_soldier_3
	)

/datum/outfit/loadout/enclave_soldier_1
	name = "Enclave Plasma soldier"
	uniform = /obj/item/clothing/under/f13/dbdu
	suit_store = /obj/item/gun/energy/laser/plasma
	accessory = /obj/item/clothing/accessory/enclave/sergeant
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 3)

/datum/outfit/loadout/enclave_soldier_2
	name = "Enclave Ballistic soldier"
	uniform = /obj/item/clothing/under/f13/dbdu
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine
	accessory = /obj/item/clothing/accessory/enclave/private
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault = 3)

/datum/outfit/loadout/enclave_soldier_3
	name = "Enclave Spy"
	accessory = /obj/item/clothing/accessory/enclave/sergeant
	r_pocket = /obj/item/encryptionkey/syndicate
	belt = /obj/item/stealthboy
	backpack_contents = list(
		/obj/item/storage/box/syndie_kit/chameleon = 1, /obj/item/storage/box/syndie_kit/imp_microbomb = 1, /obj/item/jammer = 1, /obj/item/card/id/syndicate/anyone = 1, /obj/item/melee/baton/enclave = 1)

/datum/outfit/job/enclave/f13usprivate
	name = "US Private"
	jobtype = /datum/job/enclave/f13usprivate
	id = /obj/item/card/id/dogtag/enclave
	uniform =  /obj/item/clothing/under/f13/dbdu
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_enclave
	head = /obj/item/clothing/head/helmet/f13/combat/enclave
	suit = /obj/item/clothing/suit/armor/f13/combat/enclave
	belt = /obj/item/gun/energy/laser/plasma/pistol
	back = /obj/item/storage/backpack/trekker

/*
Scientist
*/
/datum/job/enclave/f13usscientist
	title = "US Scientist"
	flag = F13USSCIENTIST
	department_flag = ENCLAVE
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 2
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usscientist

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	exp_requirements = 600
	exp_type = EXP_TYPE_NCR

/datum/outfit/job/enclave/f13usscientist
	name = "US Scientist"
	jobtype = /datum/job/enclave/f13usscientist

	chemwhiz = TRUE

	id = /obj/item/card/id/dogtag/enclave
	uniform =  /obj/item/clothing/under/f13/dbdu
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_enclave
	head = /obj/item/clothing/head/bio_hood/f13/hazmat_enclave
	suit = /obj/item/clothing/suit/bio_suit/f13/hazmat_enclave
	belt = /obj/item/storage/belt/utility/full/engi

/*
Engineer
*/
/datum/job/enclave/f13usengineer
	title = "US Engineer"
	flag = F13USENGINEER
	department_flag = ENCLAVE
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13usengineer

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	exp_requirements = 400
	exp_type = EXP_TYPE_NCR

	loadout_options = list(
	/datum/outfit/loadout/enclave_eng_1,
	/datum/outfit/loadout/enclave_eng_2,
	/datum/outfit/loadout/enclave_eng_3
	)

/datum/outfit/job/enclave/f13usengineer
	name = "US Engineer"
	jobtype = /datum/job/enclave/f13usengineer

	id = /obj/item/card/id/dogtag/enclave
	uniform =  /obj/item/clothing/under/f13/petrochico
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_enclave
	belt = /obj/item/storage/belt/utility/full/engi
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE

/datum/outfit/loadout/enclave_eng_1
	name = "Enclave Combat Engineer"
	suit_store = /obj/item/gun/energy/laser/plasma/pistol
	accessory = /obj/item/clothing/accessory/enclave/sergeant
	head = /obj/item/clothing/head/welding/weldingjapan
	glasses = /obj/item/clothing/glasses/night
	suit = /obj/item/clothing/suit/armor/f13/combat/enclave
	backpack_contents = list(
		/obj/item/construction/rcd/combat = 1,
		/obj/item/rcd_ammo/large = 2,
		/obj/item/stock_parts/cell/ammo/ec = 3)

/datum/outfit/loadout/enclave_eng_2
	name = "Enclave Flamethrower"
	mask = /obj/item/clothing/mask/gas/explorer
	suit = /obj/item/clothing/suit/fire/atmos
	back = /obj/item/tank/internals/oxygen/red
	head = /obj/item/clothing/head/welding/f13/fire
	backpack_contents = list(
		/obj/item/flamethrower/full/tank = 1, /obj/item/tank/internals/plasma/full = 1)

/datum/outfit/loadout/enclave_eng_3
	name = "Enclave Pilot"
	head = /obj/item/clothing/head/soft/f13/enclave
	suit_store = /obj/item/gun/energy/laser/plasma/pistol
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/key/vertibird = 1,
		/obj/item/flashlight/flare/emergency = 3
		)

/*
/*
Colonist
*/
/datum/job/enclave/f13uscolonist
	title = "US Colonist"
	flag = F13USCOLONIST
	department_flag = ENCLAVE
	//faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the commander"
	selection_color = "#ccccff"

	outfit = /datum/outfit/job/enclave/f13uscolonist

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave/f13uscolonist
	name = "US Colonist"
	jobtype = /datum/job/enclave/f13uscolonist

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain
*/

/obj/item/clothing/accessory/enclave/sergeant
    name = "Sergeant pins"
    desc = "A silver pin with one device, a silver sword centered on the purple coloring, and notches denoting the rank of the Paladin."
    icon_state = "paladin"
    item_color = "paladin"
    minimize_when_attached = TRUE

/obj/item/clothing/accessory/enclave/private
    name = "Private pins"
    desc = "A silver pin with one device, and purple coloring."
    icon_state = "juniorpaladin"
    item_color = "juniorpaladin"
    minimize_when_attached = TRUE

/obj/item/clothing/accessory/enclave/colonel
    name = "Colonel pins"
    desc = "A gold-plated, silver lined pin with one device and two outstretched wings on the side; a golden sword centered on green-cloth. It bears notches with gems on the top half, and denotes the rank of Colonel."
    icon_state = "elder"
    item_color = "elder"
    minimize_when_attached = TRUE
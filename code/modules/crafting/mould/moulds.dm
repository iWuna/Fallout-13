/obj/item/prefabs/mould
	name = "Mould"
	desc = ""
	icon_state = "mould"

	var/item_path
	var/obj/item/stack/mould_sheet_type = /obj/item/stack/sheet/metal
	var/sheet_amount = 1

/obj/item/prefabs/mould/examine(mob/user)
	. = ..()
	var/obj/item/stack/sheet/sheet = new mould_sheet_type
	to_chat(user, "It requires [sheet_amount] [sheet.name] and moulding bench")

// Attachment

/obj/item/prefabs/mould/attachment/scope
	name = "Weapon Optics Mould"
	item_path = /obj/item/attachments/scope
	sheet_amount = 8
	mould_sheet_type = /obj/item/stack/sheet/glass

/obj/item/prefabs/mould/attachment/recoil_decrease
	name = "Recoil Compensator Mould"
	item_path = /obj/item/attachments/recoil_decrease
	sheet_amount = 5

/obj/item/prefabs/mould/attachment/bullet_speed
	name = "Improved Barrel Mould"
	item_path = /obj/item/attachments/bullet_speed
	sheet_amount = 10

/obj/item/prefabs/mould/attachment/burst_improvement
	name = "Burst Cam Mould"
	item_path = /obj/item/attachments/burst_improvement
	sheet_amount = 7

// Action

/obj/item/prefabs/mould/action/simple
	name = "Simple Action Mould"
	item_path = /obj/item/prefabs/complex/action/simple
	sheet_amount = 1

/obj/item/prefabs/mould/action/auto
	name = "Automatic Action Mould"
	item_path = /obj/item/prefabs/complex/action/auto
	sheet_amount = 2

/obj/item/prefabs/mould/action/autoburst
	name = "Automatic Burst Action Mould"
	item_path = /obj/item/prefabs/complex/action/autoburst
	sheet_amount = 3

/obj/item/prefabs/mould/action/rapid
	name = "Rapid Blowback Action Mould"
	item_path = /obj/item/prefabs/complex/action/rapid
	sheet_amount = 5

// Barrel

/obj/item/prefabs/mould/barrel/short
	name = "Short Barrel Mould"
	item_path = /obj/item/prefabs/complex/barrel/short
	sheet_amount = 1

/obj/item/prefabs/mould/barrel/medium
	name = "Medium Barrel Mould"
	desc = ""
	item_path = /obj/item/prefabs/complex/barrel/medium
	sheet_amount = 2

/obj/item/prefabs/mould/barrel/long
	name = "Long Barrel Mould"
	item_path = /obj/item/prefabs/complex/barrel/long
	sheet_amount = 3

/obj/item/prefabs/mould/barrel/extended
	name = "Long Barrel Mould"
	item_path = /obj/item/prefabs/complex/barrel/extended
	sheet_amount = 6

/obj/item/prefabs/mould/barrel/dual
	name = "Multiple barrels Mould"
	item_path = /obj/item/prefabs/complex/barrel/dual
	sheet_amount = 5

// Frame

/obj/item/prefabs/mould/simpleWeaponFrame
	name = "Simple Weapon Frame Mould"
	item_path = /obj/item/prefabs/complex/WeaponFrame/makeshift
	sheet_amount = 2

/obj/item/prefabs/mould/complexWeaponFrame
	name = "Complex Weapon Frame Mould"
	item_path = /obj/item/prefabs/complex/WeaponFrame/standard
	sheet_amount = 5

/obj/item/prefabs/mould/prewarWeaponFrame
	name = "Prewar Weapon Frame Mould"
	item_path = /obj/item/prefabs/complex/WeaponFrame/improved
	sheet_amount = 2
	mould_sheet_type = /obj/item/stack/sheet/plasteel

/obj/item/prefabs/mould/masterworkWeaponFrame
	name = "Masterwork Weapon Frame Mould"
	item_path = /obj/item/prefabs/complex/WeaponFrame/masterwork
	sheet_amount = 4
	mould_sheet_type = /obj/item/stack/sheet/plasteel

/obj/item/prefabs/mould/assembly
	name = "Weapon Assembly Mould"
	item_path = /obj/item/advanced_crafting_components/assembly
	sheet_amount = 2
	mould_sheet_type = /obj/item/stack/crafting/goodparts

// Loader

/obj/item/prefabs/mould/m10mm
	name = "10mm Magazine Ammo Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m10mm
	sheet_amount = 2

/obj/item/prefabs/mould/m10mmdouble
	name = "10mm Magazine Double Ammo Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m10mmdouble
	sheet_amount = 4

/obj/item/prefabs/mould/m9mm
	name = "9mm Magazine Ammo Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m9mm
	sheet_amount = 2

/obj/item/prefabs/mould/m9mmdouble
	name = "9mm Magazine Double Ammo Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m9mmdouble
	sheet_amount = 4

/obj/item/prefabs/mould/m9mmext
	name = "9mm Magazine Extended Ammo Loader Mould"
	desc = ""
	item_path = /obj/item/prefabs/complex/ammo_loader/m9mmext
	sheet_amount = 6

/obj/item/prefabs/mould/m556
	name = "556 Magazine Ammo Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m556
	sheet_amount = 6

/obj/item/prefabs/mould/m762
	name = "762 Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m762
	sheet_amount = 6

/obj/item/prefabs/mould/m45mm
	name = ".45 Simple Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m45mm
	sheet_amount = 2

/obj/item/prefabs/mould/m45mmdouble
	name = ".45 Double Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m45mmdouble
	sheet_amount = 4

/obj/item/prefabs/mould/tommygunm45
	name = ".45 Extended Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m45mmext
	sheet_amount = 6

/obj/item/prefabs/mould/a50
	name = "handgun magazine (.50 AE)"
	item_path = /obj/item/prefabs/complex/ammo_loader/m50AE
	sheet_amount = 8

/obj/item/prefabs/mould/d12g
	name = "12g Drum Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m12g
	sheet_amount = 10

/obj/item/prefabs/mould/tube4570
	name = "45-70 Internal Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m4570
	sheet_amount = 8

/obj/item/prefabs/mould/tube44
	name = ".44 Internal Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m44
	sheet_amount = 4

/obj/item/prefabs/mould/tube357
	name = ".357 Internal Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m357
	sheet_amount = 2

/obj/item/prefabs/mould/antimateriel
	name = ".50MG Internal Magazine Loader Mould"
	item_path = /obj/item/prefabs/complex/ammo_loader/m50MG
	sheet_amount = 20

// Bolt

/obj/item/prefabs/mould/bolt/simple
	name = "Simple Bolt Mould"
	desc = ""
	item_path = /obj/item/prefabs/complex/bolt/simple
	sheet_amount = 2

/obj/item/prefabs/mould/bolt/high
	name = "Advanced Bolt Mould"
	desc = ""
	item_path = /obj/item/prefabs/complex/bolt/high
	sheet_amount = 2

// Trigger

/obj/item/prefabs/mould/trigger
	name = "Simple Trigger Mould"
	item_path = /obj/item/prefabs/complex/trigger/simple
	sheet_amount = 1

/obj/item/prefabs/mould/hair
	name = "Hair Trigger Mould"
	item_path = /obj/item/prefabs/complex/trigger/hair
	sheet_amount = 3

/obj/item/prefabs/mould/advhair
	name = "Advanced Hair Trigger Mould"
	item_path = /obj/item/prefabs/complex/trigger/advhair
	sheet_amount = 5

// Stock

/obj/item/prefabs/mould/stock
	name = "Stock Mould"
	item_path = /obj/item/prefabs/complex/stock
	sheet_amount = 2

/obj/item/prefabs/mould/stock/wooden
	name = "Wooden Stock Mould"
	item_path = /obj/item/prefabs/complex/stock/low
	sheet_amount = 2
	mould_sheet_type = /obj/item/stack/sheet/mineral/wood

/obj/item/prefabs/mould/stock/plastic
	name = "Plastic Stock Mould"
	item_path = /obj/item/prefabs/complex/stock/mid
	sheet_amount = 2
	mould_sheet_type = /obj/item/stack/sheet/plastic

/obj/item/prefabs/mould/screw
	name = "Screw Mould"
	item_path = /obj/item/prefabs/complex/screw
	sheet_amount = 1


/obj/item/prefabs/mould/receiver
	name = "Receiver Mould"
	item_path = /obj/item/advanced_crafting_components/receiver
	mould_sheet_type = /obj/item/stack/crafting/goodparts
	sheet_amount = 2

/obj/item/prefabs/mould/alloy
	name = "Alloy Mould"
	item_path = /obj/item/advanced_crafting_components/alloys
	mould_sheet_type = /obj/item/stack/crafting/metalparts
	sheet_amount = 2

/obj/item/prefabs/mould/alloy/advanced
	name = "Superlight Alloy Mould"
	item_path = /obj/item/advanced_crafting_components/alloys/advanced
	mould_sheet_type = /obj/item/stack/crafting/metalparts
	sheet_amount = 6
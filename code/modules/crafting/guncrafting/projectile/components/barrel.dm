/obj/item/prefabs/complex/barrel
	name = "Barrel"
	desc = ""
	icon_state = "barrel"
	part_type = "barrel"
	complexity = 10

/obj/item/prefabs/complex/barrel/short
	name = "Short Barrel"
	desc = ""
	icon_state = "barrel"
	complexity = 10
	bullet_speed_mod = 0
	dam_mod = -3
	armorpen_mod = -3

/obj/item/prefabs/complex/barrel/medium
	name = "Medium Barrel"
	desc = ""
	icon_state = "barrel"
	complexity = 20
	bullet_speed_mod = -0.1

/obj/item/prefabs/complex/barrel/long
	name = "Long Barrel"
	desc = ""
	icon_state = "barrel"
	complexity = 40
	bullet_speed_mod = -0.2

/obj/item/prefabs/complex/barrel/extended
	name = "Extended Rifle Barrel"
	desc = ""
	icon_state = "barrel"
	complexity = 50
	bullet_speed_mod = -0.4
	incompatible_tags = list("rifle", "smg", "lmg", "shotgun", "revolver")

/obj/item/prefabs/complex/barrel/dual
	name = "Multiple barrels"
	desc = ""
	icon_state = "barrel"
	tags = list("automatic")
	complexity = 70
	burst_mod = 1
	burst_delay_mod = -1.5
	spread_mod = 30
/obj/item/prefabs/complex/bolt
	name = "Bolt"
	desc = ""
	icon_state = "bolt"
	part_type = "bolt"

/obj/item/prefabs/complex/bolt/simple
	name = "Simple Bolt"
	desc = ""
	icon_state = "bolt"
	tags = list("crude_quality")
	incompatible_tags = list("masterwork_quality")
	complexity = 10

/obj/item/prefabs/complex/bolt/high
	name = "Advanced Bolt"
	desc = ""
	tags = list("prewar_quality","bonusdmg")
	incompatible_tags = list("crude_quality")
	complexity = 40
	dam_mod = 6
	armorpen_mod = 6
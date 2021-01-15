/obj/item/prefabs/complex/action
	part_type = "action"

/obj/item/prefabs/complex/action/simple
	name = "Simple Action"
	desc = ""
	icon_state = "action"
	complexity = 10
	tags = list("semiauto")
	incompatible_tags = list("automatic")

/obj/item/prefabs/complex/action/auto
	name = "Automatic Action"
	desc = ""
	icon_state = "action"
	complexity = 30
	tags = list("automatic")
	incompatible_tags = list("semiauto")
	spread_mod = 10
	enables_automatic = TRUE

/obj/item/prefabs/complex/action/autoburst
	name = "Automatic Burst Action"
	desc = ""
	icon_state = "action"
	complexity = 50
	tags = list("automatic","burst")
	incompatible_tags = list("revolver","shotgun","sniper")
	burst_mod = 1
	spread_mod = 20
	enables_automatic = TRUE

/obj/item/prefabs/complex/action/rapid
	name = "Rapid Blowback Action"
	desc = "Rare!"
	icon_state = "action"
	part_type = "action"
	complexity = 80
	tags = list("automatic","burst")
	incompatible_tags = list("revolver","shotgun","sniper","pistol")
	spread_mod = 30
	burst_mod = 2
	burst_delay_mod = -1
	enables_automatic = TRUE
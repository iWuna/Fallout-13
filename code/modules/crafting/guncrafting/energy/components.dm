// BARRELS
/obj/item/prefabs/complex/ebarrel
	part_type = "ebarrel"
	icon_state = "flux"
	desc = "Energy Emitter"


/obj/item/prefabs/complex/ebarrel/laser/weak
	name = "Weak Laser Emitter"
	icon_state = "emitter_l1"
	energyProjType = list(/obj/item/ammo_casing/energy/laser/pistol)
	complexity = 25


/obj/item/prefabs/complex/ebarrel/laser/avg
	name = "Laser Emitter"
	icon_state = "emitter_l2"
	energyProjType = list(/obj/item/ammo_casing/energy/laser/lasgun)
	complexity = 50


/obj/item/prefabs/complex/ebarrel/stun/disabler
	name = "Disabler Emitter"
	icon_state = "emitter_d1"
	energyProjType = list(/obj/item/ammo_casing/energy/disabler/expensive)
	complexity = 25


/obj/item/prefabs/complex/ebarrel/stun/disabler/scatter
	name = "Scatter Disabler Emitter"
	icon_state = "emitter_d2"
	energyProjType = list(/obj/item/ammo_casing/energy/laser/scatter/disabler/expensive)
	complexity = 125
	incompatible_tags = list("fdual", "triple")
	tags = list("scatter")


/obj/item/prefabs/complex/ebarrel/laser/strong
	name = "Strong Laser Emitter"
	icon_state = "emitter_l3"
	energyProjType = list(/obj/item/ammo_casing/energy/laser/musket)
	complexity = 125


/obj/item/prefabs/complex/ebarrel/laser/scatter
	name = "Scatter Laser Emitter"
	icon_state = "emitter_l3"
	energyProjType = list(/obj/item/ammo_casing/energy/laser/scatter)
	complexity = 100
	incompatible_tags = list("fdual", "triple")
	tags = list("scatter")


/obj/item/prefabs/complex/ebarrel/plasma/weak
	name = "Weak Plasma Emitter"
	icon_state = "emitter_p1"
	energyProjType = list(/obj/item/ammo_casing/energy/plasma/pistol)
	complexity = 75


/obj/item/prefabs/complex/ebarrel/plasma/avg
	name = "Plasma Emitter"
	icon_state = "emitter_p2"
	energyProjType = list(/obj/item/ammo_casing/energy/plasma)
	complexity = 125


/obj/item/prefabs/complex/ebarrel/plasma/scatter
	name = "Scatter Plasma Emitter"
	icon_state = "emitter_p3"
	energyProjType = list(/obj/item/ammo_casing/energy/plasma/scatter)
	complexity = 175
	incompatible_tags = list("fdual", "triple")
	tags = list("scatter")


/obj/item/prefabs/complex/ebarrel/ion
	name = "Weak Ion Emitter"
	icon_state = "emitter_i2"
	energyProjType = list(/obj/item/ammo_casing/energy/ion/pistol)
	complexity = 75


/obj/item/prefabs/complex/ebarrel/ion/strong
	name = "Strong Ion Emitter"
	icon_state = "emitter_i3"
	energyProjType = list(/obj/item/ammo_casing/energy/ion)
	complexity = 125


// BURST
/obj/item/prefabs/complex/eburst
	part_type = "eburst"
	icon_state = "flux"
	desc = "Energy Stream Adapter"


/obj/item/prefabs/complex/eburst/simple
	name = "Single Stream"
	burst_mod = 0
	complexity = 25


/obj/item/prefabs/complex/eburst/dual
	name = "Dual Stream"
	burst_mod = 1
	burst_delay_mod = 1.5
	complexity = 75
	bullet_speed_mod = 0.1
	// tags = list("dual")
	// incompatible_tags = list("scatter")


/obj/item/prefabs/complex/eburst/fast
	name = "Fast Dual Stream"
	burst_mod = 1
	burst_delay_mod = -2
	dam_mod = -3
	armorpen_mod = -3
	complexity = 100
	tags = list("fdual")
	incompatible_tags = list("scatter")


/obj/item/prefabs/complex/eburst/triple
	name = "Triple Stream"
	burst_mod = 2
	burst_delay_mod = -0.5
	dam_mod = -5
	armorpen_mod = -5
	complexity = 150
	tags = list("triple")
	incompatible_tags = list("scatter")


/obj/item/prefabs/complex/ecell
	part_type = "ecell"
	icon_state = "flux"
	desc = "Power Source Adapater"


// POWER CELL
/obj/item/prefabs/complex/ecell/ec
	name = "EC Adapter"
	icon_state = "adapter_ec"
	energyAmmoType = /obj/item/stock_parts/cell/ammo/ec
	dam_mod = -7
	armorpen_mod = -7
	complexity = 25


/obj/item/prefabs/complex/ecell/mfc
	name = "MFC Adapter"
	icon_state = "adapter_mfc"
	energyAmmoType = /obj/item/stock_parts/cell/ammo/mfc
	dam_mod = 3
	armorpen_mod = 3
	complexity = 50


/obj/item/prefabs/complex/ecell/ecp
	name = "ECP Adapter"
	icon_state = "adapter_ecp"
	energyAmmoType = /obj/item/stock_parts/cell/ammo/ecp
	dam_mod = 5
	armorpen_mod = 5
	complexity = 50


// FRAMES
/obj/item/prefabs/complex/energy/frame/pistol
	name = "Energy Pistol Frame"
	desc = "An unfinished energy gun."
	icon_state = "pistolframe"
	max_complexity = 150


/obj/item/prefabs/complex/energy/frame/hqpistol
	name = "Advanced Energy Pistol Frame"
	desc = "An unfinished energy gun."
	icon_state = "pistolframe"
	max_complexity = 200


/obj/item/prefabs/complex/energy/frame/rifle
	name = "Energy Rifle Frame"
	desc = "An unfinished energy gun."
	icon_state = "gunframe"
	max_complexity = 300


/obj/item/prefabs/complex/energy/frame/hqrifle
	name = "Advanced Energy Rifle Frame"
	desc = "An unfinished energy gun."
	icon_state = "gunframe"
	max_complexity = 375


// COMPONENTS
/obj/item/advanced_crafting_components/capacitor
	var/armorpen_mod = 0

/obj/item/advanced_crafting_components/capacitor/flux
	name = "Flux capacitor"
	desc = "An energy weapon part, a craftsman might want to have this."
	icon_state = "capacitor_flux"
	complexity = 25
	armorpen_mod = 2


/obj/item/advanced_crafting_components/capacitor/array
	name = "Array capacitor"
	desc = "An energy weapon part, a craftsman might want to have this. Advanced model of its more common predecessor."
	icon_state = "capacitor_array"
	complexity = 50
	armorpen_mod = 7


/obj/item/advanced_crafting_components/capacitor/reflex
	name = "Reflex capacitor"
	desc = "An energy weapon part, a craftsman might want to have this. It has the highest efficiecy among other models."
	icon_state = "capacitor_reflex"
	complexity = 75
	armorpen_mod = 15


/obj/item/advanced_crafting_components/lenses
	name = "Focused crystal lenses"
	desc = "An energy weapon part, a craftsman might want to have this. Common serial model of pre-war industry."
	icon_state = "lense_focused"
	complexity = 25
	var/burst_delay_mod = -0.5
	var/bullet_speed_mod = -0.1


/obj/item/advanced_crafting_components/lenses/crude
	name = "Crude lenses"
	desc = "An energy weapon part, a craftsman might want to have this. Has tiny fractures over the sides."
	icon_state = "lense_crude"
	complexity = 0
	burst_delay_mod = 0.5
	bullet_speed_mod = 0.1


/obj/item/advanced_crafting_components/lenses/meta
	name = "Focused metasurface lense"
	desc = "An energy weapon part, a craftsman might want to have this. Array of reconfigurable microscopic pillars that polarize light beams coming throught it."
	icon_state = "lense_metasurface"
	bullet_speed_mod = -0.15
	burst_delay_mod = -1
	complexity = 75

/obj/item/advanced_crafting_components/conductors
	name = "Conductor coil"
	desc = "An energy weapon part, a craftsman might want to have this."
	icon_state = "conductor"
	complexity = 10
	var/spread_mod = -10


/obj/item/advanced_crafting_components/conductors/super
	name = "Superconductor coil"
	desc = "An energy weapon part, a craftsman might want to have this."
	icon_state = "conductor_super"
	complexity = 20
	spread_mod = -20

/obj/item/advanced_crafting_components/firing_pin
    name = "Firing pin adapter"
    icon_state = "frame"
    complexity = 25
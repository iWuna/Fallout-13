/////////////////////////////////////////
/////////////////Weapons/////////////////
/////////////////////////////////////////

/datum/design/c38/sec
	id = "sec_38"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/rubbershot/sec
	id = "sec_rshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun_slug/sec
	id = "sec_slug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/buckshot_shell/sec
	id = "sec_bshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun_dart/sec
	id = "sec_dart"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/incendiary_slug/sec
	id = "sec_Islug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/minibomb
	name = "Minibomb Grenade"
	desc = "A somewhat destructive grenade, does damage."
	id = "minibomb"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/grenade/syndieminibomb
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_testing
	name = "Test-Range Firing Pin"
	desc = "This safety firing pin allows firearms to be operated within proximity to a firing range."
	id = "pin_testing"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 500, MAT_GLASS = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin
	name = "Regular Firing Pin"
	desc = "This is a basic firing pin."
	id = "pin"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/firing_pin
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_mindshield
	name = "Mindshield Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are mindshield-implanted."
	id = "pin_loyalty"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_flux
	name = "Flux capacitor"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_c_flux"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 12000, MAT_DIAMOND = 7600, MAT_URANIUM = 8000)
	build_path = /obj/item/advanced_crafting_components/capacitor/flux
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_array
	name = "Array capacitor"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_c_array"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 12000, MAT_DIAMOND = 6600, MAT_URANIUM = 8000)
	build_path = /obj/item/advanced_crafting_components/capacitor/array
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_reflex
	name = "Reflex capacitor"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_c_reflex"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 12000, MAT_DIAMOND = 6600, MAT_URANIUM = 8000)
	build_path = /obj/item/advanced_crafting_components/capacitor/reflex
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_firing_pin
	name = "Firing Pin Adapter"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_firing_pin"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 12000, MAT_DIAMOND = 8600, MAT_SILVER = 12200)
	build_path = /obj/item/advanced_crafting_components/firing_pin
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	

/datum/design/advw_capacitor
	name = "Conductor coil"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_coil"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 12000, MAT_DIAMOND = 8600, MAT_SILVER = 12200)
	build_path = /obj/item/advanced_crafting_components/conductors
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/advw_capacitor_super
	name = "Superconductor coil"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_coil_super"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 12000, MAT_DIAMOND = 8600, MAT_SILVER = 12200)
	build_path = /obj/item/advanced_crafting_components/conductors/super
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_lense
	name = "Focused crystal lenses"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_lense"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 8000, MAT_DIAMOND = 8000, MAT_GLASS = 20000)
	build_path = /obj/item/advanced_crafting_components/lenses
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_lense_crude
	name = "Crude lenses"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_lense_crude"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 4000, MAT_DIAMOND = 2000, MAT_GLASS = 10000)
	build_path = /obj/item/advanced_crafting_components/lenses/crude
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_lense_meta
	name = "Metasurface lenses"
	desc = "An energy weapon part, a craftsman might want to have this."
	id = "advw_lense_meta"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 16000, MAT_DIAMOND = 12000, MAT_GLASS = 20000)
	build_path = /obj/item/advanced_crafting_components/lenses/meta
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_alloys
	name = "Light alloys"
	desc = "A general crafting part, a craftsman might want to have this."
	id = "advw_alloys"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 10600, MAT_DIAMOND = 6800, MAT_URANIUM = 8000, MAT_PLASTIC=5000)
	build_path = /obj/item/advanced_crafting_components/alloys
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/advw_alloys
	name = "Superlight alloys"
	desc = "A general crafting part, a craftsman might want to have this."
	id = "advw_alloys_super"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 10600, MAT_DIAMOND = 12800, MAT_URANIUM = 8000, MAT_PLASTIC=10000)
	build_path = /obj/item/advanced_crafting_components/alloys/advanced
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_weak_emitter
	name = "Weak Laser Emitter"
	desc = "Energy Emitter"
	id = "ew_weak_emitter"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 18000, MAT_DIAMOND = 9000, MAT_URANIUM = 8000)
	build_path = /obj/item/prefabs/complex/ebarrel/laser/weak
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_disabler
	name = "Disabler Emitter"
	desc = "Energy Emitter"
	id = "ew_disabler"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 18000, MAT_DIAMOND = 9000, MAT_URANIUM = 8000)
	build_path = /obj/item/prefabs/complex/ebarrel/stun/disabler
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_emitter
	name = "Laser Emitter"
	desc = "Energy Emitter"
	id = "ew_emitter"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 20000, MAT_DIAMOND = 10600, MAT_URANIUM = 12000)
	build_path = /obj/item/prefabs/complex/ebarrel/laser/avg
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_strong_emitter
	name = "Strong Laser Emitter"
	desc = "Energy Emitter"
	id = "ew_strong_emitter"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 22000, MAT_DIAMOND = 8000, MAT_URANIUM = 16000)
	build_path = /obj/item/prefabs/complex/ebarrel/laser/strong
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_scatter_emitter
	name = "Scatter Laser Emitter"
	desc = "Energy Emitter"
	id = "ew_scatter_emitter"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 18000, MAT_GOLD = 18000, MAT_DIAMOND = 8600, MAT_URANIUM = 15000)
	build_path = /obj/item/prefabs/complex/ebarrel/laser/scatter
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_scatter_emitter_disabler
	name = "Scatter Disabler Emitter"
	desc = "Energy Emitter"
	id = "ew_scatter_disabler_emitter"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 18000, MAT_GOLD = 18000, MAT_DIAMOND = 8600, MAT_URANIUM = 15000)
	build_path = /obj/item/prefabs/complex/ebarrel/stun/disabler/scatter
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_scatter_emitter_plasma
	name = "Scatter Plasma Emitter"
	desc = "Energy Emitter"
	id = "ew_scatter_plasma_emitter"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 38000, MAT_GOLD = 38000, MAT_DIAMOND = 17200, MAT_URANIUM = 30000)
	build_path = /obj/item/prefabs/complex/ebarrel/plasma/scatter
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_weak_plasma
	name = "Weak Plasma Emitter"
	desc = "Energy Emitter"
	id = "ew_weak_plasma"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 16000, MAT_GOLD = 16000, MAT_DIAMOND = 6000, MAT_URANIUM = 12000)
	build_path = /obj/item/prefabs/complex/ebarrel/plasma/weak
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_plasma
	name = "Plasma Emitter"
	desc = "Energy Emitter"
	id = "ew_plasma"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 24000, MAT_GOLD = 24000, MAT_DIAMOND = 12000, MAT_URANIUM = 32500)
	build_path = /obj/item/prefabs/complex/ebarrel/plasma/avg
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ion_beam
	name = "Ion Emitter"
	desc = "Ion particles emitter"
	id = "ion_beam"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 25000, MAT_GOLD = 25000, MAT_DIAMOND = 10000, MAT_URANIUM = 45000)
	build_path = /obj/item/prefabs/complex/ebarrel/ion
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ion_beam_mk2
	name = "Advanced Ion Emitter"
	desc = "More advanced and efficient ion particles emitter"
	id = "ion_beam_mk2"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 30000, MAT_GOLD = 40000, MAT_DIAMOND = 18000, MAT_URANIUM = 60500)
	build_path = /obj/item/prefabs/complex/ebarrel/ion/strong
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_stream
	name = "Single Stream"
	desc = "Energy Stream Adapter"
	id = "ew_stream"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 12000, MAT_GOLD = 12000, MAT_DIAMOND = 6000, MAT_URANIUM = 7500)
	build_path = /obj/item/prefabs/complex/eburst/simple
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_stream_dual
	name = "Dual Stream"
	desc = "Energy Stream Adapter"
	id = "ew_stream_dual"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 8000, MAT_GOLD = 8400, MAT_DIAMOND = 8000, MAT_URANIUM = 12500)
	build_path = /obj/item/prefabs/complex/eburst/dual
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_stream_fast
	name = "Fast Dual Stream"
	desc = "Energy Stream Adapter"
	id = "ew_stream_fast"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 18000, MAT_GOLD = 18400, MAT_DIAMOND = 8500, MAT_URANIUM = 9000)
	build_path = /obj/item/prefabs/complex/eburst/fast
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_stream_triple
	name = "Triple Stream"
	desc = "Energy Stream Adapter"
	id = "ew_stream_triple"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 16000, MAT_GOLD = 16400, MAT_DIAMOND = 15500, MAT_URANIUM = 18500)
	build_path = /obj/item/prefabs/complex/eburst/triple
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_adapter_EC
	name = "EC Adapter"
	desc = "Power Source Adapater"
	id = "EC_ew_adapter"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 4500, MAT_GOLD = 15500, MAT_DIAMOND = 16000, MAT_URANIUM = 8000)
	build_path = /obj/item/prefabs/complex/ecell/ec
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_adapter_MFC
	name = "MFC Adapter"
	desc = "Power Source Adapater"
	id = "MFC_ew_adapter"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 8500, MAT_GOLD = 6500, MAT_DIAMOND = 6500, MAT_URANIUM = 4000)
	build_path =/obj/item/prefabs/complex/ecell/mfc
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_adapter_ECP
	name = "ECP Adapter"
	desc = "Power Source Adapater"
	id = "ECP_ew_adapter"
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 12500, MAT_GOLD = 16500, MAT_DIAMOND = 16000, MAT_URANIUM = 8000)
	build_path = /obj/item/prefabs/complex/ecell/ecp
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_frame
	name = "Weapon Frame"
	desc = "An unfinished energy gun."
	id = "ew_frame"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 14500, MAT_METAL = 14500)
	build_path = /obj/item/prefabs/complex/energy/frame
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_frame_pistol
	name = "Energy Pistol Frame"
	desc = "An unfinished energy gun."
	id = "ew_frame_pistol"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 18500, MAT_METAL = 18500, MAT_TITANIUM=10000)
	build_path = /obj/item/prefabs/complex/energy/frame/pistol
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ew_frame_pistol_hq
	name = "Advanced Pistol Frame"
	desc = "An unfinished energy gun."
	id = "ew_frame_pistol_hq"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 18500, MAT_METAL = 16500, MAT_TITANIUM=10000)
	build_path = /obj/item/prefabs/complex/energy/frame/hqpistol
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	
/datum/design/ew_frame_rifle
	name = "Energy Rifle Frame"
	desc = "An unfinished energy gun."
	id = "ew_frame_rifle"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 16500, MAT_METAL = 28500, MAT_TITANIUM=24000)
	build_path = /obj/item/prefabs/complex/energy/frame/rifle
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ew_frame_hqrifle
	name = "Advanced Energy Rifle Frame"
	desc = "An unfinished energy gun."
	id = "ew_frame_hqrifle"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 24500, MAT_GOLD=24500, MAT_DIAMOND=8000, MAT_METAL = 12500, MAT_TITANIUM=28000)
	build_path = /obj/item/prefabs/complex/energy/frame/hqrifle
	category = list("Weapon Parts")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/pin_auth
	name = "Weapon Authorization Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are weapon authed-implanted."
	id = "pin_auth"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 600, MAT_DIAMOND = 600, MAT_URANIUM = 200)
	build_path = /obj/item/firing_pin/implant/pindicate
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ar
	name = "Advanced Assault Rifle"
	desc = "A seemingly advanced 5.56mm assault rifle."
	id = "ar"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000)
	build_path = /obj/item/gun/ballistic/automatic/ar
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun
	name = "Advanced Shotgun"
	desc = "An advanced semi auto shotgun that takes specialized magazines."
	id = "shotgun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000)
	build_path = /obj/item/gun/ballistic/automatic/shotgun/bulldog
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smg
	name = "Advanced Small Machine Gun"
	desc = "A seemingly advanced SMG, uses special ammo and can be suppressed."
	id = "smg"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000)
	build_path = /obj/item/gun/ballistic/automatic/c20r //NO STAM DAMAGE
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/stunrevolver
	name = "Tesla Revolver"
	desc = "A high-tech revolver that fires internal, reusable shock cartridges in a revolving cylinder. The cartridges can be recharged using conventional rechargers."
	id = "stunrevolver"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 10000, MAT_SILVER = 10000, MAT_URANIUM = 5000)
	build_path = /obj/item/gun/energy/tesla_revolver
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/stunrifle
	name = "Tesla Rifle"
	desc = "A high-tech revolver that fires internal, reusable shock cartridges in a revolving cylinder. The cartridges can be recharged using conventional rechargers."
	id = "stunrifle"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 20000, MAT_GLASS = 20000, MAT_SILVER = 15000, MAT_URANIUM = 15000, MAT_DIAMOND=7000)
	build_path = /obj/item/gun/energy/tesla_rifle
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

// /datum/design/stuncannon
// 	name = "Tesla Cannon"
// 	desc = "A high-tech revolver that fires internal, reusable shock cartridges in a revolving cylinder. The cartridges can be recharged using conventional rechargers."
// 	id = "stuncannon"
// 	build_type = PROTOLATHE
// 	materials = list(MAT_METAL = 30000, MAT_GLASS = 30000, MAT_SILVER = 25000, MAT_URANIUM = 15000, MAT_DIAMOND=15000)
// 	build_path = /obj/item/gun/energy/tesla_cannon
// 	category = list("Weapons")
// 	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/*
/datum/design/nuclear_gun
	name = "Advanced Energy Gun"
	desc = "An energy gun with an experimental miniaturized reactor."
	id = "nuclear_gun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000, MAT_URANIUM = 3000, MAT_TITANIUM = 1000)
	build_path = /obj/item/gun/energy/e_gun/nuclear
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/
/datum/design/tele_shield
	name = "Telescopic Riot Shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	id = "tele_shield"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000, MAT_GLASS = 4000, MAT_SILVER = 300, MAT_TITANIUM = 200)
	build_path = /obj/item/shield/riot/tele
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
/*
/datum/design/beamrifle
	name = "Beam Marksman Rifle"
	desc = "A powerful long ranged anti-material rifle that fires charged particle beams to obliterate targets."
	id = "beamrifle"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/beam_rifle
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/
/datum/design/decloner
	name = "Direct Application Device"
	desc = "A device that makes use of the Forced Evolutionary virus with each shot."
	id = "decloner"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000,MAT_GLASS = 5000,MAT_GOLD = 5000,MAT_PLASMA = 500,MAT_URANIUM = 10000)
	reagents_list = list("FEV_solution" = 60)
	build_path = /obj/item/gun/energy/decloner
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/rapidsyringe
	name = "Rapid Syringe Gun"
	desc = "A gun that fires many syringes."
	id = "rapidsyringe"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 1000)
	build_path = /obj/item/gun/syringe/rapidsyringe
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL		//uwu

/datum/design/temp_gun
	name = "Temperature Gun"
	desc = "A gun that shoots temperature bullet energythings to change temperature."//Change it if you want
	id = "temp_gun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 500, MAT_SILVER = 3000)
	build_path = /obj/item/gun/energy/temperature
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/flora_gun
	name = "Floral Somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells. Harmless to other organic life."
	id = "flora_gun"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_GLASS = 500)
	reagents_list = list("radium" = 20)
	build_path = /obj/item/gun/energy/floragun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/large_grenade
	name = "Large Grenade"
	desc = "A grenade that affects a larger area and use larger containers."
	id = "large_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/pyro_grenade
	name = "Pyro Grenade"
	desc = "An advanced grenade that is able to self ignite its mixture."
	id = "pyro_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_PLASMA = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cryo_grenade
	name = "Cryo Grenade"
	desc = "An advanced grenade that rapidly cools its contents upon detonation."
	id = "cryo_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/adv_grenade
	name = "Advanced Release Grenade"
	desc = "An advanced grenade that can be detonated several times, best used with a repeating igniter."
	id = "adv_Grenade"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 3000, MAT_GLASS = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/laserpistol
	name = "AEP7 Laser Pistol"
	desc = "A laser pistol."
	id = "laserpistol"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 2000, MAT_URANIUM = 1000, MAT_METAL = 2000, MAT_TITANIUM = 500)
	build_path = /obj/item/gun/energy/laser/pistol
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/wattz
	name = "Wattz 1000 Laser Pistol"
	desc = "A laser pistol."
	id = "wattzlaserpistol"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 2500, MAT_URANIUM = 2000, MAT_METAL = 2500, MAT_TITANIUM = 1000)
	build_path = /obj/item/gun/energy/laser/wattz
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/laserrifle
	name = "AER9 Laser Rifle"
	desc = "An AER9 laser rifle."
	id = "laserrifle"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 5000, MAT_URANIUM = 4000, MAT_METAL = 5000, MAT_TITANIUM = 2000)
	build_path = /obj/item/gun/energy/laser/aer9
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/*
/datum/design/xray
	name = "Xray Laser Gun"
	desc = "Not quite as menacing as it sounds"
	id = "xray_laser"
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 5000, MAT_URANIUM = 4000, MAT_METAL = 5000, MAT_TITANIUM = 2000, MAT_BLUESPACE = 2000)
	build_path = /obj/item/gun/energy/xray
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/

/*
/datum/design/ioncarbine
	name = "Ion Carbine"
	desc = "How to dismantle a cyborg : The gun."
	id = "ioncarbine"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 6000, MAT_METAL = 8000, MAT_URANIUM = 2000)
	build_path = /obj/item/gun/energy/ionrifle/carbine
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/
/*
/datum/design/wormhole_projector
	name = "Bluespace Wormhole Projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams."
	id = "wormholeprojector"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 2000, MAT_METAL = 5000, MAT_DIAMOND = 2000, MAT_BLUESPACE = 3000)
	build_path = /obj/item/gun/energy/wormhole_projector
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
*/

//Laser and energy gun ammo cells

/datum/design/mfc
	name = "Microfusion Cell"
	id = "mfc"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000)
	build_path =/obj/item/stock_parts/cell/ammo/mfc
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ec
	name = "Energy Cell"
	id = "ec"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 1000)
	build_path =/obj/item/stock_parts/cell/ammo/ec
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/ecp
	name = "Electron Charge Pack"
	id = "ecp"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000, MAT_DIAMOND = 2000)
	build_path = /obj/item/stock_parts/cell/ammo/ecp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//Weapon Mags

/datum/design/m12rubber
	name = "Advanced shotgun 8 round rubbershot magazine"
	desc = "A 8 round drum consisting of rubbershot shell for the advanced shotgun."
	id = "shotgunrubber"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m12beanbag
	name = "Advanced shotgun 8 round beanbag slug magazine"
	desc = "A 8 round drum consisting of beanbag slug rounds for the advanced shotgun."
	id = "shotgunbean"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g/beanslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m12buckshot
	name = "Advanced shotgun 8 round buckshot magazine"
	desc = "A 8 round drum consisting of buckshot rounds for the advanced shotgun."
	id = "shotgunbuck"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m12beanslug
	name = "Advanced shotgun 8 round slug magazine"
	desc = "A 8 round drum consisting of regular slug rounds for the advanced shotgun."
	id = "shotgunslug"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 15000)
	build_path = /obj/item/ammo_box/magazine/m12g/slug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smgmag
	name = "Advanced SMG Magazine"
	desc = "A 24 round magazine for the advanced SMG"
	id = "smgmag"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000)
	build_path = /obj/item/ammo_box/magazine/smgm45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/armag
	name = "Advanced Assault Rifle Magazine"
	desc = "A 30 round toploader magazine for the advanced AR."
	id = "armag"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000)
	build_path = /obj/item/ammo_box/magazine/m556
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
/*
/datum/design/mag_oldsmg/ap_mag
	name = "WT-550 Auto Gun Armour Piercing Magazine (4.6x30mm AP)"
	desc = "A 20 round armour piercing magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg_ap"
	materials = list(MAT_METAL = 6000, MAT_SILVER = 600)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtap
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mag_oldsmg/ic_mag
	name = "WT-550 Auto Gun Incendiary Magazine (4.6x30mm IC)"
	desc = "A 20 round armour piercing magazine for the out of date security WT-550 Auto Rifle"
	id = "mag_oldsmg_ic"
	materials = list(MAT_METAL = 6000, MAT_SILVER = 600, MAT_GLASS = 1000)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtic
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 200)
	build_path = /obj/item/ammo_casing/shotgun/stunslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/techshell
	name = "Unloaded Technological Shotshell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshotshell"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 1000, MAT_GLASS = 200)
	build_path = /obj/item/ammo_casing/shotgun/techshell
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE
*/
/datum/design/suppressor
	name = "Universal Suppressor"
	desc = "A reverse-engineered universal suppressor that fits on most small arms with threaded barrels."
	id = "suppressor"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bulletarmor
	name = "Bulletproof Vest"
	desc = "A nice bulletproof vest."
	id = "bulletarmor"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/clothing/suit/armor/bulletproof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bullethelmet
	name = "Bulletproof Helmet"
	desc = "A nice bulletproof helmet."
	id = "bullethelmet"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_SILVER = 500)
	build_path = /obj/item/clothing/head/helmet/alt
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/gravitygun
	name = "One-point Gravitational Manipulator"
	desc = "A multi-mode device that blasts one-point gravitational bolts that locally distort gravity."
	id = "gravitygun"
	build_type = PROTOLATHE
	materials = list(MAT_SILVER = 8000, MAT_URANIUM = 8000, MAT_GLASS = 12000, MAT_METAL = 12000, MAT_DIAMOND = 4000)
	build_path = /obj/item/gun/energy/gravity_gun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
/*
/datum/design/largecrossbow
	name = "Energy Crossbow"
	desc = "A reverse-engineered energy crossbow favored by syndicate infiltration teams and carp hunters."
	id = "largecrossbow"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 5000, MAT_GLASS = 1500, MAT_URANIUM = 1500, MAT_SILVER = 1500)
	build_path = /obj/item/gun/energy/kinetic_accelerator/crossbow/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cryostatis_shotgun_dart
	name = "Cryostatis Shotgun Dart"
	desc = "A shotgun dart designed with similar internals to that of a cryostatis beaker, allowing reagents to not react when inside."
	id = "shotgundartcryostatis"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 3500)
	build_path = /obj/item/ammo_casing/shotgun/dart/noreact
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
*/

/obj/item/components
	name = "crafting items"
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "blueprint_empty"
	w_class = WEIGHT_CLASS_TINY

/obj/item/blueprint
	name = "crafting blueprint"
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "blueprint_empty"
	w_class = WEIGHT_CLASS_TINY

/obj/item/prefabs
	name = "crafting prefabs"
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "blueprint_empty"
	w_class = WEIGHT_CLASS_TINY
	var/list/tags = list()
	var/list/incompatible_tags = list()
	var/complexity = 10
	var/part_type = "generic" //These are for ensuring you can always swap out similar parts even if item paths differ, mostly fixing barrels
	var/mag_type
	var/enables_automatic = FALSE
	var/burst_mod = 0
	var/dam_mod = 0
	var/canpulloutmag = TRUE
	var/armorpen_mod = 0
	var/recoil_mod = 0
	var/spread_mod = 0
	var/burst_delay_mod = 0
	var/bullet_speed_mod = 0
	var/force_mod = 0
	var/fire_delay_mod = 0
	var/gun_weight_class = WEIGHT_CLASS_TINY //bulky, tiny, small. uses the highest weighted part
	var/caliber_name = ""
	var/frame_type = "pistol"
	var/scope = FALSE

	//energy weapons
	var/energyAmmoType = null
	var/energyProjType = null

/obj/item/prefabs/examine(mob/user)
	. = ..()
	if(!complexity)
		to_chat(user, "<span>This is a basic part.</span>")
	else
		to_chat(user, "<span>Part complexity: [complexity].</span>")

/obj/item/stack/prefabs
    name = "crafting prefabs"
    icon = 'icons/fallout/objects/crafting.dmi'
    icon_state = "blueprint_empty"
    w_class = WEIGHT_CLASS_TINY

//misc blueprints
/obj/item/blueprint/misc
    name = "weapon blueprint"
    desc = "A crafting blueprint for a weapon design."
    icon_state = "blueprint2"

/obj/item/blueprint/misc/stim
    name = "Stimpack blueprint"
    desc = "Stimpacks"

/obj/item/blueprint/misc/superstims
    name = "Super Stimpack blueprint"
    desc = "Super stims"

//weapon blueprints
/obj/item/blueprint/weapon
    name = "weapon blueprint"
    desc = "A crafting blueprint for a weapon design."
    icon_state = "blueprint1"

//low tier

/obj/item/blueprint/weapon/AEP7
	name = "AEP7 blueprint"

/obj/item/blueprint/weapon/trail_carbine
	name = "Trail Carbine blueprint"

/obj/item/blueprint/weapon/lever_action
	name = "Lever Action shotgun blueprint"

/obj/item/blueprint/weapon/kar98
	name = "Ancient rifle blueprint"

/obj/item/blueprint/weapon/kar98/limited
	name = "Damaged ancient rifle blueprint"

//mid tier
/obj/item/blueprint/weapon/thatgun
	name = ".223 pistol blueprint"

/obj/item/blueprint/weapon/thatgun/limited
	name = "Damaged .223 pistol blueprint"

/obj/item/blueprint/weapon/pps
	name = "Ancient SMG blueprint"

/obj/item/blueprint/weapon/pps/limited
	name = "Damaged ancient SMG blueprint"

/obj/item/blueprint/weapon/mg34
	name = "Ancient machine gun blueprint"

/obj/item/blueprint/weapon/mg34/limited
	name = "Damaged ancient machine gun blueprint"

/obj/item/blueprint/weapon/marksmanrifle
	name = "Marksman Rifle blueprint"

/obj/item/blueprint/weapon/marksmanrifle/limited
	name = "Damaged Marksman Rifle blueprint"

/obj/item/blueprint/weapon/plasmapistol
	name = "Plasma Pistol blueprint"

/obj/item/blueprint/weapon/plasmapistol/limited
	name = "Damaged Plasma Pistol blueprint"

/obj/item/blueprint/weapon/uzi
	name = "UZI blueprint"

/obj/item/blueprint/weapon/uzi/limited
	name = "Damaged UZI blueprint"

/obj/item/blueprint/weapon/smg10mm
	name = "10mm SMG blueprint"

/obj/item/blueprint/weapon/smg10mm/limited
	name = "Damaged 10mm SMG blueprint"

/obj/item/blueprint/weapon/brush
	name = "Brush Gun blueprint"

/obj/item/blueprint/weapon/brush/limited
	name = "Damaged Brush Gun blueprint"

/obj/item/blueprint/weapon/grease_gun
 	name = "Grease Gun blueprint"

/obj/item/blueprint/weapon/grease_gun/limited
 	name = "Damaged Grease Gun blueprint"

//high tier
/obj/item/blueprint/weapon/R82
	name = "R82 heavy service rifle blueprint"

/obj/item/blueprint/weapon/R82/limited
	name = "Damaged R82 heavy service rifle blueprint"

/obj/item/blueprint/weapon/deagle
	name = "Desert Eagle blueprint"

/obj/item/blueprint/weapon/deagle/limited
	name = "Damaged Desert Eagle blueprint"

/obj/item/blueprint/weapon/R91
	name = "R91 Assault rifle blueprint"

/obj/item/blueprint/weapon/R91/limited
	name = "Damaged R91 Assault rifle blueprint"

/obj/item/blueprint/weapon/sniper
	name = "Sniper Rifle blueprint"

/obj/item/blueprint/weapon/sniper/limited
	name = "Damaged Sniper Rifle blueprint"

/obj/item/blueprint/weapon/breacher
	name = "Breacher Shotgun blueprint"

/obj/item/blueprint/weapon/breacher/limited
	name = "Damaged Breacher Shotgun blueprint"

/obj/item/blueprint/weapon/lmg
	name = "LMG blueprint"

/obj/item/blueprint/weapon/lmg/limited
	name = "Damaged LMG blueprint"

//very high tier
/obj/item/blueprint/weapon/plasmarifle
	name = "Plasma Rifle blueprint"

/obj/item/blueprint/weapon/plasmarifle/limited
	name = "Damaged Plasma Rifle blueprint"

/obj/item/blueprint/weapon/AER9
	name = "AER9 blueprint"

/obj/item/blueprint/weapon/AER9/limited
	name = "Damaged AER9 blueprint"

/obj/item/blueprint/weapon/AM_rifle
	name = "AM Rifle blueprint"

/obj/item/blueprint/weapon/AM_rifle/limited
	name = "Damaged AM Rifle blueprint"

/obj/item/blueprint/weapon/city_killer
	name = "City Killer shotgun blueprint"

/obj/item/blueprint/weapon/city_killer/limited
	name = "Damaged City Killer shotgun blueprint"

/obj/item/blueprint/weapon/rangemaster
	name = "Colt Rangemaster blueprint"

/obj/item/blueprint/weapon/rangemaster/limited
	name = "Damaged Colt Rangemaster blueprint"

/obj/item/blueprint/weapon/bozar
	name = "Bozar blueprint"

/obj/item/blueprint/weapon/bozar/limited
	name = "Damaged bozar blueprint"
//armor blueprints
/obj/item/blueprint/armor
    name = "armor blueprint"
    icon_state = "blueprint4"

/obj/item/blueprint/armor/combat
    name = "combat armor blueprint"

/obj/item/blueprint/armor/reinforced
    name = "reinforced armor blueprint"

/obj/item/advanced_crafting_components
    name = "crafting blueprint"
    icon = 'icons/fallout/objects/crafting.dmi'
    icon_state = "blueprint_empty"
    w_class = WEIGHT_CLASS_TINY
    var/complexity = 0

/obj/item/advanced_crafting_components/examine(mob/user)
	. = ..()
	if(complexity)
		to_chat(user, "<span>Part complexity: [complexity]</span>")
	else
		to_chat(user, "<span>This is a basic part.</span>")

/obj/item/prefabs/complex/screw
	name = "Screw"
	desc = ""
	icon_state = "screw"
	complexity = 10
	part_type = "screw"

/obj/item/prefabs/complex/gunframe
	name = "frame"
	part_type = "frame"
	icon_state = "rifleframe"
	var/gun_type = ""
	var/needs_stock = FALSE

/obj/item/prefabs/complex/loot
	name = "Ruined Pre-War Assembly"
	desc = "You might be able to salvage this using an advanced workbench, a gunsmith might get better results..."
	icon_state = "advancedframe"

/obj/item/prefabs/complex/loot/energy
	name = "Ruined Pre-War Energy Assembly"

//general ballistics
/obj/item/advanced_crafting_components/receiver
	name = "Advanced modular receiver"
	desc = "A ballistic weapon part, a craftsman might want to have this."
	icon_state = "receiver"

//general
/obj/item/advanced_crafting_components/alloys
	name = "Light alloys"
	desc = "A general crafting part, a craftsman might want to have this."
	icon_state = "alloys"
	complexity = 30
	var/slowdown_multiply = 0.5


/obj/item/advanced_crafting_components/alloys/advanced
	name = "Superlight alloys"
	icon_state = "alloys_super"
	complexity = 40
	slowdown_multiply = 0.2
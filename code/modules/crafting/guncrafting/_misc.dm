// FOR DEBUG PURPOSES //

/obj/item/storage/box/projectile_components
	name = "Projectile componetns"
	desc = "Shitspawn!! REEEEEEE!!"
	icon_state = "syndiebox"

/obj/item/storage/box/projectile_components/Initialize(mapload)
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.display_numerical_stacking = TRUE
	STR.click_gather = TRUE
	STR.max_items = 1000
	STR.max_w_class = WEIGHT_CLASS_GIGANTIC

/obj/item/storage/box/projectile_components/PopulateContents()
	..() 
	for(var/P in subtypesof(/obj/item/prefabs/complex/action) - /obj/item/prefabs/complex/action)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/barrel) - /obj/item/prefabs/complex/barrel)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/bolt) - /obj/item/prefabs/complex/bolt)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/WeaponFrame))
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/ammo_loader) - /obj/item/prefabs/complex/ammo_loader)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/stock) - /obj/item/prefabs/complex/stock)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/trigger))
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	var/P = /obj/item/prefabs/complex/screw
	for(var/i in 1 to 10)
		var/obj/item/prefabs/complex/PR = P
		new PR(src)

/obj/item/storage/box/projectile_components/advanced/PopulateContents()
	for(var/P in subtypesof(/obj/item/advanced_crafting_components) - /obj/item/advanced_crafting_components/capacitor)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)


/obj/item/storage/box/projectile_components/energy/PopulateContents() 
	for(var/P in subtypesof(/obj/item/prefabs/complex/energy/frame) - /obj/item/prefabs/complex/energy/frame)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/ebarrel) - /obj/item/prefabs/complex/ebarrel/laser - /obj/item/prefabs/complex/ebarrel/stun  - /obj/item/prefabs/complex/ebarrel - /obj/item/prefabs/complex/ebarrel/plasma)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/eburst) - /obj/item/prefabs/complex/eburst)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	for(var/P in subtypesof(/obj/item/prefabs/complex/ecell) - /obj/item/prefabs/complex/ecell)
		for(var/i in 1 to 10)
			var/obj/item/prefabs/complex/PR = P
			new PR(src)
	
/obj/item/prefabs/complex/WeaponFrame
	name = "Weapon Frame"
	desc = "An unfinished gun."
	icon_state = "gunframe"

	var/max_complexity = 100
	complexity = 0

	var/destroy_chance =  15
	var/needs_stock = FALSE
	var/quality = 0

	var/obj/item/prefabs/action = null
	var/obj/item/prefabs/barrel = null
	var/obj/item/prefabs/trigger = null
	var/obj/item/prefabs/bolt = null
	var/obj/item/prefabs/screw = null
	var/obj/item/prefabs/receiver = null
	var/obj/item/prefabs/alloys = null
	var/obj/item/prefabs/assembly = null
	var/obj/item/prefabs/stock = null
	var/obj/item/prefabs/ammo_loader = null


/obj/item/prefabs/complex/WeaponFrame/examine(mob/user)
	..()

	if(action)
		to_chat(user,"<span class='notice'>It's got [action] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no action mechanism installed!</span>")
	if(barrel)
		to_chat(user,"<span class='notice'>It's got [barrel] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no barrel!</span>")
	if(trigger)
		to_chat(user,"<span class='notice'>It's got [trigger] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no trigger!</span>")
	if(bolt)
		to_chat(user,"<span class='notice'>It's got [bolt] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no bolt!</span>")
	if(screw)
		to_chat(user,"<span class='notice'>It's got [screw] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no screw!</span>")
	if(receiver)
		to_chat(user,"<span class='notice'>It's got [receiver] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no receiver!</span>")
	if(ammo_loader)
		to_chat(user,"<span class='notice'>It's got [ammo_loader] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no ammo loader!</span>")
	if(stock)
		to_chat(user,"<span class='notice'>It's got [stock] installed.</span>")
	else
		if(needs_stock)
			to_chat(user,"<span class='warning'>There is no stock installed!</span>")
		else
			to_chat(user,"<span class='notice'>There is no stock, but it will work without one.</span>")
	if(alloys)
		to_chat(user,"<span class='notice'>It's got [alloys] installed.</span>")
	else
		to_chat(user,"<span class='notice'>There is no outer frame installed, but it will work without one.</span>")

	if(assembly)
		to_chat(user,"<span class='notice'>It's got [assembly] installed.</span>")
	else
		to_chat(user,"<span class='warning'>There is no gun assembly installed! Activate the assembly in-hand to shape it.</span>")

	to_chat(user,"<span class='notice'>The frame's complexity is [complexity]/[max_complexity].</span>")

/obj/item/prefabs/complex/WeaponFrame/attackby(obj/item/W, mob/user, params)
	var/mob/living/M = user
	var/obj/item/dropitem = null

	if(istype(W,/obj/item/prefabs/complex/WeaponFrame))
		return

	if(istype(W,/obj/item/wrench))
		finish_gun(user)

	if(istype(W,/obj/item/screwdriver))
		if(!LAZYLEN(src.contents))
			to_chat(M,"\The [src] does not contain anything.")
			return 0
		
		for(var/obj/item/advanced_crafting_components/A in src.contents)
			receiver = null
			alloys = null
			assembly = null
			to_chat(M,"You remove \the [A] from \the [src].")
			A.forceMove(get_turf(src))

		for(var/obj/item/prefabs/P in src.contents)
			action = null
			barrel = null
			trigger = null
			bolt = null
			screw = null
			ammo_loader = null
			stock = null

			//temp disabled
			//if(!M.has_trait(TRAIT_MASTER_GUNSMITH) && prob(destroy_chance))
			//	to_chat(M,"<span_class='warning'>[P] is ruined when you remove it!</span>")
			//	P.forceMove(get_turf(src))
			//	qdel(P)
			//	continue
			to_chat(M,"You remove \the [P] from \the [src].")
			P.forceMove(get_turf(src))

		enables_automatic = 0
		complexity = 0
		playsound(loc, 'sound/items/screwdriver.ogg', 50, 1)
		return 0

	if(istype(W,/obj/item/prefabs))
		var/obj/item/prefabs/I = W
		if(complexity + I.complexity > max_complexity)
			to_chat(usr,"<span class='warning'>[I] cannot fit on that frame! The system is too complicated and needs simpler parts.</span>")
			return

		for(var/obj/item/prefabs/P in src.contents)
			if(I.part_type == P.part_type) //Always able to swap out barrel with barrel, etc
				continue

			for(var/tag in I.tags)
				if(tag in P.incompatible_tags)//Something already in it is incompatible
					to_chat(usr,"<span class='warning'>[I] cannot fit on that frame! \The [P] makes it incompatible.</span>")
					return
				for(var/inner_tag in P.tags) //This part we're holding is incompatible with something already in it. Hello recursion my old friend
					if(inner_tag in I.incompatible_tags)
						to_chat(usr,"<span class='warning'>[I] cannot fit on that frame! It's incompatible with \the [P].</span>")
						return

		complexity += I.complexity
		if(I.enables_automatic)
			enables_automatic = TRUE
	if(istype(W,/obj/item/prefabs/complex/action))//automatic/burst/etc, lower damage for burst
		dropitem = action
		if(action)
			to_chat(usr,"<span_class='notice'>You swap out \the [action].</span>")
			action = null
		action = W
	else if(istype(W,/obj/item/prefabs/complex/barrel))//bullet speed
		dropitem = barrel
		if(barrel)
			to_chat(usr,"<span_class='notice'>You swap out \the [barrel].</span>")
			barrel = null
		barrel = W
	else if(istype(W,/obj/item/prefabs/complex/trigger))//fire delay, burst delay, more spread for better
		dropitem = trigger
		if(trigger)
			to_chat(usr,"<span_class='notice'>You swap out \the [trigger].</span>")
			trigger = null
		trigger = W
	else if(istype(W,/obj/item/prefabs/complex/bolt))//damage, armorpen mod
		dropitem = bolt
		if(bolt)
			to_chat(usr,"<span_class='notice'>You swap out \the [bolt].</span>")
			bolt = null
		bolt = W
	else if(istype(W,/obj/item/prefabs/complex/screw))//spread
		dropitem = screw
		if(screw)
			to_chat(usr,"<span_class='notice'>You swap out \the [screw].</span>")
			screw = null
		screw = W
	else if(istype(W,/obj/item/advanced_crafting_components/receiver))//req
		dropitem = receiver
		if(receiver)
			to_chat(usr,"<span_class='notice'>You swap out \the [receiver].</span>")
			receiver = null
		receiver = W
	else if(istype(W,/obj/item/advanced_crafting_components/alloys))//extra random stats if present
		dropitem = alloys
		if(alloys)
			to_chat(usr,"<span_class='notice'>You swap out \the [alloys].</span>")
			alloys = null
		alloys = W
	else if(istype(W,/obj/item/prefabs/complex/ammo_loader))//ammo type
		dropitem = ammo_loader
		if(ammo_loader)
			to_chat(usr,"<span_class='notice'>You swap out \the [ammo_loader].</span>")
			ammo_loader = null
		ammo_loader = W
	else if(istype(W,/obj/item/prefabs/complex/gunframe))
		var/obj/item/prefabs/complex/gunframe/G = W
		dropitem = assembly
		if(assembly)
			to_chat(usr,"<span_class='notice'>You swap out \the [assembly].</span>")
			assembly = null
		assembly = W
		icon_state = assembly.icon_state
		src.name = "[G.gun_type] frame"
		needs_stock = G.needs_stock
	else if(istype(W,/obj/item/prefabs/complex/stock))//spread reduction
		dropitem = stock
		if(stock)
			to_chat(usr,"<span_class='notice'>You swap out \the [stock].</span>")
			stock = null
		stock = W
	else
		return ..()

	if(dropitem)
		dropitem.forceMove(get_turf(src))

	playsound(get_turf(src), 'sound/items/screwdriver.ogg', 50, 1)
	user.transferItemToLoc(W,src)

/obj/item/prefabs/complex/WeaponFrame/proc/finish_gun(mob/user)
	var/mob/living/M = user

	if(!action || !barrel || !trigger || !bolt || !screw || !receiver || !assembly || (!stock && needs_stock))
		if(user)
			to_chat(user,"<span_class='notice'>It's missing a part! Examine it for more details.</span>")
		return 0

	var/gun_path
	var/gun_icon
	var/prefix = ""
	var/quality = ""
	var/obj/item/gun/G

	switch(assembly.frame_type)
		if("pistol")
			switch(ammo_loader.caliber_name)
				if("10mm")
					gun_path = /obj/item/gun/ballistic/automatic/pistol/n99
				if("9mm")
					if(complexity > 100)
						gun_path = /obj/item/gun/ballistic/automatic/pistol/beretta
					else
						gun_path = /obj/item/gun/ballistic/automatic/pistol/ninemil
				if("5.56")
					gun_path = /obj/item/gun/ballistic/revolver/thatgun
				if("7.62")
					gun_path = /obj/item/gun/ballistic/automatic/pistol/APS
				if(".45-70")
					if(complexity > 100)
						gun_path = /obj/item/gun/ballistic/automatic/pistol/ninemil/maria
					else
						gun_path = /obj/item/gun/ballistic/automatic/pistol/m1911
				if(".50")
					if(complexity > 100)
						gun_path = /obj/item/gun/ballistic/automatic/pistol/deagle
					else
						gun_path = /obj/item/gun/ballistic/automatic/pistol/m1911
				else
					gun_path = /obj/item/gun/ballistic/automatic/pistol/m1911
		if("rifle")
			switch(ammo_loader.caliber_name)
				if("9mm")
					if(complexity < 50)
						gun_path = /obj/item/gun/ballistic/automatic/autopipe
					else
						gun_path = /obj/item/gun/ballistic/automatic/m1carbine
				if("5.56")
					if(complexity < 50)
						gun_path = /obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint
					else if(complexity < 125)
						gun_path = /obj/item/gun/ballistic/automatic/marksman/servicerifle
					else if(complexity < 150)
						gun_path = /obj/item/gun/ballistic/automatic/assault_rifle
					else if(complexity < 200)
						gun_path = /obj/item/gun/ballistic/automatic/assault_carbine
					else if(complexity < 250)
						gun_path = /obj/item/gun/ballistic/automatic/marksman/servicerifle/r82
					else
						gun_path = /obj/item/gun/ballistic/automatic/type93
				if("7.62")
					if(enables_automatic)
						gun_path = /obj/item/gun/ballistic/automatic/rangemaster
					else
						gun_path = /obj/item/gun/ballistic/automatic/surplus
				else
					gun_path = /obj/item/gun/ballistic/automatic/marksman/servicerifle

		if("shotgun")
			gun_path = /obj/item/gun/ballistic/shotgun/automatic
			if(complexity < 50)
				gun_path = /obj/item/gun/ballistic/revolver/single_shotgun
			else if(complexity < 75)
				gun_path = /obj/item/gun/ballistic/revolver/caravan_shotgun
			else if(complexity < 100)
				gun_path = /obj/item/gun/ballistic/shotgun/hunting
			else if(complexity < 125)
				gun_path = /obj/item/gun/ballistic/shotgun/trench
			else if(complexity < 200)
				gun_path = /obj/item/gun/ballistic/automatic/shotgun/riot
			else
				gun_path = /obj/item/gun/ballistic/automatic/shotgun/bulldog
		if("revolver")
			switch(ammo_loader.caliber_name)
				if("10mm")
					gun_path = /obj/item/gun/ballistic/revolver/colt6250
				if("9mm")
					gun_path = /obj/item/gun/ballistic/revolver/zipgun
				if(".357")
					gun_path = /obj/item/gun/ballistic/revolver/colt357
				if(".44")
					gun_path = /obj/item/gun/ballistic/revolver/m29
				if(".45")
					gun_path = /obj/item/gun/ballistic/revolver/m29/alt
				if(".45-70")
					gun_path = /obj/item/gun/ballistic/revolver/sequoia/scoped
					gun_icon = "hunting_revolverscopeless"
				if(".50")
					gun_path = /obj/item/gun/ballistic/revolver/mateba
				if("12g")
					gun_path = /obj/item/gun/ballistic/shotgun/hunting
					gun_icon = "hunting-sawn"
				else
					gun_path = /obj/item/gun/ballistic/revolver
					gun_icon = "detective_panther"
		if("smg")
			switch(ammo_loader.caliber_name)
				if("10mm")
					gun_path = /obj/item/gun/ballistic/automatic/smg10mm
				if("9mm")
					gun_path = /obj/item/gun/ballistic/automatic/mini_uzi
				if(".44")
					gun_path = /obj/item/gun/ballistic/automatic/greasegun
				if(".45")
					gun_path = /obj/item/gun/ballistic/automatic/tommygun
				if(".45-70")
					gun_path = /obj/item/gun/ballistic/automatic/m90
				else
					gun_path = /obj/item/gun/ballistic/automatic
					gun_icon = "smg10mm"

		if("lmg")
			if(complexity < 100)
				gun_path = /obj/item/gun/ballistic/automatic/lmg
				gun_icon = "R84"
			else
				gun_path = /obj/item/gun/ballistic/automatic/assault_rifle
				gun_icon = "fnfal"

		if("sniper")
			scope = TRUE
			switch(ammo_loader.caliber_name)
				if(".357")
					gun_path = /obj/item/gun/ballistic/shotgun/automatic/hunting/cowboy
				if(".44")
					gun_path = /obj/item/gun/ballistic/shotgun/automatic/hunting/trail
				if(".45")
					gun_path = /obj/item/gun/ballistic/automatic/marksman/sniper
				if(".45-70")
					gun_path = /obj/item/gun/ballistic/automatic/marksman/sniper/gold
				if("5.56")
					gun_path = /obj/item/gun/ballistic/automatic/marksman/servicerifle/varmint/ratslayer
				if("7.62")
					gun_path = /obj/item/gun/ballistic/automatic/rangemaster
				if(".50")
					gun_path = /obj/item/gun/ballistic/automatic/bozar
				else
					gun_path = /obj/item/gun/ballistic/shotgun/remington

	if(!ispath(gun_path)) //Something went fucky
		return 0

	G = new gun_path(get_turf(src))
	if(gun_icon)
		G.icon_state = gun_icon
		G.gun_icon_state = gun_icon
		G.item_state = gun_icon
		G.desc = ""

	//reset stats
	G.extra_damage = 0
	G.burst_size = 1				
	G.fire_delay = 6				
	G.burst_delay = 2				
	G.firing_burst = 0				
	G.semicd = 0					
	G.weapon_weight = WEAPON_LIGHT
	G.spread = 0					
	G.randomspread = 1				
	G.distro = 0					
	G.extra_damage = 0				
	G.extra_penetration = 0			
	G.projectile_speed = 0.4

	if(alloys)
		to_chat(user,"You use the alloys to improve the weapon.")
		G.extra_damage += pick(6,4,2)
		G.extra_penetration += pick(6,4,2)
	if(enables_automatic)
		G.automatic = 1

	if(M.has_trait(TRAIT_MASTER_GUNSMITH))
		to_chat(user,"Your skills come in handy while assembling the weapon")
		if(prob(7))
			G.extra_damage += 5
		if(prob(7))
			G.extra_penetration += 5
		if(prob(7))
			G.burst_size += 1
		if(prob(7))
			G.spread += -15
		// Too much hitscan guns
		// if(prob(7))
		//	G.projectile_speed += -0.2
		if(prob(7))
			G.fire_delay += -0.5

	for(var/obj/item/prefabs/C in src.contents)
		G.extra_damage += C.dam_mod//0
		G.burst_size += C.burst_mod//1
		G.customburst += C.burst_mod//1
		G.burst_delay += C.burst_delay_mod//2
		G.extra_penetration += C.armorpen_mod//0
		G.recoil += C.recoil_mod//0
		G.spread += C.spread_mod//0
		G.projectile_speed += C.bullet_speed_mod //Should be tiny increments, normally is 0.8
		G.fire_delay += C.fire_delay_mod
		if(G.w_class < C.gun_weight_class)
			G.w_class = C.gun_weight_class
		if(C.mag_type && istype(G,/obj/item/gun/ballistic))
			var/obj/item/gun/ballistic/B = G
			B.mag_type = C.mag_type
			B.pulloutmag = C.canpulloutmag
		else if(C.mag_type && istype(G,/obj/item/gun/energy))
			var/obj/item/gun/energy/E = G
			E.cell_type = C.mag_type
		G.force += C.force_mod

	if(complexity < 50)
		quality = "crude" //It shouldn't even be possible to get this low, maybe VERY basic shotguns
	else if(complexity < 75)
		quality = "makeshift"
	else if(complexity < 100)
		quality = "standard"
	else if(complexity < 150)
		quality = "good"
	else if(complexity < 170)
		quality = "improved"
	else if(complexity < 200)
		quality = "excellent"
	else if(complexity < 250)
		quality = "superior"
	else
		quality = "masterwork"

	if(max_complexity / 2 > complexity) //You got lazy and didn't even fill half the possible complexity
		G.extra_damage += pick(-2,-1,0)
		if(quality == "standard")
			quality = "substandard"
		if(quality == "improved")
			quality = "modified"
		if(quality == "masterwork")
			quality = "enhanced"

	src.forceMove(G) //Entire assembly gets thrown in the gun
	var/custom_name = input(user, "Select a name for this gun", "Custom name", G.name)
	if(!custom_name)
		G.name = "[G.name] ([capitalize(quality)])"
	else
		G.name = "[custom_name] ([capitalize(quality)])"
	G.desc = "[prefix][ammo_loader.caliber_name] [assembly.frame_type] ([quality])"
	
	if(scope)
		G.zoomable = TRUE
		G.zoom_amt = 10
		G.zoom_out_amt = 13
		G.build_zooming()

	var/obj/item/gun/ballistic/B = G
	B.magazine = new B.mag_type(B)

/obj/item/advanced_crafting_components/assembly
	name = "weapon assembly"
	desc = "A ballistic weapon part, a craftsman might want to have this. Activate it in hand to shape it into a type of firearm. This cannot be undone!"
	icon_state = "rifleframe"

	//Ideally these would all have their own sprites
	var/list/frame_types = list("pistol" = WEIGHT_CLASS_TINY,
								"rifle" = WEIGHT_CLASS_BULKY,
								"smg" = WEIGHT_CLASS_SMALL,
								"lmg" = WEIGHT_CLASS_BULKY,
								"shotgun" = WEIGHT_CLASS_BULKY,
								"revolver" = WEIGHT_CLASS_SMALL,
								"sniper" = WEIGHT_CLASS_BULKY) //add more here, energy weapons etc

/obj/item/advanced_crafting_components/assembly/attack_self(mob/user)
	var/selection = input(user,"What do you want to shape this assembly into?") as null|anything in frame_types
	if(!selection)
		return

	to_chat(user,"<span class='notice'>You shape the metal into a gun frame!")
	// to_chat(user,"<span class='notice'>You begin shaping the metal into a gun frame... Sit tight! This cannot be undone!")
	// if(do_after(user,80,target = src))
	var/obj/item/prefabs/complex/gunframe/G = new(get_turf(src))
	if(selection == "pistol" || selection == "revolver")
		G.icon_state = "pistolframe" //lil pistol icon hackiness
	G.frame_type = selection
	G.gun_type = selection
	G.tags = list(selection)
	for(var/F in frame_types)
		if(F == selection)
			continue
		LAZYADD(G.incompatible_tags,F) //Add our opposing ones, rifle shit cannot go in a pistol frame, etc

	G.gun_weight_class = frame_types[selection]
	G.name = "[selection] [initial(G.name)]" //ie. pistol frame
	to_chat(user,"<span class='notice'>You finish shaping the metal and end up with \the [G]!")
	user.dropItemToGround(src) //Clear it the UI/inventory
	if(selection == "pistol" || selection == "smg" || selection == "revolver")
		G.needs_stock = FALSE //negates the need to add a stock
	else
		G.needs_stock = TRUE
	qdel(src)
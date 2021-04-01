/obj/item/prefabs/complex/energy/frame
	name = "Weapon Frame"
	desc = "An unfinished energy gun."
	icon_state = "gunframe"

	var/max_complexity = 100
	complexity = 0

	var/destroy_chance =  15
	var/needs_stock = FALSE
	var/quality = 0

	var/obj/item/prefabs/barrel = null 			//plasma/laser/etc
	var/obj/item/prefabs/cell = null 			//type of ammo
	var/obj/item/prefabs/burst = null

	var/obj/item/advanced_crafting_components/conductors/conductors = null //optional
	var/obj/item/advanced_crafting_components/capacitor/capacitor = null //required (energy cost multiplier)
	var/obj/item/advanced_crafting_components/alloys/alloys = null //optional (slowdown decrease)
	var/obj/item/advanced_crafting_components/lenses/lens = null  //required (bullet speed mod)	
	var/obj/item/advanced_crafting_components/firing_pin/firing_pin = null		//optional


/obj/item/prefabs/complex/energy/frame/attackby(obj/item/W, mob/user, params)
	var/mob/living/M = user
	var/obj/item/dropitem = null

	if(istype(W,/obj/item/prefabs/complex/energy/frame))
		return

	if(istype(W,/obj/item/wrench))
		finish_egun(user)

	if(istype(W,/obj/item/screwdriver))
		if(!LAZYLEN(src.contents))
			to_chat(M,"\The [src] does not contain anything.")
			return 0
		
		for(var/obj/item/advanced_crafting_components/A in src.contents)
			to_chat(M,"You remove \the [A] from \the [src].")
			A.forceMove(get_turf(src))

		lens = null
		capacitor = null
		conductors = null
		alloys = null
		firing_pin = null

		for(var/obj/item/prefabs/P in src.contents)
			barrel = null
			cell = null

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
	if(istype(W, /obj/item/advanced_crafting_components))
		var/obj/item/advanced_crafting_components/I = W
		if(complexity + I.complexity > max_complexity)
			to_chat(usr,"<span class='warning'>[I] cannot fit on that frame! The system is too complicated and needs simpler parts.</span>")
			return
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
	if(istype(W,/obj/item/prefabs/complex/ebarrel))//automatic/burst/etc, lower damage for burst
		dropitem = barrel
		if(barrel)
			to_chat(usr,"<span_class='notice'>You swap out \the [barrel].</span>")
			barrel = null
		barrel = W
	else if(istype(W,/obj/item/prefabs/complex/eburst))//bullet speed
		dropitem = burst
		if(burst)
			to_chat(usr,"<span_class='notice'>You swap out \the [burst].</span>")
			burst = null
		burst = W
	else if(istype(W,/obj/item/prefabs/complex/ecell))//bullet speed
		dropitem = cell
		if(cell)
			to_chat(usr,"<span_class='notice'>You swap out \the [cell].</span>")
			cell = null
		cell = W
	else if(istype(W,/obj/item/advanced_crafting_components/lenses))
		var/obj/item/advanced_crafting_components/lenses/I = W
		dropitem = lens
		if(lens)
			to_chat(usr,"<span_class='notice'>You swap out \the [lens].</span>")
			lens = null
		lens = W
		complexity += I.complexity
	else if(istype(W,/obj/item/advanced_crafting_components/capacitor))
		var/obj/item/advanced_crafting_components/capacitor/I = W
		dropitem = capacitor
		if(capacitor)
			to_chat(usr,"<span_class='notice'>You swap out \the [capacitor].</span>")
			capacitor = null
		capacitor = W
		complexity += I.complexity
	else if(istype(W,/obj/item/advanced_crafting_components/conductors))
		var/obj/item/advanced_crafting_components/conductors/I = W
		dropitem = conductors
		if(conductors)
			to_chat(usr,"<span_class='notice'>You swap out \the [conductors].</span>")
			conductors = null
		conductors = W
		complexity += I.complexity
	else if(istype(W,/obj/item/advanced_crafting_components/alloys)) //slowdown decrease
		var/obj/item/advanced_crafting_components/alloys/I = W
		dropitem = alloys
		if(alloys)
			to_chat(usr,"<span_class='notice'>You swap out \the [alloys].</span>")
			alloys = null
		alloys = W
		complexity += I.complexity
	else if(istype(W,/obj/item/advanced_crafting_components/firing_pin)) //allows firing pins to be installed 
		var/obj/item/advanced_crafting_components/firing_pin/I = W
		dropitem = firing_pin
		if(firing_pin)
			to_chat(usr,"<span_class='notice'>You swap out \the [firing_pin].</span>")
			firing_pin = null
		firing_pin = W
		complexity += I.complexity
	else
		return ..()

	if(dropitem)
		dropitem.forceMove(get_turf(src))

	playsound(get_turf(src), 'sound/items/screwdriver.ogg', 50, 1)
	user.transferItemToLoc(W,src)

//Alloys are not needed, but buff stats a bit

/obj/item/prefabs/complex/energy/frame/proc/finish_egun(mob/user)
	var/mob/living/M = user

	if(!barrel || !burst || !cell || !lens || !capacitor)
		if(user)
			to_chat(user,"<span_class='notice'>It's missing a part! Examine it for more details.</span>")
		return 0

	var/gun_path
	var/prefix = ""
	var/quality = ""
	var/obj/item/gun/G
	var/lethal = TRUE

	if(istype(src,/obj/item/prefabs/complex/energy/frame/pistol))
		gun_path = /obj/item/gun/energy/laser/pistol
		prefix = "Portable"
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/laser/weak))
			gun_path = /obj/item/gun/energy/laser/wattz
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma))
			gun_path = /obj/item/gun/energy/laser/plasma/pistol
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/ion))
			gun_path = /obj/item/gun/energy/ionrifle/carbine
			lethal = FALSE

	else if(istype(src, /obj/item/prefabs/complex/energy/frame/hqpistol))
		gun_path = /obj/item/gun/energy/laser/pistol
		prefix = "Portable"
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/laser/weak))
			gun_path = /obj/item/gun/energy/laser/wattz/magneto
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma))
			gun_path = /obj/item/gun/energy/laser/plasma/glock/extended
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/ion))
			gun_path = /obj/item/gun/energy/ionrifle/carbine
			lethal = FALSE

	else if(istype(src, /obj/item/prefabs/complex/energy/frame/rifle))
		gun_path = /obj/item/gun/energy/laser/aer9
		prefix = "Full Length"
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma/weak))
			gun_path = /obj/item/gun/energy/laser/plasma
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma/scatter))
			gun_path = /obj/item/gun/energy/laser/plasma/scatter
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma/avg))
			gun_path = /obj/item/gun/energy/laser/plasma/carbine

		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/laser/strong))
			gun_path = /obj/item/gun/energy/laser/aer9
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/laser/scatter))
			gun_path = /obj/item/gun/energy/laser/scatter

		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/ion))
			gun_path = /obj/item/gun/energy/ionrifle
			lethal = FALSE

		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/stun/disabler/scatter))
			gun_path = /obj/item/gun/energy/laser/scatter/shotty

	else if(istype(src, /obj/item/prefabs/complex/energy/frame/hqrifle))
		gun_path = /obj/item/gun/energy/laser/rcw
		prefix = "Advanced"
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma/weak))
			gun_path = /obj/item/gun/energy/laser/plasma
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma/scatter))
			gun_path = /obj/item/gun/energy/laser/plasma/scatter
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/plasma/avg))
			gun_path = /obj/item/gun/energy/laser/plasma/carbine

		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/laser/strong))
			gun_path = /obj/item/gun/energy/laser/aer9
		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/laser/scatter))
			gun_path = /obj/item/gun/energy/laser/scatter

		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/ion))
			gun_path = /obj/item/gun/energy/ionrifle
			lethal = FALSE

		if(istype(barrel, /obj/item/prefabs/complex/ebarrel/stun/disabler/scatter))
			gun_path = /obj/item/gun/energy/laser/scatter/shotty

	
	if(istype(barrel, /obj/item/prefabs/complex/ebarrel/stun/disabler))
		prefix = "Energy"
		

	if(!ispath(gun_path)) //Something went fucky
		return 0

	G = new gun_path(get_turf(src))
	G.desc = ""

	G.chambered = null

	if(conductors && lethal)
		to_chat(user,"You use the conductors to improve the weapon.")
		G.extra_damage += pick(6,4,2)
		G.extra_penetration += pick(6,4,2)

	if(M.has_trait(TRAIT_MASTER_GUNSMITH) && lethal)
		to_chat(user,"Your skills come in handy while assembling the weapon")
		if(prob(25))
			G.extra_damage += 5
		if(prob(25))
			G.extra_penetration += 5

	G.extra_damage = 0
	G.burst_size = 1
	G.customburst = 1
	G.burst_delay = 4
	G.extra_penetration = 0
	G.recoil = 0
	G.spread = 0
	G.projectile_speed = 0.8
	G.fire_delay = 6
	if(firing_pin)
		G.pin = null
	else
		G.pin = /obj/item/firing_pin

	if(lethal)
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
			if(C.energyAmmoType)
				var/obj/item/gun/energy/E = G
				E.cell_type = C.energyAmmoType
			if (C.energyProjType)
				var/obj/item/gun/energy/E = G
				E.ammo_type = C.energyProjType
			G.force += C.force_mod
		if(conductors)
			G.spread += conductors.spread_mod
		if(lens)
			G.projectile_speed += lens.bullet_speed_mod
			G.burst_delay += lens.burst_delay_mod
		if(capacitor)
			G.extra_penetration += capacitor.armorpen_mod
		if(alloys)
			G.slowdown *= alloys.slowdown_multiply

	if(complexity <= 100)
		quality = "crude"
	else if(complexity <= 75)
		quality = "makeshift"
	else if(complexity <= 100)
		quality = "standard"
	else if(complexity <= 175)
		quality = "good"
	else if(complexity <= 200)
		quality = "improved"
	else if(complexity <= 250)
		quality = "excellent"
	else if(complexity <= 300)
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
		
	G.desc = "[prefix] [burst.name] [barrel.name] ([quality])"
	if(alloys)
		G.desc = "Lightweight " + G.desc
	
	var/obj/item/gun/energy/B = G

	B.cell = new B.cell_type(B) 

	B.Initialize()


/obj/item/prefabs/complex/energy/frame/examine(mob/user)
	var/c = complexity
	complexity = 0
	..()
	complexity = c
	if(barrel)
		to_chat(user,"<span class='notice'>Barrel: <i>[barrel]</i></span>")
	else
		to_chat(user,"<span class='notice'>Barrel: </span><span class='warning'>Not installed!</span>")
	if(cell)
		to_chat(user,"<span class='notice'>Power cell: <i>[cell]</i></span>")
	else
		to_chat(user,"<span class='notice'>Power cell: </span><span class='warning'>Not installed!</span>")
	if(burst)
		to_chat(user,"<span class='notice'>Stream adapter: <i>[burst]</i></span>")
	else
		to_chat(user,"<span class='notice'>Stream adapter: </span><span class='warning'>Not installed!</span>")
	if(lens)
		to_chat(user,"<span class='notice'>Lense assembly: <i>[lens]</i></span>")
	else
		to_chat(user,"<span class='notice'>Lense assembly: </span><span class='warning'>Not installed!</span>")
	if(capacitor)
		to_chat(user,"<span class='notice'>Capacitor: <i>[capacitor]</i></span>")
	else
		to_chat(user,"<span class='notice'>Capacitor: </span><span class='warning'>Not installed!</span>")
	if(conductors)
		to_chat(user,"<span class='notice'>Conductor: <i>[conductors]</i></span>")
	else
		to_chat(user,"<span class='notice'>Conductor: </span><span class='notice'>Not installed!</span>")
	if(alloys)
		to_chat(user,"<span class='notice'>Additional alloys: <i>[alloys]</i></span>")
	else
		to_chat(user,"<span class='notice'>Additional alloys: </span><span class='notice'>Not installed!</span>")
	if(firing_pin)
		to_chat(user,"<span class='notice'>Firing pin: <i>[firing_pin]</i></span>")
	else
		to_chat(user,"<span class='notice'>Firing pin: </span><span class='notice'>basic pin</span>")

	to_chat(user,"<span class='notice'>The frame's complexity is <b>[complexity]/[max_complexity]</b>.</span>")
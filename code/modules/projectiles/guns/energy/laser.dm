/obj/item/gun/energy/laser
	name = "laser gun"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon_state = "laser"
	item_state = "retro"
	can_attachments = FALSE
	w_class = WEIGHT_CLASS_BULKY
	materials = list(MAT_METAL=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1

/obj/item/gun/energy/laser/rcw/ui_action_click()
	burst_select()

/obj/item/gun/energy/laser/plasma/carbine/ui_action_click()
	burst_select()

/obj/item/gun/energy/laser/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		burst_size = 1
		to_chat(user, "<span class='notice'>You switch to a single stream laser.</span>")
	else
		burst_size = initial(burst_size)
		to_chat(user, "<span class='notice'>You switch to [burst_size]-stream laser.</span>")

	playsound(user, 'sound/f13weapons/laserswitch.ogg', 80, 1)
	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/energy/laser/practice
	name = "practice laser gun"
	desc = "A modified version of the basic laser gun, this one fires less concentrated energy bolts designed for target practice."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice)
	clumsy_check = 0
	item_flags = NONE

/obj/item/gun/energy/laser/retro
	name ="retro laser gun"
	icon_state = "retro"
	desc = "An older model of the basic lasergun, no longer used by Vault-Tec's private security or military forces. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	ammo_x_offset = 3

/obj/item/gun/energy/laser/retro/old
	name ="laser gun"
	icon_state = "retro"
	desc = "First generation lasergun, developed by Vault-Tec. Suffers from ammo issues but its unique ability to recharge its ammo without the need of a magazine helps compensate. You really hope someone has developed a better lasergun while you were in cyro."
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun/old)
	ammo_x_offset = 3

/obj/item/gun/energy/laser/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "This is an antique laser gun. All craftsmanship is of the highest quality. It is decorated with assistant leather and chrome. The object menaces with spikes of energy. It's usually given to high-ranking members within the Brotherhood."
	force = 10
	ammo_x_offset = 3
	selfcharge = 1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/captain/scattershot
	name = "scatter shot laser rifle"
	icon_state = "lasercannon"
	item_state = "laser"
	desc = "An industrial-grade heavy-duty laser rifle with a modified laser lens to scatter its shot into multiple smaller lasers. The inner-core can self-charge for theoretically infinite use."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/laser/cyborg
	can_charge = 0
	desc = "An energy-based laser gun that draws power from the cyborg's internal energy cell directly. So this is what freedom looks like?"
	use_cyborg_cell = 1

/obj/item/gun/energy/laser/cyborg/emp_act()
	return

/obj/item/gun/energy/laser/scatter/shotty
	name = "energy shotgun"
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "cshotgun"
	item_state = "shotgun"
	desc = "A combat shotgun gutted and refitted with an internal laser system. Can switch between taser and scattered disabler shots."
	shaded_charge = 0
	pin = /obj/item/firing_pin/implant/mindshield
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter/disabler, /obj/item/ammo_casing/energy/electrode)

///Laser Cannon

/obj/item/gun/energy/lasercannon
	name = "accelerator laser cannon"
	desc = "An advanced laser cannon that does more damage the farther away the target is."
	icon_state = "lasercannon"
	item_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator)
	pin = null
	ammo_x_offset = 3

/obj/item/ammo_casing/energy/laser/accelerator
	projectile_type = /obj/item/projectile/beam/laser/accelerator
	select_name = "accelerator"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/projectile/beam/laser/accelerator
	name = "accelerator laser"
	icon_state = "scatterlaser"
	range = 255
	damage = 6

/obj/item/projectile/beam/laser/accelerator/Range()
	..()
	damage += 7
	transform *= 1 + ((damage/7) * 0.2)//20% larger per tile

/obj/item/gun/energy/xray
	name = "x-ray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated x-ray blasts that pass through multiple soft targets and heavier materials."
	icon_state = "xray"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/xray)
	pin = null
	ammo_x_offset = 3

////////Laser Tag////////////////////

/obj/item/gun/energy/laser/bluetag
	name = "laser tag gun"
	icon_state = "bluetag"
	desc = "A retro laser gun modified to fire harmless blue beams of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/blue
	ammo_x_offset = 2
	selfcharge = TRUE

/obj/item/gun/energy/laser/bluetag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag/hitscan)

/obj/item/gun/energy/laser/redtag
	name = "laser tag gun"
	icon_state = "redtag"
	desc = "A retro laser gun modified to fire harmless beams red of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/red
	ammo_x_offset = 2
	selfcharge = TRUE

/obj/item/gun/energy/laser/redtag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag/hitscan)


//Fallout

//six shots with the laser musket, stronger than a regular laser rifle,
//need electronics,
//a pipe rifle and a nuka cola bottle.
//Then you need makeshift energy cells, so empty MF cells. and electronics
//make the musket laser have like a 2 second delay after each shot

///obj/item/gun/energy/laser/musket
//	name = "Homemade Laser Musket"
//	desc = "A crudely made laser Musket, inneficient but powerful enough"
//	icon_state = "las_musket"
//	item_state = "las_musket"
//	fire_delay = 80
//	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'
//	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket)
//	cell_type = /obj/item/stock_parts/cell/ammo/mfc
//	w_class = WEIGHT_CLASS_BULKY
//	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/laser/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				//else
				//	to_chat(user, "<span class='notice'>You insert the cell into \the [src].</span>")

				//playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				//chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/laser/aer9
	name = "\improper AER9 laser rifle"
	desc = "A sturdy and advanced military grade pre-war service laser rifle"
	icon_state = "laser"
	item_state = "laser-rifle9"
	can_scope = TRUE
	scopestate = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	fire_delay = 1.5 //Default 3
	burst_delay = 4
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/laser/ultra_rifle
	name = "\improper Ultracite laser rifle"
	desc = "A sturdy and advanced military grade pre-war service laser rifle, now enhanced with ultracite"
	icon_state = "ultra_rifle"
	item_state = "laser-rifle9"
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_delay = 1.5 //Default 3
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/ultracite
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/laser/pistol
	name = "\improper AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light."
	icon_state = "AEP7"
	item_state = "laser-pistol"
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 1
	burst_delay = 4
	can_scope = TRUE
	scopestate = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/ultra_pistol
	name = "\improper Ultracite laser pistol"
	desc = "An ultracite enhanced energy-based laser gun that fires concentrated beams of light."
	icon_state = "ultra_pistol"
	item_state = "laser-pistol"
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 1
	scope_x_offset = 7
	scope_y_offset = 22
	ammo_type = list(/obj/item/ammo_casing/energy/laser/ultra_pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/solar
	name = "\improper Solar Scorcher"
	desc = "This modified AEP7 laser pistol takes its power from the sun, recharging slowly using stored solar energy. However, it cannot be recharged manually as a result."
	icon_state = "solarscorcher"
	item_state = "solarscorcher"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/solar) //30 damage, 20 AP
	cell_type = /obj/item/stock_parts/cell/ammo/ec //10 shots, self-charges
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
	can_charge = 0
	selfcharge = 1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/scatter
	name = "tribeam laser rifle"
	desc = "A modified AER9 equipped with a refraction kit that spreads its bolts. It is usually only given to high-ranking soldiers within the Brotherhood, due to it's level of technology, as well as its reputation of friendly fire."
	icon_state = "tribeam"
	item_state = "laser-rifle9"
	fire_delay = 1.5
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/laser/plasma
	name ="plasma rifle"
	item_state = "plasma"
	icon_state = "plasma"
	fire_delay = 2.5
	desc = "A top of line miniaturized plasma caster built by REPCONN in the wake of the Z43-521P failure. It is supperior to all previous rifles to enter service in the USCC."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	projectile_speed = 0.9

/obj/item/gun/energy/laser/plasma/carbine
	name ="plasma carbine"
	item_state = "plasma"
	icon_state = "plasmacarbine"
	desc = ""
	ammo_type = list(/obj/item/ammo_casing/energy/plasmacarbine)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	burst_size = 2
	burst_delay = 1
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	projectile_speed = 1.5
	can_scope = TRUE
	scopestate = "plasma_scope"
	scope_x_offset = 13
	scope_y_offset = 16

/obj/item/gun/energy/laser/plasma/carbine/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			to_chat(user, "<span class='notice'>You switch to dual-stream plasma.</span>")
		if(1)
			select = 0
			burst_size = 1
			to_chat(user, "<span class='notice'>You switch to singular stream plasma.</span>")
	playsound(user, 'sound/f13weapons/equipsounds/plasequip.ogg', 80, 1)
	update_icon()
	return

/obj/item/gun/energy/laser/plasma/scatter
	name = "multiplas Rifle"
	item_state = "multiplas"
	icon_state = "multiplas"
	fire_delay = 3
	desc = "A modified A3-20 plasma caster built by REPCONN equipped with a multicasting kit that creates multiple weaker clots."
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	weapon_weight = WEAPON_HEAVY
	projectile_speed = 1.2

/obj/item/gun/energy/laser/plasma/pistol
	name ="plasma pistol"
	item_state = "plasma-pistol"
	icon_state = "plasma-pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires heavy low penetration plasma clots."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT
	projectile_speed = 1.1

/obj/item/gun/energy/laser/plasma/glock
	name = "glock 86"
	item_state = "plasma-pistol"
	icon_state = "glock86"
	desc = "Glock 86 Plasma Pistol. Designed by the Gaston Glock artificial intelligence. Shoots a small bolt of superheated plasma. Powered by a small energy cell."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT
	projectile_speed = 1.1

/obj/item/gun/energy/laser/plasma/glock/extended
	name ="glock 86a"
	item_state = "plasma-pistol"
	icon_state = "glock86a"
	desc = "This Glock 86 plasma pistol has had its magnetic housing chamber realigned to reduce the drain on its energy cell. Its efficiency has doubled, allowing it to fire more shots before the battery is expended."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock/extended)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/wattz
	name = "Wattz 1000 laser pistol"
	desc = "A Wattz 1000 Laser Pistol. Civilian model, so the wattage is lower than military or police versions. Uses small energy cells."
	icon_state = "wattz1000"
	item_state = "laser-pistol"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/wattz/magneto
	name = "Wattz 1000 magneto-laser pistol"
	desc = "This Wattz 1000 laser pistol has been upgraded with a magnetic field targeting system that tightens the laser emission, giving this pistol extra penetrating power."
	icon_state = "magnetowattz"
	item_state = "laser-pistol"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz/magneto)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/plasma/alien
	name = "alien blaster"
	item_state = "alienblaster"
	icon_state = "alienblaster"
	desc = "This weapon is unlike any other you've ever seen before, and appears to be made out of metals not usually found on Earth. It certainly packs a punch, though."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/alien)
	cell_type = /obj/item/stock_parts/cell/ammo/alien //unchargeable, but removable
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/rcw
	name = "laser RCW"
	desc = "A rapid-fire laser rifle modeled after the familiar \"Thompson\" SMG. It features high-accuracy burst fire that will whittle down targets in a matter of seconds."
	icon_state = "lasercw"
	item_state = "rcw"
	fire_delay = 3
	burst_size = 2
	burst_delay = 2.5
	equipsound = 'sound/f13weapons/equipsounds/RCWequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rcw)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/laser/rcw/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			fire_delay = 3
			to_chat(user, "<span class='notice'>You switch to a dual-stream laser.</span>")
		if(1)
			select = 0
			burst_size = 1
			fire_delay = 2.3
			to_chat(user, "<span class='notice'>You switch to a singular stream laser.</span>")
	playsound(user, 'sound/f13weapons/laserswitch.ogg', 80, 1)
	update_icon()
	return


/obj/item/gun/energy/laser/rcw/afterattack()
	. = ..()
	empty_alarm()
	return

/obj/item/gun/energy/laser/laer
	name = "\improper LAER"
	desc = "The Laser Assister Energy Rifle is a powerful pre-war weapon developed just before the turn of the Great War. Due to its incredible rarity and unprecedented firepower, the weapon is coveted and nearly solely possesed by the Brotherhood of Steel; typically held by an Elder as a status symbol."
	icon_state = "laer"
	item_state = "laer"
	fire_delay = 1.5
	burst_size = 1
	equipsound = 'sound/f13weapons/equipsounds/laerequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/laer)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/laser/aer14
	name = "\improper AER14 laser rifle"
	desc = "The AER14, a successor to the AER9 and AER12, was a prototype in development before the Great War. It features an orange trim and higher firepower at the cost of slower firing rate."
	icon_state = "aer14"
	item_state = "laser-rifle9"
	can_scope = TRUE
	scopestate = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	fire_delay = 2
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/aer14)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/energy/gammagun
	name = "Gamma gun"
	desc = "A very crude weapon overall and appears to have been built from scavenged junk found throughout the wasteland."
	icon_state = "gammagun"
	item_state = "gammagun"
	ammo_type = list(/obj/item/ammo_casing/energy/gammagun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	ammo_x_offset = 3
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/laser/pistol/pewpew
	name = "\improper pew-pew"
	desc = "A basic energy-based laser gun that fires concentrated beams of light."
	icon_state = "pewpew"
	item_state = "laser-pistol"
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 1
	burst_delay = 4
	can_scope = TRUE
	scopestate = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/pewpew)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slot_flags = ITEM_SLOT_BELT
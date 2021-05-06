//Bluespace crystals, used in telescience and when crushed it will blink you to a random turf.
/obj/item/stack/ore/bluespace_crystal
	name = "Quantum Mesh"
	desc = "A glowing blue crystal, allegedly linked to research of quantum entanglement. It looks very delicate."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "bluespace_crystal"
	singular_name = "bluespace crystal"
	w_class = WEIGHT_CLASS_TINY
	materials = list(MAT_BLUESPACE=MINERAL_MATERIAL_AMOUNT)
	points = 50
	var/blink_range = 0 // The teleport range when crushed/thrown at someone
	refined_type = /obj/item/stack/sheet/bluespace_crystal
	grind_results = list("bluespace" = 20)

/obj/item/stack/ore/bluespace_crystal/refined
	name = "refined Quantum Mesh"
	points = 0
	refined_type = null

/obj/item/stack/ore/bluespace_crystal/Initialize()
	. = ..()
	pixel_x = rand(0, 0)
	pixel_y = rand(0, 0)

/obj/item/stack/ore/bluespace_crystal/get_part_rating()
	return 1
/*
/obj/item/stack/ore/bluespace_crystal/attack_self(mob/user)
	user.visible_message("<span class='warning'>[user] crushes [src]!</span>", "<span class='danger'>You crush [src]!</span>")
	new /obj/effect/particle_effect/sparks(loc)
	playsound(loc, "sparks", 50, 1)
	blink_mob(user)
	use(1)
*/
/obj/item/stack/ore/bluespace_crystal/proc/blink_mob(mob/living/L)
	do_teleport(L, get_turf(L), blink_range, asoundin = 'sound/effects/phasein.ogg')

/obj/item/stack/ore/bluespace_crystal/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..()) // not caught in mid-air
		visible_message("<span class='notice'>[src] shatters!</span>")
		var/turf/T = get_turf(hit_atom)
		new /obj/effect/particle_effect/sparks(T)
		playsound(loc, "sparks", 50, 1)
		use(1)

//Artifical bluespace crystal, doesn't give you much research.
/obj/item/stack/ore/bluespace_crystal/artificial
	name = "artificial Quantum Mesh"
	desc = "An artificially made blue crystal, it looks delicate."
	materials = list(MAT_BLUESPACE=MINERAL_MATERIAL_AMOUNT*0.5)
	blink_range = 4 // Not as good as the organic stuff
	points = 0 //nice try
	refined_type = null
	grind_results = list("bluespace" = 10, "silicon" = 20)

//Polycrystals, aka stacks
/obj/item/stack/sheet/bluespace_crystal
	name = "Quantum Mesh"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "polycrystal"
	item_state = "sheet-polycrystal"
	singular_name = "bluespace polycrystal"
	desc = "A stable polycrystal, made of Quantum Mesh."
	materials = list(MAT_BLUESPACE=MINERAL_MATERIAL_AMOUNT)
	attack_verb = list("quantum polybashed", "quantum polybattered", "quantum polybludgeoned", "quantum polythrashed", "quantum polysmashed")
	novariants = TRUE
	grind_results = list("bluespace" = 20)
	/*var/crystal_type = /obj/item/stack/ore/bluespace_crystal/refined*/

/obj/item/stack/sheet/bluespace_crystal/attack_self(mob/user)// to prevent the construction menu from ever happening
	to_chat(user, "<span class='warning'>You cannot crush the mesh in-hand, try breaking one off.</span>")

/*//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/stack/sheet/bluespace_crystal/attack_hand(mob/user)
	if(user.get_inactive_held_item() == src)
		if(zero_amount())
			return
		var/BC = new crystal_type(src)
		user.put_in_hands(BC)
		use(1)
		if(!amount)
			to_chat(user, "<span class='notice'>You break the final crystal off.</span>")
		else
			to_chat(user, "<span class='notice'>You break off a crystal.</span>")
	else
		..()*/
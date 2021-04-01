/obj/item/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	item_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 40
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 30		// three seconds
	dissolvable = FALSE

/obj/item/reagent_containers/pill/patch/attack(mob/living/L, mob/user)
	if(ishuman(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!L.can_inject(user, 1))
			return
		if(!affecting)
			to_chat(user, "<span class='warning'>The limb is missing!</span>")
			return
		if(affecting.status != BODYPART_ORGANIC)
			to_chat(user, "<span class='notice'>Medicine won't work on a robotic limb!</span>")
			return
	..()

/obj/item/reagent_containers/pill/patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	list_reagents = list("styptic_powder" = 20)
	icon_state = "bandaid_brute"

/obj/item/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	list_reagents = list("silver_sulfadiazine" = 20)
	icon_state = "bandaid_burn"

/obj/item/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "A highly addictive meta-amphetamine that produces a fast-acting, intense euphoric high on the user."
	list_reagents = list("jet" = 10)
	icon_state = "bandaid_jet"

/obj/item/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	list_reagents = list("turbo" = 5)
	icon_state = "bandaid_turbo"

/obj/item/reagent_containers/pill/patch/healingpowder
	name = "Healing Powder"
	desc = "A powder used to heal physical wounds derived from ground broc flowers and xander roots, commonly used by tribals."
	list_reagents = list("healing_powder" = 10)
	icon_state = "bandaid_healingpowder"
	self_delay = 0

/obj/item/reagent_containers/pill/patch/healingpowder/attack(mob/living/L, mob/user)
	.=..()
	if(L.has_trait(TRAIT_MEDEBIL, TRAIT_GENERIC))
		to_chat(user, "Ahh, yes, finally good medicine.")
		list_reagents = list("healing_powder" = 18)
	else
		list_reagents = list("healing_powder" = 10)

/obj/item/reagent_containers/pill/patch/healpoultice
	name = "Healing poultice"
	desc = "A concoction of broc flower, cave fungus, agrave fruit and xander root."
	list_reagents = list("healing_poultice" = 10)
	icon_state = "bandaid_healingpoultice"
	self_delay = 0

/obj/item/reagent_containers/pill/patch/voodoo
    name = "Voodoo"
    desc = "A tribal concoction, made from the left-over byproducts of various critters. It imbues the user with greater agility and a sense of invincibility."
    list_reagents = list("ephedrine" = 5, "coffee" = 30, "mine_salve" = 5)
    icon_state = "Voodoo"
    self_delay = 0

/obj/item/reagent_containers/pill/patch/coyotechew
    name = "coyote tobacco chew"
    desc = "Nicotiana attenuata, colloquially known as coyote tobacco. The plant is native to and grows wild in the southwestern United States and Mexico."
    list_reagents = list("salbutamol" = 0.15, "nicotine" = 0.24, "antihol" = 5)
    icon_state = "bandaid_chew"
    self_delay = 30
/obj/item/gun/energy/disabler/fluff/angelofmercy
	name = "Angel of Mercy"
	desc = "Этот прекрасный шокер некогда принадлежал таинственному работорговцу из пустошей. Легенды гласят, что с его помощью было поймано около тысячи рабов. В его деталях можно разглядеть следы крови, которые спустя многие года работают в качестве смазки."
	icon = 'icons/obj/betaadvanced.dmi'
	icon_state = "compliance_regulatorfluff"

/obj/item/clothing/head/beret/mixanoff
	name = "officer beret"
	desc = "A green beret, standard issue for all commissioned Officers."
	icon_state = "hosberetblack"
	item_state = "hosberetblack"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 30, "energy" = 30, "bomb" = 30, "bio" = 40, "rad" = 30, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/power_armor/t45d/modified
	name = "modified power armor"
	desc = "A captured set of T-45d power armor, it's been heavily modified and decorated with the head of a bear and intricate gold trimming. A two headed bear is scorched into the breastplate."
	icon_state = "sierra"
	item_state = "sierra"
	traits = list(TRAIT_IRONFIST, TRAIT_STUNIMMUNE, TRAIT_PUSHIMMUNE)

/obj/item/storage/briefcase/mixanoff
	name = "коробочка говна нахуй"
	desc = "Удали блять."

/obj/item/storage/briefcase/mixanoff/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/power_armor/t45d/modified(src)
	new /obj/item/clothing/head/beret/mixanoff(src)
	new /obj/item/book/granter/trait/pa_wear(src)
	new /obj/item/gun/ballistic/automatic/marksman/servicerifle/r82(src)
	new /obj/item/ammo_box/magazine/m556/rifle/extended(src)
	new /obj/item/ammo_box/magazine/m556/rifle/extended(src)

/obj/item/storage/briefcase/supermutant
	name = "box of clothes"
	desc = "old rusted box, oddly big"

/obj/item/storage/briefcase/supermutant/PopulateContents()
	new /obj/item/reagent_containers/pill/supermutant(src)
	new /obj/item/clothing/under/hulk/hulk_vault13(src)
	new /obj/item/clothing/suit/armor/hulk/hulk_armor(src)
	new /obj/item/clothing/glasses/sunglasses/hulk_lili(src)
	new /obj/item/clothing/head/helmet/hulk/metal(src)
	new /obj/item/clothing/shoes/hulk_boots(src)
	new /obj/item/storage/backpack/hulk(src)
	new /obj/item/radio/headset/hulk(src)
	new /obj/item/twohanded/sledgehammer(src)
	new /obj/item/reagent_containers/hypospray/medipen/psycho(src)
	new /obj/item/reagent_containers/hypospray/medipen/psycho(src)

/obj/item/storage/briefcase/supermutant
	name = "box of clothes"
	desc = "old rusted box, oddly big"

/obj/item/storage/briefcase/nightkin/PopulateContents()
	new /obj/item/reagent_containers/pill/nightkin(src)
	new /obj/item/clothing/under/hulk/hulk_vault13(src)
	new /obj/item/clothing/suit/armor/hulk/night_armor(src)
	new /obj/item/clothing/glasses/sunglasses/hulk_lili(src)
	new /obj/item/clothing/head/helmet/hulk/metal(src)
	new /obj/item/clothing/shoes/hulk_boots(src)
	new /obj/item/storage/backpack/hulk(src)
	new /obj/item/radio/headset/hulk(src)
	new /obj/item/stealthboy/makeshift(src)
	new /obj/item/claymore/machete(src)
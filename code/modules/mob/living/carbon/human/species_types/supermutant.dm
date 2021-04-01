/datum/species/supermutant
	name = "Super mutant"
	id = "supermutant"
	say_mod = "yells"
	limbs_id = "hulky"
	damage_overlay_type = ""
	no_equip = list(SLOT_WEAR_MASK, SLOT_WEAR_SUIT, SLOT_GLOVES, SLOT_SHOES, SLOT_W_UNIFORM, SLOT_EARS, SLOT_HEAD)
	inherent_traits = list(TRAIT_RADIMMUNE)
	species_traits = list(NO_UNDERWEAR)
	inherent_biotypes = list(MOB_INORGANIC, MOB_HUMANOID)
	punchstunthreshold = 9
	use_skintones = 0
	armor = 30
	sexes = 1
	disliked_food = GROSS
	offset_features = list(OFFSET_UNIFORM = list(0,0), OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_GLASSES = list(0,2), OFFSET_EARS = list(0,0), OFFSET_SHOES = list(0,0), OFFSET_S_STORE = list(0,0), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,0), OFFSET_FACE = list(0,2), OFFSET_BELT = list(0,0), OFFSET_BACK = list(0,0), OFFSET_SUIT = list(0,0), OFFSET_NECK = list(0,0))
	liked_food = JUNKFOOD | FRIED | RAW

/datum/species/supermutant/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	for(var/I in C.contents)
		C.dropItemToGround(I, TRUE)
	C.verbs |= /mob/living/carbon/human/species/supermutant/verb/emote_h_attack
	C.verbs |= /mob/living/carbon/human/species/supermutant/verb/emote_h_alert
	C.verbs |= /mob/living/carbon/human/species/supermutant/verb/emote_h_idle

/datum/species/supermutant/on_species_loss(mob/living/carbon/C)
	..()
	C.verbs -= /mob/living/carbon/human/species/supermutant/verb/emote_h_attack
	C.verbs -= /mob/living/carbon/human/species/supermutant/verb/emote_h_alert
	C.verbs -= /mob/living/carbon/human/species/supermutant/verb/emote_h_idle

/datum/species/supermutant/nightkin
	name = "Nightkin"
	id = "nightkin"
	limbs_id = "night"
	armor = 35

/datum/species/supermutant/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	

/datum/species/supermutant/on_species_loss(mob/living/carbon/C)
	. = ..()
	C.verbs |= /mob/living/carbon
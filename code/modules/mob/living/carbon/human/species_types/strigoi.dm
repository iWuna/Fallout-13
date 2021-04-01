/datum/species/strigoi
	name = "strigoi"
	id = "strigoi"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,DRINKSBLOOD)
	inherent_traits = list(TRAIT_NOHUNGER,TRAIT_NOBREATH)
	inherent_biotypes = list(MOB_UNDEAD, MOB_HUMANOID)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	exotic_bloodtype = "U"
	use_skintones = TRUE
	mutant_heart = /obj/item/organ/heart/vampire
	mutanttongue = /obj/item/organ/tongue/vampire
	mutanteyes = /obj/item/organ/eyes/night_vision/vampire
	blacklisted = FALSE
	limbs_id = "human"
	skinned_type = /obj/item/stack/sheet/animalhide/human
	var/info_text = "You are a <span class='danger'>Strigoi</span>. You will slowly but constantly lose blood if outside of a coffin. If inside a coffin, you will slowly heal. You may gain more blood by grabbing a live victim and using your drain ability."

/datum/species/strigoi/check_roundstart_eligible(mob/living/L)
	return FALSE

/datum/species/strigoi/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	. = ..()
	to_chat(C, "[info_text]")
	C.skin_tone = "albino"
	C.update_body(0)

/datum/species/strigoi/on_species_loss(mob/living/carbon/C)
	. = ..()

/datum/species/strigoi/qualifies_for_rank(rank, list/features)
	if(rank in GLOB.legion_positions)
		return 0
	if(rank in GLOB.brotherhood_positions)
		return 0
	if(rank in GLOB.vault_positions)
		return 0
	if(rank in GLOB.enclave_positions)
		return 0
	if(rank in GLOB.ncr_positions)
		return 0
	return ..()

/datum/species/strigoi/spec_life(mob/living/carbon/human/C)
	. = ..()
	if(C.health < 100)
		C.heal_overall_damage(2,2)
		C.adjustToxLoss(-2)
		C.adjustOxyLoss(-2)
		C.adjustCloneLoss(-2)
		C.blood_volume -= 1
		return
GLOBAL_LIST_INIT(trait_name, list(
	TRAIT_PA_WEAR 					= "Power Armor",
	TRAIT_HARD_YARDS 				= "Trekking",
	TRAIT_MEDICALEXPERT 			= "Field Surgery",
	TRAIT_ADVANCED_SURGEON 			= "Brain Surgery",
	TRAIT_GUNSMITH_ONE 				= "Basic Gunsmithing",
	TRAIT_GUNSMITH_TWO 				= "Experienced Gunsmithing",
	TRAIT_GUNSMITH_THREE 			= "Intermediate Gunsmithing",
	TRAIT_GUNSMITH_FOUR 			= "Expert Gunsmithing",
	TRAIT_CHEMWHIZ 					= "Chemistry",
	TRAIT_CHEMWHIZ 					= "The Machine Spirits",
	TRAIT_MASTER_GUNSMITH 			= "Master Gunsmithing"
))

/datum/granter_trait
	var/name = ""
	var/grant = ""
	var/teachable = TRUE

/datum/granter_trait/chemistry
	name = "Chemistry"
	grant = TRAIT_CHEMWHIZ

/datum/granter_trait/spirit_teachings
	name = "The Machine Spirits"
	grant = TRAIT_CHEMWHIZ

/datum/granter_trait/gunsmith
	name = "Master Gunsmithing"
	grant = TRAIT_MASTER_GUNSMITH

/datum/granter_trait/techno
	name = "Craftsmanship"
	grant = TRAIT_TECHNOPHREAK
	teachable = FALSE

/datum/granter_trait/pa_wear
	name = "Power Armor"
	grant = TRAIT_PA_WEAR

/datum/granter_trait/trekking
	name = "Trekking"
	grant = TRAIT_HARD_YARDS

/datum/granter_trait/field_surgery
	name = "Field Surgery"
	grant = TRAIT_MEDICALEXPERT

/datum/granter_trait/brain_surgery
	name = "Brain Surgery"
	grant = TRAIT_ADVANCED_SURGEON

/datum/granter_trait/gunsmith_one
	name = "Basic Gunsmithing"
	grant = TRAIT_GUNSMITH_ONE

/datum/granter_trait/gunsmith_two
	name = "Intermediate Gunsmithing"
	grant = TRAIT_GUNSMITH_TWO

/datum/granter_trait/gunsmith_three
	name = "Experienced Gunsmithing"
	grant = TRAIT_GUNSMITH_THREE

/datum/granter_trait/gunsmith_four
	name = "Expert Gunsmithing"
	grant = TRAIT_GUNSMITH_FOUR

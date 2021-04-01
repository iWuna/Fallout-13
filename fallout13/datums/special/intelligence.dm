/datum/special
	var/can_program_eyebot = FALSE
	var/grenade_clumsy = FALSE
	var/can_use_eguns = FALSE

/datum/special/proc/update_intelligence(value = _intelligence)
	_intelligence = value
	value = trim(value)

	holder.remove_language(/datum/language/aphasia)
	holder.remove_language(/datum/language/common)
	if(value < 3)
		holder.grant_language(/datum/language/aphasia)
	else if(value > 8)
		holder.grant_language(/datum/language/aphasia)
		holder.grant_language(/datum/language/common)
	else
		holder.grant_language(/datum/language/common)

	can_program_eyebot = FALSE
	if(value > 5)
		can_program_eyebot = TRUE

	grenade_clumsy = FALSE
	if(value < 3)
		grenade_clumsy = TRUE

	if(value >= 9)
		holder.verbs |= /mob/living/proc/teach_skill
	else
		holder.verbs -= /mob/living/proc/teach_skill

	can_use_eguns = FALSE
	if(value > 3)
		can_use_eguns = TRUE

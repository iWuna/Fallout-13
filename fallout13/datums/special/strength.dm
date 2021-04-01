/datum/special
	var/can_drill_rgirder = FALSE
	var/can_drill_girder = FALSE
	var/can_use_guns = FALSE
	var/punch_mod = 0

	var/punchdamagelow_mod = 0
	var/punchdamagehigh_mod = 0
	var/punchstunthreshold_mod = 0

/datum/special/proc/update_strength(value = _strength)
	_strength = value
	value = trim(value)

	can_drill_rgirder = FALSE
	if (value >= 8)
		can_drill_rgirder = TRUE

	can_drill_girder = FALSE
	if (value >= 6)
		can_drill_girder = TRUE

	can_use_guns = FALSE
	if (value > 2)
		can_use_guns = TRUE

	punch_mod = value * 2

	if(iscarbon(holder))
		var/mob/living/carbon/C = holder
		C.dna.species.punchdamagelow 		-= punchdamagelow_mod
		C.dna.species.punchdamagehigh 		-= punchdamagehigh_mod
		C.dna.species.punchstunthreshold 	-= punchstunthreshold_mod

		punchdamagelow_mod 			=  initial(C.dna.species.punchdamagelow) * (1 + value * 0.2) - initial(C.dna.species.punchdamagelow)
		punchdamagehigh_mod 		=  initial(C.dna.species.punchdamagehigh) * (1 + value * 0.2) - initial(C.dna.species.punchdamagehigh)
		punchstunthreshold_mod 		=  initial(C.dna.species.punchstunthreshold) * (1 + value * 0.1) - initial(C.dna.species.punchdamagehigh)

		C.dna.species.punchdamagelow 		+= punchdamagelow_mod
		C.dna.species.punchdamagehigh 		+= punchdamagehigh_mod
		C.dna.species.punchstunthreshold 	+= punchstunthreshold_mod
	else
		punchdamagelow_mod = 0
		punchdamagehigh_mod = 0
		punchstunthreshold_mod = 0

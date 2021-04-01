/datum/special
	var/stealth_armor_mod = 0
	var/stealthboy_mod = 0
	var/trigger_mines = TRUE
	var/speedmod = 0
	var/strip_visible = TRUE


/datum/special/proc/update_agility(value = _agility)
	_agility = value
	value = trim(value)

	stealth_armor_mod = value * 16
	stealthboy_mod = value * 5
	
	trigger_mines = TRUE
	if(value >= 9)
		trigger_mines = FALSE

	if(iscarbon(holder))
		var/mob/living/carbon/C = holder
		C.dna.species.speedmod -= speedmod
		speedmod = initial(C.dna.species.speedmod) * (1 + value * 0.5) - initial(C.dna.species.speedmod)
		C.dna.species.speedmod += speedmod

	strip_visible = TRUE
	if(value >= 8)
		strip_visible = FALSE

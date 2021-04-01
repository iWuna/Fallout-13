/datum/special
	var/health_mod = 0


/datum/special/proc/update_endurance(value = _endurance)
	_endurance = value
	value = trim(value)

	if(isliving(holder))
		var/mob/living/L = holder
		L.maxHealth -= health_mod
		L.health -= health_mod
		health_mod = initial(L.maxHealth) * (1 + value * 0.05) - initial(L.maxHealth)
		L.health += health_mod
		L.maxHealth += health_mod

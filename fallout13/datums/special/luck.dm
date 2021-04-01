/datum/special
	var/unlucky = TRUE
	var/miss_chance = 0
	var/trash_items_mod = 0


/datum/special/proc/update_luck(value = _luck)
	_luck = value
	value = trim(value)

	trash_items_mod = value
	unlucky = TRUE
	if (value >= 3)
		unlucky = FALSE

	miss_chance = 2 * value + 6.5

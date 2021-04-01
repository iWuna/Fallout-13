/datum/special
	var/can_see_pockets = FALSE

	var/mines_hidden = FALSE
	var/mines_normal = FALSE
	var/mines_visible = FALSE


/datum/special/proc/update_perception(value = _perception)
	_perception = value
	value = trim(value)

	can_see_pockets = FALSE
	if(value > 6)
		can_see_pockets = TRUE
		
	mines_hidden = FALSE
	mines_normal = FALSE
	mines_visible = FALSE
	if(value < 3)
		mines_hidden = TRUE
	else if(value > 3 && value < 7)
		mines_normal = TRUE
	else if(value > 7)
		mines_visible = TRUE

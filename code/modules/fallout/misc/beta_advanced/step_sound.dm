//Fallout 13 - you can't see what's behing, but you can hear it.

/turf
	var/list/step_sounds = list("human" = "footsteps")

/mob/living
	var/step_sounded = FALSE
	var/step_sound_type = null

/mob/living/proc/get_step_sound()
	return step_sound_type

/mob/living/Move(n, direct)
	if(!..())
		return FALSE

	if(!has_gravity(loc))
		return TRUE

	if(buckled)
		return TRUE

	var/mob/living/carbon/human/H = src
	if(istype(H) && !H.shoes)
		return TRUE

	if(step_sounded)
		return TRUE

	if(lying)
		return TRUE

	var/sound_type = get_step_sound()
	if(!sound_type)
		return TRUE

	var/turf/T = get_turf(src)
	if(T.step_sounds[sound_type] && !step_sounded)
		playsound(src, T.step_sounds[sound_type], 60, 0)
		step_sounded = TRUE
		spawn(max(5, src.movement_delay() * 2.1))
			step_sounded = FALSE
	return TRUE

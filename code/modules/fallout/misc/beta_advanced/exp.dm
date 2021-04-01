/datum/experience
	var/current = 0
	var/level = 1
	var/mob/living/carbon/owner
	var/maxLevel = 10

/datum/experience/New(iOwner)
	owner = iOwner

/datum/experience/proc/nextLevel()
	//return 50 + (150 * (level))
	return round((level ** 1.92) * 100) //round to pretty view

/datum/experience/proc/toNextLevel()
	return nextLevel() - current

/*
/datum/experience/proc/levelCap()
	var/maxLevel = 10
*/

/datum/experience/proc/add(XP)
	if(!XP)
		return
	XP *= 2
	// XP *= 0.5 + (owner.special_i / 10)
	current += XP
	to_chat(owner, "<font color='blue'>Вы получили [XP] опыта! ([toNextLevel()] осталось до следующего уровня)</font>")
	if(toNextLevel() > 0)
		playsound(owner, "sound/f13effects/xp_add.ogg", 50)
	else
		if(level < maxLevel)
			promoteLevel()

/datum/experience/proc/promoteLevel()
	level += 1
	to_chat(owner, "<font color='blue'>Вы получили уровень [level]!</font>")
	playsound(owner, "sound/f13effects/xp_newLevel.ogg", 50)
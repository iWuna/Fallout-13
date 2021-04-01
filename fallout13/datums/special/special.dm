/datum/special
	var/_strength 		= 3
	var/_perception 	= 3
	var/_endurance 		= 3
	var/_charisma 		= 3
	var/_intelligence 	= 3
	var/_agility 		= 3
	var/_luck 			= 3

	var/mob/holder


/datum/special/proc/update(strength = null, perception = null, endurance = null, charisma = null, 
						   intelligence = null, agility = null, luck = null)
	if(strength)
		update_strength(strength)
	if(perception)
		update_perception(perception)
	if(endurance)
		update_endurance(endurance)
	if(charisma)
		update_charisma(charisma)
	if(intelligence)
		update_intelligence(intelligence)
	if(agility)
		update_agility(agility)
	if(luck)
		update_luck(luck)


/datum/special/proc/adjust(strength = null, perception = null, endurance = null, charisma = null, 
						   intelligence = null, agility = null, luck = null)
	if(strength)
		update_strength(_strength + strength)
	if(perception)
		update_perception(_perception + perception)
	if(endurance)
		update_endurance(_endurance + endurance)
	if(charisma)
		update_charisma(_charisma + charisma)
	if(intelligence)
		update_intelligence(_intelligence + intelligence)
	if(agility)
		update_agility(_agility + agility)
	if(luck)
		update_luck(_luck + luck)


/datum/special/proc/total()
	return _strength + _perception + _endurance + _charisma + _intelligence + _agility + _luck


/datum/special/proc/trim(value)
	if (value > 9)
		return 9
	if (value < 1)
		return 1
	return value

/datum/special/proc/get_info()
	
	var/msg = "S:[trim(_strength)],P:[trim(_perception)],E:[trim(_endurance)],C:[trim(_charisma)],I:[trim(_intelligence)],A:[trim(_agility)],L:[trim(_luck)]<br>"

	if (_strength < 3)
		msg += "<br>This person looks puny, like a total noodle."
	if (_strength > 7)
		msg += "<br>Simply built out of muscle, they could wrestle a deathclaw to death."

	if (_perception < 3)
		msg += "<br>Even with glasses, an elephant could easily sneak by them."
	if (_perception > 7)
		msg += "<br>A sharp and attentive gaze almost pierces through you, nothing gets past them it seems."

	if (_endurance < 3)
		msg += "<br>It looks like a stiff breeze could tear them in two."
	if (_endurance > 7)
		msg += "<br>As solid as an oak, they look like they could run for miles on end."

	if (_charisma < 3)
		msg += "<br>Staggeringly ugly and awkward, they are about as smooth as pavement."
	if (_charisma > 7)
		msg += "<br>Beautiful and charismatic, you would almost beg to help this person."

	if (_intelligence < 3)
		msg += "<br>They look like they'd struggle to get water out of a boot with instructions printed on the heel."
	if (_intelligence > 7)
		msg += "<br>A bright and careful gaze in their eyes, they seem to know much more than you."

	if (_agility < 3)
		msg += "<br>Maladroit and unbalanced, it is a wonder they can even stand straight."
	if (_agility > 7)
		msg += "<br>Moving like a panther, it is a wonder you have even noticed that they are here."

	if (_luck < 3)
		msg += "<br>Misfortune just seems to stick to them like a fly to shit."
	if (_luck > 7)
		msg += "<br>Somehow you just know that they are as lucky as it gets."

	msg += "<br> *---------**---------*"
	return msg


/datum/special/proc/prayer_info()
	return "Удача: [_luck] Харизма: [_charisma]"


/datum/special/New(mob/owner)
	holder = owner

	update_strength()
	update_perception()
	update_endurance(initial=TRUE)
	update_charisma()
	update_intelligence()
	update_agility()
	update_luck()


/datum/special/proc/from_prefs(datum/preferences/prefs)
	update_strength(prefs.special_s)
	update_perception(prefs.special_p)
	update_endurance(prefs.special_e/*, initial=TRUE*/)  //Возможно починит Выносливость.
	update_charisma(prefs.special_c)
	update_intelligence(prefs.special_i)
	update_agility(prefs.special_a)
	update_luck(prefs.special_l)


/datum/special/Destroy()
	holder = null
	. = ..()
	
proc/scale_agility(time, mob/user)
	var/agility = user.special._agility
	return scale_special(time, agility)


proc/scale_a_i(time, mob/user) // agility, intellect
	var/t = scale_special(time, user.special._agility, 10)
	t = scale_special(t, user.special._intelligence)
	return t
	

proc/scale_special(time, value, coeff=5)
	if(value >= 5)
		return time *(1 - (value - 5)/coeff)
	else if(value <= 5)
		return time *(1 + (5 - value)/coeff)
	else
		return time

/mob/living/simple_animal/hostile/deathclaw/verb/roar()
	set category = "Emote"
	set name = "< ROAR >"
	src.emote("claw_roar")

/mob/living/simple_animal/hostile/deathclaw/verb/roar_idle()
	set category = "Emote"
	set name = "< Roar >"
	src.emote("claw_l_roar")

/mob/living/simple_animal/hostile/deathclaw/verb/taunt()
	set category = "Emote"
	set name = "< Taunt >"
	src.emote("claw_taunt")

/datum/emote/living/roar
	key = "claw_roar"
	key_third_person = "roars"
	message = "roars!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/roar/run_emote(mob/user, params)
	. = ..()
	if(. && isdeathclaw(user))
		playsound(user, pick('sound/f13npc/deathclaw/aggro1.ogg', 'sound/f13npc/deathclaw/aggro2.ogg'), 50, 0)

/datum/emote/living/l_roar
	key = "claw_l_roar"
	key_third_person = "roars"
	message = "roars!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/l_roar/run_emote(mob/user, params)
	. = ..()
	if(. && isdeathclaw(user))
		playsound(user, 'sound/f13npc/deathclaw/idle.ogg', 50, 0)

/datum/emote/living/taunt
	key = "claw_taunt"
	key_third_person = "taunts"
	message = "taunts!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/taunt/run_emote(mob/user, params)
	. = ..()
	if(. && isdeathclaw(user))
		playsound(user, 'sound/f13npc/deathclaw/taunt.ogg', 50, 0)

/mob/living/simple_animal/hostile/deathclaw
	emote_delay = 30
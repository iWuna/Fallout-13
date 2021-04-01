
/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = list(/mob/living)
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "blushes."

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "bows."
	message_param = "bows to %t."
	restraint_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "burps."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "chokes!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/gasp_f_1.ogg', 'sound/voice/human/gasp_f_2.ogg', 'sound/voice/human/gasp_f_3.ogg', 'sound/voice/human/gasp_f_4.ogg', 'sound/voice/human/gasp_f_5.ogg', 'sound/voice/human/gasp_f_6.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/gasp_m_1.ogg', 'sound/voice/human/gasp_m_2.ogg', 'sound/voice/human/gasp_m_3.ogg', 'sound/voice/human/gasp_m_4.ogg', 'sound/voice/human/gasp_m_5.ogg', 'sound/voice/human/gasp_m_6.ogg', 'sound/voice/human/gasp_m_7.ogg'), 50, 0)

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "crosses their arms."
	restraint_check = TRUE

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "chuckles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/chuckle/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender != FEMALE)
				playsound(H, pick('sound/voice/human/chuckle_m_1.ogg'), 50, 0)

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "collapses!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "coughs!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/cough_f_1.ogg', 'sound/voice/human/cough_f_2.ogg', 'sound/voice/human/cough_f_3.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/cough_m_1.ogg', 'sound/voice/human/cough_m_2.ogg', 'sound/voice/human/cough_m_3.ogg'), 50, 0)


/datum/emote/living/cry
	key = "cry"
	key_third_person = "cries"
	message = "cries."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cry/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/cry_f_1.ogg', 'sound/voice/human/cry_f_2.ogg', 'sound/voice/human/cry_f_3.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/cry_m_1.ogg', 'sound/voice/human/cry_m_2.ogg'), 50, 0)

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "dances around happily."
	restraint_check = TRUE

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "seizes up and falls limp, their eyes dead and lifeless..."
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "lets out a flurry of sparks, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, green blood bubbling from its maw..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_simple =  "stops moving..."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && isalienadult(user))
		playsound(user.loc, 'sound/voice/hiss6.ogg', 80, 1, 1)
	else if (ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "human" && (!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, pick('sound/voice/human/goonstation/deathgasp_1.ogg', 'sound/voice/human/goonstation/deathgasp_2.ogg'), 50, 0)
		else if (H.dna.species.id == "supermutant" || H.dna.species.id == "nightkin" && (!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, pick('sound/f13npc/supermutant/death1.ogg', 'sound/f13npc/supermutant/death2.ogg'), 50, 0)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "drools."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "faints."

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "flaps their wings."
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if("wingsopen" in H.dna.species.mutant_bodyparts)
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "flaps their wings ANGRILY!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "frowns."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "gags."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "gasps!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/gasp/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/gasp/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/goonstation/female_dying_gasp_1.ogg', 'sound/voice/human/goonstation/female_dying_gasp_2.ogg', 'sound/voice/human/goonstation/female_dying_gasp_3.ogg', 'sound/voice/human/goonstation/female_dying_gasp_4.ogg', 'sound/voice/human/goonstation/female_dying_gasp_5.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/goonstation/male_dying_gasp_1.ogg', 'sound/voice/human/goonstation/male_dying_gasp_2.ogg', 'sound/voice/human/goonstation/male_dying_gasp_3.ogg', 'sound/voice/human/goonstation/male_dying_gasp_4.ogg', 'sound/voice/human/goonstation/male_dying_gasp_5.ogg'), 50, 0)


/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	message_mime = "giggles silently!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/giggle/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/giggle_f_1.ogg', 'sound/voice/human/giggle_f_2.ogg', 'sound/voice/human/giggle_f_3.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/giggle_m_1.ogg', 'sound/voice/human/giggle_m_2.ogg', 'sound/voice/human/giggle_m_3.ogg'), 50, 0)

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "glares."
	message_param = "glares at %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "scratches."

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "grins."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "groans!"
	message_mime = "appears to groan!"

/datum/emote/living/groan/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/groan_f_1.ogg', 'sound/voice/human/groan_f_2.ogg', 'sound/voice/human/groan_f_3.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/groan_m_1.ogg', 'sound/voice/human/groan_m_2.ogg', 'sound/voice/human/groan_m_3.ogg'), 50, 0)


/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "grimaces."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "jumps!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "blows a kiss."
	message_param = "blows a kiss to %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "laughs."
	message_mime = "laughs silently!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(H.dna.species.id == "supermutant" || H.dna.species.id == "nightkin")
				playsound(H, 'sound/voice/human/laugh_sm_1.ogg', 50, 0)
			else
				if(user.gender == FEMALE)
					playsound(H, 'sound/voice/human/laugh_f_1.ogg', 50, 0)
				else
					playsound(H, pick('sound/voice/human/laugh_m_1.ogg', 'sound/voice/human/laugh_m_2.ogg', 'sound/voice/human/laugh_m_3.ogg'), 50, 0)


/datum/emote/living/moan
	key = "moan"
	key_third_person = "moans"
	message = "moans."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/moan_p/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/moan_f_1.ogg', 'sound/voice/human/moan_f_2.ogg', 'sound/voice/human/moan_f_3.ogg'), 50,0)
			else
				playsound(H, pick('sound/voice/human/moan_m_1.ogg', 'sound/voice/human/moan_m_2.ogg', 'sound/voice/human/moan_m_3.ogg'), 25, 0)


/datum/emote/living/moan_p
	key = "moan_p"
	key_third_person = "moans"
	message = "moans."
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/moan/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/moan_f_1.wav', 'sound/voice/human/moan_f_2.wav', 'sound/voice/human/moan_f_3.wav'), 50,0)


/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "looks."
	message_param = "looks at %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "nods."
	message_param = "nods at %t."

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "points."
	message_param = "points at %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, <span class='userdanger'>falling down</span> in the process!"
				H.Knockdown(20)
			else
				message_param = "<span class='userdanger'>bumps [user.p_their()] head on the ground</span> trying to motion towards %t."
				H.adjustBrainLoss(5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "pouts."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "screams."
	message_mime = "acts out a scream!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/scream/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/scream_f_1.ogg', 'sound/voice/human/scream_f_2.ogg', 'sound/voice/human/scream_f_3.ogg', 'sound/voice/human/goonstation/female_scream.ogg'), 50, 0)
			else
				if(istype(H.w_uniform, /obj/item/clothing/under/jabroni))
					playsound(H, 'sound/voice/human/scream_boss.ogg', 50, 0)
				else
					playsound(H, pick('sound/voice/human/scream_m_1.ogg', 'sound/voice/human/scream_m_2.ogg', 'sound/voice/human/scream_m_3.ogg', 'sound/voice/human/scream_m_4.ogg', 'sound/voice/human/scream_m_5.ogg', 'sound/voice/human/scream_m_6.ogg'), 50, 0)

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "scowls."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "shakes their head."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "shivers."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "sighs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/sigh_f_1.ogg', 'sound/voice/human/sigh_f_2.wav'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/sigh_m_1.ogg', 'sound/voice/human/sigh_m_2.wav'), 50, 0)

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "sits down."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "smiles."

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "sneezes."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sneeze/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, 'sound/voice/human/sneeze.ogg', 50, 0)

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "grins smugly."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "snores."
	message_mime = "sleeps soundly."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/snore/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, pick('sound/voice/human/snore_1.ogg', 'sound/voice/human/snore_2.ogg', 'sound/voice/human/snore_3.ogg', 'sound/voice/human/snore_4.ogg', 'sound/voice/human/snore_1.ogg', 'sound/voice/human/snore_6.ogg', 'sound/voice/human/snore_7.ogg'), 50, 0)

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "stares."
	message_param = "stares at %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "stretches their arms."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "sulks down sadly."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "puts their hands on their head and falls to the ground, they surrender!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Knockdown(200)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "sways around dizzily."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "trembles in fear!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "twitches violently."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "twitches."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "waves."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "whimpers."
	message_mime = "appears hurt."

/datum/emote/living/whimper/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/whimper_f_1.ogg', 'sound/voice/human/whimper_f_2.ogg', 'sound/voice/human/whimper_f_3.ogg'), 50, 0)

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "smiles weakly."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "yawns."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "whistles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/whistle/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, 'sound/voice/human/whistle.ogg', 50, 0)

/datum/emote/living/notice
	key = "fart"
	key_third_person = "farts"
	message = "farts."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/notice
	key = "shakes"
	key_third_person = "shakes"
	message = "shakes."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/notice
	key = "quiver"
	key_third_person = "quivers"
	message = "quivers."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/yawn/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			if(user.gender == FEMALE)
				playsound(H, pick('sound/voice/human/yawn_f_1.ogg', 'sound/voice/human/yawn_f_2.ogg', 'sound/voice/human/yawn_f_3.ogg'), 50, 0)
			else
				playsound(H, pick('sound/voice/human/yawn_m_1.ogg', 'sound/voice/human/yawn_m_2.ogg'), 50, 0)

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	. = TRUE
	if(copytext_char(input,1,5) == "says")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext_char(input,1,9) == "восклицает")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,6) == "yells")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext_char(input,1,5) == "asks")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else
		. = FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(input("Choose an emote to display.") as message|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return
			var/static/regex/slurs = regex("tranny|dyke|kike|pedo|loli|shota", "i")
			if(findtext(custom_emote, slurs))
				//to_chat(user, "<B>Slurs are not allowed on Desert Rose.</B>")
				log_admin("[key_name(user)] has triggered the slur filter in IC (emote): [custom_emote]")
				message_admins("[key_name_admin(user)] has triggered the slur filter in IC (emote): [custom_emote]")
				//return 0 //Uncomment this (and the to_chat line) if we want to prevent them saying it, rather than just alert us.
			message = custom_emote
	else
		var/static/regex/slurs = regex("tranny|dyke|kike|pedo|loli|shota", "i")
		if(findtext(params, slurs))
			//to_chat(user, "<B>Slurs are not allowed on Desert Rose.</B>")
			log_admin("[key_name(user)] has triggered the slur filter in IC (emote): [params]")
			message_admins("[key_name_admin(user)] has triggered the slur filter in IC (emote): [params]")
			//return 0 //Uncomment this (and the to_chat line) if we want to prevent them saying it, rather than just alert us.
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, status_check = FALSE))
			keys += E.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/sound/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."
	sound = 'sound/machines/twobeep.ogg'

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params)
	. = ..()
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You make a circle with your hand.</span>")
	else
		qdel(N)
		to_chat(user, "<span class='warning'>You don't have any free hands to make a circle with.</span>")

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You ready your slapping hand.</span>")
	else
		to_chat(user, "<span class='warning'>You're incapable of slapping in your current state.</span>")


/datum/emote/living/silicon/ping
	key = "ping"
	key_third_person = "pings"
	message = "pings."
	restraint_check = TRUE

/datum/emote/living/silicon/ping/run_emote(mob/user, params)
	. = ..()
	if (issilicon(user))
		playsound(user, 'sound/voice/silicon/ping.ogg', 50, 0)

/datum/emote/living/silicon/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "buzzes."

/datum/emote/living/silicon/buzz/run_emote(mob/user, params)
	. = ..()
	if (issilicon(user))
		playsound(user, 'sound/voice/silicon/buzz1.ogg', 50, 0)

/datum/emote/living/silicon/buzz2
	key = "buzz2"
	key_third_person = "buzzes angrily"
	message = "buzzes angrily."

/datum/emote/living/silicon/buzz2/run_emote(mob/user, params)
	. = ..()
	if (issilicon(user))
		playsound(user, 'sound/voice/silicon/buzz2.ogg', 50, 0)

/datum/emote/living/silicon/ping_yes
	key = "ping_yes"
	key_third_person = "pings"
	message = "pings."

/datum/emote/living/silicon/ping_yes/run_emote(mob/user, params)
	. = ..()
	if (issilicon(user))
		playsound(user, 'sound/voice/silicon/yes.ogg', 50, 0)

/datum/emote/living/silicon/ping_no
	key = "ping_no"
	key_third_person = "pings"
	message = "pings."

/datum/emote/living/silicon/ping_no/run_emote(mob/user, params)
	. = ..()
	if (issilicon(user))
		playsound(user, pick('sound/voice/silicon/no.ogg'), 50, 0)


/datum/emote/living/carbon/human/species/supermutant/h_attack
	key = "h_attack"
	key_third_person = "yell"
	key_third_person = "yells."

/datum/emote/living/carbon/human/species/supermutant/h_attack/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "supermutant" || H.dna.species.id == "nightkin" && (!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, pick('sound/f13npc/supermutant/attack1.ogg', 'sound/f13npc/supermutant/attack2.ogg', 'sound/f13npc/supermutant/attack3.ogg'), 50, 0)

/datum/emote/living/carbon/human/species/supermutant/h_seeyou
	key = "h_seeyou"
	key_third_person = "yell"
	key_third_person = "yells."

/datum/emote/living/carbon/human/species/supermutant/h_seeyou/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "supermutant" || H.dna.species.id == "nightkin" && (!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, pick('sound/f13npc/supermutant/alert1.ogg', 'sound/f13npc/supermutant/alert2.ogg', 'sound/f13npc/supermutant/alert3.ogg', 'sound/f13npc/supermutant/alert4.ogg'), 50, 0)

/datum/emote/living/carbon/human/species/supermutant/h_chat
	key = "h_chat"
	key_third_person = "yell"
	key_third_person = "yells."

/datum/emote/living/carbon/human/species/supermutant/h_chat/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "supermutant" || H.dna.species.id == "nightkin" && (!H.mind || !H.mind.miming) && !user.is_muzzled())
			playsound(H, pick('sound/f13npc/supermutant/idle1.ogg', 'sound/f13npc/supermutant/idle2.ogg', 'sound/f13npc/supermutant/idle3.ogg', 'sound/f13npc/supermutant/idle4.ogg'), 50, 0)

/datum/emote/living/carbon/human/ncr
	key = "ncr_r"



/datum/emote/living/carbon/human/ncr/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/mob/living/carbon/H = user
	if("NCR" in H.faction)
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			H.say("ЭН-СИ-АР!!")


/datum/emote/living/carbon/human/ncr/command
	key = "ncr_c"


/datum/emote/living/carbon/human/ncr/command/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/mob/living/carbon/H = user
	if("NCR" in H.faction)
		if((!H.mind || !H.mind.miming) && !user.is_muzzled())
			for(var/mob/living/carbon/M in view(12))
				if(M != H)
					if("NCR" in M.faction)
						M.say("ЭН-СИ-АР!!")

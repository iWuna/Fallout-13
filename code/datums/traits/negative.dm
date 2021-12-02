//predominantly negative traits

/datum/quirk/blooddeficiency
	name = "Circulatory Insufficiency"
	desc = "Your body can't produce enough blood"
	value = -2
	gain_text = "<span class='danger'>You feel like your strength is disappearing over time.</span>"
	lose_text = "<span class='notice'>You feel cheerful again.</span>"
	medical_record_text = "The patient requires regular treatment of blood loss due to low hematopoiesis."

/datum/quirk/blooddeficiency/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	if(NOBLOOD in H.dna.species.species_traits) //can't lose blood if your species doesn't have any
		return
	else
		quirk_holder.blood_volume -= 0.275


/*
/datum/quirk/depression
	name = "Depression"
	desc = "You sometimes just hate life."
	mob_trait = TRAIT_DEPRESSION
	value = -1
	gain_text = "<span class='danger'>You start feeling depressed.</span>"
	lose_text = "<span class='notice'>You no longer feel depressed.</span>" //if only it were that easy!
	medical_record_text = "Patient has a severe mood disorder causing them to experience sudden moments of sadness."
	mood_quirk = TRUE


/datum/quirk/heavy_sleeper
	name = "Heavy Sleeper"
	desc = "You sleep like a rock! Whenever you're put to sleep, you sleep for a little bit longer."
	value = -1
	mob_trait = TRAIT_HEAVY_SLEEPER
	gain_text = "<span class='danger'>You feel sleepy.</span>"
	lose_text = "<span class='notice'>You feel awake again.</span>"
	medical_record_text = "Patient has abnormal sleep study results and is difficult to wake up."
*/
/datum/quirk/brainproblems
	name = "Schizophrenia"
	desc = "There is a little voice in your brain that is slowly destroying it. Mannitol is the best remedy for treatment."
	value = -3
	gain_text = "<span class='danger'>ALL THIS VOICES HURTS MY MIND, STOP IT!</span>"
	lose_text = "<span class='notice'>I feel myself free...</span>"
	medical_record_text = "The patient have Schizophrenia."

/datum/quirk/brainproblems/on_process()
	quirk_holder.adjustBrainLoss(0.2)

/*
/datum/quirk/nyctophobia
	name = "Nyctophobia"
	desc = "As far as you can remember, you've always been afraid of the dark. While in the dark without a light source, you instinctually act careful, and constantly feel a sense of dread."
	value = -2

/datum/quirk/nyctophobia/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	if(H.dna.species.id in list("shadow", "nightmare"))
		return //we're tied with the dark, so we don't get scared of it; don't cleanse outright to avoid cheese
	var/turf/T = get_turf(quirk_holder)
	var/lums = T.get_lumcount()
	if(lums <= 0.2)
		if(quirk_holder.m_intent == MOVE_INTENT_RUN)
			to_chat(quirk_holder, "<span class='warning'>Easy, easy, take it slow... you're in the dark...</span>")
			quirk_holder.toggle_move_intent()
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "nyctophobia", /datum/mood_event/nyctophobia)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "nyctophobia")
*/


/datum/quirk/nonviolent
	name = "Pacifist"
	desc = "The thought of violence is nauseating. So much so that you can't do damage to any creature."
	value = -3
	mob_trait = TRAIT_PACIFISM
	gain_text = "<span class='danger'>Are you repelled by the thought of violence!</span>"
	lose_text = "<span class='notice'>I can protect myself again.</span>"
	medical_record_text = "The patient is unusually peaceful and cannot bring himself to cause physical harm."

/datum/quirk/nonviolent/on_process()
	if(quirk_holder.mind && LAZYLEN(quirk_holder.mind.antag_datums))
		to_chat(quirk_holder, "<span class='boldannounce'>Your antagonistic nature forced you to abandon pacifism.</span>")
		qdel(src)



/datum/quirk/poor_aim
	name = "Poor Aim"
	desc = "You do not handle the weapon well and cannot shoot so that the bullet hits the target"
	value = -1
	mob_trait = TRAIT_POOR_AIM
	medical_record_text = "У больного сильный тремор в обеих руках."

/datum/quirk/cannotmed
	name = "Traditional medicine lover"
	desc = "You are sure of only one truth. Traditional medicine is cooler than usual."
	value = -3
	mob_trait = TRAIT_MEDEBIL
	locked = FALSE

/*
/datum/quirk/insanity
	name = "Reality Dissociation Syndrome"
	desc = "You suffer from a severe disorder that causes very vivid hallucinations. Mindbreaker toxin can suppress its effects, and you are immune to mindbreaker's hallucinogenic properties. <b>This is not a license to grief.</b>"
	value = -2
	//no mob trait because it's handled uniquely
	gain_text = "<span class='userdanger'>...</span>"
	lose_text = "<span class='notice'>You feel in tune with the world again.</span>"
	medical_record_text = "Patient suffers from acute Reality Dissociation Syndrome and experiences vivid hallucinations."

/datum/quirk/insanity/on_process()
	if(quirk_holder.reagents.has_reagent("mindbreaker"))
		quirk_holder.hallucination = 0
		return
	if(prob(2)) //we'll all be mad soon enough
		madness()

/datum/quirk/insanity/proc/madness()
	quirk_holder.hallucination += rand(10, 25)

/datum/quirk/insanity/post_add() //I don't /think/ we'll need this but for newbies who think "roleplay as insane" = "license to kill" it's probably a good thing to have
	if(!quirk_holder.mind || quirk_holder.mind.special_role)
		return
	to_chat(quirk_holder, "<span class='big bold info'>Please note that your dissociation syndrome does NOT give you the right to attack people or otherwise cause any interference to \
	the round. You are not an antagonist, and the rules will treat you the same as other crewmembers.</span>")
*/


/datum/quirk/social_anxiety
	name = "Social anxiety"
	desc = "It is very difficult for you to talk to people, you often stutter"
	value = -2
	gain_text = "<span class='danger'>I can't concentrate when I'm talking.</span>"
	lose_text = "<span class='notice'>Now i can talk as normal!</span>" //if only it were that easy!
	medical_record_text = "The patient is usually concerned about social contacts and prefers to avoid them."
	var/dumb_thing = TRUE

/datum/quirk/social_anxiety/on_process()
	var/nearby_people = 0
	for(var/mob/living/carbon/human/H in view(5, quirk_holder))
		if(H.client)
			nearby_people++
	var/mob/living/carbon/human/H = quirk_holder
	if(prob(2 + nearby_people))
		H.stuttering = max(3, H.stuttering)
	else if(prob(min(3, nearby_people)) && !H.silent)
		to_chat(H, "<span class='danger'>I don't want to talk, I want to <i>withdraw</i> into myself now.</span>")
		H.silent = max(10, H.silent)
	else if(prob(0.5) && dumb_thing)
		to_chat(H, "<span class='userdanger'>You're thinking about a stupid thing you said years ago.</span>")
		dumb_thing = FALSE //only once per life
		if(prob(1))
			new/obj/item/reagent_containers/food/snacks/pastatomato(get_turf(H)) //now that's what I call spaghetti code

/*
/datum/quirk/underprepared
	name = "Underprepared"
	desc = "You are not suited to a life in the Wastes! Instantly lose 15 maximum health and walk slower on desert tiles."
	value = -3
	mob_trait = TRAIT_UNDERPREPARED
	gain_text = "<span class='notice'>You feel less healthy than usual, and you move a little slower.</span>"
	lose_text = "<span class='danger'>You feel healthier than usual and move a little faster.</span>"

/datum/quirk/underprepared/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += -15
	mob_tar.health += -15
*/

/datum/quirk/wild_wasteland
	name = "Wild Wasteland"
	desc = "A strange thing happened in your life and now you little god slut."
	value = 0
	mob_trait = TRAIT_WILDWASTELAND
	gain_text = "<span class='danger'>I feel myself more interesting for gods...</span>"
	lose_text = "<span class='danger'>Or not?</span>"

/datum/quirk/wild_wasteland/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 5
	mob_tar.health += 5
	message_admins("Let's make [key_name(usr)] life funnier, because he picked WILD WASTELAND perk!")

/datum/quirk/mute
	name = "Muted"
	desc = "You can't talk..."
	value = -1
	mob_trait = TRAIT_MUTE

/datum/quirk/nearsighted //t. errorage
	name = "Nearsighted"
	desc = "You have vision problems, which is why you get a pair of glasses for eyes."
	value = -1
	gain_text = "<span class='danger'>Your eyes hurts.</span>"
	lose_text = "<span class='notice'>I can see again.</span>"
	medical_record_text = "The patient need to wear glasses."

/datum/quirk/nearsighted/add()
	quirk_holder.become_nearsighted(ROUNDSTART_TRAIT)

/datum/quirk/nearsighted/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/glasses/regular/glasses = new(get_turf(H))
	H.put_in_hands(glasses)
	H.equip_to_slot_if_possible(glasses, SLOT_GLASSES)
	H.regenerate_icons() //this is to remove the inhand icon, which persists even if it's not in their hands

/datum/quirk/monochromatic
	name = "Monochromatic"
	desc = "You have complete color blindness and perceive almost the whole world in black and white."
	value = -1
	medical_record_text = "The patient suffers from achromatopsia and sees the whole world in black and white shades."

/datum/quirk/monochromatic/add()
	quirk_holder.add_client_colour(/datum/client_colour/monochrome)

/datum/quirk/monochromatic/post_add()
	if(quirk_holder.mind.assigned_role == "Detective") //Добавить сюда шерифа
		to_chat(quirk_holder, "<span class='boldannounce'>Жизнь была прекрасна... Закат освещает прекрасный летний вечер, в воздухе висит запах свежескошенной травы с газонов, где-то смеются и кричат дети. Дом за рекой... где тебя ждут красавица-жена и чудесная маленькая дочка. Настоящий воздушный замок, ставший реальностью. Вот только если бы воздушные замки не разрушались так быстро, пока на них не смотрят.</span>")
		quirk_holder.playsound_local(quirk_holder, 'sound/ambience/ambidet1.ogg', 50, FALSE)

/datum/quirk/monochromatic/remove()
	if(quirk_holder)
		quirk_holder.remove_client_colour(/datum/client_colour/monochrome)

/datum/quirk/prosthetic_limb
	name = "Prosthetic limb"
	desc = "Now you have prothetic limb instead normal one."
	value = -1
	var/slot_string = "limb"

/datum/quirk/prosthetic_limb/on_spawn()
	var/limb_slot = pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/bodypart/old_part = H.get_bodypart(limb_slot)
	var/obj/item/bodypart/prosthetic
	switch(limb_slot)
		if(BODY_ZONE_L_ARM)
			prosthetic = new/obj/item/bodypart/l_arm/robot/surplus(quirk_holder)
			slot_string = "left arm"
		if(BODY_ZONE_R_ARM)
			prosthetic = new/obj/item/bodypart/r_arm/robot/surplus(quirk_holder)
			slot_string = "right arm"
		if(BODY_ZONE_L_LEG)
			prosthetic = new/obj/item/bodypart/l_leg/robot/surplus(quirk_holder)
			slot_string = "left leg"
		if(BODY_ZONE_R_LEG)
			prosthetic = new/obj/item/bodypart/r_leg/robot/surplus(quirk_holder)
			slot_string = "right leg"
	prosthetic.replace_limb(H)
	qdel(old_part)
	H.regenerate_icons()

/datum/quirk/prosthetic_limb/post_add()
	to_chat(quirk_holder, "<span class='boldannounce'>Now you have ''Rob'co [slot_string] surplus'' instead of your previous limb, \
	use wires and welding instead of ointments and bandages, respectively.</span>")

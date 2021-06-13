//predominantly negative traits

/datum/quirk/blooddeficiency
	name = "Кровеносная Недостаточность"
	desc = "Ваше тело не может вырабатывать достаточно крови"
	value = -2
	gain_text = "<span class='danger'>Вы чувствуете, как ваша силы со временем исчезают.</span>"
	lose_text = "<span class='notice'>Вы снова чувствуете себя бодрым.</span>"
	medical_record_text = "Пациенту требуется регулярное лечение кровопотери из-за низкого кроветворения."

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
	name = "Шизофрения"
	desc = "В вашем мозгу есть маленький друг, который медленно его разрушает. Маннитол лучшее средство для лечения."
	value = -3
	gain_text = "<span class='danger'>Моя голова АДСКИ болит.</span>"
	lose_text = "<span class='notice'>Моя голова больше не болит.</span>"
	medical_record_text = "У пациента опухоль в мозгу, которая медленно ведет к смерти мозга."

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
	name = "Пацифист"
	desc = "Мысль о насилии вызывает тошноту. Настолько, что вы не можете нанести урон любому существу."
	value = -3
	mob_trait = TRAIT_PACIFISM
	gain_text = "<span class='danger'>Вас отталкивает мысль о насилии!</span>"
	lose_text = "<span class='notice'>Я снова могу защитить себя.</span>"
	medical_record_text = "Пациент необычайно миролюбив и не может заставить себя причинить физический вред."

/datum/quirk/nonviolent/on_process()
	if(quirk_holder.mind && LAZYLEN(quirk_holder.mind.antag_datums))
		to_chat(quirk_holder, "<span class='boldannounce'>Ваша антагонистическая натура заставила вас отказаться от пацифизма.</span>")
		qdel(src)



/datum/quirk/poor_aim
	name = "Криворукий"
	desc = "Вы плохо обращаетесь с оружием и не можете выстрелить так, чтобы пуля попала в цель"
	value = -1
	mob_trait = TRAIT_POOR_AIM
	medical_record_text = "У больного сильный тремор в обеих руках."

/datum/quirk/cannotmed
	name = "Традиционалист"
	desc = "Вы уверены только в одной истине. Традиционная медицина круче обычной."
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
	name = "Асоциальный"
	desc = "Вам очень трудно разговаривать с людьми, вы часто заикаетесь"
	value = -2
	gain_text = "<span class='danger'>Не могу сосредоточиться когда говорю.</span>"
	lose_text = "<span class='notice'>Теперь могу говорить нормально.</span>" //if only it were that easy!
	medical_record_text = "Пациент обычно обеспокоен социальными контактами и предпочитает их избегать."
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
		to_chat(H, "<span class='danger'>Не хочу говорить, хочу <i>сейчас</i> уйти в себя.</span>")
		H.silent = max(10, H.silent)
	else if(prob(0.5) && dumb_thing)
		to_chat(H, "<span class='userdanger'>Вы думаете о глупости, которую вы сказали много лет назад.</span>")
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
	name = "Дикая Пустошь"
	desc = "В вашей жизни произошло странное и теперь около вас творится пиздец."
	value = 0
	mob_trait = TRAIT_WILDWASTELAND
	gain_text = "<span class='danger'>Чуствую себя странно.</span>"
	lose_text = "<span class='danger'>Теперь я спокоен.</span>"

/datum/quirk/wild_wasteland/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 5
	mob_tar.health += 5
	message_admins("Расчехляем щитспавнилки, [key_name(usr)] берет перк ДИКАЯ ПУСТОШЬ, НУ-КА ПАМАЦАЕМ!")

/datum/quirk/mute
	name = "Молчаливый"
	desc = "Вы не умеете разговаривать"
	value = -1
	mob_trait = TRAIT_MUTE

/datum/quirk/nearsighted //t. errorage
	name = "Близорукость"
	desc = "У вас проблемы со зрением, из-за чего у вас появляется пара очков для глаз без рецепта."
	value = -1
	gain_text = "<span class='danger'>Глаза болят.</span>"
	lose_text = "<span class='notice'>Начинаю нормально видеть.</span>"
	medical_record_text = "Пациенту требуются очки по рецепту, чтобы противодействовать близорукости."

/datum/quirk/nearsighted/add()
	quirk_holder.become_nearsighted(ROUNDSTART_TRAIT)

/datum/quirk/nearsighted/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/glasses/regular/glasses = new(get_turf(H))
	H.put_in_hands(glasses)
	H.equip_to_slot_if_possible(glasses, SLOT_GLASSES)
	H.regenerate_icons() //this is to remove the inhand icon, which persists even if it's not in their hands

/datum/quirk/monochromatic
	name = "Монохромность"
	desc = "У вас полный дальтонизм и воспринимаете почти весь мир в черно-белых тонах."
	value = -1
	medical_record_text = "Пациент страдает ахроматопсией и видит весь мир в чёрно-белых оттенках."

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
	name = "Протез"
	desc = "Ваша конечность была заменена на протез."
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
	to_chat(quirk_holder, "<span class='boldannounce'>К вашему телу была приделана ''Rob'co [slot_string] surplus'' вместо старой конечности, \
	используйте провода и сварку вместо мазей и бинтов соответственно. Также протез соединён с кровеносной системой, так что \
	рекомендуется устранять поломку конечности как можно быстрее.</span>")

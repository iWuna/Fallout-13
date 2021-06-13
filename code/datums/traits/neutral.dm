//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/no_taste
	name = "Агевзия"
	desc = "Вы не чуствуете вкус еды или реагентов."
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = "<span class='notice'>Не чуствую язык.</span>"
	lose_text = "<span class='notice'>Чуствую язык снова.</span>"
	medical_record_text = "Пациент страдает агевзией и не может пробовать пищу или реагенты."

/datum/quirk/pineapple_liker
	name = "Ананасовый Любитель"
	desc = "Вы очень наслаждаетесь ананасами или продуктами из ананасов."
	value = 0
	gain_text = "<span class='notice'>Хочу сьесть ананас.</span>"
	lose_text = "<span class='notice'>Не чуствую такой привязаности а ананасам.</span>"

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ананасовый Ненавистник"
	desc = "Ананас зло. Блядь вы реально думаете что ананас вкусный?"
	value = 0
	gain_text = "<span class='notice'>Ненавижу ананас.</span>"
	lose_text = "<span class='notice'>Не думаю что ананасы такие уж и плохие.</span>"

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Девиантные Вкусы"
	desc = "Вы не любите пищу, которая нравится большинству людей, и находите вкусной то, что им не нравится."
	value = 0
	gain_text = "<span class='notice'>Странная еда мне нравится больше чем нормальная.</span>"
	lose_text = "<span class='notice'>Теперь я люблю нормальную еду.</span>"

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/family_heirloom
	name = "Семейная Реликвия"
	desc = "Вы - нынешний владелец семейной реликвии, передаваемой из поколения в поколение. Вы должны сохранить реликвию в бзопасности!"
	value = 0
	mood_quirk = TRUE
	var/obj/item/heirloom
	var/where

/datum/quirk/family_heirloom/on_spawn() //Добавить к каждой проффессии реликвию
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/heirloom_type
	switch(quirk_holder.mind.assigned_role)
		if("Clown")
			heirloom_type = /obj/item/bikehorn/golden
		if("Mime")
			heirloom_type = /obj/item/reagent_containers/food/snacks/baguette
		if("Lawyer")
			heirloom_type = /obj/item/gavelhammer
		if("Janitor")
			heirloom_type = /obj/item/mop
		if("Security Officer")
			heirloom_type = /obj/item/book/manual/wiki/security_space_law
		if("Scientist")
			heirloom_type = /obj/item/toy/plush/slimeplushie
		if("Assistant")
			heirloom_type = /obj/item/storage/toolbox/mechanical/old/heirloom
	if(!heirloom_type)
		heirloom_type = pick(
		/obj/item/toy/cards/deck,
		/obj/item/lighter,
		/obj/item/dice/d20)
	heirloom = new heirloom_type(get_turf(quirk_holder))
	var/list/slots = list(
		"в левом кармане" = SLOT_L_STORE,
		"в правом кармане" = SLOT_R_STORE,
		"в сумке" = SLOT_IN_BACKPACK
	)
	where = H.equip_in_one_of_slots(heirloom, slots, FALSE) || "под тобой"

/datum/quirk/family_heirloom/post_add()
	if(where == "в сумке")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)

	to_chat(quirk_holder, "<span class='boldnotice'>[heirloom.name], являющиеся семейной реликвией, сейчас лежит [where]. Сохраните её в безопасности!</span>")
	var/list/family_name = splittext(quirk_holder.real_name, " ")
	heirloom.name = "\improper [family_name[family_name.len]] family [heirloom.name]"

/datum/quirk/family_heirloom/on_process()
	if(heirloom in quirk_holder.GetAllContents())
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "family_heirloom_missing")
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "family_heirloom", /datum/mood_event/family_heirloom)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "family_heirloom")
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "family_heirloom_missing", /datum/mood_event/family_heirloom_missing)

/datum/quirk/family_heirloom/clone_data()
	return heirloom

/datum/quirk/family_heirloom/on_clone(data)
	heirloom = data

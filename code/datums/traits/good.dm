//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "Любитель Выпить"
	desc = "Вы можете выпить больше но не так сильно страдаете от похмелья"
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>Теперь я могу выпивать хоть кеглю пива - буду на ногах.</span>"
	lose_text = "<span class='danger'>Не смогу теперь выпивать больше.</span>"

/datum/quirk/apathetic
	name = "Игнорщик"
	desc = "Вы не обращаете внимания на проблеммы других."
	value = 1
	mood_quirk = TRUE

/datum/quirk/apathetic/add()
	GET_COMPONENT_FROM(mood, /datum/component/mood, quirk_holder)
	if(mood)
		mood.mood_modifier = 0.8

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		GET_COMPONENT_FROM(mood, /datum/component/mood, quirk_holder)
		if(mood)
			mood.mood_modifier = 1 //Change this once/if species get their own mood modifiers.

/datum/quirk/trapper
	name = "Охотник"
	desc = "Как охотник, вы хорошо разбираетесь в разделке животных и можете получить в два раза больше материалов с них."
	value = 2
	mob_trait = TRAIT_TRAPPER
	gain_text = "<span class='notice'>You learn the secrets of butchering!</span>"
	lose_text = "<span class='danger'>You forget how to slaughter animals.</span>"

/datum/quirk/bigleagues
	name = "Силач"
	desc = "Урон от холодного оружия и от кулаков увеличен."
	value = 2
	mob_trait = TRAIT_BIG_LEAGUES
	gain_text = "<span class='notice'>Теперь могу гнуть заборы и крушить, крушить крушить!</span>"
	lose_text = "<span class='danger'>Силушка пропала.</span>"
	locked = TRUE

/datum/quirk/chemwhiz
	name = "Алхимик"
	desc = "Химия это просто! С начала игры вы умеете пользоваться хим раздатчиком"
	value = 2
	mob_trait = TRAIT_CHEMWHIZ
	gain_text = "<span class='notice'>Химия понятна мне.</span>"
	lose_text = "<span class='danger'>Не знаю больше как химикаты смешивать.</span>"
	locked = TRUE
/datum/quirk/pa_wear
	name = "СилоВик"
	desc = "Силовая броня была на вас с самого рождения! С начала игры вы умеете носить силовую броню с сервоприводом"
	value = 3
	mob_trait = TRAIT_PA_WEAR
	gain_text = "<span class='notice'>Умею носить Силовую Броню</span>"
	lose_text = "<span class='danger'>Забыл как носить Силовую Броню.</span>"
	locked = TRUE

/datum/quirk/master_gunsmith
	name = "Оружейник"
	desc = "Вы умеете создавать огнестрел и патроны"
	value = 3
	mob_trait = TRAIT_MASTER_GUNSMITH
	gain_text = "<span class='notice'>Я знаю как делать оружие.</span>"
	lose_text = "<span class='danger'>Забыл как делается оружие.</span>"
	locked = TRUE

/datum/quirk/machine_spirits
	name = "Техножрец"
	desc = "Ваша душа благословлена Духом Машины"
	value = 3
	mob_trait = TRAIT_MACHINE_SPIRITS
	gain_text = "<span class='notice'>Теперь я обучён как управлять Духом Машин.</span>"
	lose_text = "<span class='danger'>Теперь я не знаю как управлять Духом Машин.</span>"
	locked = TRUE

/datum/quirk/magic_hands
	name = "Прямые Руки"
	desc = "Вы эксперт в управлении и стрельбе из дальнобойного и не очень оружия"
	value = 5
	mob_trait = TRAIT_MAGIC_HANDS
	gain_text = "<span class='notice'>Стрельба из оружия это так просто.</span>"
	lose_text = "<span class='danger'>Я плохо стреляю из оружия.</span>"
	locked = FALSE

/datum/quirk/drunkhealing
	name = "Похмельное Лечение"
	desc = "Алкоголь излечивает любой полученый урон"
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>Алкоголь залечивает раны</span>"
	lose_text = "<span class='danger'>Алкоголь не залечивает раны</span>"
	medical_record_text = "Пациент имеет необычно эффективный метаболизм в печени и может медленно восстанавливать раны, употребляя алкогольные напитки."

/datum/quirk/freerunning
	name = "Паркурист"
	desc = "Скорость - залог к выживанию. Перелезание через стол ускорено."
	value = 2
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>Скорость - это жизнь.</span>"
	lose_text = "<span class='danger'>Неуклюжий я снова.</span>"

/datum/quirk/iron_fist
	name = "Кулак Железной Звезды"
	desc = "Урон голыми руками увеличен."
	value = 2
	mob_trait = TRAIT_IRONFIST
	gain_text = "<span class='notice'>Мои кулаки полны ярости!</span>"
	lose_text = "<span class='danger'>Мои руки теперь не так уж и сильны.</span>"
	locked = TRUE

/datum/quirk/iron_fist/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow = 3
	mob_tar.dna.species.punchdamagehigh = 10

/datum/quirk/jolly
	name = "Клоун"
	desc = "Вам иногда бывает весело"
	value = 1
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE

/datum/quirk/hard_yards
	name = "Жёсткостопый"
	desc = "Ваша жизнь была нелёгкой, теперь это вам поможет"
	value = 3
	mob_trait = TRAIT_HARD_YARDS
	gain_text = "<span class='notice'>Моя походка теперь твёрдая.</span>"
	lose_text = "<span class='danger'>Вы идете менее уверенной походкой, и земля почему-то кажется менее твердой.</span>"
	locked = TRUE

/datum/quirk/lifegiver
	name = "Здоровый"
	desc = "Вы здоровее остальных! Ваше здоровье увелинечно на 15 от начального состояния"
	value = 3
	mob_trait = TRAIT_LIFEGIVER
	gain_text = "<span class='notice'>Чуствую себя более живым</span>"
	lose_text = "<span class='danger'>Чуствую себя немного хуже</span>"

/datum/quirk/lifegiver/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 15
	mob_tar.health += 15

/datum/quirk/light_step
	name = "Лёгкая Походка"
	desc = "Ваши шаги менее слышны а звук наступления на осколок приглушён"
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>Я стал более тихим.</span>"
	lose_text = "<span class='danger'>Я стал более громким.</span>"

/datum/quirk/selfaware
	name = "Самосознание"
	desc = "Вы хорошо знаете себя и можете точно оценить ранения."
	value = 2
	mob_trait = TRAIT_SELF_AWARE

/datum/quirk/skittish
	name = "Норовистый"
	desc = "Вы можете мгновенно прятаться в шкафы и ящики. Удерживая Ctrl, щелкните закрытый шкафчик, чтобы запрыгнуть в него, если у вас есть доступ."
	value = 1
	mob_trait = TRAIT_SKITTISH

/datum/quirk/spiritual
	name = "Верующий"
	desc = "Вы верите в богов, и ваши молитвы могут быть услышаны с большей вероятностью. Или нет."
	value = 1
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>Я думаю что сегодня меня господь услышит.</span>"
	lose_text = "<span class='danger'>Я думаю что боги не слышат больше меня.</span>"

/datum/quirk/voracious
	name = "Прожорливый"
	desc = "Ваша жизнь это еда! Вы едите в два раза быстрее"
	value = 1
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>Я ГОЛОДЕН.</span>"
	lose_text = "<span class='danger'>Я не ГОЛОДЕН.</span>"

///////////////////
//////FL13 weapons traits!
///DO NOT USE IMPLANTS.
///Grenades
/datum/quirk/grenadesloot
	name = "Любитель Вечеринок"
	desc = "Кто знает что внутри"
	value = 3
	var/obj/item/heirloom ///SPAGETH CODE DON'T LEAVE TO REMOVE THE NAME.
	var/where

/datum/quirk/grenadesloot/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/heirloom_type  ///DONT CHANGE HERILOOM STUFF FOR SOME REASON DONT WORK IF YOU REMOVE IT AAAAA.
	switch(quirk_holder.mind.assigned_role)
		if("Sentinel", "Centurion", "Sheriff", "NCR Captain", "Overseer")
			heirloom_type = pick(/obj/item/grenade/flashbang, 200 ; /obj/item/grenade/smokebomb, 200 ; /obj/item/grenade/plastic)
		else
			heirloom_type = pick(
				300 ; /obj/item/grenade/smokebomb,
				200 ; /obj/item/grenade/empgrenade,
				200 ; /obj/item/grenade/flashbang,
				/obj/item/grenade/plastic)
	heirloom = new heirloom_type(get_turf(quirk_holder)) //IF YOU CHANGE THIS FOR SOME REASON WILL NOT WORK.
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE, //SPAWNS IN THE POCKETS
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK	//SPAWNS IN THE BACKPACK

	)
	where = H.equip_in_one_of_slots(heirloom, slots, FALSE) || "at your feet"

/datum/quirk/grenadesloot/post_add()
	if(where == "in your backpack")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H) //GOD BLESS SPAGETHY CODE!
///TO DO: TEST IT WITH BOXES LIKE MEDKITS/NORMALS BOXES.
///ADD MORE EQUIPMENT TRAITS REEEE
///IMPROVE MY ENGLISH

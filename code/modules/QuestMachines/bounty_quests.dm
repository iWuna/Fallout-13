/*
	Quest contain information about items needs to complete them.
	And reward in caps
*/
/datum/bounty_quest
	var/name = "Default Quest Name"
	var/desc = "Default Quest Description"
	var/employer = "Default Employer"

	/* This items needs to complete this quest */
	var/list/target_items = list()

	/* How many caps will spawned after quest complete */
	var/caps_reward = 10

	/* Will show to player, when quest is complete */
	var/end_message = "*бип-бип* Отправка успешна. Выдача награды."

	var/need_message = "Need some items"

	var/employer_icon_folder = "icons/bounty_employers/"

	var/employer_icon = "employer_00.png"

/datum/bounty_quest/proc/ItsATarget(var/target)
	for(var/target_type in target_items)
		if(istype(target, target_type))
			return 1
	return 0

/datum/bounty_quest/proc/GetIconWithPath()
	return text2path("[employer_icon_folder][employer_icon]")

/datum/bounty_quest/faction/wasteland/qst_0
	name = "Проблемы с био материалом"
	desc = "Надеюсь нас кто слышит! У нас прорыв в исследовании радиации! Гули... их разум... В общем у нас закончился био материал и мы заплатим за 5 туш гулей, живых или мертвых."
	employer = "Ученые Наварро"
	employer_icon = "employer_00.png"
	need_message = "5 гулей"
	end_message = "Отлично! Прекрасные образцы! Отправляем вам ваши деньги."
	target_items = list(/mob/living/simple_animal/hostile/ghoul = 5)
	caps_reward = 850

/datum/bounty_quest/faction/wasteland/qst_1
	name = "Химия, химия, бочки!"
	employer = "Лаборатория токсичных отходов"
	employer_icon = "employer_00.png"
	need_message = "Бочка с химикатами - 1 шт."
	target_items = list(/obj/structure/reagent_dispensers/barrel/dangerous = 1)
	caps_reward = 280

/datum/bounty_quest/faction/wasteland/qst_2
	name = "Прихватите флейту"
	employer = "Биологи Анклава"
	employer_icon = "employer_00.png"
	desc = "Анклав на связи, у нас есть черновая работа для вас. Нашему научному отделу необходимы новые испытуемые, а именно кротокрысы."
	need_message = "Кротокрысы - 2 шт."
	end_message = "О да, эти маленькие дряни то что нам нужно. Какая у вас там валюта? Крышки вроде?"
	target_items = list(/mob/living/simple_animal/hostile/molerat = 2)
	caps_reward = 60

/datum/bounty_quest/faction/wasteland/qst_3
	name = "Гуляш"
	employer = "Ученые Наварро"
	employer_icon = "employer_00.png"
	need_message = "Гуль - 1 шт."
	desc = "Анклав на связи. Нам необходимы мутанты для очередных опытов. Конечно мы могли бы похитить кого-то из вас, но сегодня ваш день, потому что нам нужны гули."
	end_message = "Итан! Прибей эту мразь! Так, оплата, вот ваши 200 крышек."
	target_items = list(/mob/living/simple_animal/hostile/ghoul = 1)
	caps_reward = 200

/datum/bounty_quest/faction/wasteland/qst_4
	name = "Молчание - Золото"
	employer = "Джо"
	employer_icon = "employer_00.png"
	need_message = "Человеческие языки - 3 шт."
	desc = "Тут мне поступил специфический заказ. На органы. Необходимо отправить три языка. Оплата приличная."
	target_items = list(/obj/item/organ/tongue = 3)
	caps_reward = 930

/datum/bounty_quest/faction/wasteland/qst_5
	name = "Когти, смертельные когти"
	employer = "Ученые Братства"
	employer_icon = "employer_00.png"
	need_message = "Коготь смерти - 1 шт."
	target_items = list(/mob/living/simple_animal/hostile/deathclaw = 1)
	caps_reward = 304

/datum/bounty_quest/faction/wasteland/qst_6
	name = "Кожа да кости"
	employer = "Охотники"
	employer_icon = "employer_00.png"
	need_message = "Шкуры животных - 5 шт."
	target_items = list(/obj/item/stack/sheet/animalhide = 5)
	caps_reward = 103

/datum/bounty_quest/faction/wasteland/qst_7
	name = "Секс в большом городе"
	employer = "ERP-75"
	employer_icon = "employer_00.png"
	need_message = "Человеческие тела - 5 шт."
	target_items = list(/mob/living/carbon/human = 5)
	caps_reward = 324

/datum/bounty_quest/faction/wasteland/qst_8
	name = "Один коготь хорошо, два - пизда."
	employer = "Ученые Братства"
	employer_icon = "employer_00.png"
	need_message = "Коготь смерти - 2 шт."
	target_items = list(/mob/living/simple_animal/hostile/deathclaw = 2)
	caps_reward = 712

/datum/bounty_quest/faction/wasteland/qst_9
	name = "Снова в школу"
	employer = "Школа гулей"
	employer_icon = "employer_00.png"
	need_message = "Листы бумаги - 20 шт."
	target_items = list(/obj/item/paper = 20)
	caps_reward = 78

/datum/bounty_quest/faction/wasteland/qst_10
	name = "Хрущёв и кукуруза."
	employer = "Беженцы"
	employer_icon = "employer_08.png"
	need_message = "Кукуруза - 10 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/corn = 10)
	caps_reward = 59

/datum/bounty_quest/faction/wasteland/qst_11
	name = "Большая Премьера"
	employer = "Беженцы"
	employer_icon = "employer_08.png"
	need_message = "Кукуруза - 30 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/corn = 30)
	caps_reward = 204

/datum/bounty_quest/faction/wasteland/qst_12
	name = "Зайкина радость"
	employer = "Беженцы"
	employer_icon = "employer_08.png"
	need_message = "Морковка - 10 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/carrot = 10)
	caps_reward = 75

/datum/bounty_quest/faction/wasteland/qst_13
	name = "Кушать хочется."
	employer = "Беженцы"
	employer_icon = "employer_00.png"
	need_message = "Морковка - 30 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/carrot = 30)
	caps_reward = 302

/datum/bounty_quest/faction/wasteland/qst_14
	name = "Ямайка, родная."
	employer = "Приют Юный Рейдер"
	employer_icon = "employer_00.png"
	need_message = "Лист Канабиса - 10 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/cannabis = 10)
	caps_reward = 302

/datum/bounty_quest/faction/wasteland/qst_15
	name = "Полный расколбас"
	employer = "Приют Юный Рейдер"
	employer_icon = "employer_00.png"
	need_message = "Лист Канабиса - 30 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/cannabis = 30)
	caps_reward = 1203

/datum/bounty_quest/faction/wasteland/qst_16
	name = "Бонд с кнопкой"
	employer = "Приют Юный Рейдер"
	employer_icon = "employer_00.png"
	need_message = "Лист Табака - 10 шт."
	target_items = list(/obj/item/reagent_containers/food/snacks/grown/tobacco = 10)
	caps_reward = 167

/datum/bounty_quest/faction/wasteland/qst_17
	name = "Безумно можно быть первым."
	employer = "Утилизаторы"
	employer_icon = "employer_00.png"
	need_message = "Волк - 3 шт."
	target_items = list(/mob/living/simple_animal/hostile/wolf = 3)
	caps_reward = 164

/datum/bounty_quest/faction/wasteland/qst_18
	name = "Не порежься"
	employer = "Мусорщики"
	employer_icon = "employer_00.png"
	need_message = "Осколки стекла - 10 шт."
	target_items = list(/obj/item/shard = 10)
	caps_reward = 91

/datum/bounty_quest/faction/wasteland/qst_19
	name = "Царь Скорпионов"
	employer = "Врачи Наварро"
	employer_icon = "employer_00.png"
	need_message = "Скорпионы - 2 шт."
	target_items = list(/mob/living/simple_animal/hostile/radscorpion  = 2)
	caps_reward = 152

/datum/bounty_quest/faction/wasteland/qst_20
	name = "Ядерная вошка"
	employer = "Смотритель убежища"
	desc = "На связи убежище 113, нам нужно плутониевое ядро. Платим очень щедро. Предположительно одно находится в вашем районе, под зданием Волт-Тек."
	employer_icon = "employer_00.png"
	need_message = "Плутоний - 1 шт."
	target_items = list(/obj/item/nuke_core = 1)
	caps_reward = 6500
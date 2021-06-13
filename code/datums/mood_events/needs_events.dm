//nutrition
/datum/mood_event/nutrition/fat
	description = "<span class='warning'><B>Слишком много сьел еды</B></span>\n" //muh fatshaming
	mood_change = -4

/datum/mood_event/nutrition/wellfed
	description = "<span class='nicegreen'>Поел и доволен</span>\n"
	mood_change = 6

/datum/mood_event/nutrition/fed
	description = "<span class='nicegreen'>Недавно перекусил</span>\n"
	mood_change = 3

/datum/mood_event/nutrition/hungry
	description = "<span class='warning'>Поесть бы</span>\n"
	mood_change = -8

/datum/mood_event/nutrition/starving
	description = "<span class='boldwarning'>Хочу жрать</span>\n"
	mood_change = -15

//HYDRATION - by Woona
/datum/mood_event/hydration/full
	description = "<span class='warning'><B>Напился сильно</B></span>\n" //muh fatshaming
	mood_change = -8

/datum/mood_event/hydration/med
	description = "<span class='nicegreen'>Напился</span>\n"
	mood_change = 6

/datum/mood_event/hydration/low_med
	description = "<span class='nicegreen'>Выпил бы воды</span>\n"
	mood_change = 3

/datum/mood_event/hydration/low
	description = "<span class='warning'>Выпил бы реку</span>\n"
	mood_change = -8

/datum/mood_event/hydration/very_low
	description = "<span class='boldwarning'>Водыыыы</span>\n"
	mood_change = -15

//Disgust
/datum/mood_event/disgust/gross
	description = "<span class='warning'>Это было отстойно</span>\n"
	mood_change = -2

/datum/mood_event/disgust/verygross
	description = "<span class='warning'>Ужасное было увидено мной</span>\n"
	mood_change = -5

/datum/mood_event/disgust/disgusted
	description = "<span class='boldwarning'>ПОЧЕМУ ЭТО ТАК СТРАШНО</span>\n"
	mood_change = -8

//Generic needs events
/datum/mood_event/favorite_food
	description = "<span class='nicegreen'>Сьел вкусную еду</span>\n"
	mood_change = 3
	timeout = 2400

/datum/mood_event/gross_food
	description = "<span class='nicegreen'>Еда на вкус так себе</span>\n"
	mood_change = -2
	timeout = 2400

/datum/mood_event/disgusting_food
	description = "<span class='nicegreen'>Еда на вкус отвратительна</span>\n"
	mood_change = -4
	timeout = 2400

/datum/mood_event/nice_shower
	description = "<span class='nicegreen'>Я помылся</span>\n"
	mood_change = 2
	timeout = 1800

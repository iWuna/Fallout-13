/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////// DRINKS BELOW, Beer is up there though, along with cola. Cap'n Pete's Cuban Spiced Rum////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/reagent/consumable/orangejuice
	name = "Orange Juice"
	id = "orangejuice"
	description = "Both delicious AND rich in Vitamin C, what more do you need?"
	color = "#E78108" // rgb: 231, 129, 8
	taste_description = "oranges"
	glass_icon_state = "glass_orange"
	glass_name = "glass of orange juice"
	glass_desc = "Vitamins! Yay!"
	hydration_factor = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/orangejuice/on_mob_life(mob/living/carbon/M)
	if(M.getOxyLoss() && prob(30))
		M.adjustOxyLoss(-1, 0)
		. = 1
	..()

/datum/reagent/consumable/tomatojuice
	name = "Tomato Juice"
	id = "tomatojuice"
	description = "Tomatoes made into juice. What a waste of big, juicy tomatoes, huh?"
	color = "#731008" // rgb: 115, 16, 8
	taste_description = "tomatoes"
	glass_icon_state = "glass_red"
	glass_name = "glass of tomato juice"
	glass_desc = "Are you sure this is tomato juice?"

/datum/reagent/consumable/tomatojuice/on_mob_life(mob/living/carbon/M)
	if(M.getFireLoss() && prob(20))
		M.heal_bodypart_damage(0,1, 0)
		. = 1
	..()

/datum/reagent/consumable/limejuice
	name = "Lime Juice"
	id = "limejuice"
	description = "The sweet-sour juice of limes."
	color = "#365E30" // rgb: 54, 94, 48
	taste_description = "unbearable sourness"
	glass_icon_state = "glass_green"
	glass_name = "glass of lime juice"
	glass_desc = "A glass of sweet-sour lime juice."

/datum/reagent/consumable/limejuice/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1*REM, 0)
		. = 1
	..()

/datum/reagent/consumable/carrotjuice
	name = "Carrot Juice"
	id = "carrotjuice"
	description = "It is just like a carrot but without crunching."
	color = "#973800" // rgb: 151, 56, 0
	taste_description = "carrots"
	glass_icon_state = "carrotjuice"
	glass_name = "glass of  carrot juice"
	glass_desc = "It's just like a carrot but without crunching."
	hydration_factor = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/carrotjuice/on_mob_life(mob/living/carbon/M)
	M.adjust_blurriness(-1)
	M.adjust_blindness(-1)
	switch(current_cycle)
		if(1 to 20)
			//nothing
		if(21 to INFINITY)
			if(prob(current_cycle-10))
				M.cure_nearsighted(list(EYE_DAMAGE))
	..()
	return

/datum/reagent/consumable/berryjuice
	name = "Berry Juice"
	id = "berryjuice"
	description = "A delicious blend of several different kinds of berries."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "berries"
	glass_icon_state = "berryjuice"
	glass_name = "glass of berry juice"
	glass_desc = "Berry juice. Or maybe it's jam. Who cares?"

/datum/reagent/consumable/applejuice
	name = "Apple Juice"
	id = "applejuice"
	description = "The sweet juice of an apple, fit for all ages."
	color = "#ECFF56" // rgb: 236, 255, 86
	taste_description = "apples"

/datum/reagent/consumable/mutjuice
	name = "Mutfruit Juice"
	id = "mutjuice"
	description = "The sweet-salty juice of the mutfruit."
	color = "#660099"
	taste_description = "sweet and salty"
	glass_name = "glass of mutfruit juice"
	glass_desc = "A glass of sweet-salty mutfruit juice."

/datum/reagent/consumable/mutjuice/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(50))
		M.heal_bodypart_damage(0,1, 0)
		. = 1
	..()

/datum/reagent/consumable/poisonberryjuice
	name = "Poison Berry Juice"
	id = "poisonberryjuice"
	description = "A tasty juice blended from various kinds of very deadly and toxic berries."
	color = "#863353" // rgb: 134, 51, 83
	taste_description = "berries"
	glass_icon_state = "poisonberryjuice"
	glass_name = "glass of berry juice"
	glass_desc = "Berry juice. Or maybe it's poison. Who cares?"

/datum/reagent/consumable/poisonberryjuice/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(1, 0)
	. = 1
	..()

/datum/reagent/consumable/watermelonjuice
	name = "Watermelon Juice"
	id = "watermelonjuice"
	description = "Delicious juice made from watermelon."
	color = "#863333" // rgb: 134, 51, 51
	taste_description = "juicy watermelon"
	glass_icon_state = "glass_red"
	glass_name = "glass of watermelon juice"
	glass_desc = "A glass of watermelon juice."
	hydration_factor = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/lemonjuice
	name = "Lemon Juice"
	id = "lemonjuice"
	description = "This juice is VERY sour."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "sourness"
	glass_icon_state  = "lemonglass"
	glass_name = "glass of lemon juice"
	glass_desc = "Sour..."

/datum/reagent/consumable/banana
	name = "Banana Juice"
	id = "banana"
	description = "The raw essence of a banana."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "banana"
	glass_icon_state = "banana"
	glass_name = "glass of banana juice"
	glass_desc = "The raw essence of a banana."

/datum/reagent/consumable/banana/on_mob_life(mob/living/carbon/M)
	if((ishuman(M) && M.job == "Clown") || ismonkey(M))
		M.heal_bodypart_damage(1,1, 0)
		. = 1
	..()

/datum/reagent/consumable/yuccajuice
	name = "Yucca Juice"
	id = "yuccajuice"
	description = "The raw essence of a	banana yucca."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "sand and bunker-air"
	glass_icon_state = "banana"
	glass_name = "glass of yucca juice"
	glass_desc = "A wastelanders favourite."

/datum/reagent/consumable/nothing
	name = "Nothing"
	id = "nothing"
	description = "Absolutely nothing."
	taste_description = "nothing"
	glass_icon_state = "nothing"
	glass_name = "nothing"
	glass_desc = "Absolutely nothing."
	shot_glass_icon_state = "shotglass"

/datum/reagent/consumable/nothing/on_mob_life(mob/living/carbon/M)
	if(ishuman(M) && M.job == "Mime")
		M.heal_bodypart_damage(1,1, 0)
		. = 1
	..()

/* Begone, foul meme chemical
/datum/reagent/consumable/laughter
	name = "Laughter"
	id = "laughter"
	description = "Some say that this is the best medicine, but recent studies have proven that to be untrue."
	metabolization_rate = INFINITY
	color = "#FF4DD2"
	taste_description = "laughter"
*/

/datum/reagent/consumable/laughter/on_mob_life(mob/living/carbon/M)
	M.emote("laugh")
	..()

/datum/reagent/consumable/superlaughter
	name = "Super Laughter"
	id = "superlaughter"
	description = "Funny until you're the one laughing."
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	color = "#FF4DD2"
	taste_description = "laughter"

/datum/reagent/consumable/superlaughter/on_mob_life(mob/living/carbon/M)
	if(prob(30))
		M.visible_message("<span class='danger'>[M] bursts out into a fit of uncontrollable laughter!</span>", "<span class='userdanger'>You burst out in a fit of uncontrollable laughter!</span>")
		M.Stun(5)
	..()

/datum/reagent/consumable/potato_juice
	name = "Potato Juice"
	id = "tato"
	description = "Juice of the potato. Bleh."
	nutriment_factor = 2 * REAGENTS_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "irish sadness"
	glass_icon_state = "glass_brown"
	glass_name = "glass of potato juice"
	glass_desc = "Bleh..."

/datum/reagent/consumable/tato_juice
	name = "Tato Juice"
	id = "tatojuice"
	description = "Juice of the tato. Smells like bad eggs"
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "rotten ketchup"
	glass_icon_state = "glass_brown"
	glass_name = "glass of tato juice"
	glass_desc = "Juice of the tato. Smells like bad eggs"

/datum/reagent/consumable/grapejuice
	name = "Grape Juice"
	id = "grapejuice"
	description = "The juice of a bunch of grapes. Guaranteed non-alcoholic."
	color = "#290029" // dark purple
	taste_description = "grape soda"

/datum/reagent/consumable/milk
	name = "Milk"
	id = "milk"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	color = "#DFDFDF" // rgb: 223, 223, 223
	taste_description = "milk"
	glass_icon_state = "glass_white"
	glass_name = "glass of milk"
	glass_desc = "White and nutritious goodness!"
/*
/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_CALCIUM_HEALER))
		M.heal_bodypart_damage(1.5,0, 0)
		. = 1
	else
		if(M.getBruteLoss() && prob(20))
			M.heal_bodypart_damage(1,0, 0)
			. = 1
	if(holder.has_reagent("capsaicin"))
		holder.remove_reagent("capsaicin", 2)
	..()
*/
/datum/reagent/consumable/soymilk
	name = "Soy Milk"
	id = "soymilk"
	description = "An opaque white liquid made from soybeans."
	color = "#DFDFC7" // rgb: 223, 223, 199
	taste_description = "soy milk"
	glass_icon_state = "glass_white"
	glass_name = "glass of soy milk"
	glass_desc = "White and nutritious soy goodness!"

/datum/reagent/consumable/soymilk/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	..()

/datum/reagent/consumable/cream
	name = "Cream"
	id = "cream"
	description = "The fatty, still liquid part of milk. Why don't you mix this with sum scotch, eh?"
	color = "#DFD7AF" // rgb: 223, 215, 175
	taste_description = "creamy milk"
	glass_icon_state  = "glass_white"
	glass_name = "glass of cream"
	glass_desc = "Ewwww..."

/datum/reagent/consumable/cream/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	..()

/datum/reagent/consumable/coffee
	name = "Coffee"
	id = "coffee"
	description = "Coffee is a brewed drink prepared from roasted seeds, commonly called coffee beans, of the coffee plant."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = 80
	taste_description = "bitterness"
	glass_icon_state = "coffee"
	glass_name = "mug of coffee"
	glass_desc = "Don't drop it, or you'll send scalding liquid and ceramic shards everywhere."

/datum/reagent/consumable/coffee/overdose_process(mob/living/M)
	M.Jitter(5)
	..()

/datum/reagent/consumable/coffee/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/mocha
	name = "Mocha"
	id = "mocha"
	description = "A delicious mix of coffee and chocolate. Also known as a caffe mocha or mochaccino."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	overdose_threshold = 80
	taste_description = "creamy chocolate and strong coffee"
	glass_icon_state = "chocolateglass"
	glass_name = "mocha"
	glass_desc = "A delicious mix of coffee and chocolate. Also known as a caffe mocha or mochaccino."

/datum/reagent/consumable/mocha/overdose_process(mob/living/M)
	M.Jitter(5)
	..()

/datum/reagent/consumable/mocha/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/icemocha
	name = "Iced Mocha"
	id = "icemocha"
	description = "Chilled mocha, refreshing and invigorating."
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "smooth chocolate and icy coffee"
	glass_icon_state = "chocolateglass"
	glass_name = "iced mocha"
	glass_desc = "Chilled mocha, refreshing and invigorating."

/datum/reagent/consumable/icecoffee/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.Jitter(5)
	..()
	. = 1

/datum/reagent/consumable/bawls
	name = "Balls Guarana"
	id = "bawls"
	description = "For that Guarana Bounce!"
	color = "#494A82"
	taste_description = "insanely sweet coffee"
	glass_icon_state = "bawlsglass"
	glass_name = "glass of Balls Guarana"
	glass_desc = "Beverage of the Balls Guarana Company."

/datum/reagent/consumable/bawls/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/tea
	name = "Tea"
	id = "tea"
	description = "Tasty black tea, it has antioxidants, it's good for you!"
	color = "#101000" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "tart black tea"
	glass_icon_state = "teaglass"
	glass_name = "glass of tea"
	glass_desc = "Drinking it from here would not seem right."
	hydration_factor = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/tea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/lemonade
	name = "Lemonade"
	id = "lemonade"
	description = "Sweet, tangy lemonade. Good for the soul."
	color = "#FFE978"
	taste_description = "sunshine and summertime"
	glass_icon_state = "lemonpitcher"
	glass_name = "pitcher of lemonade"
	glass_desc = "This drink leaves you feeling nostalgic for some reason."
	hydration_factor = 4 * REAGENTS_METABOLISM

/datum/reagent/consumable/icecoffee
	name = "Iced Coffee"
	id = "icecoffee"
	description = "Coffee and ice, refreshing and cool."
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "bitter coldness"
	glass_icon_state = "icedcoffeeglass"
	glass_name = "iced coffee"
	glass_desc = "A drink to perk you up and refresh you!"

/datum/reagent/consumable/icecoffee/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.Jitter(5)
	..()
	. = 1

/datum/reagent/consumable/icetea
	name = "Iced Tea"
	id = "icetea"
	description = "No relation to a certain rap artist/actor."
	color = "#104038" // rgb: 16, 64, 56
	nutriment_factor = 0
	taste_description = "sweet tea"
	glass_icon_state = "icedteaglass"
	glass_name = "iced tea"
	glass_desc = "All natural, antioxidant-rich flavour sensation."

/datum/reagent/consumable/icetea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.AdjustSleeping(-40, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/space_cola
	name = "Cola"
	id = "cola"
	description = "A refreshing beverage."
	color = "#100800" // rgb: 16, 8, 0
	taste_description = "cola"
	glass_icon_state  = "glass_brown"
	glass_name = "glass of Space Cola"
	glass_desc = "A glass of refreshing Space Cola."
	hydration_factor = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/space_cola/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-5)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/nuka_cola
	name = "Nuka Cola"
	id = "nuka_cola"
	description = "Cola, cola never changes."
	color = "#100800" // rgb: 16, 8, 0
	taste_description = "the future"
	glass_icon_state = "nukacolaglass"
	glass_name = "Nuka Cola"
	glass_desc = "Don't cry, Don't raise your eye, It's only nuclear wasteland."
	hydration_factor = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/nuka_cola/on_mob_life(mob/living/carbon/M)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/sunset
	name = "Sunset Sarsaparilla"
	id = "sunset"
	description = "Build Mass With Sass!"
	color = "#994C00" // rgb: 153, 76, 0
	taste_description = "root beer, vanilla and caramel"
	glass_icon_state = "sunsetglass"
	glass_name = "glass of Sunset Sarsaparilla"
	glass_desc = "Beverage of the West Coast."
	hydration_factor = 2 * REAGENTS_METABOLISM

/datum/reagent/consumable/sunset/on_mob_life(mob/living/carbon/M)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1


/datum/reagent/consumable/spacemountainwind
	name = "SM Wind"
	id = "spacemountainwind"
	description = "Blows right through you like a space wind."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "sweet citrus soda"
	glass_icon_state = "Space_mountain_wind_glass"
	glass_name = "glass of Space Mountain Wind"
	glass_desc = "Space Mountain Wind. As you know, there are no mountains in space, only wind."

/datum/reagent/consumable/spacemountainwind/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-7)
	M.AdjustSleeping(-20, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.Jitter(5)
	..()
	. = 1

/datum/reagent/consumable/dr_gibb
	name = "Dr. Gibb"
	id = "dr_gibb"
	description = "A delicious blend of 42 different flavours."
	color = "#102000" // rgb: 16, 32, 0
	taste_description = "cherry soda" // FALSE ADVERTISING
	glass_icon_state = "dr_gibb_glass"
	glass_name = "glass of Dr. Gibb"
	glass_desc = "Dr. Gibb. Not as dangerous as the glass_name might imply."

/datum/reagent/consumable/dr_gibb/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-6)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/space_up
	name = "Space-Up"
	id = "space_up"
	description = "Tastes like a hull breach in your mouth."
	color = "#00FF00" // rgb: 0, 255, 0
	taste_description = "cherry soda"
	glass_icon_state = "space-up_glass"
	glass_name = "glass of Space-Up"
	glass_desc = "Space-up. It helps you keep your cool."


/datum/reagent/consumable/space_up/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/lemon_lime
	name = "Lemon Lime"
	description = "A tangy substance made of 0.5% natural citrus!"
	id = "lemon_lime"
	color = "#8CFF00" // rgb: 135, 255, 0
	taste_description = "tangy lime and lemon soda"
	glass_icon_state = "glass_yellow"
	glass_name = "glass of lemon-lime"
	glass_desc = "You're pretty certain a real fruit has never actually touched this."


/datum/reagent/consumable/lemon_lime/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/pwr_game
	name = "Pwr Game"
	description = "The only drink with the PWR that true gamers crave."
	id = "pwr_game"
	color = "#9385bf" // rgb: 58, 52, 75
	taste_description = "sweet and salty tang"
	glass_icon_state = "glass_red"
	glass_name = "glass of Pwr Game"
	glass_desc = "Goes well with a Vlad's salad."

/datum/reagent/consumable/pwr_game/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/shamblers
	name = "Shambler's Juice"
	description = "~Shake me up some of that Shambler's Juice!~"
	id = "shamblers"
	color = "#f00060" // rgb: 94, 0, 38
	taste_description = "carbonated metallic soda"
	glass_icon_state = "glass_red"
	glass_name = "glass of Shambler's juice"
	glass_desc = "Mmm mm, shambly."

/datum/reagent/consumable/shamblers/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-8 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
/datum/reagent/consumable/sodawater
	name = "Soda Water"
	id = "sodawater"
	description = "A can of club soda. Why not make a scotch and soda?"
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "carbonated water"
	glass_icon_state = "glass_clear"
	glass_name = "glass of soda water"
	glass_desc = "Soda water. Why not make a scotch and soda?"

/datum/reagent/consumable/sodawater/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/tonic
	name = "Tonic Water"
	id = "tonic"
	description = "It tastes strange but at least the quinine keeps the Space Malaria at bay."
	color = "#0064C8" // rgb: 0, 100, 200
	taste_description = "tart and fresh"
	glass_icon_state = "glass_clear"
	glass_name = "glass of tonic water"
	glass_desc = "Quinine tastes funny, but at least it'll keep that Space Malaria away."

/datum/reagent/consumable/tonic/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ice
	name = "Ice"
	id = "ice"
	description = "Frozen water, your dentist wouldn't like you chewing this."
	reagent_state = SOLID
	color = "#619494" // rgb: 97, 148, 148
	taste_description = "ice"
	glass_icon_state = "iceglass"
	glass_name = "glass of ice"
	glass_desc = "Generally, you're supposed to put something else in there too..."

/datum/reagent/consumable/ice/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/soy_latte
	name = "Soy Latte"
	id = "soy_latte"
	description = "A nice and tasty beverage while you are reading your hippie books."
	color = "#664300" // rgb: 102, 67, 0
	taste_description = "creamy coffee"
	glass_icon_state = "soy_latte"
	glass_name = "soy latte"
	glass_desc = "A nice and refreshing beverage while you're reading."

/datum/reagent/consumable/soy_latte/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.SetSleeping(0, FALSE)
	M.adjust_bodytemperature(5 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	M.Jitter(5)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/cafe_latte
	name = "Cafe Latte"
	id = "cafe_latte"
	description = "A nice, strong and tasty beverage while you are reading."
	color = "#664300" // rgb: 102, 67, 0
	taste_description = "bitter cream"
	glass_icon_state = "cafe_latte"
	glass_name = "cafe latte"
	glass_desc = "A nice, strong and refreshing beverage while you're reading."

/datum/reagent/consumable/cafe_latte/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.SetSleeping(0, FALSE)
	M.adjust_bodytemperature(5 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	M.Jitter(5)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/doctor_delight
	name = "The Doctor's Delight"
	id = "doctorsdelight"
	description = "A gulp a day keeps the Medibot away! A mixture of juices that heals most damage types fairly quickly at the cost of hunger."
	color = "#FF8CFF" // rgb: 255, 140, 255
	taste_description = "homely fruit"
	glass_icon_state = "doctorsdelightglass"
	glass_name = "Doctor's Delight"
	glass_desc = "The space doctor's favorite. Guaranteed to restore bodily injury; side effects include cravings and hunger."

/datum/reagent/consumable/doctor_delight/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.5, 0)
	M.adjustFireLoss(-0.5, 0)
	M.adjustToxLoss(-0.5, 0)
	M.adjustOxyLoss(-0.5, 0)
	if(M.nutrition && (M.nutrition - 2 > 0))
		if(!(M.mind && M.mind.assigned_role == "Medical Doctor")) //Drains the nutrition of the holder. Not medical doctors though, since it's the Doctor's Delight!
			M.nutrition -= 2
	..()
	. = 1

/datum/reagent/consumable/chocolatepudding
	name = "Chocolate Pudding"
	id = "chocolatepudding"
	description = "A great dessert for chocolate lovers."
	color = "#800000"
	nutriment_factor = 4 * REAGENTS_METABOLISM
	taste_description = "sweet chocolate"
	glass_icon_state = "chocolatepudding"
	glass_name = "chocolate pudding"
	glass_desc = "Tasty."

/datum/reagent/consumable/vanillapudding
	name = "Vanilla Pudding"
	id = "vanillapudding"
	description = "A great dessert for vanilla lovers."
	color = "#FAFAD2"
	nutriment_factor = 4 * REAGENTS_METABOLISM
	taste_description = "sweet vanilla"
	glass_icon_state = "vanillapudding"
	glass_name = "vanilla pudding"
	glass_desc = "Tasty."

/datum/reagent/consumable/cherryshake
	name = "Cherry Shake"
	id = "cherryshake"
	description = "A cherry flavored milkshake."
	color = "#FFB6C1"
	nutriment_factor = 4 * REAGENTS_METABOLISM
	taste_description = "creamy cherry"
	glass_icon_state = "cherryshake"
	glass_name = "cherry shake"
	glass_desc = "A cherry flavored milkshake."

/datum/reagent/consumable/bluecherryshake
	name = "Blue Cherry Shake"
	id = "bluecherryshake"
	description = "An exotic milkshake."
	color = "#00F1FF"
	nutriment_factor = 4 * REAGENTS_METABOLISM
	taste_description = "creamy blue cherry"
	glass_icon_state = "bluecherryshake"
	glass_name = "blue cherry shake"
	glass_desc = "An exotic blue milkshake."

/datum/reagent/consumable/pumpkin_latte
	name = "Pumpkin Latte"
	id = "pumpkin_latte"
	description = "A mix of pumpkin juice and coffee."
	color = "#F4A460"
	nutriment_factor = 3 * REAGENTS_METABOLISM
	taste_description = "creamy pumpkin"
	glass_icon_state = "pumpkin_latte"
	glass_name = "pumpkin latte"
	glass_desc = "A mix of coffee and pumpkin juice."

/datum/reagent/consumable/gibbfloats
	name = "Gibb Floats"
	id = "gibbfloats"
	description = "Ice cream on top of a Dr. Gibb glass."
	color = "#B22222"
	nutriment_factor = 3 * REAGENTS_METABOLISM
	taste_description = "creamy cherry"
	glass_icon_state = "gibbfloats"
	glass_name = "Gibbfloat"
	glass_desc = "Dr. Gibb with ice cream on top."

/datum/reagent/consumable/pumpkinjuice
	name = "Pumpkin Juice"
	id = "pumpkinjuice"
	description = "Juiced from real pumpkin."
	color = "#FFA500"
	taste_description = "pumpkin"

/datum/reagent/consumable/blumpkinjuice
	name = "Blumpkin Juice"
	id = "blumpkinjuice"
	description = "Juiced from real blumpkin."
	color = "#00BFFF"
	taste_description = "a mouthful of pool water"

/datum/reagent/consumable/triple_citrus
	name = "Triple Citrus"
	id = "triple_citrus"
	description = "A solution."
	color = "#C8A5DC"
	taste_description = "extreme bitterness"
	glass_icon_state = "triplecitrus" //needs own sprite mine are trash
	glass_name = "glass of triple citrus"
	glass_desc = "A mixture of citrus juices. Tangy, yet smooth."

/datum/reagent/consumable/grape_soda
	name = "Grape soda"
	id = "grapesoda"
	description = "Beloved of children and teetotalers."
	color = "#E6CDFF"
	taste_description = "grape soda"
	glass_name = "glass of grape juice"
	glass_desc = "It's grape (soda)!"

/datum/reagent/consumable/milk/chocolate_milk
	name = "Chocolate Milk"
	id = "chocolate_milk"
	description = "Milk for cool kids."
	color = "#7D4E29"
	taste_description = "chocolate milk"

/datum/reagent/consumable/menthol
	name = "Menthol"
	id = "menthol"
	description = "Alleviates coughing symptoms one might have."
	color = "#80AF9C"
	taste_description = "mint"
	glass_icon_state = "glass_green"
	glass_name = "glass of menthol"
	glass_desc = "Tastes naturally minty, and imparts a very mild numbing sensation."

/datum/reagent/consumable/grenadine
	name = "Gustov Grenadine"
	id = "grenadine"
	description = "A sticky pre-war bottle of fruit syrup, Also known as grenadine."
	color = "#EA1D26"
	taste_description = "sweet pomegranates"
	glass_name = "glass of grenadine"
	glass_desc = "Delicious flavored syrup."

/datum/reagent/consumable/parsnipjuice
	name = "Parsnip Juice"
	id = "parsnipjuice"
	description = "Why..."
	color = "#FFA500"
	taste_description = "parsnip"
	glass_name = "glass of parsnip juice"

/datum/reagent/consumable/whitebeetjuice
	name = "White Beet Juice"
	id = "whitebeetjuice"
	description = "Why..."
	color = "#f5f2d0"
	taste_description = "white beets"
	glass_name = "glass of white beet juice"
	glass_desc = "Why..."

/datum/reagent/consumable/pineapplejuice
	name = "Pineapple Juice"
	id = "pineapplejuice"
	description = "Tart, tropical, and hotly debated."
	color = "#F7D435"
	taste_description = "tangy pineapple"
	glass_name = "glass of pineapple juice"
	glass_desc = "Tart, tropical, and hotly debated."

/datum/reagent/consumable/cream_soda
	name = "Cream Soda"
	id = "creamsoda"
	description = "A classic space-American vanilla flavored soft drink."
	color = "#dcb137"
	quality = DRINK_VERYGOOD
	taste_description = "fizzy vanilla"
	glass_icon_state = "cream_soda"
	glass_name = "Cream Soda"
	glass_desc = "A classic space-American vanilla flavored soft drink."

/datum/reagent/consumable/vim
	name = "Vim"
	id = "vim"
	description = "You've Got Vim!"
	color = "#946B4A"
	taste_description = "off-brand nuka-cola"
	glass_icon_state = "vimglass"
	glass_name = "glass of Vim"
	glass_desc = "Unrelated to Nuka-Cola, Vim trademark Circa 2077."

/datum/reagent/consumable/vim/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.5, 0)
	M.adjustOxyLoss(0.5, 0)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/vimquartz
	name = "Vim Quartz"
	id = "vimquartz"
	description = "You've Got Vim! Quartz edition, worse than the Imitation."
	color = "#946B4A"
	taste_description = "off-brand nuka-cola but fucking worse"
	glass_icon_state = "vimquartzglass"
	glass_name = "Vim Quartz"
	glass_desc = "You've Got Vim! Quartz edition, worse than the Imitation."

/datum/reagent/consumable/vimquartz/on_mob_life(mob/living/carbon/M)
	M.vomit(10)
	M.adjustToxLoss(-2, 0)
	M.adjustOxyLoss(4, 0)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/vimrefresh
	name = "Vim Refresh"
	id = "vimrefresh"
	description = "You've Got Vim Refresh! Ooooh!"
	color = "#BFAC9C"
	taste_description = "off-brand nuka-cola and refreshment"
	glass_icon_state = "grasshopper"
	glass_name = "Vim Refresh"
	glass_desc = "You've Got Vim Refresh! Ooooh!"

/datum/reagent/consumable/vimrefresh/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-1.5*REM, 0)
	M.adjustToxLoss(-1.5, 0)
	M.adjustOxyLoss(1, 0)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/vimice
	name = "Vim Ice"
	id = "vimice"
	description = "You've Got Vim! Cold as the East."
	color = "#DFECED"
	taste_description = "cold off-brand nuka-cola"
	glass_icon_state = "vimiceglass"
	glass_name = "Iced Vim"
	glass_desc = "You've Got Vim! Cold as the East."

/datum/reagent/consumable/vimice/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-40 * TEMPERATURE_DAMAGE_COEFFICIENT, T0C)
	M.adjustFireLoss(-2*REM, 0)
	M.adjustOxyLoss(1, 0)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	//310.15 is the normal bodytemp.

	..()
	. = 1

//nuka bases

/datum/reagent/consumable/nukacherry
	name = "Nuka Cherry"
	id = "nukacherry"
	description = "Nuka-Cola with a Cherry Aftertaste."
	color = "#9C1512"
	taste_description = "fizzy cherry soda"
	glass_icon_state = "nukacherryglass"
	glass_name = "Nuka Cherry"
	glass_desc = "Nuka-Cola with a Cherry Aftertaste."

/datum/reagent/consumable/nukacherry/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-1*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukagrape
	name = "Nuka Grape"
	id = "nukagrape"
	description = "Nuka-Cola with a Grape Aftertaste."
	color = "#643B65"
	taste_description = "fizzy grape soda"
	glass_icon_state = "nukagrapeglass"
	glass_name = "Nuka Grape"
	glass_desc = "Nuka-Cola with a Grape Aftertaste."

/datum/reagent/consumable/nukagrape/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukaorange
	name = "Nuka Orange"
	id = "nukaorange"
	description = "Nuka-Cola with a Orange Aftertaste."
	color = "#FF7F00"
	taste_description = "fizzy orange soda"
	glass_icon_state = "nukaorangeglass"
	glass_name = "Nuka Orange"
	glass_desc = "Nuka-Cola with a Orange Aftertaste."

/datum/reagent/consumable/nukaorange/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukaquartz
	name = "Nuka Quartz"
	id = "nukaquartz"
	description = "An abomination of Americas favourite soda."
	color = "#FFFFFF"
	taste_description = "clear"
	glass_icon_state = "nukaquartzglass"
	glass_name = "Nuka Quartz"
	glass_desc = "An abomination of Americas favourite soda."

/datum/reagent/consumable/nukaquartz/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-1*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukaice
	name = "Iced Nuka"
	id = "nukaice"
	description = "Nuka. Stay frosty."
	color = "#646A7B"
	taste_description = "cold Nuka-Cola"
	glass_icon_state = "nukaiceglass"
	glass_name = "Iced Nuka"
	glass_desc = "Nuka. Stay frosty."

/datum/reagent/consumable/nukaice/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-20 * TEMPERATURE_DAMAGE_COEFFICIENT, T0C) //310.15 is the normal bodytemp.
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukawild
	name = "Nuka Wild"
	id = "nukawild"
	description = "A totally original concept of Nuka-Cola!"
	color = "#734517"
	taste_description = "Nuka and root-beer"
	glass_icon_state = "nukawildglass"
	glass_name = "Nuka Wild"
	glass_desc = "A totally original concept of Nuka-Cola!"

/datum/reagent/consumable/nukawild/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-5, 0)
	M.AdjustKnockdown(-5, 0)
	M.AdjustUnconscious(-5, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

//nuka mixes

/datum/reagent/consumable/nukanew
	name = "Newka Cola"
	id = "nukanew"
	description = "The tastiest Hybridisation of Nuka-Colas."
	color = "#75E11D"
	taste_description = "impossibly tasty Nuka"
	glass_icon_state = "nukanewglass"
	glass_name = "Newka Cola"
	glass_desc = "The tastiest Hybridisation of Nuka-Colas."

/datum/reagent/consumable/nukanew/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-2*REM, 0)
	M.AdjustStun(-15, 0)
	M.AdjustKnockdown(-15, 0)
	M.AdjustUnconscious(-15, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukaberry
	name = "Nuka Berry"
	id = "nukaberry"
	description = "Nuka-Cola with a Berry Aftertaste."
	color = "#753453"
	taste_description = "berry Nuka-Cola"
	glass_icon_state = "nukaberryglass"
	glass_name = "Nuka Berry"
	glass_desc = "Nuka-Cola with a Berry Aftertaste."

/datum/reagent/consumable/nukaberry/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-2*REM, 0)
	M.adjustBruteLoss(-2*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukacooler
	name = "Nuka Cooler"
	id = "nukacooler"
	description = "Insanely cold Nuka-Cola, Freezing the air that surrounds it."
	color = "#B2B2B2"
	taste_description = "insanely cold Nuka-Cola"
	glass_icon_state = "nukacoolerglass"
	glass_name = "Nuka Cooler"
	glass_desc = "Insanely cold Nuka-Cola, Freezing the air that surrounds it."

/datum/reagent/consumable/nukacooler/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-60 * TEMPERATURE_DAMAGE_COEFFICIENT, T0C) //310.15 is the normal bodytemp.
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukafree
	name = "Diet Nuka"
	id = "nukafree"
	description = "Nuka-Cola with no added sugars!"
	color = "#663300"
	taste_description = "watered down Nuka"
	glass_icon_state = "nukafreeglass"
	glass_name = "Diet Nuka"
	glass_desc = "Nuka-Cola with no added sugars!"

/datum/reagent/consumable/nukafree/on_mob_life(mob/living/carbon/M)
	if(M.nutrition <= NUTRITION_LEVEL_STARVING)
		M.adjustToxLoss(1*REM, 0)
	M.nutrition = max(M.nutrition - 3, 0)
	M.overeatduration = 0
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/nukafrutti
	name = "Nuka Frutti"
	id = "nukafrutti"
	description = "The frutiest of Nukas."
	color = "#FF9ABF"
	taste_description = "fruity Nuka"
	glass_icon_state = "nukafruttiglass"
	glass_name = "Nuka Frutti"
	glass_desc = "The frutiest of Nukas."

/datum/reagent/consumable/nukafrutti/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-3*REM, 0)
	M.adjustFireLoss(-3*REM, 0)
	M.adjustBruteLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

//fallout teas

/datum/reagent/consumable/agavetea
	name = "Agave Tea"
	id = "agavetea"
	description = "A soothing herbal rememedy steeped from the Agave Plant. Inhibits increased healing of burns and sores."
	color = "#FFFF91"
	nutriment_factor = 0
	hydration_factor = 1 * REAGENTS_METABOLISM
	taste_description = "bitterness"
	glass_icon_state = "tea"
	glass_name = "Agave Tea"
	glass_desc = "A soothing herbal rememedy steeped from the Agave Plant. Inhibits increased healing of burns and sores."

/datum/reagent/consumable/agavetea/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-3*REM, 0)
	M.nutrition = max(M.nutrition - 3, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/broctea
	name = "Broc Tea"
	id = "broctea"
	description = "A soothing herbal rememedy steeped from the Broc Flower. Increases the clearance and flow of airways."
	color = "#FF6347"
	nutriment_factor = 0
	hydration_factor = 2 * REAGENTS_METABOLISM
	taste_description = "bitterness"
	glass_icon_state = "tea"
	glass_name = "Broc Tea"
	glass_desc = "A soothing herbal rememedy steeped from the Broc Flower. Increases the clearance and flow of airways."

/datum/reagent/consumable/broctea/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-4*REM, 0)
	M.nutrition = max(M.nutrition - 3, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/coyotetea
	name = "Coyote Tea"
	id = "coyotetea"
	description = "A smokey herbal rememedy steeped from coyote tobacco stems. Natural caffeines keep the drinker alert and awake while numbing the senses."
	color = "#008000"
	nutriment_factor = 0
	hydration_factor = 1 * REAGENTS_METABOLISM
	taste_description = "smoke"
	glass_icon_state = "coyotetea"
	glass_name = "Coyote Tea"
	glass_desc = "A smokey herbal rememedy steeped from coyote tobacco stems. Natural caffeines keep the drinker alert and awake while numbing the senses."

/datum/reagent/consumable/coyotetea/on_mob_life(mob/living/carbon/M)
	if(prob(10))
		var/smoke_message = pick("You feel relaxed.", "You feel calmed.","You feel alert.","You feel rugged.")
		to_chat(M, "<span class='notice'>[smoke_message]</span>")
	M.AdjustStun(-40, 0)
	M.AdjustKnockdown(-40, 0)
	M.AdjustUnconscious(-40, 0)
	M.adjustStaminaLoss(-1*REM, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/feratea
	name = "Barrel Tea"
	id = "feratea"
	description = "A sour and dry rememedy steeped from barrel cactus fruit. Detoxifies the user through natural filteration and dehydration."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	glass_name = "Barrel Tea"
	glass_desc = "A sour and dry rememedy steeped from barrel cactus fruit. Detoxifies the user through natural filteration and dehydration."

/datum/reagent/consumable/feratea/on_mob_life(mob/living/carbon/M)
	if(prob(80))
		M.Dizzy(-2)
		M.Jitter(-2)
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R != src)
			M.reagents.remove_reagent(R.id,2.5)
	if(M.health > 20)
		M.adjustToxLoss(-3*REM, 0)
		. = 1
	M.radiation += 0.1
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/pricklytea
	name = "Prickly Tea"
	id = "pricklytea"
	description = "A sweet and fruitfel rememedy steeped from barrel cactus fruit. Keeps you on edge."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "sweetness"
	glass_icon_state = "cafe_latte"
	glass_name = "Prickly Tea"
	glass_desc = "A sour and dry rememedy steeped from barrel cactus fruit. Keeps you on edge."

/datum/reagent/consumable/pricklytea/on_mob_life(mob/living/carbon/M)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/xandertea
	name = "Xander Tea"
	id = "xandertea"
	description = "A engaging herbal rememedy steeped from blitzed Xander root. Detoxifies and replenishes the bodies blood supply."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "earthy"
	glass_icon_state = "coffee"
	glass_name = "Xander Tea"
	glass_desc = "A engaging herbal rememedy steeped from blitzed Xander root. Detoxifies and replenishes the bodies blood supply."

/datum/reagent/consumable/xandertea/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(BLOOD_VOLUME_NORMAL, M.blood_volume + 3)
	M.adjustToxLoss(-4*REM, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

//shake shack royal rumble

/datum/reagent/consumable/nukafloat
	name = "Nuka Float"
	id = "nukafloat"
	description = "A delicious blend of ice-cream and classic Nuka-Cola!"
	color = "#11111E"
	nutriment_factor = 10
	taste_description = "creamy Nuka"
	glass_icon_state = "nukafloatglass"
	glass_name = "Nuka Float"
	glass_desc = "A delicious blend of ice-cream and classic Nuka-Cola!"

/datum/reagent/consumable/nukafloat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/sunsetfloat
	name = "Sunset Float"
	id = "sunsetfloat"
	description = "A delicious blend of ice-cream and classic Sunset Sass!"
	color = "#734517"
	nutriment_factor = 10
	taste_description = "creamy root beer"
	glass_icon_state = "sunsetfloatglass"
	glass_name = "Sunset Float"
	glass_desc = "A delicious blend of ice-cream and classic Sunset Sass!"

/datum/reagent/consumable/sunsetfloat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/bawlsshake
	name = "Bawls Shake"
	id = "bawlsshake"
	description = "A blended shake consumed by those on high energy blitz-lifestyles."
	color = "#0070E1"
	nutriment_factor = 10
	taste_description = "creamy sugar"
	glass_icon_state = "bawlsshakeglass"
	glass_name = "Bawls Shake"
	glass_desc = "A blended shake consumed by those on high energy blitz-lifestyles."

/datum/reagent/consumable/bawlsshake/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/jakeshake
	name = "Jake Shake"
	id = "jakeshake"
	description = "Jakes patented shake of Jake."
	color = "#7ABB5F"
	nutriment_factor = 10
	taste_description = "creamy patented juice"
	glass_icon_state = "jakeshakeglass"
	glass_name = "Jake Shake"
	glass_desc ="Jakes patented shake of Jake."

/datum/reagent/consumable/jakeshake/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/sweetwaterfloat
	name = "Sweetwater Float"
	id = "sweetwaterfloat"
	description = "The sweetest water."
	color = "#FAFAF8"
	nutriment_factor = 10
	taste_description = "the sweetest water"
	glass_icon_state = "sweetwaterfloatglass"
	glass_name = "Sweetwater Float"
	glass_desc = "The sweetest water."

/datum/reagent/consumable/sweetwaterfloat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/sunsetter
	name = "Sunsetter"
	id = "sunsetter"
	description = "For when the days dawn, lest brings a brighter tommorrow."
	color = "#B06A24"
	nutriment_factor = 10
	taste_description = "days gone by"
	glass_icon_state = "sunsetterglass"
	glass_name = "Sunsetter"
	glass_desc = "For when the days dawn, lest brings a brighter tommorrow."

/datum/reagent/consumable/sunsetter/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/yuccashake
	name = "Yucca Shake"
	id = "yuccashake"
	description = "A blended shake consisting of yucca and creamy goodness."
	color = "#FFD24A"
	nutriment_factor = 10
	taste_description = "bannanas and cream"
	glass_icon_state = "yuccashakeglass"
	glass_name = "Yucca Shake"
	glass_desc = "A blended shake consisting of yucca and creamy goodness."

/datum/reagent/consumable/yuccashake/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-10 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

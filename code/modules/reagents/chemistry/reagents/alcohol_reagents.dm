#define ALCOHOL_THRESHOLD_MODIFIER 0.05 //Greater numbers mean that less alcohol has greater intoxication potential
#define ALCOHOL_RATE 0.005 //The rate at which alcohol affects you
#define ALCOHOL_EXPONENT 1.6 //The exponent applied to boozepwr to make higher volume alcohol atleast a little bit damaging.

////////////// I don't know who made this header before I refactored alcohols but I'm going to fucking strangle them because it was so ugly, holy Christ
// ALCOHOLS //
//////////////

/datum/reagent/consumable/ethanol
	name = "Ethanol"
	id = "ethanol"
	description = "A well-known alcohol with a variety of applications."
	color = "#404030" // rgb: 64, 64, 48
	nutriment_factor = 0
	hydration_factor = 1 * REAGENTS_METABOLISM
	taste_description = "alcohol"
	var/boozepwr = 65 //Higher numbers equal higher hardness, higher hardness equals more intense alcohol poisoning

/*
Boozepwr Chart
Note that all higher effects of alcohol poisoning will inherit effects for smaller amounts (i.e. light poisoning inherts from slight poisoning)
In addition, severe effects won't always trigger unless the drink is poisonously strong
All effects don't start immediately, but rather get worse over time; the rate is affected by the imbiber's alcohol tolerance
0: Non-alcoholic
1-10: Barely classifiable as alcohol - occassional slurring
11-20: Slight alcohol content - slurring
21-30: Below average - imbiber begins to look slightly drunk
31-40: Just below average - no unique effects
41-50: Average - mild disorientation, imbiber begins to look drunk
51-60: Just above average - disorientation, vomiting, imbiber begins to look heavily drunk
61-70: Above average - small chance of blurry vision, imbiber begins to look smashed
71-80: High alcohol content - blurry vision, imbiber completely shitfaced
81-90: Extremely high alcohol content - heavy toxin damage, passing out
91-100: Dangerously toxic - swift death
*/

/datum/reagent/consumable/ethanol/on_mob_life(mob/living/carbon/C)
	if(C.drunkenness < volume * boozepwr * ALCOHOL_THRESHOLD_MODIFIER)
		var/booze_power = boozepwr
		if(C.has_trait(TRAIT_ALCOHOL_TOLERANCE)) //we're an accomplished drinker
			booze_power *= 0.7
		C.drunkenness = max((C.drunkenness + (sqrt(volume) * booze_power * ALCOHOL_RATE)), 0) //Volume, power, and server alcohol rate effect how quickly one gets drunk
		var/obj/item/organ/liver/L = C.getorganslot(ORGAN_SLOT_LIVER)
		if (istype(L))
			C.applyLiverDamage((max(sqrt(volume) * (boozepwr ** ALCOHOL_EXPONENT) * L.alcohol_tolerance, 0))/150)
	return ..()

/datum/reagent/consumable/ethanol/reaction_obj(obj/O, reac_volume)
	if(istype(O, /obj/item/paper))
		var/obj/item/paper/paperaffected = O
		paperaffected.clearpaper()
		to_chat(usr, "<span class='notice'>[paperaffected]'s ink washes away.</span>")
	if(istype(O, /obj/item/book))
		if(reac_volume >= 5)
			var/obj/item/book/affectedbook = O
			affectedbook.dat = null
			O.visible_message("<span class='notice'>[O]'s writing is washed away by [name]!</span>")
		else
			O.visible_message("<span class='warning'>[O]'s ink is smeared by [name], but doesn't wash away!</span>")
	return

/datum/reagent/consumable/ethanol/reaction_mob(mob/living/M, method=TOUCH, reac_volume)//Splashing people with ethanol isn't quite as good as fuel.
	if(!isliving(M))
		return

	if(method in list(TOUCH, VAPOR, PATCH))
		M.adjust_fire_stacks(reac_volume / 15)

		if(iscarbon(M))
			var/mob/living/carbon/C = M
			var/power_multiplier = boozepwr / 65 // Weak alcohol has less sterilizing power

			for(var/s in C.surgeries)
				var/datum/surgery/S = s
				S.success_multiplier = max(0.1*power_multiplier, S.success_multiplier)
				// +10% success propability on each step, useful while operating in less-than-perfect conditions
	return ..()

/datum/reagent/consumable/ethanol/beer
	name = "Beer"
	id = "beer"
	description = "An alcoholic beverage brewed since ancient times on Old Earth. Still popular today."
	color = "#664300" // rgb: 102, 67, 0
	nutriment_factor = 1 * REAGENTS_METABOLISM
	boozepwr = 25
	taste_description = "piss water"
	glass_name = "glass of beer"
	glass_desc = "A freezing pint of beer. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/arnold_palmer
	name = "Arnold Palmer"
	id = "arnold_palmer"
	description = "A pre-war golfers classic, reduced to ashes now but their drink lives on!"
	color = "#D2815B"
	boozepwr = 10
	taste_description = "tea and lemonade"
	glass_icon_state = "longislandicedteaglass"
	glass_name = "Arnold Palmer" //tgheads riot
	glass_desc = "A pre-war golfers classic, reduced to ashes now but their drink lives on! S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/arnold_palmer/on_mob_life(mob/living/carbon/M)
	if(prob(5))
		to_chat(M, "<span class = 'notice'>[pick("You remember to square your shoulders.","You remember to keep your head down.","You can't decide between squaring your shoulders and keeping your head down.","You remember to relax.","You think about how someday you'll get two strokes off your golf game.")]</span>")
	..()
	. = 1

/datum/reagent/consumable/ethanol/beer/green
	name = "Green Beer"
	id = "greenbeer"
	description = "An alcoholic beverage brewed since ancient times on Old Earth. This variety is dyed a festive green."
	color = "#A8E61D"
	taste_description = "green piss water"
	glass_icon_state = "greenbeerglass"
	glass_name = "glass of green beer"
	glass_desc = "A freezing pint of green beer. Festive."

/datum/reagent/consumable/ethanol/beer/green/on_mob_life(mob/living/carbon/M)
	if(M.color != color)
		M.add_atom_colour(color, TEMPORARY_COLOUR_PRIORITY)
	return ..()

/datum/reagent/consumable/ethanol/beer/green/on_mob_delete(mob/living/M)
	M.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY, color)

/datum/reagent/consumable/ethanol/kahlua
	name = "Kahlua"
	id = "kahlua"
	description = "A widely known, Mexican coffee-flavoured liqueur. In production since 1936!"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 45
	glass_icon_state = "kahluaglass"
	glass_name = "glass of RR coffee liquor"
	glass_desc = "A widely known, Mexican coffee-flavoured liqueur. In production since 1936!"
	shot_glass_icon_state = "shotglasscream"

/datum/reagent/consumable/ethanol/kahlua/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	if(!M.has_trait(TRAIT_ALCOHOL_TOLERANCE))
		M.Jitter(5)
	..()
	. = 1

/datum/reagent/consumable/ethanol/whiskey
	name = "Whiskey"
	id = "whiskey"
	description = "A superb and well-aged single-malt whiskey. Damn. S: +1 C: +1 I: -1"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 75
	taste_description = "molasses"
	glass_icon_state = "whiskeyglass"
	glass_name = "glass of whiskey"
	glass_desc = "The silky, smokey whiskey goodness inside the glass makes the drink look very classy. S: +1 C: +1 I: -1"
	shot_glass_icon_state = "shotglassbrown"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/brave_bull
	name = "Brave Bull"
	id = "bravebull"
	description = "An honourable and strong as bull mixture of tequila and kahlua."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 75
	taste_description = "old mexico"
	glass_icon_state = "bravebullglass"
	glass_name = "Brave Bull"
	glass_desc = "An honourable and strong as bull mixture of tequila and kahlua."
	shot_glass_icon_state = "shotglassbrown"

/datum/reagent/consumable/ethanol/vodka
	name = "Vodka"
	id = "vodka"
	description = "Number one drink AND fueling choice for Russians worldwide."
	color = "#0064C8" // rgb: 0, 100, 200
	boozepwr = 65
	taste_description = "grain alcohol"
	glass_icon_state = "ginvodkaglass"
	glass_name = "glass of vodka"
	glass_desc = "The glass contain wodka. Xynta."
	shot_glass_icon_state = "shotglassclear"

/datum/reagent/consumable/ethanol/vodka/on_mob_life(mob/living/carbon/M)
	M.radiation = max(M.radiation-2,0)
	return ..()

/datum/reagent/consumable/ethanol/tatovodka
	name = "Tato Vodka"
	id = "tatovodka"
	description = "A extremely powerful and disgusting spirit."
	color = "#706A58"
	boozepwr = 100
	taste_description = "extremely powerful dirt"
	glass_icon_state = "glass_brown"
	glass_name = "glass of tato vodka"
	glass_desc = "The glass contains actual swill tato vodka."

/datum/reagent/consumable/ethanol/tatovodka/on_mob_life(mob/living/carbon/M)
	if(prob(10))
		M.vomit(10)
	M.radiation = max(M.radiation-3,0)
	return ..()

/datum/reagent/consumable/ethanol/pungajuice
	name = "punga juice"
	id = "pungajuice"
	description = "The fermented juice of the punga fruit, used to treat radiation sickness"
	color = "#1B2E24"
	boozepwr = 80
	taste_description = "acidic slime"
	glass_icon_state = "Space_mountain_wind_glass"
	glass_name = "glass of punga juice"
	glass_desc = "The glass contain punga juice, used to treat radiation sickness"

/datum/reagent/consumable/ethanol/pungajuice/on_mob_life(mob/living/carbon/M)
	M.radiation = max(M.radiation-5,0)
	M.hallucination += 5
	return ..()

/datum/reagent/consumable/ethanol/bilk
	name = "Bilk"
	id = "bilk"
	description = "This appears to be beer mixed with milk. Disgusting."
	color = "#895C4C" // rgb: 137, 92, 76
	nutriment_factor = 2 * REAGENTS_METABOLISM
	boozepwr = 15
	taste_description = "desperation and lactate"
	glass_icon_state = "glass_brown"
	glass_name = "glass of bilk"
	glass_desc = "A brew of milk and beer. For those alcoholics who fear osteoporosis."

/datum/reagent/consumable/ethanol/bilk/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(10))
		M.heal_bodypart_damage(1)
		. = 1
	return ..() || .

/datum/reagent/consumable/ethanol/threemileisland
	name = "Three Mile Island Iced Tea"
	id = "threemileisland"
	description = "Made for a woman, strong enough for a man."
	color = "#666340" // rgb: 102, 99, 64
	boozepwr = 10
	quality = DRINK_FANTASTIC
	taste_description = "dryness"
	glass_icon_state = "threemileislandglass"
	glass_name = "Three Mile Island Ice Tea"
	glass_desc = "A glass of this is sure to prevent a meltdown."

/datum/reagent/consumable/ethanol/threemileisland/on_mob_life(mob/living/carbon/M)
	M.set_drugginess(50)
	return ..()

/datum/reagent/consumable/ethanol/gin
	name = "Gin"
	id = "gin"
	description = "It's gin. In space. I say, good sir."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 45
	taste_description = "an alcoholic christmas tree"
	glass_icon_state = "ginvodkaglass"
	glass_name = "glass of gin"
	glass_desc = "A crystal clear glass of Griffeater gin. S: +1 A: +1 I: -1"

	pos_Strength = 1
	pos_Intelligence = -1
	pos_Agility = 1
	neg_Strength = -1
	neg_Intelligence = 1
	neg_Agility = -1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/rum
	name = "Rum"
	id = "rum"
	description = "Yohoho and all that."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 60
	taste_description = "spiked butterscotch"
	glass_icon_state = "rumglass"
	glass_name = "glass of rum"
	glass_desc = "Now you want to Pray for a pirate suit, don't you? S: +1 A: +1 I: -1"
	shot_glass_icon_state = "shotglassbrown"

	pos_Strength = 1
	pos_Intelligence = -1
	pos_Agility = 1
	neg_Strength = -1
	neg_Intelligence = 1
	neg_Agility = -1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/tequila
	name = "Tequila"
	id = "tequila"
	description = "A strong and mildly flavoured, Mexican produced spirit. Feeling thirsty, hombre?"
	color = "#FFFF91" // rgb: 255, 255, 145
	boozepwr = 70
	taste_description = "paint stripper"
	glass_icon_state = "tequilaglass"
	glass_name = "glass of tequila"
	glass_desc = "Now all that's missing is the weird colored shades! S: +2 C: +1 I: -2"
	shot_glass_icon_state = "shotglassgold"

	pos_Strength = 2
	pos_Charisma = 1
	pos_Intelligence = -2
	neg_Strength = -2
	neg_Charisma = -1
	neg_Intelligence = 2

	can_affect = TRUE

/datum/reagent/consumable/ethanol/vermouth
	name = "Champagne"
	id = "champagne"
	description = "You suddenly feel a craving for a martini..."
	color = "#91FF91" // rgb: 145, 255, 145
	boozepwr = 20
	taste_description = "fizzy alcohol"
	glass_icon_state = "patronglass"
	glass_name = "glass of champagne"
	glass_desc = "Classical party fizz! C: +2 A: +2 I: -1"
	shot_glass_icon_state = "shotglassclear"

	pos_Charisma = 2
	pos_Intelligence = -1
	pos_Agility = 2
	neg_Charisma = -2
	neg_Intelligence = 1
	neg_Agility = -2

	can_affect = TRUE

/datum/reagent/consumable/ethanol/jack_rose
	name = "Jack Rose"
	id = "jack_rose"
	description = "A light cocktail perfect for sipping with a slice of pie."
	color = "#ff6633"
	boozepwr = 15
	quality = DRINK_NICE
	taste_description = "a sweet and sour slice of apple"
	glass_icon_state = "jack_rose"
	glass_name = "Jack Rose"
	glass_desc = "Enough of these, and you really will start to suppose your toeses are roses."

/datum/reagent/consumable/ethanol/old_timer
	name = "Old Timer"
	id = "old_timer"
	description = "An archaic potation enjoyed by old coots of all ages."
	color = "#996835"
	boozepwr = 35
	quality = DRINK_NICE
	taste_description = "the old world"
	glass_icon_state = "old_timer"
	glass_name = "Old Timer"
	glass_desc = "Your grandpa's favorite drink."

/datum/reagent/consumable/ethanol/painkiller
	name = "Painkiller"
	id = "painkiller"
	description = "Dulls your pain. Your emotional pain, that is."
	boozepwr = 20
	color = "#EAD677"
	quality = DRINK_NICE
	taste_description = "sugary tartness"
	glass_icon_state = "painkiller"
	glass_name = "Painkiller"
	glass_desc = "A combination of tropical juices and rum. Surely this will make you feel better."

/datum/reagent/consumable/ethanol/wine
	name = "Wine"
	id = "wine"
	description = "A premium alcoholic beverage made from distilled grape juice."
	color = "#7E4043" // rgb: 126, 64, 67
	boozepwr = 35
	taste_description = "bitter sweetness"
	glass_icon_state = "wineglass"
	glass_name = "glass of wine"
	glass_desc = "A very classy looking drink. S: +1 C: +1 I: -1"
	shot_glass_icon_state = "shotglassred"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/lizardwine
	name = "Lizard wine"
	id = "lizardwine"
	description = "An alcoholic beverage from Space China, made by infusing lizard tails in ethanol."
	color = "#7E4043" // rgb: 126, 64, 67
	boozepwr = 45
	taste_description = "scaley sweetness"

/datum/reagent/consumable/ethanol/grappa
	name = "Grappa"
	id = "grappa"
	description = "A fine Italian brandy, for when regular wine just isn't alcoholic enough for you."
	color = "#F8EBF1"
	boozepwr = 45
	taste_description = "classy bitter sweetness"
	glass_icon_state = "grappa"
	glass_name = "glass of grappa"
	glass_desc = "A fine drink originally made to prevent waste by using the leftovers from winemaking."

/datum/reagent/consumable/ethanol/cognac
	name = "Cognac"
	id = "cognac"
	description = "A sweet and strongly alcoholic drink, made after numerous distillations and years of maturing. Classy as fornication."
	color = "#AB3C05" // rgb: 171, 60, 5
	boozepwr = 75
	taste_description = "angry and irish"
	glass_icon_state = "cognacglass"
	glass_name = "glass of cognac"
	glass_desc = "Damn, you feel like some kind of French aristocrat just by holding this. S: +1 C: +1 I: -1"
	shot_glass_icon_state = "shotglassbrown"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/absinthe
	name = "Absinthe"
	id = "absinthe"
	description = "A powerful alcoholic drink. Rumored to cause hallucinations but does not."
	color = rgb(10, 206, 0)
	boozepwr = 80 //Very strong even by default
	taste_description = "death and licorice"
	glass_icon_state = "absinthe"
	glass_name = "glass of absinthe"
	glass_desc = "It's as strong as it smells. P: +1 C: +1 I: -1"
	shot_glass_icon_state = "shotglassgreen"

/datum/reagent/consumable/ethanol/absinthe/on_mob_life(mob/living/carbon/M)
	if(prob(10) && !M.has_trait(TRAIT_ALCOHOL_TOLERANCE))
		M.hallucination += 4 //Reference to the urban myth
	..()

	pos_Perception = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Perception = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/hooch
	name = "Hooch"
	id = "hooch"
	description = "Either someone's failure at cocktail making or attempt in alcohol production. In any case, do you really want to drink that?"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 100
	taste_description = "pure resignation"
	glass_icon_state = "glass_brown2"
	glass_name = "Hooch"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night. S: +2 C: +2 I: -2"

	pos_Strength = 2
	pos_Charisma = 2
	pos_Intelligence = -2
	neg_Strength = -2
	neg_Charisma = -2
	neg_Intelligence = 2

	can_affect = TRUE

/datum/reagent/consumable/ethanol/ale
	name = "Ale"
	id = "ale"
	description = "A dark alcoholic beverage made with malted barley and yeast."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 65
	taste_description = "hearty barley ale"
	glass_icon_state = "aleglass"
	glass_name = "glass of ale"
	glass_desc = "A freezing pint of delicious Ale. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/goldschlager
	name = "Goldschlager"
	id = "goldschlager"
	description = "An extremely sweet glittering beverage."
	color = "#FFFF91" // rgb: 255, 255, 145
	boozepwr = 25
	quality = DRINK_VERYGOOD
	taste_description = "burning cinnamon"
	glass_icon_state = "goldschlagerglass"
	glass_name = "glass of goldschlager"
	glass_desc = "An extremely sweet glittering beverage. S: +1 C: +1 I: -1"
	shot_glass_icon_state = "shotglassgold"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/patron
	name = "Patron"
	id = "patron"
	description = "Tequila with silver in it, a favorite of alcoholic women in the club scene."
	color = "#585840" // rgb: 88, 88, 64
	boozepwr = 60
	quality = DRINK_VERYGOOD
	taste_description = "smooth tequila"
	glass_icon_state = "patronglass"
	glass_name = "glass of patron"
	glass_desc = "Drinking patron in the bar, Boss of the World. S: +1 C: +1 I: -1"
	shot_glass_icon_state = "shotglassclear"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	pos_Agility = 0
	pos_Luck = 0
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/gintonic
	name = "Gin and Tonic"
	id = "gintonic"
	description = "An all time classic, mild cocktail."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 25
	quality = DRINK_NICE
	taste_description = "bittersweet tonic and vibrant herbal zest"
	glass_icon_state = "gintonicglass"
	glass_name = "Gin and Tonic"
	glass_desc = "A mild but still great cocktail. Drink up, like a true Englishman. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/rum_coke
	name = "Rum and Nuka"
	id = "rumcoke"
	description = "Rum, mixed with Nuka-Cola."
	taste_description = "Nuka-Cola"
	boozepwr = 40
	quality = DRINK_NICE
	color = "#3E1B00"
	glass_icon_state = "whiskeycolaglass"
	glass_name = "Rum and Nuka"
	glass_desc = "The classic go-to of fratboys. S: +1 I: -1"

	pos_Strength = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/cuba_libre
	name = "Nuka Libre"
	id = "cubalibre"
	description = "Viva la Revolucion! Viva Cuba Libre!"
	color = "#3E1B00" // rgb: 62, 27, 0
	boozepwr = 50
	quality = DRINK_GOOD
	taste_description = "a refreshing marriage of citrus and rum"
	glass_icon_state = "cubalibreglass"
	glass_name = "Nuka Libre"
	glass_desc = "A classic mix of rum, Nuka-Cola, and lime. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/cuba_libre/on_mob_life(mob/living/carbon/M)
	if(M.mind && M.mind.has_antag_datum(/datum/antagonist/rev)) //Cuba Libre, the traditional drink of revolutions! Heals revolutionaries.
		M.adjustBruteLoss(-1, 0)
		M.adjustFireLoss(-1, 0)
		M.adjustToxLoss(-1, 0)
		M.adjustOxyLoss(-5, 0)
		. = 1
	return ..() || .

/datum/reagent/consumable/ethanol/whiskey_cola
	name = "Whiskey Nuka"
	id = "whiskeycola"
	description = "Whiskey, mixed with Nuka-Cola. Surprisingly refreshing. S: +1 C: +1 I: -1"
	color = "#3E1B00" // rgb: 62, 27, 0
	boozepwr = 70
	quality = DRINK_NICE
	taste_description = "Nuka Cola"
	glass_icon_state = "whiskeycolaglass"
	glass_name = "whiskey cola"
	glass_desc = "An innocent-looking mixture of Nuka-Cola and Whiskey. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/martini
	name = "Classic Martini"
	id = "martini"
	description = "Vermouth with Gin. Not quite how 007 enjoyed it, but still delicious."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 60
	quality = DRINK_NICE
	taste_description = "a drinkable ice cube infused with an evergreen forest"
	glass_icon_state = "martiniglass"
	glass_name = "Classic Martini"
	glass_desc = "Damn, the bartender even stirred it, not shook it. S: +2 E: +3 I: -1"

	pos_Strength = 2
	pos_Endurance = 3
	pos_Intelligence = -1
	neg_Strength = -2
	neg_Endurance = -3
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/vodkamartini
	name = "Vodka Martini"
	id = "vodkamartini"
	description = "Vodka with Gin. Not quite how 007 enjoyed it, but still delicious."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 65
	quality = DRINK_NICE
	taste_description = "a blank slate, with the mildest hint of sweet greenery"
	glass_icon_state = "martiniglass"
	glass_name = "Vodka martini"
	glass_desc ="A bastardisation of the classic martini. Still great. S: +2 E: +3 I: -1"

	pos_Strength = 2
	pos_Endurance = 3
	pos_Intelligence = -1
	neg_Strength = -2
	neg_Endurance = -3
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/white_russian
	name = "White Russian"
	id = "whiterussian"
	description = "That's just, like, your opinion, man..."
	color = "#A68340" // rgb: 166, 131, 64
	boozepwr = 50
	quality = DRINK_GOOD
	taste_description = "sweet coffee liqueur and cream"
	glass_icon_state = "whiterussianglass"
	glass_name = "White Russian"
	glass_desc = "A very nice looking drink. But that's just, like, your opinion, man. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/screwdrivercocktail
	name = "Screwdriver"
	id = "screwdrivercocktail"
	description = "Vodka, mixed with plain ol' orange juice. The result is surprisingly delicious."
	color = "#A68310" // rgb: 166, 131, 16
	boozepwr = 55
	quality = DRINK_NICE
	taste_description = "strong orange and sharp vodka"
	glass_icon_state = "screwdriverglass"
	glass_name = "Screwdriver"
	glass_desc = "A simple, yet superb mixture of Vodka and orange juice. Just the thing for the tired engineer. S: -1 C: +2 I: +1"

	pos_Strength = -1
	pos_Charisma = 2
	pos_Intelligence = 1
	neg_Strength = 1
	neg_Charisma = -2
	neg_Intelligence = -1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/screwdrivercocktail/on_mob_life(mob/living/carbon/M)
	if(M.mind && (M.mind.assigned_role in list("Station Engineer", "Atmospheric Technician", "Chief Engineer"))) //Engineers lose radiation poisoning at a massive rate.
		M.radiation = max(M.radiation - 25, 0)
	return ..()

/datum/reagent/consumable/ethanol/booger
	name = "Booger"
	id = "booger"
	description = "Ewww..."
	color = "#8CFF8C" // rgb: 140, 255, 140
	boozepwr = 45
	taste_description = "slime and cream"
	glass_icon_state = "booger"
	glass_name = "Booger"
	glass_desc = "Ewww..."

/datum/reagent/consumable/ethanol/bloody_mary
	name = "Bloody Mary"
	id = "bloodymary"
	description = "A strange yet pleasurable mixture made of vodka, tomato and lime juice. Or at least you THINK the red stuff is tomato juice."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 55
	quality = DRINK_GOOD
	taste_description = "earthy tomatoes with hints of lime"
	glass_icon_state = "bloodymaryglass"
	glass_name = "Bloody Mary"
	glass_desc = "Tomato juice, mixed with Vodka and a lil' bit of lime. Tastes like liquid murder. S: +2 C: -2 I: -3"

	pos_Strength = 2
	pos_Charisma = -2
	pos_Intelligence = -3
	neg_Strength = -2
	neg_Charisma = 2
	neg_Intelligence = 3

	can_affect = TRUE

/datum/reagent/consumable/ethanol/bloody_mary/on_mob_life(mob/living/carbon/C)
	if(C.blood_volume < BLOOD_VOLUME_NORMAL)
		C.blood_volume = min(BLOOD_VOLUME_NORMAL, C.blood_volume + 3) //Bloody Mary quickly restores blood loss.
	..()

/datum/reagent/consumable/ethanol/tequila_sunrise
	name = "Tequila Sunrise"
	id = "tequilasunrise"
	description = "Tequila, Grenadine, and Orange Juice."
	color = "#FFE48C" // rgb: 255, 228, 140
	boozepwr = 45
	quality = DRINK_GOOD
	taste_description = "warm oranges with a hint of pomegranate"
	glass_icon_state = "tequilasunriseglass"
	glass_name = "tequila Sunrise"
	glass_desc = "Oh great, now you feel nostalgic about sunrises... S: +1 I: -2 L: +1"
	var/obj/effect/light_holder

	pos_Strength = 1
	pos_Luck = 1
	pos_Intelligence = -2
	neg_Strength = -1
	neg_Luck = -1
	neg_Intelligence = 2

	can_affect = TRUE

/datum/reagent/consumable/ethanol/tequila_sunrise/on_mob_add(mob/living/M)
	to_chat(M, "<span class='notice'>You feel gentle warmth spread through your body!</span>")
	light_holder = new(M)
	light_holder.set_light(3, 0.7, "#FFCC00") //Tequila Sunrise makes you radiate dim light, like a sunrise!

/datum/reagent/consumable/ethanol/tequila_sunrise/on_mob_life(mob/living/carbon/M)
	if(QDELETED(light_holder))
		M.reagents.del_reagent("tequilasunrise") //If we lost our light object somehow, remove the reagent
	else if(light_holder.loc != M)
		light_holder.forceMove(M)
	return ..()

/datum/reagent/consumable/ethanol/tequila_sunrise/on_mob_delete(mob/living/M)
	to_chat(M, "<span class='notice'>The warmth in your body fades.</span>")
	QDEL_NULL(light_holder)

/datum/reagent/consumable/ethanol/irish_cream
	name = "Irish Cream"
	id = "irishcream"
	description = "Whiskey-imbued cream, what else would you expect from the Irish?"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 70
	quality = DRINK_NICE
	taste_description = "creamy alcohol with a kick"
	glass_icon_state = "irishcreamglass"
	glass_name = "Irish Cream"
	glass_desc = "It's cream, mixed with whiskey. What else would you expect from the Irish? S: +2 E: +1 I: -1"

	pos_Strength = 2
	pos_Endurance = 1
	pos_Intelligence = -1
	neg_Strength = -2
	neg_Endurance = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/longislandicedtea
	name = "Long Island Iced Tea"
	id = "longislandicedtea"
	description = "The liquor cabinet, brought together in a delicious mix. Intended for middle-aged alcoholic women only."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 35
	quality = DRINK_VERYGOOD
	taste_description = "orange, lemon, and cola"
	glass_icon_state = "longislandicedteaglass"
	glass_name = "Long Island Iced Tea"
	glass_desc = "The liquor cabinet, brought together in a delicious mix. Intended for middle-aged alcoholic women only."

/datum/reagent/consumable/ethanol/moonshine
	name = "Moonshine"
	id = "moonshine"
	description = "You've really hit rock bottom now... your liver packed its bags and left last night."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 150
	taste_description = "hand sanitizer"
	glass_icon_state = "nothing"
	glass_name = "Moonshine"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night. S: +4 C: -1 I: -3"

	pos_Strength = 4
	pos_Charisma = -1
	pos_Intelligence = -3
	neg_Strength = -4
	neg_Charisma = -1
	neg_Intelligence = 3

	can_affect = TRUE

/datum/reagent/consumable/ethanol/b52
	name = "B-52"
	id = "b52"
	description = "Coffee, Irish Cream, and cognac. You will get bombed."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 85
	quality = DRINK_GOOD
	taste_description = "creamy coffee, caramel, and oranges"
	glass_icon_state = "b52glass"
	glass_name = "B-52"
	glass_desc = "Kahlua, Irish Cream, and cognac."
	shot_glass_icon_state = "b52glass"

/datum/reagent/consumable/ethanol/irishcoffee
	name = "Irish Coffee"
	id = "irishcoffee"
	description = "Coffee, and alcohol. More fun than a Mimosa to drink in the morning."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 35
	quality = DRINK_NICE
	taste_description = "rich coffee and satisfying creaminess"
	glass_icon_state = "irishcoffeeglass"
	glass_name = "Irish Coffee"
	glass_desc = "Coffee and alcohol. More fun than a Mimosa to drink in the morning."

/datum/reagent/consumable/ethanol/margarita
	name = "Margarita"
	id = "margarita"
	description = "On the rocks with salt on the rim. Arriba~!"
	color = "#8CFF8C" // rgb: 140, 255, 140
	boozepwr = 35
	quality = DRINK_NICE
	taste_description = "sour citrus that gives way to a salty sweetness"
	glass_icon_state = "margaritaglass"
	glass_name = "Margarita"
	glass_desc = "On the rocks with salt on the rim."

/datum/reagent/consumable/ethanol/black_russian
	name = "Black Russian"
	id = "blackrussian"
	description = "For the lactose-intolerant. Still as classy as a White Russian."
	color = "#360000" // rgb: 54, 0, 0
	boozepwr = 70
	quality = DRINK_NICE
	taste_description = "sweetened coffee"
	glass_icon_state = "blackrussianglass"
	glass_name = "Black Russian"
	glass_desc = "For the lactose-intolerant. Still as classy as a White Russian."

/datum/reagent/consumable/ethanol/manhattan
	name = "Manhattan"
	id = "manhattan"
	description = "The Detective's undercover drink of choice. He never could stomach gin..."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 30
	quality = DRINK_NICE
	taste_description = "slight bitterness with herbal undertones"
	glass_icon_state = "manhattanglass"
	glass_name = "Manhattan"
	glass_desc = "The Detective's undercover drink of choice. He never could stomach gin... S: +2 C: +2 I: -1"

	pos_Strength = 2
	pos_Charisma = 2
	pos_Intelligence = -1
	neg_Strength = -2
	neg_Charisma = -2
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/whiskeysoda
	name = "Whiskey Soda"
	id = "whiskeysoda"
	description = "For the more refined griffon."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 70
	quality = DRINK_NICE
	taste_description = "fizzy whiskey"
	glass_icon_state = "whiskeysodaglass2"
	glass_name = "whiskey soda"
	glass_desc = "Ultimate refreshment. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/antifreeze
	name = "Anti-freeze"
	id = "antifreeze"
	description = "The ultimate refreshment. Not what it sounds like."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 35
	quality = DRINK_NICE
	taste_description = "Jack Frost's piss"
	glass_icon_state = "antifreeze"
	glass_name = "Anti-freeze"
	glass_desc = "The ultimate refreshment."

/datum/reagent/consumable/ethanol/barefoot
	name = "Barefoot"
	id = "barefoot"
	description = "Barefoot and pregnant."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 45
	quality = DRINK_VERYGOOD
	taste_description = "creamy berries"
	glass_icon_state = "b&p"
	glass_name = "Barefoot"
	glass_desc = "Barefoot and pregnant."

/datum/reagent/consumable/ethanol/snowwhite
	name = "Snow White"
	id = "snowwhite"
	description = "A cold refreshment."
	color = "#FFFFFF" // rgb: 255, 255, 255
	boozepwr = 35
	quality = DRINK_NICE
	taste_description = "bubbly citrus and refreshing coldmess"
	glass_icon_state = "snowwhite"
	glass_name = "Snow White"
	glass_desc = "A cold refreshment."

/datum/reagent/consumable/ethanol/devilskiss
	name = "Devil's Kiss"
	id = "devilskiss"
	description = "Creepy time!"
	color = "#A68310" // rgb: 166, 131, 16
	boozepwr = 70
	quality = DRINK_VERYGOOD
	taste_description = "spice and bitter iron"
	glass_icon_state = "devilskiss"
	glass_name = "Devils Kiss"
	glass_desc = "Creepy time!"

/datum/reagent/consumable/ethanol/vodkatonic
	name = "Vodka and Tonic"
	id = "vodkatonic"
	description = "For when a gin and tonic isn't Russian enough."
	color = "#0064C8" // rgb: 0, 100, 200
	boozepwr = 70
	quality = DRINK_NICE
	taste_description = "quinine and carbonation"
	glass_icon_state = "vodkatonicglass"
	glass_name = "vodka and tonic"
	glass_desc = "For when a gin and tonic isn't Russian enough."

/datum/reagent/consumable/ethanol/ginfizz
	name = "Gin Fizz"
	id = "ginfizz"
	description = "Refreshingly lemony, deliciously dry."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 45
	quality = DRINK_GOOD
	taste_description = "dry, fizzy lemons"
	glass_icon_state = "ginfizzglass"
	glass_name = "gin fizz"
	glass_desc = "Refreshingly lemony, deliciously dry."

/datum/reagent/consumable/ethanol/bahama_mama
	name = "Bahama Mama"
	id = "bahama_mama"
	description = "Tropical cocktail."
	color = "#FF7F3B" // rgb: 255, 127, 59
	boozepwr = 35
	quality = DRINK_GOOD
	taste_description = "a fruity tropical vacation"
	glass_icon_state = "bahama_mama"
	glass_name = "Bahama Mama"
	glass_desc = "Tropical cocktail."

/datum/reagent/consumable/ethanol/sbiten
	name = "Sbiten"
	id = "sbiten"
	description = "A spicy Vodka! Might be a little hot for the little guys!"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 70
	quality = DRINK_VERYGOOD
	taste_description = "warm, invigorating spice"
	glass_icon_state = "sbitenglass"
	glass_name = "Sbiten"
	glass_desc = "A spicy mix of Vodka and Spice. Very hot."

/datum/reagent/consumable/ethanol/sbiten/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(50 * TEMPERATURE_DAMAGE_COEFFICIENT, 0 ,BODYTEMP_HEAT_DAMAGE_LIMIT) //310.15 is the normal bodytemp.
	return ..()

/datum/reagent/consumable/ethanol/red_mead
	name = "Red Mead"
	id = "red_mead"
	description = "The true Viking drink! Even though it has a strange red color."
	color = "#C73C00" // rgb: 199, 60, 0
	boozepwr = 51 //Red drinks are stronger
	quality = DRINK_GOOD
	taste_description = "sweet and salty alcohol"
	glass_icon_state = "red_meadglass"
	glass_name = "Red Mead"
	glass_desc = "A True Viking's Beverage, though its color is strange."

/datum/reagent/consumable/ethanol/mead
	name = "Mead"
	id = "mead"
	description = "A Viking drink, though a cheap one."
	color = "#664300" // rgb: 102, 67, 0
	nutriment_factor = 1 * REAGENTS_METABOLISM
	boozepwr = 50
	quality = DRINK_NICE
	taste_description = "sweet honey and alcohol"
	glass_icon_state = "meadglass"
	glass_name = "Mead"
	glass_desc = "A Viking's Beverage, though a cheap one."

/datum/reagent/consumable/ethanol/wastemead
	name = "Waste Mead"
	id = "wastemead"
	description = "A True Wastelanders drink."
	color = "#664300" // rgb: 102, 67, 0
	nutriment_factor = 1 * REAGENTS_METABOLISM
	boozepwr = 50
	taste_description = "crispy sweetness"
	glass_icon_state = "meadglass"
	glass_name = "Waste Mead"
	glass_desc = "A True Wastelander's drink."

/datum/reagent/consumable/ethanol/iced_beer
	name = "Iced Beer"
	id = "iced_beer"
	description = "A beer which is so cold the air around it freezes."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 15
	taste_description = "smooth, cold beer"
	glass_icon_state = "iced_beerglass"
	glass_name = "iced beer"
	glass_desc = "A beer so frosty, it almost makes you feel like its a nuclear winter. S: +2 C: +1 I: -2"

	pos_Strength = 2
	pos_Charisma = 1
	pos_Intelligence = -2
	neg_Strength = -2
	neg_Charisma = -1
	neg_Intelligence = 2

	can_affect = TRUE

/datum/reagent/consumable/ethanol/iced_beer/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-20 * TEMPERATURE_DAMAGE_COEFFICIENT, T0C) //310.15 is the normal bodytemp.
	return ..()

/datum/reagent/consumable/ethanol/grog
	name = "Grog"
	id = "grog"
	description = "Watered down rum, Vault-Tec approves!"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 1 //Basically nothing
	taste_description = "water with a vague hint of alcohol"
	glass_icon_state = "grogglass"
	glass_name = "Grog"
	glass_desc = "Watered down rum."

/datum/reagent/consumable/ethanol/aloe
	name = "Aloe"
	id = "aloe"
	description = "So very, very, very good."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 35
	quality = DRINK_VERYGOOD
	taste_description = "sweet 'n creamy"
	glass_icon_state = "aloe"
	glass_name = "Aloe"
	glass_desc = "Very, very, very good."

/datum/reagent/consumable/ethanol/andalusia
	name = "Andalusia"
	id = "andalusia"
	description = "A nice, strangely named drink."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 40
	quality = DRINK_GOOD
	taste_description = "lemons"
	glass_icon_state = "andalusia"
	glass_name = "Andalusia"
	glass_desc = "A nice, strangely named drink."

/datum/reagent/consumable/ethanol/alliescocktail
	name = "Allies Cocktail"
	id = "alliescocktail"
	description = "A drink made from your allies. Not as sweet as those made from your enemies."
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 45
	quality = DRINK_NICE
	taste_description = "martini and companionship"
	glass_icon_state = "alliescocktail"
	glass_name = "Allies cocktail"
	glass_desc = "A drink made from your allies."

/datum/reagent/consumable/ethanol/amasec
	name = "Amasec"
	id = "amasec"
	description = "Official drink of the Nanotrasen Gun-Club!"
	color = "#664300" // rgb: 102, 67, 0
	boozepwr = 35
	quality = DRINK_GOOD
	taste_description = "dark and metallic"
	glass_icon_state = "amasecglass"
	glass_name = "Amasec"
	glass_desc = "Always handy before COMBAT!!!"

/datum/reagent/consumable/ethanol/irishcarbomb
	name = "Irish Car Bomb"
	id = "irishcarbomb"
	description = "Mmm, tastes like chocolate cake..."
	color = "#2E6671" // rgb: 46, 102, 113
	boozepwr = 25
	quality = DRINK_GOOD
	taste_description = "irish cream and regret"
	glass_icon_state = "irishcarbomb"
	glass_name = "Irish Car Bomb"
	glass_desc = "An Irish car bomb. S: +1 C: +3 I: -1"

	pos_Strength = 1
	pos_Charisma = 3
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -3
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/bananacream
	name = "Banana Cream"
	id = "bananacream"
	description = "A drink from Monkey Heaven."
	nutriment_factor = 1 * REAGENTS_METABOLISM
	color = "#FFFF91" // rgb: 255, 255, 140
	boozepwr = 60
	quality = DRINK_GOOD
	taste_description = "a bad joke"
	glass_icon_state = "bananahonkglass"
	glass_name = "Banana Cream"
	glass_desc = "A drink from Monkey Heaven."

/datum/reagent/consumable/ethanol/whiskey_sour //Requested since we had whiskey cola and soda but not sour.
	name = "Whiskey Sour"
	id = "whiskey_sour"
	description = "Lemon juice/whiskey/sugar mixture. Moderate alcohol content."
	color = rgb(255, 201, 49)
	boozepwr = 35
	quality = DRINK_GOOD
	taste_description = "balanced, lemony sourness"
	glass_icon_state = "whiskey_sour"
	glass_name = "whiskey sour"
	glass_desc = "Lemon juice mixed with whiskey and a dash of sugar. Surprisingly satisfying. S: +1 C: +2 I: -1"

	pos_Strength = 1
	pos_Charisma = 2
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -2
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/hcider
	name = "Hard Cider"
	id = "hcider"
	description = "Apple juice, for adults."
	color = "#CD6839"
	nutriment_factor = 1 * REAGENTS_METABOLISM
	boozepwr = 25
	taste_description = "the season that <i>falls</i> between summer and winter"
	glass_icon_state = "whiskeyglass"
	glass_name = "hard cider"
	glass_desc = "Tastes like autumn... no wait, fall! S: +1 C: +1 I: -2"
	shot_glass_icon_state = "shotglassbrown"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -2
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 2

	can_affect = TRUE

/datum/reagent/consumable/ethanol/purplecider
	name = "Purple Cider"
	id = "purplecider"
	description = "Refined a pressurised, Mutfruit Cider."
	color = "#570197"
	nutriment_factor = 1 * REAGENTS_METABOLISM
	boozepwr = 25
	taste_description = "sweetness and nuclear winter"
	glass_icon_state = "mutfruitglass"
	glass_name = "purple cider"
	glass_desc = "Refined a pressurised, Mutfruit Cider."

/datum/reagent/consumable/ethanol/purplecider/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(10))
		M.heal_bodypart_damage(1)
		. = 1
	return ..() || .

/datum/reagent/consumable/ethanol/brocbrew
	name = "Broc Brew"
	id = "brocbrew"
	description = "A potent healing beverage brewed from the Broc flower."
	color = "#DFA866"
	boozepwr = 50
	taste_description = "dirt and roses"
	glass_icon_state = "cognacglass"
	glass_name = "broc brew"
	glass_desc = "A potent healing beverage brewed from the Broc flower."
	var/last_added = 0
	var/maximum_reachable = BLOOD_VOLUME_NORMAL - 10

/datum/reagent/consumable/ethanol/brocbrew/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-5*REM, 0)
	..()
	. = 1

/datum/reagent/consumable/ethanol/brocbrew/on_mob_life(mob/living/carbon/M)
	if(last_added)
		M.blood_volume -= last_added
		last_added = 0
	if(M.blood_volume < maximum_reachable)	//Can only up to double your effective blood level.
		var/amount_to_add = min(M.blood_volume, volume*5)
		var/new_blood_level = min(M.blood_volume + amount_to_add, maximum_reachable)
		last_added = new_blood_level - M.blood_volume
		M.blood_volume = new_blood_level
	if(prob(33))
		M.adjustBruteLoss(-0.5*REM, 0)
		M.adjustFireLoss(-0.5*REM, 0)
		. = TRUE
	..()

/datum/reagent/consumable/ethanol/buffalo
	name = "Buffalo"
	id = "buffalo"
	description = "An insaneley strong spirit that hits you like whatever the hell a buffalo was."
	color = "#DFA866"
	boozepwr = 150
	taste_description = "a stampede"
	glass_icon_state = "buffaloglass"
	glass_name = "buffalo"
	glass_desc = "An insaneley strong spirit that hits you like whatever the hell a buffalo was."

/datum/reagent/consumable/ethanol/deathroach
	name = "Deathroach"
	id = "deathroach"
	description = "Distilled tobacco, for that two in one cancer blast!"
	color = "#0C0704"
	boozepwr = 100
	taste_description = "tobacco and hatred"
	glass_icon_state = "irishcarbomb"
	glass_name = "death roach"
	glass_desc = "Distilled tobacco, for that two in one cancer blast!"

/datum/reagent/consumable/ethanol/deathroach/on_mob_life(mob/living/carbon/M)
	if(prob(10))
		var/drink_message = pick("You feel rugged.", "You feel manly.","You feel wastern.","You feel like a madman.")
		to_chat(M, "<span class='notice'>[drink_message]</span>")
	M.AdjustStun(-20, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-0.5*REM, 0)
	..()
	. = 1

/datum/reagent/consumable/ethanol/daturatea
	name = "Datura Tea"
	id = "daturatea"
	description = "A potent tea well used for rites of passage rituals and ceremonies."
	color = "#E5E2D4"
	boozepwr = 10
	taste_description = "divine intervention"
	glass_icon_state = "daturatea"
	glass_name = "datura tea"
	glass_desc = "A potent tea well used for rites of passage rituals and ceremonies."

/datum/reagent/consumable/ethanol/daturatea/on_mob_add(mob/living/M) //spiritual shizzle, also admemes getting booled on
	M.add_trait(TRAIT_SPIRITUAL, id)
	M.set_drugginess(15)
	M.hallucination += 20
	..()

/datum/reagent/consumable/ethanol/daturatea/on_mob_delete(mob/living/M)
	M.remove_trait(TRAIT_SPIRITUAL, id)
	M.set_drugginess(0)
	M.hallucination += 0
	..()

/datum/reagent/consumable/ethanol/pinkpulque
	name = "Pink Pulque"
	id = "pinkpulque"
	description = "An alchoholic prickly pear cactus mash spirit."
	color = "#D0007C"
	boozepwr = 30
	taste_description = "sweetness and pulp"
	glass_icon_state = "pinkpulqueglass"
	glass_name = "pink pulque"
	glass_desc = "An alchoholic prickly pear cactus mash spirit."

/datum/reagent/consumable/ethanol/pinkpulque/on_mob_life(mob/living/carbon/M)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/consumable/ethanol/yellowpulque
	name = "Yellow Pulque"
	id = "yellowpulque"
	description = "An sobering and extremely bitter barrel cactus mash spirit."
	color = "#FEFCE7"
	boozepwr = -10
	taste_description = "sweetness and pulp"
	glass_icon_state = "yellowpulqueglass"
	glass_name = "yellow pulque"
	glass_desc = "An sobering and extremely bitter barrel cactus mash spirit."

/datum/reagent/consumable/ethanol/yellowpulque/on_mob_life(mob/living/carbon/M)
	if(prob(80))
		M.Dizzy(-2)
		M.Jitter(-2)
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R != src)
			M.reagents.remove_reagent(R.id,2.5)
	if(M.health > 20)
		M.adjustToxLoss(0.5*REM, 0)
		. = 1
	M.radiation += 0.1
	return ..()

/datum/reagent/consumable/ethanol/salgam
	name = "Salgam"
	id = "salgam"
	description = "A spirit brewed from xander roots."
	color = "#591F24"
	boozepwr = 80
	taste_description = "sour turnips"
	glass_icon_state = "salgamglass"
	glass_name = "şalgam"
	glass_desc = "A powerful spirit brewed from the xander root."

/datum/reagent/consumable/ethanol/salgam/on_mob_life(mob/living/carbon/M)
	if(prob(33))
		M.adjustBruteLoss(-1*REM, 0)
		M.adjustFireLoss(-1*REM, 0)
		. = TRUE
	..()

/datum/reagent/consumable/ethanol/salgam/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-2*REM, 0)
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		M.reagents.remove_reagent(R.id,1)
	..()
	. = 1

/datum/reagent/consumable/ethanol/fetching_fizz //A reference to one of my favorite games of all time. Pulls nearby ores to the imbiber!
	name = "Fetching Fizz"
	id = "fetching_fizz"
	description = "Whiskey sour/iron/uranium mixture resulting in a highly magnetic slurry. Mild alcohol content." //Requires no alcohol to make but has alcohol anyway because ~magic~
	color = rgb(255, 91, 15)
	boozepwr = 10
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	taste_description = "charged metal" // the same as teslium, honk honk.
	glass_icon_state = "fetching_fizz"
	glass_name = "Fetching Fizz"
	glass_desc = "Induces magnetism in the imbiber. Started as a barroom prank but evolved to become popular with miners and scrappers. Metallic aftertaste. S: +2 E: +1 I: -1 L: +1"

	pos_Strength = 2
	pos_Endurance = 1
	pos_Intelligence = -1
	pos_Luck = 1
	neg_Strength = -2
	neg_Endurance = -1
	neg_Intelligence = 1
	neg_Luck = -1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/fetching_fizz/on_mob_life(mob/living/carbon/M)
	for(var/obj/item/stack/ore/O in orange(3, M))
		step_towards(O, get_turf(M))
	return ..()

/datum/reagent/consumable/ethanol/neurotoxin
	name = "Neurotoxin"
	id = "neurotoxin"
	description = "A strong neurotoxin that induces effects similar to extremely potent alcohol."
	color = "#2E2E61" // rgb: 46, 46, 97
	boozepwr = 150 //very powerful to compensate for losing its instant KO
	taste_description = "a numbing sensation"
	glass_icon_state = "neurotoxinglass"
	glass_name = "Neurotoxin"
	glass_desc = "A drink that is guaranteed to knock you silly. S: -4 C: -2 I: -4"

	pos_Strength = -4
	pos_Charisma = -2
	pos_Intelligence = -4
	neg_Strength = 4
	neg_Charisma = 2
	neg_Intelligence = 4

	can_affect = TRUE

/datum/reagent/consumable/ethanol/eggnog
	name = "Eggnog"
	id = "eggnog"
	description = "For enjoying the most wonderful time of the year."
	color = "#fcfdc6" // rgb: 252, 253, 198
	nutriment_factor = 2 * REAGENTS_METABOLISM
	boozepwr = 1
	quality = DRINK_VERYGOOD
	taste_description = "custard and alcohol"
	glass_icon_state = "glass_yellow"
	glass_name = "eggnog"
	glass_desc = "For enjoying the most wonderful time of the year."

/datum/reagent/consumable/ethanol/triple_sec
	name = "Triple Sec"
	id = "triple_sec"
	description = "A sweet and vibrant orange liqueur."
	color = "#ffcc66"
	boozepwr = 30
	taste_description = "a warm flowery orange taste which recalls the ocean air and summer wind of the caribbean"
	glass_icon_state = "glass_orange"
	glass_name = "Triple Sec"
	glass_desc = "A glass of straight Triple Sec."

/datum/reagent/consumable/ethanol/creme_de_menthe
	name = "Creme de Menthe"
	id = "creme_de_menthe"
	description = "A minty liqueur excellent for refreshing, cool drinks."
	color = "#00cc00"
	boozepwr = 20
	taste_description = "a minty, cool, and invigorating splash of cold streamwater"
	glass_icon_state = "glass_green"
	glass_name = "Creme de Menthe"
	glass_desc = "You can almost feel the first breath of spring just looking at it."

/datum/reagent/consumable/ethanol/creme_de_cacao
	name = "Creme de Cacao"
	id = "creme_de_cacao"
	description = "A chocolatey liqueur excellent for adding dessert notes to beverages and bribing sororities."
	color = "#996633"
	boozepwr = 20
	taste_description = "a slick and aromatic hint of chocolates swirling in a bite of alcohol"
	glass_icon_state = "glass_brown"
	glass_name = "Creme de Cacao"
	glass_desc = "A million hazing lawsuits and alcohol poisonings have started with this humble ingredient."

/datum/reagent/consumable/ethanol/creme_de_coconut
	name = "Creme de Coconut"
	name = "creme_de_coconut"
	description = "A coconut liqueur for smooth, creamy, tropical drinks."
	color = "#F7F0D0"
	boozepwr = 20
	taste_description = "a sweet milky flavor with notes of toasted sugar"
	glass_icon_state = "glass_white"
	glass_name = "Creme de Coconut"
	glass_desc = "An unintimidating glass of coconut liqueur."

/datum/reagent/consumable/ethanol/grasshopper
	name = "Grasshopper"
	id = "grasshopper"
	description = "A fresh and sweet dessert shooter. Difficult to look manly while drinking this."
	color = "00ff00"
	boozepwr = 25
	quality = DRINK_GOOD
	taste_description = "chocolate and mint dancing around your mouth"
	glass_icon_state = "grasshopper"
	glass_name = "Grasshopper"
	glass_desc = "You weren't aware edible beverages could be that green."

/datum/reagent/consumable/ethanol/stinger
	name = "Stinger"
	id = "stinger"
	description = "A snappy way to end the day."
	color = "ccff99"
	boozepwr = 25
	quality = DRINK_NICE
	taste_description = "a slap on the face in the best possible way"
	glass_icon_state = "stinger"
	glass_name = "Stinger"
	glass_desc = "You wonder what would happen if you pointed this at a heat source..."

/datum/reagent/consumable/ethanol/sake
	name = "Sake"
	id = "sake"
	description = "A sweet rice wine of questionable legality and extreme potency."
	color = "#DDDDDD"
	boozepwr = 70
	taste_description = "sweet rice wine"
	glass_icon_state = "sakecup"
	glass_name = "cup of sake"
	glass_desc = "A traditional cup of sake."

/datum/reagent/consumable/ethanol/sugar_rush
	name = "Sugar Rush"
	id = "sugar_rush"
	description = "Sweet, light, and fruity - as girly as it gets."
	color = "#FF226C"
	boozepwr = 10
	quality = DRINK_GOOD
	taste_description = "your arteries clogging with sugar"
	nutriment_factor = 2 * REAGENTS_METABOLISM
	glass_icon_state = "sugar_rush"
	glass_name = "Sugar Rush"
	glass_desc = "If you can't mix a Sugar Rush, you can't tend bar."

/datum/reagent/consumable/ethanol/peppermint_patty
	name = "Peppermint Patty"
	id = "peppermint_patty"
	description = "This lightly alcoholic drink combines the benefits of menthol and cocoa."
	color = "#45ca7a"
	taste_description = "cool mint and warm chocolate"
	boozepwr = 25
	quality = DRINK_GOOD
	glass_icon_state = "peppermint_patty"
	glass_name = "Peppermint Patty"
	glass_desc = "A boozy minty hot cocoa that warms your belly on a cold night."

/datum/reagent/consumable/ethanol/peppermint_patty/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(5 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/ethanol/alexander
	name = "Alexander"
	id = "alexander"
	description = "Named after a Greek hero, this mix is said to embolden a user's shield as if they were in a phalanx."
	color = "#F5E9D3"
	boozepwr = 80
	quality = DRINK_GOOD
	taste_description = "bitter, creamy cacao"
	glass_icon_state = "alexander"
	glass_name = "Alexander"
	glass_desc = "A creamy, indulgent delight that is stronger than it seems."
	var/obj/item/shield/mighty_shield

/datum/reagent/consumable/ethanol/alexander/on_mob_add(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/thehuman = L
		for(var/obj/item/shield/theshield in thehuman.contents)
			mighty_shield = theshield
			mighty_shield.block_chance += 10
			to_chat(thehuman, "<span class='notice'>[theshield] appears polished, although you don't recall polishing it.</span>")
			return TRUE

/datum/reagent/consumable/ethanol/alexander/on_mob_life(mob/living/L)
	..()
	if(mighty_shield && !(mighty_shield in L.contents)) //If you had a shield and lose it, you lose the reagent as well. Otherwise this is just a normal drink.
		L.reagents.del_reagent("alexander")

/datum/reagent/consumable/ethanol/alexander/on_mob_delete(mob/living/L)
	if(mighty_shield)
		mighty_shield.block_chance -= 10
		to_chat(L,"<span class='notice'>You notice [mighty_shield] looks worn again. Weird.</span>")
	..()

/datum/reagent/consumable/ethanol/sidecar
	name = "Sidecar"
	id = "sidecar"
	description = "The one ride you'll gladly give up the wheel for."
	color = "#FFC55B"
	boozepwr = 80
	quality = DRINK_GOOD
	taste_description = "a perfect balance of sweet and sour"
	glass_icon_state = "sidecar"
	glass_name = "Sidecar"
	glass_desc = "The one ride you'll gladly give up the wheel for."

/datum/reagent/consumable/ethanol/between_the_sheets
	name = "Between the Sheets"
	id = "between_the_sheets"
	description = "A provocatively named classic. Funny enough, doctors recommend drinking it before taking a nap."
	color = "#F4C35A"
	boozepwr = 80
	quality = DRINK_GOOD
	taste_description = "lemon and cognac, with a dash of rum"
	glass_icon_state = "between_the_sheets"
	glass_name = "Between the Sheets"
	glass_desc = "The only drink that comes with a label reminding you of Vault-Tec's zero-tolerance promiscuity policy."

/datum/reagent/consumable/ethanol/between_the_sheets/on_mob_life(mob/living/L)
	..()
	if(L.IsSleeping())
		if(L.bruteloss && L.fireloss) //If you are damaged by both types, slightly increased healing but it only heals one. The more the merrier wink wink.
			if(prob(50))
				L.adjustBruteLoss(-0.25)
			else
				L.adjustFireLoss(-0.25)
		else if(L.bruteloss && !L.fireloss) //If you have only one, it still heals but not as well.
			L.adjustBruteLoss(-0.2)
		else if(!L.bruteloss && L.fireloss)
			L.adjustFireLoss(-0.2)

/datum/reagent/consumable/ethanol/hephaestion
	name = "The Hephaestion"
	id = "hephaestion"
	description = "A drink fit for an Emperor."
	color = "#F4C35A"
	boozepwr = 80
	quality = DRINK_FANTASTIC
	taste_description = "seductive chocolate and intoxicating cognac"
	glass_icon_state = "hephaestion"
	glass_name = "The Hephaestion"
	glass_desc = "A drink fit for an Emperor."

/datum/reagent/consumable/ethanol/kamikaze
	name = "Kamikaze"
	id = "kamikaze"
	description = "A citrusy cocktail that's as fresh as the Divine wind itself."
	color = "#EEF191"
	boozepwr = 60
	quality = DRINK_GOOD
	taste_description = "sweet, sharp orange and fresh lemon"
	glass_icon_state = "kamikaze"
	glass_name = "Kamikaze"
	glass_desc = "A citrusy cocktail that's as fresh as the Divine wind itself."

/datum/reagent/consumable/ethanol/mojito
	name = "Mojito"
	id = "mojito"
	description = "A drink that looks as refreshing as it tastes."
	color = "#DFFAD9"
	boozepwr = 30
	quality = DRINK_GOOD
	taste_description = "sweet agave and refreshing, fizzy mint"
	glass_icon_state = "mojito"
	glass_name = "Mojito"
	glass_desc = "A drink that looks as refreshing as it tastes."

/datum/reagent/consumable/ethanol/fernet
	name = "Fernet"
	id = "fernet"
	description = "An incredibly bitter herbal liqueur used as a digestif."
	color = "#1B2E24" // rgb: 27, 46, 36
	boozepwr = 80
	taste_description = "utter bitterness and a hint of herbs"
	glass_name = "glass of fernet"
	glass_desc = "A glass of pure Fernet. Only an absolute madman would drink this alone." //Hi Kevum

/datum/reagent/consumable/ethanol/fernet/on_mob_life(mob/living/carbon/M)
	if(M.nutrition <= NUTRITION_LEVEL_STARVING)
		M.adjustToxLoss(1*REM, 0)
	M.nutrition = max(M.nutrition - 5, 0)
	M.overeatduration = 0
	return ..()

/datum/reagent/consumable/ethanol/fruit_wine
	name = "Fruit Wine"
	id = "fruit_wine"
	description = "A wine made from grown plants."
	color = "#FFFFFF"
	boozepwr = 35
	taste_description = "bad coding"
	can_synth = FALSE
	var/list/names = list("null fruit" = 1) //Names of the fruits used. Associative list where name is key, value is the percentage of that fruit.
	var/list/tastes = list("bad coding" = 1) //List of tastes. See above.

/datum/reagent/consumable/ethanol/fruit_wine/on_new(list/data)
	names = data["names"]
	tastes = data["tastes"]
	boozepwr = data["boozepwr"]
	color = data["color"]
	generate_data_info(data)

/datum/reagent/consumable/ethanol/fruit_wine/on_merge(list/data, amount)
	var/diff = (amount/volume)
	if(diff < 1)
		color = BlendRGB(color, data["color"], diff/2) //The percentage difference over two, so that they take average if equal.
	else
		color = BlendRGB(color, data["color"], (1/diff)/2) //Adjust so it's always blending properly.
	var/oldvolume = volume-amount

	var/list/cachednames = data["names"]
	for(var/name in names | cachednames)
		names[name] = ((names[name] * oldvolume) + (cachednames[name] * amount)) / volume

	var/list/cachedtastes = data["tastes"]
	for(var/taste in tastes | cachedtastes)
		tastes[taste] = ((tastes[taste] * oldvolume) + (cachedtastes[taste] * amount)) / volume

	boozepwr *= oldvolume
	var/newzepwr = data["boozepwr"] * amount
	boozepwr += newzepwr
	boozepwr /= volume //Blending boozepwr to volume.
	generate_data_info(data)

/datum/reagent/consumable/ethanol/fruit_wine/proc/generate_data_info(list/data)
	var/minimum_percent = 0.15 //Percentages measured between 0 and 1.
	var/list/primary_tastes = list()
	var/list/secondary_tastes = list()
	glass_name = "glass of [name]"
	glass_desc = description
	for(var/taste in tastes)
		switch(tastes[taste])
			if(minimum_percent*2 to INFINITY)
				primary_tastes += taste
			if(minimum_percent to minimum_percent*2)
				secondary_tastes += taste

	var/minimum_name_percent = 0.35
	name = ""
	var/list/names_in_order = sortTim(names, /proc/cmp_numeric_dsc, TRUE)
	var/named = FALSE
	for(var/fruit_name in names)
		if(names[fruit_name] >= minimum_name_percent)
			name += "[fruit_name] "
			named = TRUE
	if(named)
		name += "wine"
	else
		name = "mixed [names_in_order[1]] wine"

	var/alcohol_description
	switch(boozepwr)
		if(120 to INFINITY)
			alcohol_description = "suicidally strong"
		if(90 to 120)
			alcohol_description = "rather strong"
		if(70 to 90)
			alcohol_description = "strong"
		if(40 to 70)
			alcohol_description = "rich"
		if(20 to 40)
			alcohol_description = "mild"
		if(0 to 20)
			alcohol_description = "sweet"
		else
			alcohol_description = "watery" //How the hell did you get negative boozepwr?

	var/list/fruits = list()
	if(names_in_order.len <= 3)
		fruits = names_in_order
	else
		for(var/i in 1 to 3)
			fruits += names_in_order[i]
		fruits += "other plants"
	var/fruit_list = english_list(fruits)
	description = "A [alcohol_description] wine brewed from [fruit_list]."

	var/flavor = ""
	if(!primary_tastes.len)
		primary_tastes = list("[alcohol_description] alcohol")
	flavor += english_list(primary_tastes)
	if(secondary_tastes.len)
		flavor += ", with a hint of "
		flavor += english_list(secondary_tastes)
	taste_description = flavor
	if(holder.my_atom)
		holder.my_atom.on_reagent_change()

//nuka

/datum/reagent/consumable/ethanol/nukadark
	name = "Nuka Dark"
	id = "nukadark"
	description = "Nuka Cola with a alcoholic twist."
	color = "#1C2118"
	boozepwr = 80
	taste_description = "bitter and toxic cola"
	glass_icon_state = "nukadarkglass"
	glass_name = "Nuka Dark"
	glass_desc = "Nuka Cola with a alcoholic twist."

/datum/reagent/consumable/ethanol/nukadark/on_mob_life(mob/living/carbon/M)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukavictory
	name = "Nuka Victory"
	id = "nukavictory"
	description = "Nuka Cola with an <BIG>AMERICAN<BIG> twist."
	color = "#FAEBD7"
	boozepwr = 45
	taste_description = "freedom"
	glass_icon_state = "nukavictoryglass"
	glass_name = "Nuka Victory"
	glass_desc = "Nuka Cola with an <BIG>AMERICAN<BIG> twist."

/datum/reagent/consumable/ethanol/nukavictory/on_mob_life(mob/living/carbon/M)
	M.add_trait(TRAIT_BIG_LEAGUES, id)
	M.adjustBruteLoss(-2.5*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukavictory/on_mob_delete(mob/living/M)
	M.remove_trait(TRAIT_BIG_LEAGUES, id)
	..()

/datum/reagent/consumable/ethanol/nukabomb
	name = "Nuka Bombdrop"
	id = "nukabomb"
	description = "More spirit than Nuka at this Rate."
	color = "#FAEBD7"
	boozepwr = 200
	taste_description = "pure alcohol"
	glass_icon_state = "nukabombglass"
	glass_name = "Nuka Bombdrop"
	glass_desc = "More spirit than Nuka at this Rate."

/datum/reagent/consumable/ethanol/nukabomb/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>You hear the /SIRENS BLAZING/</b></font>, <br><font color='#FF0000'><b>You feel the /RADIOACTIVE HELLFIRE/</b></font>")
	if(prob(50))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.adjustBruteLoss(-6*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukabomb/on_mob_delete(mob/living/M)
	M.playsound_local(M, 'sound/f13effects/explosion_2.ogg', 100, 0)
	M.Knockdown(10, 0)
	..()

/datum/reagent/consumable/ethanol/nukacide
	name = "Nukacide"
	id = "nukacide"
	description = "The drink of a goddamn madman, say your sorrows when you drink this."
	color = "#000000"
	boozepwr = 300
	taste_description = "nuclear annihilation"
	glass_icon_state = "nukacideglass"
	glass_name = "Nukacide"
	glass_desc = "The drink of a goddamn madman, say your sorrows when you drink this."

/datum/reagent/consumable/ethanol/nukacide/on_mob_life(mob/living/carbon/M)
	if(prob(30))
		M.vomit(100)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukafancy
	name = "Nuka Fancy"
	id = "nukafancy"
	description = "The Refined mans Soda, Fit for soda royalty."
	color = "#11111E"
	boozepwr = 30
	taste_description = "refined soda"
	glass_icon_state = "nukafancyglass"
	glass_name = "Nuka Fancy"
	glass_desc = "The Refined mans Soda, Fit for soda royalty."

/datum/reagent/consumable/ethanol/nukafancy/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br>Maybe I too need some Slaves?</b>","<br>Mutfruit for All!</b>","<br>Time to Glorify my Wasteland Castle!</b>","<brNuked, not stirred.</b>")
	if(prob(20))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.adjustBruteLoss(-0.5*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukalove
	name = "Nuka Love"
	id = "nukalove"
	description = "A Nuka-Cola twist on a passionate classic."
	color = "#8F4096"
	boozepwr = 60
	taste_description = "passion and bliss"
	glass_icon_state = "nukaloveglass"
	glass_name = "Nuka Love"
	glass_desc = "A Nuka-Cola twist on a passionate classic."

/datum/reagent/consumable/ethanol/nukalove/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-2*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukapunch
	name = "Nuka Punch"
	id = "nukapunch"
	description = "The drink of a Madman."
	color = "#4A261B"
	boozepwr = 150
	taste_description = "pain"
	glass_icon_state = "nukapunchglass"
	glass_name = "Nuka Punch"
	glass_desc = "The drink of a Madman."

/datum/reagent/consumable/ethanol/nukapunch/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-4*REM)
	M.adjustFireLoss(-4*REM)
	M.adjustOxyLoss(-4*REM)
	M.adjustToxLoss(-4*REM, 0)
	M.adjustStaminaLoss(-4*REM, 0)
	if(prob(10))
		M.vomit(20)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukasunrise
	name = "Nuka Sunrise"
	id = "nukasunrise"
	description = "A Nuka-Cola original drink, totally original and first of its kind!"
	color = "#D82E04"
	boozepwr = 30
	taste_description = "sweetness and funshine"
	glass_icon_state = "nukasunriseglass"
	glass_name = "Nuka Sunrise"
	glass_desc = "A Nuka-Cola original drink, totally original and first of its kind!"

/datum/reagent/consumable/ethanol/nukasunrise/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-2.5*REM, 0)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukaquantum
	name = "Nuka Quantum"
	id = "nukaquantum"
	description = "An extremely blue and glowing combination of Nuka-Cola and (REDACTED)."
	color = "#6AFFFF"
	boozepwr = 10
	taste_description = "the eighteenth flavour"
	glass_icon_state = "nukaquantumglass"
	glass_name = "Nuka Quantum"
	glass_desc = "An extremely blue and glowing combination of Nuka-Cola and (REDACTED)"
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/consumable/ethanol/nukaquantum/on_mob_life(mob/living/carbon/M)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.adjustBrainLoss(rand(1,0))
	M.AdjustStun(-20, 0)
	M.adjustToxLoss(1, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	M.hallucination += 20
	M.Jitter(2)
	M.add_trait(TRAIT_SLEEPIMMUNE, id)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukaquantum/on_mob_delete(mob/living/M)
	M.remove_trait(TRAIT_SLEEPIMMUNE, id)
	var/obj/item/organ/liver/L = M.getorganslot(ORGAN_SLOT_LIVER)
	if(L)
		L.damage += 1
	if(rage)
		QDEL_NULL(rage)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		C.cure_trauma_type(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()

/datum/reagent/consumable/ethanol/nukaxtreme //this is hell
	name = "Nuka X-Treme"
	id = "nukaxtreme"
	description = "Like Quantum, but <BIG>EXTREME<BIG>."
	color = "#72E070"
	boozepwr = 50
	taste_description = "THE EXTREME"
	glass_icon_state = "nukaxtremeglass"
	glass_name = "Nuka X-Treme"
	glass_desc = "Like Quantum, but <BIG>EXTREME<BIG>."
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/consumable/ethanol/nukaxtreme/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>EXTREME</b></font>", "<br><font color='#FF0000'><b>RAAAAR!</b></font>", "<br><font color='#FF0000'><b>BRING IT!</b></font>")
	if(prob(100))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.adjustBrainLoss(3,0)
	M.adjustToxLoss(2, 0)
	M.AdjustStun(-30, 0)
	M.AdjustKnockdown(-30, 0)
	M.AdjustUnconscious(-30, 0)
	M.adjustStaminaLoss(-5, 0)
	M.add_trait(TRAIT_IRONFIST, id)
	M.add_trait(TRAIT_SLEEPIMMUNE, id)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()
	. = 1

/datum/reagent/consumable/ethanol/nukaxtreme/on_mob_life(mob/living/carbon/M)
	if(M.hud_used)
		if(current_cycle >= 5 && current_cycle % 3 == 0)
			var/list/screens = list(M.hud_used.plane_masters["[FLOOR_PLANE]"], M.hud_used.plane_masters["[GAME_PLANE]"])
			var/matrix/skew = matrix()
			var/intensity = 8
			skew.set_skew(rand(-intensity,intensity), rand(-intensity,intensity))
			var/matrix/newmatrix = skew

			for(var/whole_screen in screens)
				animate(whole_screen, transform = newmatrix, time = 5, easing = QUAD_EASING, loop = -1)
				animate(transform = -newmatrix, time = 5, easing = QUAD_EASING)
	return ..()

/datum/reagent/consumable/ethanol/nukaxtreme/on_mob_delete(mob/living/M)
	M.remove_trait(TRAIT_IRONFIST, id)
	M.remove_trait(TRAIT_SLEEPIMMUNE, id)
	if(M && M.hud_used)
		var/list/screens = list(M.hud_used.plane_masters["[FLOOR_PLANE]"], M.hud_used.plane_masters["[GAME_PLANE]"], M.hud_used.plane_masters["[LIGHTING_PLANE]"])
		for(var/whole_screen in screens)
			animate(whole_screen, transform = matrix(), time = 5, easing = QUAD_EASING)
	if(rage)
		QDEL_NULL(rage)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		C.cure_trauma_type(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()

//vim

/datum/reagent/consumable/ethanol/vimcap
	name = "Vim Captains Blend"
	id = "vimcap"
	description = "The taste of the sea, Far from here."
	color = "#52849A"
	boozepwr = 30
	taste_description = "the sea"
	glass_icon_state = "vimcapglass"
	glass_name = "Vim Captains Blend"
	glass_desc = "A glass of special vim holding the taste of the sea, Far from here."

/datum/reagent/consumable/ethanol/vimcap/on_mob_life(mob/living/carbon/M)
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.adjustBrainLoss(rand(1,0))
	M.adjustBruteLoss(-2*REM)
	M.adjustFireLoss(-2*REM)
	M.adjustOxyLoss(2*REM)
	M.adjustStaminaLoss(-0.5*REM, 0)
	M.AdjustStun(-20, 0)
	M.adjustToxLoss(-3, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/ethanol/vimcap/on_mob_delete(mob/living/M)
	var/obj/item/organ/liver/L = M.getorganslot(ORGAN_SLOT_LIVER)
	if(L)
		L.damage += 50
	..()

//fallout cocktails - or "canon drinks i guess doe"

/datum/reagent/consumable/ethanol/alcoholz
	name = "Alcohol-Z"
	id = "alcoholz"
	description = "An potent generic spirit, distilled through tacky radiation and intense stirring."
	color = "#ECE7E5"
	boozepwr = 120
	taste_description = "spirit"
	glass_icon_state = "alcoholzglass"
	glass_name = "Alcohol-Z"
	glass_desc = "An potent generic spirit, distilled through tacky radiation and intense stirring."

/datum/reagent/consumable/ethanol/bbock
	name = "Ballistic Bock"
	id = "bbock"
	description = "An explosive cocktail that probably shouldnt be ingested, fills you with <BIG>BALLISTIC RAGE<BIG>."
	color = "#333333"
	boozepwr = 50
	taste_description = "rioting"
	glass_icon_state = "bbockglass"
	glass_name = "Ballistic Bock"
	glass_desc = "An explosive cocktail that probably shouldnt be ingested, fills you with <BIG>BALLISTIC RAGE<BIG>."
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/consumable/ethanol/bbock/on_mob_life(mob/living/carbon/M)
	if(prob(80))
		M.playsound_local(M, 'sound/f13effects/explosion_2.ogg', 100, 0)
	var/high_message = pick("<br><font color='#FF0000'><b><BIG>FUCKING KILL!<BIG></b></font>", "<br><font color='#FF0000'><b><BIG>RAAAAR!<BIG></b></font>", "<br><font color='#FF0000'><b><BIG>BRING IT!<BIG></b></font>")
	if(prob(50))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.hallucination += 40
	M.Jitter(2)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()
	. = 1

/datum/reagent/consumable/ethanol/bbrew/on_mob_delete(mob/living/M)
	if(rage)
		QDEL_NULL(rage)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		C.cure_trauma_type(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()

/datum/reagent/consumable/ethanol/bbrew
	name = "Battle Brew"
	id = "bbrew"
	description = "A drink fit for a warrior."
	color = "#CB686B"
	boozepwr = 100
	taste_description = "war"
	glass_icon_state = "bbrewglass"
	glass_name = "Battle Brew"
	glass_desc = "A drink fit for a warrior."
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/consumable/ethanol/bbrew/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>WAR</b></font>", "<br><font color='#FF0000'><b>GLORY</b></font>", "<br><font color='#FF0000'><b>OOORAH</b></font>")
	if(prob(10))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustKnockdown(-40, 0)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()
	. = 1

/datum/reagent/consumable/ethanol/bbrew/on_mob_delete(mob/living/M)
	if(rage)
		QDEL_NULL(rage)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		C.cure_trauma_type(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()

/datum/reagent/consumable/ethanol/bbrew2
	name = "Blackwater Brew"
	id = "bbrew2"
	description = "Underground river wine, stewed from logs and food poisoning."
	color = "#B2B2B2"
	boozepwr = 40
	taste_description = "a cess pool and sweetness"
	glass_icon_state = "bbrew2glass"
	glass_name = "Blackwater Brew"
	glass_desc = "Underground river wine, stewed from logs and food poisoning."

/datum/reagent/consumable/ethanol/bbrew2/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-4*REM, 0)
	..()

/datum/reagent/consumable/ethanol/dwastelander
	name = "Dirty Wastelander"
	id = "dwastelander"
	description = "A wastelanders second favourite."
	color = "#6E597B"
	boozepwr = 80
	taste_description = "scavenging air"
	glass_icon_state = "dwastelanderglass"
	glass_name = "Dirty Wastelander"
	glass_desc = "A wastelanders second favourite. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/dwastelander/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-3*REM, 0)
	..()

/datum/reagent/consumable/ethanol/firebelly
	name = "Fire Belly"
	id = "firebelly"
	description = "The spiciest drink in the West."
	color = "#673542"
	boozepwr = 160
	taste_description = "heartburn"
	glass_icon_state = "firebellyglass"
	glass_name = "Fire Belly"
	glass_desc = "The spiciest drink in the West."

/datum/reagent/consumable/ethanol/firebelly/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(100 * TEMPERATURE_DAMAGE_COEFFICIENT, 0 ,BODYTEMP_HEAT_DAMAGE_LIMIT)
	var/heating = 0
	switch(current_cycle)
		if(1 to 15)
			heating = 5 * TEMPERATURE_DAMAGE_COEFFICIENT
			if(holder.has_reagent("cryostylane"))
				holder.remove_reagent("cryostylane", 5)
			if(isslime(M))
				heating = rand(5,20)
		if(15 to 25)
			heating = 10 * TEMPERATURE_DAMAGE_COEFFICIENT
			if(isslime(M))
				heating = rand(10,20)
		if(25 to 35)
			heating = 15 * TEMPERATURE_DAMAGE_COEFFICIENT
			if(isslime(M))
				heating = rand(15,20)
		if(35 to INFINITY)
			heating = 20 * TEMPERATURE_DAMAGE_COEFFICIENT
			if(isslime(M))
				heating = rand(20,25)
	M.adjust_bodytemperature(heating)
	M.adjustBruteLoss(-1*REM, 0)
	if(prob(50))
		M.visible_message("<span class='warning'>[M] [pick("dry heaves!","coughs!","splutters!")]</span>")
	..()

/datum/reagent/consumable/ethanol/firecracker
	name = "Firecracker"
	id = "firecracker"
	description = "An warming mixture of wasteland homebrews."
	color = "#612B2F"
	boozepwr = 40
	taste_description = "country roads"
	glass_icon_state = "firecrackerglass"
	glass_name = "Firecracker"
	glass_desc = "An warming mixture of wasteland homebrews."

/datum/reagent/consumable/ethanol/firecracker/on_mob_life(mob/living/carbon/M)
	if(prob(33))
		M.adjustBruteLoss(-4*REM, 0)
		M.adjustFireLoss(-4*REM, 0)
		. = TRUE
	..()

/datum/reagent/consumable/ethanol/hardlemonade
	name = "Hard Lemonade"
	id = "hardlemonade"
	description = "Lemonade, but FOR MEN."
	color = "#D2FE6B"
	boozepwr = 60
	taste_description = "lemonade and vodka"
	glass_icon_state = "hardlemonadeglass"
	glass_name = "Hard Lemonade"
	glass_desc = "Lemonade, but FOR MEN. S: +1 C: +1 I: -1"

	pos_Strength = 1
	pos_Charisma = 1
	pos_Intelligence = -1
	neg_Strength = -1
	neg_Charisma = -1
	neg_Intelligence = 1

	can_affect = TRUE

/datum/reagent/consumable/ethanol/hardlemonade/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-20, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	M.hallucination += 20
	M.Jitter(2)
	..()

/datum/reagent/consumable/ethanol/jakejuice
	name = "Jake Juice"
	id = "jakejuice"
	description = "Who is Jake, why is this his Juice?"
	color = "#8EC577"
	boozepwr = 50
	taste_description = "patented juice"
	glass_icon_state = "greenbeerglass"
	glass_name = "Jake Juice"
	glass_desc = "Patented Jake Juice, Mixable at users own legal discretion."

/datum/reagent/consumable/ethanol/jakejuice/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-20, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	M.hallucination += 20
	M.Jitter(2)
	..()

/datum/reagent/consumable/ethanol/wastetequila
	name = "Wasteland Tequila"
	id = "wastetequila"
	description = "For the Real Hombres."
	color = "#CC99FF"
	boozepwr = 100
	taste_description = "old world blues and luchadors"
	glass_icon_state = "wastetequilaglass"
	glass_name = "Wasteland Tequila"
	glass_desc = "Brewed and distributed through the illusive Rad-Hombres."

/datum/reagent/consumable/ethanol/wastetequila/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-20, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	M.hallucination += 20
	M.Jitter(2)
	..()

/datum/reagent/consumable/ethanol/nukashine
	name = "Nukashine"
	id = "nukashine"
	description = "You've really hit rock bottom now... your liver packed its bags and left last night. Stronger than the normal stuff, whooboy."
	color = "#706A58"
	boozepwr = 150
	taste_description = "sweetness and liverpain"
	glass_icon_state = "glass_brown"
	glass_name = "Nukashine"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night. Stronger than the normal stuff, whooboy."

/datum/reagent/consumable/ethanol/olflakey
	name = "Ol' Flakey"
	id = "olflakey"
	description = "So smooth its flakey, leaves your throat confused and your body numb."
	color = "#DEE05E"
	boozepwr = 80
	taste_description = "dryness and warmth"
	glass_icon_state = "olflakeyglass"
	glass_name = "Ol' Flakey"
	glass_desc = "So smooth its flakey, leaves your throat confused and your body numb."

/datum/reagent/consumable/ethanol/olflakey/on_mob_life(mob/living/carbon/M)
	M.emote("laugh")
	M.emote("cough")
	..()

/datum/reagent/consumable/ethanol/oldpossum
	name = "Old Possum"
	id = "oldpossum"
	description = "Unrelated to Poppy."
	color = "#C4BA71"
	boozepwr = 1
	taste_description = "possum"
	glass_icon_state = "oldpossumglass"
	glass_name = "Old Possum"
	glass_desc = "A ratmans classic, chalky and privelaged."

/datum/reagent/consumable/ethanol/oldpossum/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>eat the possum</b></font>")
	if(prob(0.1))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustStun(-20, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	M.hallucination += 20
	M.Jitter(2)
	..()

/datum/reagent/consumable/ethanol/sludge
	name = "Resilient Sludge"
	id = "sludge"
	description = "A Ghoulies classical brew."
	color = "#C8F085"
	boozepwr = 100
	taste_description = "toxic waste"
	glass_icon_state = "sludgeglass"
	glass_name = "Resilient Sludge"
	glass_desc = "A Ghoulies classical brew."

/datum/reagent/consumable/ethanol/sludge/on_mob_life(mob/living/carbon/M)
	if(isghoul(M))
		M.adjustFireLoss(-2.5*REM, 0)
		M.adjustBruteLoss(-2.5*REM, 0)
		M.adjustToxLoss(-2.5*REM, 0)
	else
		if(ishuman(M))
			if(prob(80))
				M.vomit(10)
				M.adjustToxLoss(4*REM, 0)
			..()

/datum/reagent/consumable/ethanol/strongsludge
	name = "Strong Sludge"
	id = "strongsludge"
	description = "Not for Human Consumption."
	color = "#027F02"
	boozepwr = 200
	taste_description = "toxic waste and death"
	glass_icon_state = "strongsludgeglass"
	glass_name = "Strong Sludge"
	glass_desc = "Not for Human Consumption."

/datum/reagent/consumable/ethanol/strongsludge/on_mob_life(mob/living/carbon/M)
	if(isghoul(M))
		M.adjustFireLoss(-4*REM, 0)
		M.adjustBruteLoss(-4*REM, 0)
		M.adjustToxLoss(-4*REM, 0)
	else
		if(ishuman(M))
			if(prob(98))
				M.vomit(50)
				M.adjustToxLoss(10*REM, 0)
		..()

/datum/reagent/consumable/ethanol/sweetwater
	name = "Sweet Water"
	id = "sweetwater"
	description = "For those hot irradiated days on the ranch."
	color = "#BAC488"
	boozepwr = 40
	taste_description = "sweetness and relaxation"
	glass_icon_state = "sweetwaterglass"
	glass_name = "Sweet Water"
	glass_desc = "For those hot irradiated days on the ranch."

/datum/reagent/consumable/ethanol/sweetwater/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()

/datum/reagent/consumable/ethanol/xbeer
	name = "XXXXXXBeer"
	id = "xbeer"
	description = "Beer, but strong."
	color = "#A6868F"
	boozepwr = 80
	taste_description = "strong piss water"
	glass_icon_state = "xbeerglass"
	glass_name = "XXXXXXBeer"
	glass_desc = "Beer, but strong."

//fallout cocktails - not canon, from the mind o scar

/datum/reagent/consumable/ethanol/atombomb //metadrink :flushed:
	name = "Atom Bomb"
	id = "atombomb"
	description = "War, War never changes."
	color = "#6A8216"
	boozepwr = 150
	taste_description = "fallout"
	glass_icon_state = "atombombglass"
	glass_name = "Atom Bomb"
	glass_desc = "War, War never changes."

/datum/reagent/consumable/ethanol/atombomb/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>You hear the /SIRENS BLAZING/</b></font>, <br><font color='#FF0000'><b>You feel the /RADIOACTIVE HELLFIRE/</b></font>")
	if(prob(50))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	if(prob(50))
		M.playsound_local(M, 'sound/f13effects/explosion_fire.ogg', 100, 0)
	if(prob(50))
		M.playsound_local(M, 'sound/f13effects/alarm.ogg', 100, 0)
	M.Jitter(100)
	M.adjustBruteLoss(-3*REM, 0)
	M.dizziness +=1.5
	M.drowsyness = 0
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/henessey
	name = "Henessey"
	id = "henessey"
	description = "For the truly robust."
	color = "#CB686B"
	boozepwr = 100
	taste_description = "robust"
	glass_icon_state = "henesseyglass"
	glass_name = "Henessey"
	glass_desc = "For the truly robust."
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/consumable/ethanol/henessey/on_mob_life(mob/living/carbon/M)
	M.Jitter(40)
	M.dizziness +=1.5
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.adjustBrainLoss(rand(2,0))
	M.AdjustStun(-20, 0)
	M.adjustToxLoss(1, 0)
	M.AdjustKnockdown(-20, 0)
	M.AdjustUnconscious(-20, 0)
	M.adjustStaminaLoss(-3, 0)
	M.hallucination += 100
	M.Jitter(2)
	M.add_trait(TRAIT_SLEEPIMMUNE, id)
	M.add_trait(TRAIT_IRONFIST, id)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()
	. = 1

/datum/reagent/consumable/ethanol/henessey/on_mob_delete(mob/living/M)
	M.remove_trait(TRAIT_SLEEPIMMUNE, id)
	M.remove_trait(TRAIT_IRONFIST, id)
	var/obj/item/organ/liver/L = M.getorganslot(ORGAN_SLOT_LIVER)
	if(L)
		L.damage += 200
	if(rage)
		QDEL_NULL(rage)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		C.cure_trauma_type(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	..()

/datum/reagent/consumable/ethanol/vaulttech
	name = "Vault-Tech Special"
	id = "vaulttech"
	description = "The only brew, Certified to be drank on duty!"
	color = "#315585"
	boozepwr = 30
	taste_description = "blue and yellow"
	glass_icon_state = "vaulttechglass"
	glass_name = "Vault-Tech Special"
	glass_desc = "The only brew, Certified to be drank on duty!"

/datum/reagent/consumable/ethanol/vaulttech/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.adjustToxLoss(-3, 0)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/ethanol/vaultboy //yeah this turns you into vault boy if you OD, very HRP
	name = "Vault Boy"
	id = "vaultboy"
	description = "The beloved mascot of the Vault-Tech corporation in brew form!"
	color = "#315585"
	boozepwr = 40
	taste_description = "your intelligience stat decreasing"
	overdose_threshold = 60
	glass_icon_state = "vaultboyglass"
	glass_name = "Vault Boy"
	glass_desc = "The beloved mascot of the Vault-Tech corporation in brew form!"

/datum/reagent/consumable/ethanol/vaultboy/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.adjustBruteLoss(-4*REM, 0)
	M.adjustFireLoss(-4*REM, 0)
	M.adjustToxLoss(-2, 0)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/ethanol/vaultboy/overdose_process(mob/living/M)
	if(M && ishuman(M))
		var/mob/living/carbon/human/H = M
		H.hair_style = "Business Hair 4"
		H.facial_hair_style = "Shaved"
		H.facial_hair_color = "#FFFF99"
		H.hair_color = "#FFFF99"
		H.update_hair()
		..()
		. = 1

/datum/reagent/consumable/ethanol/vaultgirl //praying to god this dosent become "femboy juice"
	name = "Vault Girl"
	id = "vaultgirl"
	description = "Gender equality! You have no idea what this is supposed to represent."
	color = "#315585"
	boozepwr = 40
	taste_description = "your charisma stat increasing"
	overdose_threshold = 60
	glass_icon_state = "vaultgirlglass"
	glass_name = "Vault Girl"
	glass_desc = "Gender equality! You have no idea what this is supposed to represent."

/datum/reagent/consumable/ethanol/vaultgirl/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-5)
	M.adjustBruteLoss(-4*REM, 0)
	M.adjustFireLoss(-4*REM, 0)
	M.adjustToxLoss(-2, 0)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent("frostoil"))
		holder.remove_reagent("frostoil", 5)
	..()
	. = 1

/datum/reagent/consumable/ethanol/vaultboy/overdose_process(mob/living/M)
	if(M && ishuman(M))
		var/mob/living/carbon/human/H = M
		H.hair_style = "Over Eye"
		H.facial_hair_style = "Shaved"
		H.facial_hair_color = "#FFFF99"
		H.hair_color = "#FFFF99"
		H.update_hair()
		..()
		. = 1

/datum/reagent/consumable/ethanol/fernet_cola
	name = "Fernet Cola"
	id = "fernet_cola"
	description = "A very popular and bittersweet digestif, ideal after a heavy meal. Best served on a sawed-off cola bottle as per tradition."
	color = "#390600"
	boozepwr = 30
	taste_description = "smooth caramel, fizzy cola, and bitter herbs"
	glass_icon_state = "godlyblend"
	glass_name = "glass of fernet cola"
	glass_desc = "A sawed-off cola bottle filled with Fernet Cola. Nothing better after eating like a lardass."

/datum/reagent/consumable/ethanol/fernetcola/on_mob_life(mob/living/carbon/M)
	if(M.nutrition <= NUTRITION_LEVEL_STARVING)
		M.adjustToxLoss(1*REM, 0)
	M.nutrition = max(M.nutrition - 5, 0)
	M.overeatduration = 0
	return ..()

/datum/reagent/consumable/ethanol/moonshinez
	name = "Moonshine-Z"
	id = "moonshinez"
	description = "Extreme moonshine, a lethal mix of moonshine and the most potent spirit known to man."
	color = "#ECE7E5"
	boozepwr = 300
	taste_description = "death"
	glass_icon_state = "moonshinezglass"
	glass_name = "Moonshine-Z"
	glass_desc = "Extreme moonshine, a lethal mix of moonshine and the most potent spirit known to man."

/datum/reagent/consumable/ethanol/corporate
	name = "Corporate"
	id = "corporate"
	description = "The ultimate brand mix of every soda."
	color = "#85785B"
	boozepwr = 10
	taste_description = "brand loyalty"
	glass_icon_state = "corporateglass"
	glass_name = "Corporate"
	glass_desc = "The ultimate brand mix of every soda."

/datum/reagent/consumable/ethanol/corporate/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#006600'><b>Business!</b></font>, <br><font color='#006600'><b>Sales!</b></font>, <br><font color='#006600'><b>Profit!</b></font>")
	if(prob(50))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.Jitter(100)
	M.dizziness +=5
	M.drowsyness = 0
	M.AdjustSleeping(-40, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	..()
	. = 1

/datum/reagent/consumable/ethanol/ranchwhiskey
	name = "Ranchers Whiskey"
	id = "ranchwhiskey"
	description = "For them /hard days/ on the ranch."
	color = "#9C5C3A"
	boozepwr = 80
	taste_description = "cowboys"
	glass_icon_state = "rancherwhiskeyglass"
	glass_name = "Ranchers Whiskey"
	glass_desc = "For them /hard days/ on the ranch."

/datum/reagent/consumable/ethanol/ranchwhiskey/on_mob_life(mob/living/carbon/M)
	if(prob(50))
		var/smoke_message = pick("You feel relaxed.", "You feel calmed.","You feel alert.","You feel rugged.")
		to_chat(M, "<span class='notice'>[smoke_message]</span>")
	M.adjustBruteLoss(-4*REM, 0)
	M.adjustFireLoss(-4*REM, 0)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	M.emote("sigh")
	..()
	. = 1

/datum/reagent/consumable/ethanol/spiritcleanser
	name = "Spirit Cleanser"
	id = "spiritcleanser"
	description = "Purges your Body and Soul, returning your filth, UNTO GOD."
	color = "#C0DDBC"
	boozepwr = 100
	taste_description = "redemption"
	glass_icon_state = "spiritcleanserglass"
	glass_name = "Spirit Cleanser"
	glass_desc = "Purges your Body and Soul, returning your filth, UNTO GOD."

/datum/reagent/consumable/ethanol/spiritcleanser/on_mob_add(mob/living/M) //spiritual shizzle, also admemes getting booled on
	M.add_trait(TRAIT_SPIRITUAL, id)
	if(prob(50))
		M.playsound_local(M, 'sound/f13ambience/bird_6.ogg', 100, 0)
	if(prob(50))
		M.playsound_local(M, 'sound/effects/his_grace_awaken.ogg', 100, 0)
	M.radiation = max(M.radiation-5,0)
	M.adjustToxLoss(-4*REM, 0)
	M.set_drugginess(100)
	M.hallucination += 100
	..()

/datum/reagent/consumable/ethanol/spiritcleanser/on_mob_delete(mob/living/M)
	M.remove_trait(TRAIT_SPIRITUAL, id)
	M.set_drugginess(0)
	M.hallucination += 0
	..()
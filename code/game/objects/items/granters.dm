
///books that teach things (intrinsic actions like bar flinging, spells like fireball or smoke, or martial arts)///

/obj/item/book/granter
	due_date = 0 // Game time in deciseconds
	unique = 1   // 0  Normal book, 1  Should not be treated as normal book, unable to be copied, unable to be modified
	var/list/remarks = list() //things to read about while learning.
	var/pages_to_mastery = 3 //Essentially controls how long a mob must keep the book in his hand to actually successfully learn
	var/reading = FALSE //sanity
	var/oneuse = TRUE //default this is true, but admins can var this to 0 if we wanna all have a pass around of the rod form book
	var/used = FALSE //only really matters if oneuse but it might be nice to know if someone's used it for admin investigations perhaps

/obj/item/book/granter/proc/turn_page(mob/user)
	playsound(user, pick('sound/effects/pageturn1.ogg','sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg'), 30, 1)
	if(do_after(user,50, user))
		to_chat(user, "<span class='notice'>[pick(remarks)]</span>")
		return TRUE
	return FALSE

/obj/item/book/granter/proc/recoil(mob/user) //nothing so some books can just return

/obj/item/book/granter/proc/onlearned(mob/user)
	used = TRUE

/obj/item/book/granter/proc/already_known(mob/user)
	return FALSE

/obj/item/book/granter/proc/on_reading_start(mob/user)
	to_chat(user, "<span class='notice'>You start reading [name]...</span>")

/obj/item/book/granter/proc/on_reading_stopped(mob/user)
	to_chat(user, "<span class='notice'>You stop reading...</span>")

/obj/item/book/granter/proc/on_reading_finished(mob/user)
	to_chat(user, "<span class='notice'>You finish reading [name]!</span>")

/obj/item/book/granter/attack_self(mob/user)
	if(reading)
		to_chat(user, "<span class='warning'>You're already reading this!</span>")
		return FALSE
	if(already_known(user))
		return FALSE
	if(used && oneuse)
		recoil(user)
	else
		on_reading_start(user)	
		reading = TRUE
		for(var/i=1, i<=pages_to_mastery, i++)
			if(!turn_page(user))
				on_reading_stopped()
				reading = FALSE
				return
		if(do_after(user,50, user))
			on_reading_finished(user)
		reading = FALSE
	return TRUE

///ACTION BUTTONS///

/obj/item/book/granter/action
	var/granted_action
	var/actionname = "catching bugs" //might not seem needed but this makes it so you can safely name aciton buttons toggle this or that without it fucking up the granter, also caps

/obj/item/book/granter/action/attack_self(mob/user)
	. = ..()
	if(!.)
		return
	if(!granted_action)
		return
	var/datum/action/G = new granted_action
	for(var/datum/action/A in user.actions)
		if(A.type == G.type)
			to_chat(user, "<span class='notice'>You already know all about [actionname].</span>")
			qdel(G)
			return
	if(used == TRUE && oneuse == TRUE)
		recoil(user)
	else
		to_chat(user, "<span class='notice'>You start reading about [actionname]...</span>")
		reading = TRUE
		for(var/i=1, i<=pages_to_mastery, i++)
			if(!turn_page(user))
				to_chat(user, "<span class='notice'>You stop reading...</span>")
				reading = FALSE
				qdel(G)
				return
		if(do_after(user,50, user))
			to_chat(user, "<span class='notice'>You feel like you've got a good handle on [actionname]!</span>")
			G.Grant(user)
		reading = FALSE

//TRAIT GRANTERS///
/obj/item/book/granter/trait
	var/teachable = TRUE
	var/datum/granter_trait/trait = /datum/granter_trait

/obj/item/book/granter/trait/already_known(mob/living/user)
	if(!trait)
		return TRUE
	var/datum/granter_trait/T = new trait()
	if(user.has_trait(T.grant))
		to_chat(user, "<span class='notice'>You already know all about [T.name].</span>")
		return TRUE
	return FALSE

/obj/item/book/granter/trait/on_reading_start(mob/living/user)
	var/datum/granter_trait/T = new trait()
	to_chat(user, "<span class='notice'>You start reading about [T.name]...</span>")

/obj/item/book/granter/trait/on_reading_finished(mob/living/user)
	var/datum/granter_trait/T = new trait()
	to_chat(user, "<span class='notice'>You feel like you've got a good handle on [T.name]!</span>")
	user.add_trait(T.grant, TRAIT_GENERIC)
	onlearned(user)

/obj/item/book/granter/trait/onlearned(mob/living/user)
	..()
	if(oneuse)
		user.visible_message("<span class='caution'>[src]'s is useless to you now. You throw the book away.</span>")
		qdel(src)


/mob/living/proc/teach_skill()
	set name = "Teach"
	set desc = "Share the knowledge. Enlight the not enlightened!"
	set category = "IC"

	var/list/traits = list()
	var/list/options = list()
	for(var/path in subtypesof(/datum/granter_trait))
		var/datum/granter_trait/T = new path()
		if(is_string_in_list(T.grant, status_traits))
			if (T.teachable)
				traits[T.name] = path
				options += T.name
		
	if(!length(options))
		to_chat(src, "You don't know anything valuable to share.")
		return
	var/select = input(src, "Select a skill to teach", "Select skill") in options
	if(!select)
		return
	var/p = traits[select]
	var/datum/granter_trait/selected = new p()

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		// if(target.stat || !target.mind || !target.client)
		if(target.stat)
			continue
		if(target.has_trait(selected.grant))
			continue
		possible_targets += target

	if(!possible_targets.len)
		to_chat(src, "Nobody here is capable of understanding the [selected.name]")
		return

	var/mob/living/carbon/C
	C = input("Choose who to invite to your gang!", "Gang invitation") as null|mob in possible_targets
	if(!C)
		return

	to_chat(src, "You begin teaching [C] the [selected.name]. Take a sit, this will take some time...")
	to_chat(C, "[src] begins teaching you the [selected.name]. Take a sit, this will take some time...")

	if(do_after(src, 200, FALSE, C))
		to_chat(src, "<span class='notice'>You finish enlightining [C] about misteries of [selected.name]!</span>")

		to_chat(C, "<span class='notice'>You feel like you've got a good handle on [selected.name]!</span>")
		C.add_trait(selected.grant, TRAIT_GENERIC)


/obj/item/book/granter/trait/chemistry
	name = "Chemistry for Wastelanders"
	desc = "A useful book on chemistry."
	icon_state = "chem"
	oneuse = TRUE
	trait = /datum/granter_trait/chemistry
	remarks = list("Always have a safe working environment...", "Don't give chems to strangers...", "Never drink any chemicals straight from the dispenser...", "Always wear your labcoat...", "Never forget your goggles...")

/obj/item/book/granter/trait/spirit_teachings
	name = "Teachings of the Machine Spirits"
	desc = "A book all about tribal life among the Machine Spirits."
	icon_state = "spirit"
	oneuse = TRUE
	trait = /datum/granter_trait/spirit_teachings
	remarks = list("There are five Machine Spirits...", "Each govern an aspect of life...", "Always respect the Machine Spirits", "Never use them for selfish reasons", "Honour and love those blessed by the machine spirits.")


/obj/item/book/granter/trait/gunsmith
	name = "Gunsmithing for dummies"
	desc = "A book on how to use smith deadly weapons. It's pretty complicated."
	icon_state = "gc"
	oneuse = TRUE
	trait = /datum/granter_trait/gunsmith
	remarks = list("Try turning it off and on again...","Alwyas craft in good form.", "Dont forget PPE.", "Keep your mechanisms OILED.", "Stay organised.")


/obj/item/book/granter/trait/techno
	name = "Craftsmanship Monthly"
	desc = "A book on how to use advanced tools and production machinery. It's pretty complicated."
	icon_state = "work"
	oneuse = TRUE
	trait = /datum/granter_trait/techno
	remarks = list("Try turning it off and on again...","Alwyas craft in good form.", "Dont forget PPE.", "Keep your mechanisms OILED.", "Stay organised.")

/obj/item/book/granter/trait/pa_wear
	name = "Advanced Armor and You"
	desc = "An indepth look into how power armor functions."
	icon_state = "apa"
	oneuse = TRUE
	trait = /datum/granter_trait/pa_wear
	remarks = list("Don't forget to do daily maintenance...","Keep your armor well guarded..","Slow and steady wins the race...","Positioning is important while moving slow...","Tired? Take a nap in your suit...","Saftey comes first when wearing your gear...")

/obj/item/book/granter/trait/trekking
	name = "Ranger's Guide to the Wasteland"
	desc = "An extensive guide about trekking through the wastes. Written by Allesandra Hall, former NCR Ranger."
	icon_state = "wstlnd"
	oneuse = TRUE
	trait = /datum/granter_trait/trekking
	remarks = list("It never hurts to take the road less travelled...", "Proper movement is key to your survival...", "Whether during combat or for simple travel, the desert can be your friend...", "Without proper knowledge, it can be hard to traverse the desert on foot...", "A Ranger is always prepared...")


/obj/item/book/granter/trait/field_surgery
	name = "Field Surgery Handbook"
	desc = "Most trusted and up-to-date manual offered by the Department of Defense for military medical personnel in the field"
	icon_state = "surg"
	oneuse = TRUE
	trait = /datum/granter_trait/field_surgery
	remarks = list("Keep missing limbs fresh...", "Every second matters...", "Bodies can be brought to life after applying a direct charge...", "Makeshift instruments is a handy replacement...", "Right actions can patch up a dead body without chemicals...")


/obj/item/book/granter/trait/brain_surgery
	name = "Brain Surgery Manual"
	desc = "Handbook of advanced brain surgery techniques. Approved by 9 experts out of 10."
	icon_state = "bruin"
	oneuse = TRUE
	trait = /datum/granter_trait/brain_surgery
	remarks = list("Pacient can be pacified just by cutting...", "Lobotomy is used for curing severe cerebral traumas...", "Bodies can be brought to life after applying a direct charge...", "Pacient can be kept in symbiotic relationship with a virus...")


/*
/obj/item/book/granter/trait/iron_fist
	name = "Brawler's Guide to Fisticuffs"
	desc = "An advanced manual on fistfighting. It has pictures, too!"
	oneuse = TRUE
	granted_trait = TRAIT_IRONFIST
	traitname = "punching"
	remarks = list("Keep your fists up...", "Don't clench your thumb in your fist, or you might break it...", "Turn into your punch, and put your body weight behind it...", "Footwork is everything, make sure to step into your punches...", "Aim for their jaw for an easy K-O...")
*/

/obj/item/book/granter/trait/gunsmith_one
	name = "Guns and Bullets, Part 1"
	desc = "A rare issue of Guns and Bullets detailing the basic manufacture of firearms, allowing the reader to craft Tier 2 firearms. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab1"
	oneuse = FALSE
	tool_behaviour = TOOL_GUNTIER1
	trait = /datum/granter_trait/gunsmith_one
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")

/obj/item/book/granter/trait/gunsmith_two
	name = "Guns and Bullets, Part 2"
	desc = "A rare issue of Guns and Bullets following up Part 1, going further indepth into weapon mechanics, allowing the reader to craft Tier 3 firearms. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab2"
	oneuse = FALSE
	tool_behaviour = TOOL_GUNTIER2
	trait = /datum/granter_trait/gunsmith_two
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")

/obj/item/book/granter/trait/gunsmith_three
	name = "Guns and Bullets, Part 3"
	desc = "A rare issue of Guns and Bullets following up Part 2, explaining difficult ballistics theory and weapon mechanics, allowing the reader to craft Tier 4 firearms. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab3"
	oneuse = FALSE
	tool_behaviour = TOOL_GUNTIER3
	trait = /datum/granter_trait/gunsmith_three
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")

/obj/item/book/granter/trait/gunsmith_four
	name = "Guns and Bullets, Part 4"
	desc = "An extremely rare issue of Guns and Bullets, showing some design flaws of weapons and how to rectify them, allowing the reader to craft Tier 5 firearms. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab4"
	oneuse = FALSE
	tool_behaviour = TOOL_GUNTIER4
	trait = /datum/granter_trait/gunsmith_four
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")

/obj/item/book/granter/action/drink_fling
	granted_action = /datum/action/innate/drink_fling
	name = "Tapper: This One's For You"
	desc = "A seminal work on the dying art of booze sliding."
	icon_state = "barbook"
	actionname = "drink flinging"
	oneuse = FALSE
	remarks = list("The trick is keeping a low center of gravity it seems...", "The viscosity of the liquid is important...", "Accounting for crosswinds... really?", "Drag coefficients of various popular drinking glasses...", "What the heck is laminar flow and why does it matter here?", "Greasing the bar seems like it'd be cheating...", "I don't think I'll be working with superfluids...")

/datum/action/innate/drink_fling
	name = "Drink Flinging"
	desc = "Toggles your ability to satifyingly throw glasses without spilling them."
	button_icon_state = "drinkfling_off"
	check_flags = 0

/datum/action/innate/drink_fling/Activate()
	button_icon_state = "drinkfling_on"
	active = TRUE
	UpdateButtonIcon()

/datum/action/innate/drink_fling/Deactivate()
	button_icon_state = "drinkfling_off"
	active = FALSE
	UpdateButtonIcon()

///SPELLS///

/obj/item/book/granter/spell
	var/spell
	var/spellname = "conjure bugs"

/obj/item/book/granter/spell/attack_self(mob/user)
	. = ..()
	if(!.)
		return
	if(!spell)
		return
	var/obj/effect/proc_holder/spell/S = new spell
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		if(knownspell.type == S.type)
			if(user.mind)
				if(iswizard(user))
					to_chat(user,"<span class='notice'>You're already far more versed in this spell than this flimsy howto book can provide.</span>")
				else
					to_chat(user,"<span class='notice'>You've already read this one.</span>")
			return
	if(used == TRUE && oneuse == TRUE)
		recoil(user)
	else
		to_chat(user, "<span class='notice'>You start reading about casting [spellname]...</span>")
		reading = TRUE
		for(var/i=1, i<=pages_to_mastery, i++)
			if(!turn_page(user))
				to_chat(user, "<span class='notice'>You stop reading...</span>")
				reading = FALSE
				qdel(S)
				return
		if(do_after(user,50, user))
			to_chat(user, "<span class='notice'>You feel like you've experienced enough to cast [spellname]!</span>")
			user.mind.AddSpell(S)
			user.log_message("<font color='orange'>learned the spell [spellname] ([S]).</font>", INDIVIDUAL_ATTACK_LOG)
			onlearned(user)
		reading = FALSE

/obj/item/book/granter/spell/recoil(mob/user)
	user.visible_message("<span class='warning'>[src] glows in a black light!</span>")

/obj/item/book/granter/spell/onlearned(mob/user)
	..()
	if(oneuse)
		user.visible_message("<span class='caution'>[src] glows dark for a second!</span>")

/obj/item/book/granter/spell/fireball
	spell = /obj/effect/proc_holder/spell/aimed/fireball
	spellname = "fireball"
	icon_state ="bookfireball"
	desc = "This book feels warm to the touch."
	remarks = list("Aim...AIM, FOOL!", "Just catching them on fire won't do...", "Accounting for crosswinds... really?", "I think I just burned my hand...", "Why the dumb stance? It's just a flick of the hand...", "OMEE... ONI... Ugh...", "What's the difference between a fireball and a pyroblast...")

/obj/item/book/granter/spell/fireball/recoil(mob/user)
	..()
	explosion(user.loc, 1, 0, 2, 3, FALSE, FALSE, 2)
	qdel(src)

/obj/item/book/granter/spell/sacredflame
	spell = /obj/effect/proc_holder/spell/targeted/sacred_flame
	spellname = "sacred flame"
	icon_state ="booksacredflame"
	desc = "Become one with the flames that burn within... and invite others to do so as well."
	remarks = list("Well, it's one way to stop an attacker...", "I'm gonna need some good gear to stop myself from burning to death...", "Keep a fire extingusher handy, got it...", "I think I just burned my hand...", "Apply flame directly to chest for proper ignition...", "No pain, no gain...", "One with the flame...")

/obj/item/book/granter/spell/smoke
	spell = /obj/effect/proc_holder/spell/targeted/smoke
	spellname = "smoke"
	icon_state ="booksmoke"
	desc = "This book is overflowing with the dank arts."
	remarks = list("Smoke Bomb! Heh...", "Smoke bomb would do just fine too...", "Wait, there's a machine that does the same thing in chemistry?", "This book smells awful...", "Why all these weed jokes? Just tell me how to cast it...", "Wind will ruin the whole spell, good thing we're in space... Right?", "So this is how the spider clan does it...")

/obj/item/book/granter/spell/smoke/lesser //Chaplain smoke book
	spell = /obj/effect/proc_holder/spell/targeted/smoke/lesser

/obj/item/book/granter/spell/smoke/recoil(mob/user)
	..()
	to_chat(user,"<span class='caution'>Your stomach rumbles...</span>")
	if(user.nutrition)
		user.nutrition = 200
		if(user.nutrition <= 0)
			user.nutrition = 0

/obj/item/book/granter/spell/blind
	spell = /obj/effect/proc_holder/spell/targeted/trigger/blind
	spellname = "blind"
	icon_state ="bookblind"
	desc = "This book looks blurry, no matter how you look at it."
	remarks = list("Well I can't learn anything if I can't read the damn thing!", "Why would you use a dark font on a dark background...", "Ah, I can't see an Oh, I'm fine...", "I can't see my hand...!", "I'm manually blinking, damn you book...", "I can't read this page, but somehow I feel like I learned something from it...", "Hey, who turned off the lights?")

/obj/item/book/granter/spell/blind/recoil(mob/user)
	..()
	to_chat(user,"<span class='warning'>You go blind!</span>")
	user.blind_eyes(10)

/obj/item/book/granter/spell/mindswap
	spell = /obj/effect/proc_holder/spell/targeted/mind_transfer
	spellname = "mindswap"
	icon_state ="bookmindswap"
	desc = "This book's cover is pristine, though its pages look ragged and torn."
	var/mob/stored_swap //Used in used book recoils to store an identity for mindswaps
	remarks = list("If you mindswap from a mouse, they will be helpless when you recover...", "Wait, where am I...?", "This book is giving me a horrible headache...", "This page is blank, but I feel words popping into my head...", "GYNU... GYRO... Ugh...", "The voices in my head need to stop, I'm trying to read here...", "I don't think anyone will be happy when I cast this spell...")

/obj/item/book/granter/spell/mindswap/onlearned()
	spellname = pick("fireball","smoke","blind","forcewall","knock","barnyard","charge")
	icon_state = "book[spellname]"
	name = "spellbook of [spellname]" //Note, desc doesn't change by design
	..()

/obj/item/book/granter/spell/mindswap/recoil(mob/user)
	..()
	if(stored_swap in GLOB.dead_mob_list)
		stored_swap = null
	if(!stored_swap)
		stored_swap = user
		to_chat(user,"<span class='warning'>For a moment you feel like you don't even know who you are anymore.</span>")
		return
	if(stored_swap == user)
		to_chat(user,"<span class='notice'>You stare at the book some more, but there doesn't seem to be anything else to learn...</span>")
		return
	var/obj/effect/proc_holder/spell/targeted/mind_transfer/swapper = new
	if(swapper.cast(list(stored_swap), user, TRUE, TRUE))
		to_chat(user,"<span class='warning'>You're suddenly somewhere else... and someone else?!</span>")
		to_chat(stored_swap,"<span class='warning'>Suddenly you're staring at [src] again... where are you, who are you?!</span>")
	else
		user.visible_message("<span class='warning'>[src] fizzles slightly as it stops glowing!</span>") //if the mind_transfer failed to transfer mobs, likely due to the target being catatonic.

	stored_swap = null

/obj/item/book/granter/spell/forcewall
	spell = /obj/effect/proc_holder/spell/targeted/forcewall
	spellname = "forcewall"
	icon_state ="bookforcewall"
	desc = "This book has a dedication to mimes everywhere inside the front cover."
	remarks = list("I can go through the wall! Neat.", "Why are there so many mime references...?", "This would cause much grief in a hallway...", "This is some suprisingly strong magic to create a wall nobody can pass through...", "Why the dumb stance? It's just a flick of the hand...", "Why are the pages so hard to turn, is this even paper?", "I can't mo Oh, i'm fine...")

/obj/item/book/granter/spell/forcewall/recoil(mob/living/user)
	..()
	to_chat(user,"<span class='warning'>You suddenly feel very solid!</span>")
	user.Stun(40, ignore_canstun = TRUE)
	user.petrify(30)

/obj/item/book/granter/spell/knock
	spell = /obj/effect/proc_holder/spell/aoe_turf/knock
	spellname = "knock"
	icon_state ="bookknock"
	desc = "This book is hard to hold closed properly."
	remarks = list("Open Sesame!", "So THAT'S the magic password!", "Slow down, book. I still haven't finished this page...", "The book won't stop moving!", "I think this is hurting the spine of the book...", "I can't get to the next page, it's stuck t- I'm good, it just turned to the next page on it's own.", "Yeah, staff of doors does the same thing. Go figure...")

/obj/item/book/granter/spell/knock/recoil(mob/living/user)
	..()
	to_chat(user,"<span class='warning'>You're knocked down!</span>")
	user.Knockdown(40)

/obj/item/book/granter/spell/barnyard
	spell = /obj/effect/proc_holder/spell/targeted/barnyardcurse
	spellname = "barnyard"
	icon_state ="bookhorses"
	desc = "This book is more horse than your mind has room for."
	remarks = list("Moooooooo!","Moo!","Moooo!", "NEEIIGGGHHHH!", "NEEEIIIIGHH!", "NEIIIGGHH!", "HAAWWWWW!", "HAAAWWW!", "Oink!", "Squeeeeeeee!", "Oink Oink!", "Ree!!", "Reee!!", "REEE!!", "REEEEE!!")

/obj/item/book/granter/spell/barnyard/recoil(mob/living/carbon/user)
	if(ishuman(user))
		to_chat(user,"<font size='15' color='red'><b>HORSIE HAS RISEN</b></font>")
		var/obj/item/clothing/mask/horsehead/magichead = new /obj/item/clothing/mask/horsehead
		magichead.item_flags |= NODROP		//curses!
		magichead.flags_inv &= ~HIDEFACE //so you can still see their face
		magichead.voicechange = TRUE	//NEEEEIIGHH
		if(!user.dropItemToGround(user.wear_mask))
			qdel(user.wear_mask)
		user.equip_to_slot_if_possible(magichead, SLOT_WEAR_MASK, TRUE, TRUE)
		qdel(src)
	else
		to_chat(user,"<span class='notice'>I say thee neigh</span>") //It still lives here

/obj/item/book/granter/spell/charge
	spell = /obj/effect/proc_holder/spell/targeted/charge
	spellname = "charge"
	icon_state ="bookcharge"
	desc = "This book is made of 100% postconsumer wizard."
	remarks = list("I feel ALIVE!", "I CAN TASTE THE MANA!", "What a RUSH!", "I'm FLYING through these pages!", "THIS GENIUS IS MAKING IT!", "This book is ACTION PAcKED!", "HE'S DONE IT", "LETS GOOOOOOOOOOOO")

/obj/item/book/granter/spell/charge/recoil(mob/user)
	..()
	to_chat(user,"<span class='warning'>[src] suddenly feels very warm!</span>")
	empulse(src, 1, 1)

/obj/item/book/granter/spell/summonitem
	spell = /obj/effect/proc_holder/spell/targeted/summonitem
	spellname = "instant summons"
	icon_state ="booksummons"
	desc = "This book is bright and garish, very hard to miss."
	remarks = list("I can't look away from the book!", "The words seem to pop around the page...", "I just need to focus on one item...", "Make sure to have a good grip on it when casting...", "Slow down, book. I still haven't finished this page...", "Sounds pretty great with some other magical artifacts...", "Magicians must love this one.")

/obj/item/book/granter/spell/summonitem/recoil(mob/user)
	..()
	to_chat(user,"<span class='warning'>[src] suddenly vanishes!</span>")
	qdel(src)

/obj/item/book/granter/spell/random
	icon_state = "random_book"

/obj/item/book/granter/spell/random/Initialize()
	. = ..()
	var/static/banned_spells = list(/obj/item/book/granter/spell/mimery_blockade, /obj/item/book/granter/spell/mimery_guns)
	var/real_type = pick(subtypesof(/obj/item/book/granter/spell) - banned_spells)
	new real_type(loc)
	return INITIALIZE_HINT_QDEL

///MARTIAL ARTS///

/obj/item/book/granter/martial
	var/martial
	var/martialname = "bug jitsu"
	var/greet = "You feel like you have mastered the art in breaking code. Nice work, jackass."

/obj/item/book/granter/martial/attack_self(mob/user)
	. = ..()
	if(!.)
		return
	if(!martial)
		return
	var/datum/martial_art/MA = new martial
	if(user.mind.martial_art)
		for(var/datum/martial_art/knownmartial in user.mind.martial_art)
			if(knownmartial.type == MA.type)
				to_chat(user,"<span class='warning'>You already know [martialname]!</span>")
				return
	if(used == TRUE && oneuse == TRUE)
		recoil(user)
	else
		to_chat(user, "<span class='notice'>You start reading about [martialname]...</span>")
		reading = TRUE
		for(var/i=1, i<=pages_to_mastery, i++)
			if(!turn_page(user))
				to_chat(user, "<span class='notice'>You stop reading...</span>")
				reading = FALSE
				qdel(MA)
				return
		if(do_after(user,50, user))
			to_chat(user, "[greet]")
			MA.teach(user)
			user.log_message("<font color='orange'>learned the martial art [martialname] ([MA]).</font>", INDIVIDUAL_ATTACK_LOG)
			onlearned(user)
		reading = FALSE

/obj/item/book/granter/martial/cqc
	martial = /datum/martial_art/cqc
	name = "old manual"
	martialname = "close quarters combat"
	desc = "A small, black manual. There are drawn instructions of tactical hand-to-hand combat."
	greet = "<span class='boldannounce'>You've mastered the basics of CQC.</span>"
	icon_state = "cqcmanual"
	remarks = list("Kick... Slam...", "Lock... Kick...", "Strike their abdomen, neck and back for critical damage...", "Slam... Lock...", "I could probably combine this with some other martial arts!", "Words that kill...", "The last and final moment is yours...")

/obj/item/book/granter/martial/cqc/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		to_chat(user, "<span class='warning'>[src] beeps ominously...</span>")

/obj/item/book/granter/martial/cqc/recoil(mob/living/carbon/user)
	to_chat(user, "<span class='warning'>[src] explodes!</span>")
	playsound(src,'sound/effects/explosion1.ogg',40,1)
	user.flash_act(1, 1)
	user.adjustBruteLoss(6)
	user.adjustFireLoss(6)
	qdel(src)

/obj/item/book/granter/martial/carp
	martial = /datum/martial_art/the_sleeping_carp
	name = "mysterious scroll"
	martialname = "sleeping carp"
	desc = "A scroll filled with strange markings. It seems to be drawings of some sort of martial art."
	greet = "<span class='sciradio'>You have learned the ancient martial art of the Sleeping Carp! Your hand-to-hand combat has become much more effective, and you are now able to deflect any projectiles \
	directed toward you. However, you are also unable to use any ranged weaponry. You can learn more about your newfound art by using the Recall Teachings verb in the Sleeping Carp tab.</span>"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll2"
	remarks = list("I must prove myself worthy to the masters of the sleeping carp...", "Stance means everything...", "Focus... And you'll be able to incapacitate any foe in seconds...", "I must pierce armor for maximum damage...", "I don't think this would combine with other martial arts...", "Grab them first so they don't retaliate...", "I must prove myself worthy of this power...")

/obj/item/book/granter/martial/carp/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		desc = "It's completely blank."
		name = "empty scroll"
		icon_state = "blankscroll"

/obj/item/book/granter/martial/plasma_fist
	martial = /datum/martial_art/plasma_fist
	name = "frayed scroll"
	martialname = "plasma fist"
	desc = "An aged and frayed scrap of paper written in shifting runes. There are hand-drawn illustrations of pugilism."
	greet = "<span class='boldannounce'>You have learned the ancient martial art of Plasma Fist. Your combos are extremely hard to pull off, but include some of the most deadly moves ever seen including \
	the plasma fist, which when pulled off will make someone violently explode.</span>"
	icon = 'icons/obj/wizard.dmi'
	icon_state ="scroll2"
	remarks = list("Balance...", "Power...", "Control...", "Mastery...", "Vigilance...", "Skill...")

/obj/item/book/granter/martial/plasma_fist/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		desc = "It's completely blank."
		name = "empty scroll"
		icon_state = "blankscroll"

// I did not include mushpunch's grant, it is not a book and the item does it just fine.

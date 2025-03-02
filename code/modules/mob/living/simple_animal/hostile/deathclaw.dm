/mob/living/simple_animal/hostile/deathclaw
	name = "deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match."
	icon = 'icons/mob/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	icon_gib = "deathclaw_gib"
	gender = MALE
	a_intent = INTENT_HARM //So we can not move past them.
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	robust_searching = 1
	anchored = 1
	speak = list("ROAR!","Rawr!","GRRAAGH!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("grumbles.","grawls.")
	emote_taunt = list("stares ferociously", "stomps")
	speak_chance = 10
	taunt_chance = 25
	speed = -1
	see_in_dark = 8
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/deathclaw = 4,
							/obj/item/stack/sheet/animalhide/deathclaw = 2,
							/obj/item/stack/sheet/bone = 4)
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "hits"
	maxHealth = 550
	health = 550
	obj_damage = 500
	armour_penetration = 40
	melee_damage_lower = 60
	melee_damage_upper = 65
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	friendly = "hugs"
	faction = list("deathclaw")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 5
	gold_core_spawnable = HOSTILE_SPAWN
	var/charging = FALSE

	pixel_w = -16

	emote_taunt_sound = list('sound/f13npc/deathclaw/taunt.ogg')
	aggrosound = list('sound/f13npc/deathclaw/aggro1.ogg', 'sound/f13npc/deathclaw/aggro2.ogg', )
	idlesound = list('sound/f13npc/deathclaw/idle.ogg',)
	death_sound = 'sound/f13npc/deathclaw/death.ogg'

	XP = 15

/mob/living/simple_animal/hostile/deathclaw/playable
	emote_taunt_sound = null
	emote_taunt = null
	aggrosound = null
	idlesound = null
	see_in_dark = 8
	environment_smash = 2 //can smash walls
	wander = 0
	anchored = FALSE
	dextrous = TRUE
	held_items = list(null, null)
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM)

/mob/living/simple_animal/hostile/deathclaw/playable/cloak
	icon = 'icons/fallout/mobs/deathclaw_playable.dmi'
	icon_gib = "deathclaw_gib"
	var/cloak_color = null
	var/sitting = FALSE
	var/lie = FALSE


/mob/living/simple_animal/hostile/deathclaw/playable/cloak/Initialize()
	. = ..()
	cloak_color = pick("pur", "red", "whi", "gry", "hub", "bro")
	icon_dead = "dead_[cloak_color]"
	icon_state = "deathclaw_[cloak_color]"

/mob/living/simple_animal/hostile/deathclaw/playable/cloak/verb/sit()
	set category = "IC"
	set name = "* Sit"

	if(sitting)
		icon_state = "deathclaw_[cloak_color]"
		canmove = TRUE
	else
		canmove = FALSE
		icon_state = "hide_[cloak_color]"
	sitting = !sitting
	lie = FALSE


/mob/living/simple_animal/hostile/deathclaw/playable/cloak/verb/lay()
	set category = "IC"
	set name = "* Lay"

	if(lie)
		icon_state = "deathclaw_[cloak_color]"
		canmove = TRUE
	else
		icon_state = "lie_[cloak_color]"
		canmove = FALSE
	lie = !lie
	sitting = FALSE


/mob/living/simple_animal/hostile/deathclaw/mother
	name = "mother deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one is an angry mother."
	icon_state = "deathclaw_queen"
	icon_living = "deathclaw_queen"
	icon_dead = "deathclaw_queen_dead"
	gender = FEMALE
	maxHealth = 750
	health = 750
	stat_attack = UNCONSCIOUS
	melee_damage_lower = 76
	melee_damage_upper = 78
	armour_penetration = 45
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/deathclaw = 6,
							/obj/item/stack/sheet/animalhide/deathclaw = 3)
	ignore_stealth = TRUE

/mob/living/simple_animal/hostile/deathclaw/power_armor
	name = "Power Armored Deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. Someone had managed to put power armor on him."
	icon_state = "combatclaw"
	icon_living = "combatclaw"
	icon_dead = "combatclaw_dead"
	maxHealth = 2500
	health = 2500
	stat_attack = UNCONSCIOUS
	melee_damage_lower = 90
	melee_damage_upper = 150
	armour_penetration = 60

/mob/living/simple_animal/hostile/deathclaw/power_armor/maid
	name = "Deathclaw Maid"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. Someone managed to put a maid costume on her."
	icon_state = "maidclaw"
	icon_living = "maidclaw"
	icon_dead = "maidclaw_ded"
	maxHealth = 1000
	health = 1000
	speak = list("Семпай бака!","Я только помыла полы!","РЯЯЯЯЯЯ!","Костюм горничной - это её гордость!", "Я не Рем, я Рам!", "Я не Рам, я Рем", "Только не во внутрь!")
	speak_chance = 60
	faction = list("deathclaw", "city", "Wastelander", "Town")

/mob/living/simple_animal/hostile/deathclaw/legendary
	name = "legendary deathclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one is a legendary enemy."
	maxHealth = 1500
	health = 1500
	color = "#FFFF00"
	stat_attack = UNCONSCIOUS
	melee_damage_lower = 80
	melee_damage_upper = 85
	armour_penetration = 65

/mob/living/simple_animal/hostile/deathclaw/legendary/death(gibbed)
	var/turf/T = get_turf(src)
	if(prob(60))
		new /obj/item/melee/unarmed/deathclawgauntlet(T)
	. = ..()

/mob/living/simple_animal/hostile/deathclaw/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(10))
		visible_message("<span class='danger'>\The [src] growls, enraged!</span>")
		sleep(3)
		Charge()
	if(prob(85) || Proj.damage > 30) //prob(x) = chance for proj to actually do something, adjust depending on how OP you want deathclaws to be
		return ..()
	else
		visible_message("<span class='danger'>\The [Proj] bounces off \the [src]'s thick hide!</span>")
		return 0

/mob/living/simple_animal/hostile/deathclaw/do_attack_animation(atom/A, visual_effect_icon)
	if(!charging)
		..()

/mob/living/simple_animal/hostile/deathclaw/AttackingTarget()
	if(!charging)
		return ..()

/mob/living/simple_animal/hostile/deathclaw/Goto(target, delay, minimum_distance)
	if(!charging)
		..()

/mob/living/simple_animal/hostile/deathclaw/Move()
	if(charging)
		new /obj/effect/temp_visual/decoy/fading(loc,src)
		DestroySurroundings()
	. = ..()
	if(charging)
		DestroySurroundings()

/mob/living/simple_animal/hostile/deathclaw/proc/Charge()
	var/turf/T = get_turf(target)
	if(!T || T == loc)
		return
	charging = TRUE
	visible_message("<span class='danger'>[src] charges!</span>")
	DestroySurroundings()
	walk(src, 0)
	setDir(get_dir(src, T))
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#FF0000", transform = matrix()*2, time = 1)
	sleep(3)
	throw_at(T, get_dist(src, T), 1, src, 0, callback = CALLBACK(src, .proc/charge_end))

/mob/living/simple_animal/hostile/deathclaw/proc/charge_end(list/effects_to_destroy)
	charging = FALSE
	if(target)
		Goto(target, move_to_delay, minimum_distance)

/mob/living/simple_animal/hostile/deathclaw/Bump(atom/A)
	if(charging)
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		DestroySurroundings()
	..()

/mob/living/simple_animal/hostile/deathclaw/throw_impact(atom/A)
	if(!charging)
		return ..()

	else if(isliving(A))
		var/mob/living/L = A
		L.visible_message("<span class='danger'>[src] slams into [L]!</span>", "<span class='userdanger'>[src] slams into you!</span>")
		L.apply_damage(melee_damage_lower/2, BRUTE)
		playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
		shake_camera(L, 4, 3)
		shake_camera(src, 2, 3)
		var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
		L.throw_at(throwtarget, 3)


	charging = FALSE
	charging = FALSE

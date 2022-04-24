#define SYNTH_HANDS_LAYER 1
#define SYNTH_TOTAL_LAYERS 1

/mob/living/simple_animal/hostile/synth
	name = "synth mk1"
	desc = "Synth strider. Looks like weird human but it's machine."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "synthmk1"
	icon_living = "synthmk1"
	icon_dead = "synthmk1_d"
	icon_gib = "synthmk1_d"
	speak_chance = 0
	turns_per_move = 7
	environment_smash = 0
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	move_to_delay = 3
	stat_attack = 1
	robust_searching = 1
	maxHealth = 150
	health = 150

	healable = 0

	faction = list("hostile", "institute")

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	minimum_distance = 4
	retreat_distance = 7
	attacktext = "punches"
	attack_sound = "punch"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 15

	ranged = 1
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/f13weapons/laser_pistol.ogg'

	var/list/synth_overlays[SYNTH_TOTAL_LAYERS]

	XP = 10

/mob/living/simple_animal/hostile/synth/playable
	emote_taunt_sound = null
	emote_taunt = null
	aggrosound = null
	idlesound = null
	see_in_dark = 8
	environment_smash = 2 //can smash walls
	wander = 0
	anchored = FALSE
	dextrous = TRUE

/mob/living/simple_animal/hostile/synth/mk2
	name = "synth mk2"
	icon_state = "synthmk2"
	icon_living = "synthmk2"
	icon_dead = "synthmk2_d"
	icon_gib = "synthmk2_d"
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/f13weapons/laser_rifle.ogg'

	XP = 12

/mob/living/simple_animal/hostile/synth/mk2/playable
	emote_taunt_sound = null
	emote_taunt = null
	aggrosound = null
	idlesound = null
	see_in_dark = 8
	environment_smash = 2 //can smash walls
	wander = 0
	anchored = FALSE
	dextrous = TRUE

/mob/living/simple_animal/hostile/synth/proc/apply_overlay(cache_index)
	. = synth_overlays[cache_index]
	if(.)
		add_overlay(.)

/mob/living/simple_animal/hostile/synth/proc/remove_overlay(cache_index)
	var/I = synth_overlays[cache_index]
	if(I)
		cut_overlay(I)
		synth_overlays[cache_index] = null

/mob/living/simple_animal/hostile/synth/update_inv_hands()
	cut_overlays("standing_overlay")
	remove_overlay(SYNTH_HANDS_LAYER)

	var/standing = FALSE
	for(var/I in held_items)
		if(I)
			standing = TRUE
			break
	if(!standing)
		if(stat != DEAD)
			icon_state = "crawling"
			speed = 1
		return ..()
	if(stat != DEAD)
		icon_state = "standing"
		speed = 3 // synths are slow when standing up.

	var/list/hands_overlays = list()

	var/obj/item/l_hand = get_item_for_held_index(1)
	var/obj/item/r_hand = get_item_for_held_index(2)

	if(r_hand)
		var/r_state = r_hand.item_state ? r_hand.item_state : r_hand.icon_state
		var/mutable_appearance/r_hand_overlay = r_hand.build_worn_icon(state = r_state, default_layer = SYNTH_HANDS_LAYER, default_icon_file = r_hand.righthand_file, isinhands = TRUE)
		r_hand_overlay.pixel_y -= 1
		hands_overlays += r_hand_overlay

	if(l_hand)
		var/l_state = l_hand.item_state ? l_hand.item_state : l_hand.icon_state
		var/mutable_appearance/l_hand_overlay = l_hand.build_worn_icon(state = l_state, default_layer = SYNTH_HANDS_LAYER, default_icon_file = l_hand.lefthand_file, isinhands = TRUE)
		l_hand_overlay.pixel_y -= 1
		hands_overlays += l_hand_overlay

	if(hands_overlays.len)
		synth_overlays[SYNTH_HANDS_LAYER] = hands_overlays
	apply_overlay(SYNTH_HANDS_LAYER)
	add_overlay("standing_overlay")
	return ..()

/mob/living/simple_animal/hostile/synth/regenerate_icons()
	update_inv_hands()
/mob/living/simple_animal/hostile/liberatormk0
	name = "Liberator MK0"
	desc = "The Liberator robot was deployed by air onto American soil in the days leading up to the Great War. Its purpose was to inspire invading Chinese troops and spread Communist propaganda."
	icon = 'icons/mob/robots.dmi'
	icon_state = "liberator"
	icon_living = "liberator"
	icon_dead = "liberator_d"
	icon_gib = "liberator_g"
	speak_chance = 15
	turns_per_move = 6
	environment_smash = 0
	response_help = "touches"
	response_disarm = "shoves"
	response_harm = "punches"
	move_to_delay = 3
	stat_attack = 1
	robust_searching = 1
	maxHealth = 100
	health = 100
	healable = 0

	faction = list("wastebot")

	gender = NEUTER
	mob_biotypes = list(MOB_ROBOTIC)

	speak_emote = list("states")

	taunt_chance = 45
	emote_taunt_sound = 'sound/f13npc/liberator/libdetected.ogg'

//	aggro_sound_chance = 50

	aggrosound = 'sound/f13npc/liberator/libdetected.ogg'
	death_sound = 'sound/f13npc/handy/robo_death.ogg'
	attack_sound = 'sound/f13npc/liberator/libattack.ogg'

	harm_intent_damage = 10
	melee_damage_lower = 5
	melee_damage_upper = 10
	minimum_distance = 5
	retreat_distance = 8
	attacktext = "cuts"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 10

//	idle_vision_range = 7

	ranged = 1
	ranged_cooldown_time = 100
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/f13weapons/laserweap76.ogg'

	gold_core_spawnable = HOSTILE_SPAWN

	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/three)

	XP = 15

/mob/living/simple_animal/hostile/liberatormk0/mk2
	name = "Liberator MK2"
	icon_state = "liberator_y"
	icon_living = "liberator_y"
	icon_dead = "liberator_y_d"
	icon_gib = "liberator_g"
	ranged_cooldown_time = 70
	maxHealth = 120
	health = 120
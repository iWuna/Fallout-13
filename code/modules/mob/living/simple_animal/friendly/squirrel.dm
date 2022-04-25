/mob/living/simple_animal/squirrel
	name = "squirrel"
	desc = "Small animal with fur, who you are?"
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "squirrel"
	icon_living = "squirrel"
	icon_dead = "squirrel_dead"
	icon_gib = null
	gender = FEMALE
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	turns_per_move = 5
	see_in_dark = 4
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/squirrel = 1)
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "bites"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 20
	maxHealth = 20
	gold_core_spawnable = FRIENDLY_SPAWN
	blood_volume = BLOOD_VOLUME_NORMAL
	faction = list("neutral")
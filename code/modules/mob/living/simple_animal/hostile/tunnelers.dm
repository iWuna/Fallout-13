/mob/living/simple_animal/hostile/trog
	name = "trog"
	desc = "A human who has mutated and regressed back to a primal, cannibalistic state."
	icon = 'icons/mob/tunnelers.dmi'
	icon_state = "troglodyte"
	icon_living = "troglodyte"
	icon_dead = "trog_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 50
	health = 50
	speed = 2
	harm_intent_damage = 5
	obj_damage = 30
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "lunges at"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	robust_searching = 0
	stat_attack = UNCONSCIOUS
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("trog")
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human = 2,
							/obj/item/stack/sheet/animalhide/human = 1,
							/obj/item/stack/sheet/bone = 1)

	XP = 5

/mob/living/simple_animal/hostile/trog/sporecarrier
	name = "spore carrier"
	desc = "A victim of the beauveria mordicana fungus, these corpses sole purpose is to spread its spores."
	icon_state = "spore_carrier"
	icon_living = "spore_carrier"
	icon_dead = "spore_dead"
	health = 100
	maxHealth = 100
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 25
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0
	faction = list("plants")
	butcher_results = list(/obj/item/stack/sheet/bone = 1)

/mob/living/simple_animal/hostile/trog/tunneler
	name = "tunneler"
	desc = "A mutated creature that is sensitive to light, but can swarm and kill even Deathclaws."
	icon_state = "tunneler"
	icon_living = "tunneler"
	icon_dead = "tunneler_dead"
	health = 120
	maxHealth = 120
	speed = 1
	melee_damage_lower = 20
	melee_damage_upper = 25
	attack_sound = 'sound/weapons/bladeslice.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 5
	faction = list("tunneler")
	butcher_results = list(/obj/item/stack/sheet/bone = 1)

/mob/living/simple_animal/hostile/trog/tunneler/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("toxin", 5)

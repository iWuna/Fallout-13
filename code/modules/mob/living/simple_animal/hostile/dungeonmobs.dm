//////////////////////DUNGEON MOBS//////////////////////

///Ghouls///
/mob/living/simple_animal/hostile/dungemobs/ghoul
	name = "feral ghoul"
	desc = "A ghoul that has lost it's mind and become aggressive."
	icon = 'icons/mob/ghouls.dmi'
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 40
	health = 40
	speed = 2
	harm_intent_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "claws"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	robust_searching = 0
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("ghoul")
	//decompose = TRUE //посибл, перегрузка.
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/ghoul = 2,
							/obj/item/stack/sheet/animalhide/human = 1,
							/obj/item/stack/sheet/bone = 1)

//	loot = list(/obj/effect/gibspawner/human, /obj/item/stack/f13Cash/random/bottle_cap/low)   // not quite ready for cap drops on ghouls

	emote_taunt_sound = list('sound/f13npc/ghoul/taunt.ogg')
	emote_taunt = list("gurgles", "stares")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg')
	death_sound = 'sound/f13npc/ghoul/ghoul_death.ogg'

/mob/living/simple_animal/hostile/dungemobs/ghoul/Initialize()
	. = ..()
	icon_state = "retro_ghoul-[rand(1,10)]"
	icon_living = "retro_ghoul-[rand(1,10)]"

/mob/living/simple_animal/hostile/dungemobs/ghoul/reaver
	name = "feral ghoul reaver"
	desc = "A ghoul that has lost it's mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "ghoulreaver"
	icon_living = "ghoulreaver"
	icon_dead = "ghoulreaver_dead"
	speed = 2
	maxHealth = 100
	health = 100
	harm_intent_damage = 6
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/dungemobs/ghoul/reaver/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/dungemobs/ghoul/reaver/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/dungemobs/ghoul/coldferal
	name = "cold ghoul feral"
	desc = "A ghoul that has lost it's mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "cold_feral"
	icon_living = "cold_feral"
	icon_dead = "cold_feral_dead"
	speed = 1.5
	maxHealth = 200
	health = 200
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/dungemobs/ghoul/frozenreaver
	name = "frozen ghoul reaver"
	desc = "A ghoul that has lost it's mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "frozen_reaver"
	icon_living = "frozen_reaver"
	icon_dead = "frozen_reaver_dead"
	speed = 1.5
	maxHealth = 200
	health = 200
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/dungemobs/ghoul/glowing
	name = "glowing feral ghoul"
	desc = "A feral ghoul that has absorbed massive amounts of radiation, causing them to glow in the dark and radiate constantly."
	icon_state = "retro_glowghoul-6"
	icon_living = "retro_glowghoul-6"
	icon_dead = "retro_glowghoul_d"
	maxHealth = 80
	health = 80
	speed = 2
	harm_intent_damage = 10
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/dungemobs/ghoul/legendary
	name = "legendary ghoul"
	desc = "A ghoul that has lost it's mind and become aggressive. This one is exceptionally large, bulging muscles. It looks quite strong."
	icon_state = "retro_glowghoul"
	icon_living = "retro_glowghoul"
	icon_dead = "retro_glowghoul_d"
	color = "#FFFF00"
	maxHealth = 600
	health = 600
	speed = 2.5
	harm_intent_damage = 20
	melee_damage_lower = 30
	melee_damage_upper = 35
	mob_size = 5
	faction = list("hostile")

/mob/living/simple_animal/hostile/dungemobs/ghoul/glowing/Initialize()
	. = ..()
	set_light(2)
	icon_state = "retro_glowghoul-[rand(1,10)]"
	icon_living = "retro_glowghoul-[rand(1,10)]"

/mob/living/simple_animal/hostile/dungemobs/ghoul/glowing/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/dungemobs/ghoul/glowing/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(20, EFFECT_IRRADIATE, 0)

/mob/living/simple_animal/hostile/dungemobs/ghoul/frozen
	name = "frozen feral ghoul"
	desc = "A feral ghoul that has absorbed massive amounts of cold and Radiates Cold Air.."
	icon_state = "frozen_feral"
	icon_living = "frozen feral"
	icon_dead = "frozen_feral_dead"
	maxHealth = 80
	health = 80
	speed = 2
	harm_intent_damage = 10
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/dungemobs/ghoul/frozen/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/dungemobs/ghoul/frozen/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/dungemobs/ghoul/frozen/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(20, EFFECT_IRRADIATE, 0)


/mob/living/simple_animal/hostile/dungemobs/ghoul/hot
	name = "hot glowing ghoul"
	desc = "A feral ghoul that has absorbed massive amounts of cold and Radiates Cold Air.."
	icon_state = "hot_glowing_one"
	icon_living = "hot_glowing_one"
	icon_dead = "hot_glowing_one_dead"
	maxHealth = 80
	health = 80
	speed = 2
	harm_intent_damage = 10
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/dungemobs/ghoul/hot/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/dungemobs/ghoul/hot/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/dungemobs/ghoul/hot/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(20, EFFECT_IRRADIATE, 0)

/mob/living/simple_animal/hostile/dungemobs/ghoul/soldier
	name = "Ghoul Soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "soldier_ghoul"
	icon_living = "soldier_ghoul"
	icon_dead = "soldier_ghoul_d"
	icon_gib = "gib"
	maxHealth = 90
	health = 90

/mob/living/simple_animal/hostile/dungemobs/ghoul/soldier/armored
	name = "Armored Ghoul Soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "soldier_ghoul_a"
	icon_living = "soldier_ghoul_a"
	icon_dead = "soldier_ghoul_a_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100

/mob/living/simple_animal/hostile/dungemobs/ghoul/scorched
	name = "Scorched Ghoul Soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "scorched_m"
	icon_living = "scorched_m"
	icon_dead = "scorched_m_d"
	icon_gib = "gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "growl"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	faction = list("scorched", "hostile")
	death_sound = null
	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	attacktext = "punches"
	attack_sound = "punch"


/mob/living/simple_animal/hostile/dungemobs/ghoul/scorched/ranged
	name = "Ranged Ghoul Solder"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "scorched_r"
	icon_living = "scorched_r"
	icon_dead = "scorched_r_d"
	icon_gib = "gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "ow"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	ranged = 1
	ranged_cooldown_time = 200
	projectiletype = /obj/item/projectile/bullet/F13/c9mmBullet
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'
	faction = list("scorched", "hostile")
	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	attacktext = "shoots"
	attack_sound = "punch"


//////////////////////////Super Mutants////////////////////////

//Fallout 13 super mutants directory

/mob/living/simple_animal/hostile/dungemobs/supermutant
	name = "super mutant"
	desc = "A huge and ugly mutant humanoid."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_113_s"
	icon_living = "hulk_113_s"
	icon_dead = "hulk_113_s"
	speak_chance = 10
	speak = list("GRRRRRR!", "ARGH!", "NNNNNGH!", "HMPH!", "ARRRRR!")
	speak_emote = list("shouts", "yells")
	move_to_delay = 5
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	environment_smash = ENVIRONMENT_SMASH_WALLS
	emote_taunt_sound = list('sound/f13npc/supermutant/attack1.ogg', 'sound/f13npc/supermutant/attack2.ogg', 'sound/f13npc/supermutant/attack3.ogg')
	emote_taunt = list("yells")
	taunt_chance = 30
	turns_per_move = 5
	response_help = "touches"
	response_disarm = "pushes"
	response_harm = "hits"
	maxHealth = 300
	health = 300
	force_threshold = 15
	faction = list("hostile", "supermutant", "ghoul")
	melee_damage_lower = 45
	melee_damage_upper = 55
	mob_size = MOB_SIZE_LARGE
	anchored = TRUE //unpullable
	attacktext = "smashes"
	attack_sound = "punch"
	idlesound = list('sound/f13npc/supermutant/idle1.ogg', 'sound/f13npc/supermutant/idle2.ogg', 'sound/f13npc/supermutant/idle3.ogg', 'sound/f13npc/supermutant/idle4.ogg' )
	death_sound = list('sound/f13npc/supermutant/death1.ogg', 'sound/f13npc/supermutant/death2.ogg')
	aggrosound = list('sound/f13npc/supermutant/alert1.ogg', 'sound/f13npc/supermutant/alert2.ogg', 'sound/f13npc/supermutant/alert3.ogg', 'sound/f13npc/supermutant/alert4.ogg')

/mob/living/simple_animal/hostile/dungemobs/supermutant/playable
	health = 500
	maxHealth = 500
	emote_taunt_sound = null
	emote_taunt = null
	aggrosound = null
	idlesound = null
	see_in_dark = 8
	wander = 0
	anchored = FALSE
	dextrous = TRUE
	possible_a_intents = list(INTENT_HELP, INTENT_HARM)


/mob/living/simple_animal/hostile/dungemobs/supermutant/Aggro()
	..()
	summon_backup(15)

/mob/living/simple_animal/hostile/dungemobs/supermutant/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(85) || Proj.damage > 26)
		return ..()
	else
		visible_message("<span class='danger'>\The [Proj] is deflected harmlessly by \the [src]'s thick skin!</span>")
		return FALSE

/mob/living/simple_animal/hostile/dungemobs/supermutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()

/mob/living/simple_animal/dungemobs/pet/dog/mutant    //This is a supermutant, totally not a dog, and he is friendly
	name = "Brah-Min"
	desc = "A large, docile supermutant. Adopted by Kebab-town as a sort of watch dog for their brahmin herd."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_brahmin_s"
	icon_dead = "hulk_brahmin_s"
	maxHealth = 300
	health = 300
	speak_chance = 7 //30 //Oh my god he never shuts up.
	anchored = TRUE
	mob_size = MOB_SIZE_LARGE
	speak = list("Hey! These my brahmins!", "And I say, HEY-YEY-AAEYAAA-EYAEYAA! HEY-YEY-AAEYAAA-EYAEYAA! I SAID HEY, what's going on?", "What do you want from my brahmins?!", "Me gonna clean brahmin poop again now!", "I love brahmins, brahmins are good, just poop much!", "Do not speak to my brahmins ever again, you hear?!", "Bad raiders come to steal my brahmins - I crush with shovel!", "Do not come to my brahmins! Do not touch my brahmins! Do not look at my brahmins!", "I'm watching you, and my brahmins watch too!", "Brahmins say moo, and I'm saying - hey, get your ugly face out of my way!", "I... I remember, before the fire... THERE WERE NO BRAHMINS!", "No! No wind brahmin here! Wind brahmin lie!")
	speak_emote = list("shouts", "yells")
	emote_hear = list("yawns", "mumbles","sighs")
	emote_see = list("raises his shovel", "shovels some dirt away", "waves his shovel above his head angrily")
	response_help  = "touches"
	response_disarm = "pushes"
	response_harm   = "punches"
//	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/bearsteak = 3)

/mob/living/simple_animal/dungemobs/pet/dog/mutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	if(!gibbed)
		visible_message("<span class='danger'>\the [src] shouts something incoherent about brahmins for the last time and stops moving...</span>")
	..()

/mob/living/simple_animal/hostile/dungemobs/supermutant/meleemutant
	desc = "A huge and ugly mutant humanoid.  This one is brandishing a sledgehammer."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_melee_s"
	icon_living = "hulk_melee_s"
	icon_dead = "hulk_melee_s"
	maxHealth = 350
	health = 350
	force_threshold = 15
	melee_damage_lower = 45
	melee_damage_upper = 65
	attack_sound = "hit_swing"

/mob/living/simple_animal/hostile/dungemobs/supermutant/meleemutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()

/mob/living/simple_animal/hostile/dungemobs/supermutant/rangedmutant
	desc = "A huge and ugly mutant humanoid.  This one is armed with a poorly maintained hunting rifle."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_ranged_s"
	icon_living = "hulk_ranged_s"
	icon_dead = "hulk_ranged_s"
	ranged = 1
	maxHealth = 400
	health = 400
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/F13/c308mmBullet
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'
	loot = list(/obj/item/ammo_box/a308)

/mob/living/simple_animal/hostile/dungemobs/supermutant/rangedmutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()

/mob/living/simple_animal/hostile/dungemobs/supermutant/legendary
	name = "legendary super mutant"
	desc = "A huge and ugly mutant humanoid.He has a faint yellow glow to him, scars adorn his body. This super mutant is a grizzled vetern of combat. Look out!"
	color = "#FFFF00"
	icon_state = "hulk_113_s"
	icon_living = "hulk_113_s"
	icon_dead = "hulk_113_s"
	melee_damage_lower = 55
	melee_damage_upper = 70
	maxHealth = 950
	health = 950
	mob_size = 5

/mob/living/simple_animal/hostile/dungemobs/supermutant/legendary/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin
	name = "nightkin"
	desc = "A blue variant of the standard Super Mutant, equiped with steathboys."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "night_s"
	icon_living = "night_s"
	icon_dead = "night_s"
	maxHealth = 350
	health = 350
	alpha = 80
	force_threshold = 15
	melee_damage_lower = 45
	melee_damage_upper = 70
	attacktext = "slashes"
	attack_sound = "sound/weapons/bladeslice.ogg"

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/Aggro()
	..()
	summon_backup(15)
	alpha = 255

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/rangedmutant
	name = "nightkin veteran"
	desc = "A blue variant of the standard Super Mutant, equiped with steathboys.  This one is holding an Assault Rifle."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "night_ranged_s"
	icon_living = "night_ranged_s"
	icon_dead = "night_ranged_s"
	maxHealth = 400
	health = 400
	ranged = 1
	alpha = 80
	force_threshold = 15
	melee_damage_lower = 45
	melee_damage_upper = 55
	attacktext = "smashes"
	attack_sound = "punch"
	extra_projectiles = 1
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/F13/c556Bullet
	projectilesound = 'sound/f13weapons/assaultrifle_fire.ogg'
	loot = list(/obj/item/ammo_box/magazine/m556/rifle)

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/rangedmutant/Aggro()
	..()
	summon_backup(15)
	alpha = 255

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/rangedmutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/elitemutant
	name = "nightkin elite"
	desc = "A blue variant of the standard Super Mutant, and a remnant of the Masters Army."
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "night_boss_s"
	icon_living = "night_boss_s"
	icon_dead = "night_boss_s"
	ranged = 1
	maxHealth = 500
	health = 500
	alpha = 80
	force_threshold = 15
	melee_damage_lower = 45
	melee_damage_upper = 55
	attacktext = "smashes"
	attack_sound = "punch"
	retreat_distance = 5
	minimum_distance = 7
	projectiletype = /obj/item/projectile/plasma/repeater
	projectilesound = 'sound/f13weapons/plasma_rifle.ogg'
	loot = list(/obj/item/stock_parts/cell/ammo/mfc)

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/elitemutant/Aggro()
	..()
	summon_backup(15)
	alpha = 255

/mob/living/simple_animal/hostile/dungemobs/supermutant/nightkin/elitemutant/death(gibbed)
	icon = 'icons/fallout/mobs/supermutant_dead.dmi'
	icon_state = icon_dead
	anchored = FALSE
	..()
	var/turf/T = get_turf(src)
	if(prob(40))
		new /obj/item/gun/energy/laser/plasma(T)
	. = ..()
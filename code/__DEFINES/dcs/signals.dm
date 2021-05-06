// All signals. Format:
// When the signal is called: (signal arguments)
// All signals send the source datum of the signal as the first argument

// global signals
// These are signals which can be listened to by any component on any parent
// start global signals with "!", this used to be necessary but now it's just a formatting choice
#define COMSIG_GLOB_LIVING_SAY_SPECIAL "!say_special"			//global living say plug - use sparingly: (mob/speaker , message)

// signals from globally accessible objects
/// from SSsun when the sun changes position : (azimuth)
#define COMSIG_SUN_MOVED "sun_moved"
//////////////////////////////////////////////////////////////////

// /datum signals
#define COMSIG_COMPONENT_UNREGISTER_PARENT "component_unregister_parent" //sent to the component itself when unregistered from a parent
#define COMSIG_COMPONENT_REGISTER_PARENT "component_register_parent"	 //sent to the component itself when registered to a parent
#define COMSIG_PARENT_QDELETING "parent_qdeleting"				//just before a datum's Destroy() is called: (force), at this point none of the other components chose to interrupt qdel and Destroy will be called

/// Trait signals
#define COMPONENT_ADD_TRAIT (1<<0)
#define COMPONENT_REMOVE_TRAIT (1<<1)

// /atom signals
#define COMSIG_ATOM_UPDATE_ICON "atom_update_icon"				//from base of atom/update_icon(): ()
	#define COMSIG_ATOM_NO_UPDATE_ICON_STATE 1
	#define COMSIG_ATOM_NO_UPDATE_OVERLAYS		2
#define COMSIG_ATOM_UPDATE_OVERLAYS "atom_update_overlays"		//from base of atom/update_overlays(): (list/new_overlays)
#define COMSIG_ATOM_UPDATED_ICON "atom_updated_icon"			//from base of atom/update_icon(): (signalOut, did_anything)
#define COMSIG_ATOM_RAD_PROBE "atom_rad_probe"					//from proc/get_rad_contents(): ()
	#define COMPONENT_BLOCK_RADIATION 1
#define COMSIG_ATOM_RAD_CONTAMINATING "atom_rad_contam"			//from base of datum/radiation_wave/radiate(): (strength)
	#define COMPONENT_BLOCK_CONTAMINATION 1
#define COMSIG_ATOM_RAD_WAVE_PASSING "atom_rad_wave_pass"		//from base of datum/radiation_wave/check_obstructions(): (datum/radiation_wave, width)
	#define COMPONENT_RAD_WAVE_HANDLED 1
#define COMSIG_ATOM_CANREACH "atom_can_reach"					//from internal loop in atom/movable/proc/CanReach(): (list/next)
	#define COMPONENT_BLOCK_REACH 1
#define COMSIG_ATOM_SCREWDRIVER_ACT "atom_screwdriver_act"		//from base of atom/screwdriver_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_INTERCEPT_TELEPORT "intercept_teleport"		//called when teleporting into a protected turf: (channel, turf/origin, turf/destination)
	#define COMPONENT_BLOCK_TELEPORT 1
#define COMSIG_ATOM_HEARER_IN_VIEW "atom_hearer_in_view"		//called when an atom with HEAR_1 is added to the hearers on /proc/get_hearers_in_view(): (list/processing_list, list/hearers)
/////////////////
//This signal return value bitflags can be found in __DEFINES/misc.dm
#define COMSIG_ATOM_INTERCEPT_Z_FALL "movable_intercept_z_impact"	//called for each movable in a turf contents on /turf/zImpact(): (atom/movable/A, levels)

// /turf signals
#define COMSIG_TURF_MULTIZ_NEW "turf_multiz_new"				//from base of turf/New(): (turf/source, direction)

// /atom/movable signals
#define COMSIG_MOVABLE_PRE_MOVE "movable_pre_move"					///from base of atom/movable/Moved(): (/atom)
	#define COMPONENT_MOVABLE_BLOCK_PRE_MOVE 1
#define COMSIG_MOVABLE_SECLUDED_LOCATION "movable_secluded" 	//called when the movable is placed in an unaccessible area, used for stationloving: ()
#define COMSIG_MOVABLE_HEAR "movable_hear"						//from base of atom/movable/Hear(): (message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, message_mode, atom/movable/source)
	#define HEARING_MESSAGE 1
	#define HEARING_SPEAKER 2
//	#define HEARING_LANGUAGE 3
	#define HEARING_RAW_MESSAGE 4
	/* #define HEARING_RADIO_FREQ 5
	#define HEARING_SPANS 6
	#define HEARING_MESSAGE_MODE 7
	#define HEARING_SOURCE 8*/
#define COMSIG_MOVABLE_TELEPORTED "movable_teleported"			//from base of do_teleport(): (channel, turf/origin, turf/destination)
// /mind signals
#define  COMSIG_PRE_MIND_TRANSFER "pre_mind_transfer"			//from base of mind/transfer_to() before it's done: (new_character, old_character)
	#define COMPONENT_STOP_MIND_TRANSFER 1						//stops the mind transfer from happening.
#define COMSIG_MIND_TRANSFER "mind_transfer"					//from base of mind/transfer_to() when it's done: (new_character, old_character)

// /mob signals
#define COMSIG_MOB_EXAMINATE "mob_examinate"					//from base of /mob/verb/examinate(): (atom/A)
#define COMSIG_MOB_DEATH "mob_death"							//from base of mob/death(): (gibbed)
	#define COMPONENT_BLOCK_DEATH_BROADCAST 1					//stops the death from being broadcasted in deadchat.
#define COMSIG_MOB_CLICKON "mob_clickon"						//from base of mob/clickon(): (atom/A, params)
	#define COMSIG_MOB_CANCEL_CLICKON 1
#define COMSIG_MOB_GHOSTIZE "mob_ghostize"						//from base of mob/Ghostize(): (can_reenter_corpse, special, penalize)
	#define COMPONENT_BLOCK_GHOSTING (1<<0)
	#define COMPONENT_DO_NOT_PENALIZE_GHOSTING (1<<1)
	#define COMPONENT_FREE_GHOSTING (1<<2)
#define COMSIG_MOB_ALLOWED "mob_allowed"						//from base of obj/allowed(mob/M): (/obj) returns bool, if TRUE the mob has id access to the obj
#define COMSIG_MOB_HUD_CREATED "mob_hud_created"				//from base of mob/create_mob_hud(): ()
#define COMSIG_MOB_ATTACK_HAND "mob_attack_hand"				//from base of
#define COMSIG_MOB_ITEM_ATTACK "mob_item_attack"				//from base of /obj/item/attack(): (mob/M, mob/user)
	#define COMPONENT_ITEM_NO_ATTACK 1
#define COMSIG_MOB_ITEM_AFTERATTACK "mob_item_afterattack"		//from base of obj/item/afterattack(): (atom/target, mob/user, proximity_flag, click_parameters)
#define COMSIG_MOB_ATTACK_RANGED "mob_attack_ranged"			//from base of mob/RangedAttack(): (atom/A, params)
#define COMSIG_MOB_THROW "mob_throw"							//from base of /mob/throw_item(): (atom/target)
#define COMSIG_MOB_KEY_CHANGE "mob_key_change"					//from base of /mob/transfer_ckey(): (new_character, old_character)
#define COMSIG_MOB_PRE_PLAYER_CHANGE "mob_pre_player_change"	//sent to the target mob from base of /mob/transfer_ckey() and /mind/transfer_to(): (our_character, their_character)
//	#define COMPONENT_STOP_MIND_TRANSFER 1
#define COMSIG_MOB_UPDATE_SIGHT "mob_update_sight"				//from base of /mob/update_sight(): ()
#define COMSIG_MOB_ON_NEW_MIND "mob_on_new_mind"			//called when a new mind is assigned to a mob: ()
#define COMSIG_MOB_SAY "mob_say" // from /mob/living/say(): (proc args list)
	#define COMPONENT_UPPERCASE_SPEECH 1
	// used to access COMSIG_MOB_SAY argslist
	#define SPEECH_MESSAGE 1
	// #define SPEECH_BUBBLE_TYPE 2
	#define SPEECH_SPANS 3
//	#define SPEECH_SANITIZE 4
	#define SPEECH_LANGUAGE 5
//	#define SPEECH_IGNORE_SPAM 6
//	#define SPEECH_FORCED 7
#define COMSIG_MOB_ANTAG_ON_GAIN "mob_antag_on_gain"			//from base of /datum/antagonist/on_gain(): (antag_datum)

#define COMSIG_MOB_SPELL_CAN_CAST "mob_spell_can_cast"			//from base of /obj/effect/proc_holder/spell/can_cast(): (spell)

#define COMSIG_MOB_ACTION_SKILL_MOD "mob_action_skill_mod"		//from base of /datum/skill_holder/action_skills_mod() : (proc args list, list/mod_values)
	#define ACTION_SKILL_MOD_SKILL 1 //redundancy.
	#define ACTION_SKILL_MOD_VALUE 2
	#define ACTION_SKILL_MOD_THRESHOLD 3
	#define ACTION_SKILL_MOD_IS_MULTI 4
	//other mod values, kept separate from the args
	#define MOD_VALUES_SKILL_MOD 1

#define COMSIG_MOB_ITEM_ACTION_SKILLS_MOD "mob_item_action_skills_mod"	//from base of /datum/skill_holder/item_action_skills_mod() : (proc args list, mod_values)
	#define ITEM_SKILLS_MOD_ITEM 1 //redundancy
	#define ITEM_SKILLS_MOD_VALUE 2
	#define ITEM_SKILLS_MOD_FLAGS 3
	#define ITEM_SKILLS_MOD_BAD_FLAGS 4
	#define ITEM_SKILLS_MOD_IS_MULTI 5
	//other mod values, kept separate from the args
	#define MOD_VALUES_ITEM_SKILLS_SUM 1
	#define MOD_VALUES_ITEM_SKILLS_DIV 2
	#define MOD_VALUES_ITEM_SKILLS_CHECKED 3

#define COMSIG_MOB_SKILL_GET_AFFINITY "mob_skill_get_affinity"	//from base of /datum/skill_holder/get_skill_affinity(): (skill_path, list/return_value)

// /mob/living signals
#define COMSIG_LIVING_LOOK_UP "living_look_up"					//from base of mob/living/look_up() (/mob/living)
#define COMSIG_LIVING_REGENERATE_LIMBS "living_regenerate_limbs"	//from base of /mob/living/regenerate_limbs(): (noheal, excluded_limbs)
#define COMSIG_LIVING_ELECTROCUTE_ACT "living_electrocute_act"		//from base of mob/living/electrocute_act(): (shock_damage, source, siemens_coeff, flags)
#define COMSIG_LIVING_MINOR_SHOCK "living_minor_shock"			//sent by stuff like stunbatons and tasers: ()
#define COMSIG_LIVING_REVIVE "living_revive"					//from base of mob/living/revive() (full_heal, admin_revive)
#define COMSIG_MOB_CLIENT_LOGIN "comsig_mob_client_login"		//sent when a mob/login() finishes: (client)
#define COMSIG_MOB_CLIENT_LOGOUT "comsig_mob_client_logout"		//sent when a mob/logout() starts: (client)
#define COMSIG_MOB_CLIENT_MOVE "comsig_mob_client_move"			//sent when client/Move() finishes with no early returns: (client, direction, n, oldloc)
#define COMSIG_LIVING_GUN_PROCESS_FIRE "living_gun_process_fire"	//from base of /obj/item/gun/proc/process_fire(): (atom/target, params, zone_override)
// This returns flags as defined for block in __DEFINES/combat.dm!
#define COMSIG_LIVING_RUN_BLOCK "living_do_run_block"				//from base of mob/living/do_run_block(): (real_attack, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone)
#define COMSIG_LIVING_COMBAT_ENABLED "combatmode_enabled"		//from base of mob/living/enable_combat_mode() (was_forced)
#define COMSIG_LIVING_COMBAT_DISABLED "combatmode_disabled"		//from base of mob/living/disable_combat_mode() (was_forced)
#define COMSIG_LIVING_GET_BLOCKING_ITEMS "get_blocking_items"	//from base of mob/living/get_blocking_items(): (list/items)

//ALL OF THESE DO NOT TAKE INTO ACCOUNT WHETHER AMOUNT IS 0 OR LOWER AND ARE SENT REGARDLESS!
#define COMSIG_LIVING_STATUS_STUN "living_stun"					//from base of mob/living/Stun() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_KNOCKDOWN "living_knockdown"		//from base of mob/living/Knockdown() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_PARALYZE "living_paralyze"			//from base of mob/living/Paralyze() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_IMMOBILIZE "living_immobilize"		//from base of mob/living/Immobilize() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_UNCONSCIOUS "living_unconscious"	//from base of mob/living/Unconscious() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_SLEEP "living_sleeping"			//from base of mob/living/Sleeping() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_DAZE "living_daze"					//from base of mob/living/Daze() (amount, update, ignore)
#define COMSIG_LIVING_STATUS_STAGGER "living_stagger"			//from base of mob/living/Stagger() (amount, update, ignore)
	#define COMPONENT_NO_STUN 1			//For all of them

// /mob/living/carbon signals
#define COMSIG_CARBON_IDENTITY_TRANSFERRED_TO "carbon_id_transferred_to" //from datum/dna/transfer_identity(): (datum/dna, transfer_SE)
#define COMSIG_CARBON_TACKLED "carbon_tackled"						//sends from tackle.dm on tackle completion
// /mob/living/simple_animal/hostile signals
#define COMSIG_HOSTILE_ATTACKINGTARGET "hostile_attackingtarget"
	#define COMPONENT_HOSTILE_NO_ATTACK 1

// /machinery signals
#define COMSIG_MACHINE_EJECT_OCCUPANT "eject_occupant"			//from base of obj/machinery/dropContents() (occupant)

// /obj/item signals
#define COMSIG_MOB_APPLY_DAMGE	"mob_apply_damage"				//from base of /mob/living/proc/apply_damage(): (damage, damagetype, def_zone)
#define COMSIG_ITEM_ALT_AFTERATTACK "item_alt_afterattack"		//from base of obj/item/altafterattack(): (atom/target, mob/user, proximity, params)
#define COMSIG_ITEM_WEARERCROSSED "wearer_crossed"                //called on item when crossed by something (): (/atom/movable)
#define COMSIG_ITEM_WORN_OVERLAYS "item_worn_overlays"			//from base of obj/item/worn_overlays(): (isinhands, icon_file, used_state, style_flags, list/overlays)
// THE FOLLOWING TWO BLOCKS SHOULD RETURN BLOCK FLAGS AS DEFINED IN __DEFINES/combat.dm!
#define COMSIG_ITEM_CHECK_BLOCK "check_block"					//from base of obj/item/check_block(): (mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
#define COMSIG_ITEM_RUN_BLOCK "run_block"						//from base of obj/item/run_block(): (mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
#define COMSIG_ITEM_DECONSTRUCTOR_DEEPSCAN "deconstructor_deepscan"			//Called by deconstructive analyzers deepscanning an item: (obj/machinery/rnd/destructive_analyzer/analyzer_machine, mob/user, list/information_list)
	// Uncovered information
	#define COMPONENT_DEEPSCAN_UNCOVERED_INFORMATION		1

// /obj/item/clothing signals
#define COMSIG_SUIT_MADE_HELMET "suit_made_helmet"				//from base of obj/item/clothing/suit/MakeHelmet(): (helmet)

	//This uses all return values of COMSIG_IMPLANT_OTHER
#define COMSIG_IMPLANT_REMOVING "implant_removing"				//from base of /obj/item/implant/proc/removed() (list/args)

// /obj/item/projectile signals (sent to the firer)
#define COMSIG_PROJECTILE_ON_HIT "projectile_on_hit"			// from base of /obj/item/projectile/proc/on_hit(): (atom/movable/firer, atom/target, Angle)
#define COMSIG_PROJECTILE_BEFORE_FIRE "projectile_before_fire" 			// from base of /obj/item/projectile/proc/fire(): (obj/item/projectile, atom/original_target)

// /mob/living/carbon/human signals
#define COMSIG_HUMAN_PREFS_COPIED_TO "human_prefs_copied_to"					//from datum/preferences/copy_to(): (datum/preferences, icon_updates, roundstart_checks)
#define COMSIG_HUMAN_HARDSET_DNA "human_hardset_dna"							//from mob/living/carbon/human/hardset_dna(): (ui, list/mutation_index, newreal_name, newblood_type, datum/species, newfeatures)
#define COMSIG_HUMAN_ON_RANDOMIZE "humman_on_randomize"							//from base of proc/randomize_human()

// /datum/species signals
#define COMSIG_SPECIES_GAIN "species_gain"						//from datum/species/on_species_gain(): (datum/species/new_species, datum/species/old_species)
#define COMSIG_SPECIES_LOSS "species_loss"						//from datum/species/on_species_loss(): (datum/species/lost_species)

/*******Component Specific Signals*******/

//Drink

///from base of obj/item/reagent_containers/food/drinks/attack(): (mob/living/M, mob/user)
#define COMSIG_DRINK_DRANK "drink_drank"
///from base of obj/item/reagent_containers/glass/attack(): (mob/M, mob/user)
#define COMSIG_GLASS_DRANK "glass_drank"

//Gibs
#define COMSIG_GIBS_STREAK "gibs_streak"						// from base of /obj/effect/decal/cleanable/blood/gibs/streak(): (list/directions, list/diseases)

//Mood
#define COMSIG_MODIFY_SANITY "modify_sanity" //Called when you want to increase or decrease sanity from anywhere in the code.

//NTnet
#define COMSIG_COMPONENT_NTNET_RECEIVE "ntnet_receive"			//called on an object by its NTNET connection component on receive. (sending_id(number), sending_netname(text), data(datum/netdata))

//Nanites
#define COMSIG_HAS_NANITES "has_nanites"						//() returns TRUE if nanites are found
#define COMSIG_NANITE_IS_STEALTHY "nanite_is_stealthy"			//() returns TRUE if nanites have stealth
#define COMSIG_NANITE_DELETE "nanite_delete"					//() deletes the nanite component
#define COMSIG_NANITE_GET_PROGRAMS	"nanite_get_programs"		//(list/nanite_programs) - makes the input list a copy the nanites' program list
#define COMSIG_NANITE_GET_VOLUME "nanite_get_volume"			//(amount) Returns nanite amount
#define COMSIG_NANITE_SET_VOLUME "nanite_set_volume"			//(amount) Sets current nanite volume to the given amount
#define COMSIG_NANITE_ADJUST_VOLUME "nanite_adjust"				//(amount) Adjusts nanite volume by the given amount
#define COMSIG_NANITE_SET_MAX_VOLUME "nanite_set_max_volume"	//(amount) Sets maximum nanite volume to the given amount
#define COMSIG_NANITE_SET_CLOUD "nanite_set_cloud"				//(amount(0-100)) Sets cloud ID to the given amount
#define COMSIG_NANITE_SET_CLOUD_SYNC "nanite_set_cloud_sync"	//(method) Modify cloud sync status. Method can be toggle, enable or disable
#define COMSIG_NANITE_SET_SAFETY "nanite_set_safety"			//(amount) Sets safety threshold to the given amount
#define COMSIG_NANITE_SET_REGEN "nanite_set_regen"				//(amount) Sets regeneration rate to the given amount
#define COMSIG_NANITE_SIGNAL "nanite_signal"					//(code(1-9999)) Called when sending a nanite signal to a mob.
#define COMSIG_NANITE_COMM_SIGNAL "nanite_comm_signal"			//(comm_code(1-9999), comm_message) Called when sending a nanite comm signal to a mob.
#define COMSIG_NANITE_SCAN "nanite_scan"						//(mob/user, full_scan) - sends to chat a scan of the nanites to the user, returns TRUE if nanites are detected
#define COMSIG_NANITE_UI_DATA "nanite_ui_data"					//(list/data, scan_level) - adds nanite data to the given data list - made for ui_data procs
#define COMSIG_NANITE_ADD_PROGRAM "nanite_add_program"			//(datum/nanite_program/new_program, datum/nanite_program/source_program) Called when adding a program to a nanite component
#define COMPONENT_PROGRAM_INSTALLED		1					//Installation successful
#define COMPONENT_PROGRAM_NOT_INSTALLED		2				//Installation failed, but there are still nanites
#define COMSIG_NANITE_SYNC "nanite_sync"						//(datum/component/nanites, full_overwrite, copy_activation) Called to sync the target's nanites to a given nanite component

// /datum/action signals
#define COMSIG_ACTION_TRIGGER "action_trigger"						//from base of datum/action/proc/Trigger(): (datum/action)
	#define COMPONENT_ACTION_BLOCK_TRIGGER 1

//Xenobio hotkeys
#define COMSIG_XENO_SLIME_CLICK_CTRL "xeno_slime_click_ctrl"				//from slime CtrlClickOn(): (/mob)
#define COMSIG_XENO_SLIME_CLICK_ALT "xeno_slime_click_alt"					//from slime AltClickOn(): (/mob)
#define COMSIG_XENO_SLIME_CLICK_SHIFT "xeno_slime_click_shift"				//from slime ShiftClickOn(): (/mob)
#define COMSIG_XENO_TURF_CLICK_SHIFT "xeno_turf_click_shift"				//from turf ShiftClickOn(): (/mob)
#define COMSIG_XENO_TURF_CLICK_CTRL "xeno_turf_click_alt"					//from turf AltClickOn(): (/mob)
#define COMSIG_XENO_MONKEY_CLICK_CTRL "xeno_monkey_click_ctrl"				//from monkey CtrlClickOn(): (/mob)


///Called right before the atom changes the value of light_range to a different one, from base atom/set_light_range(): (new_range)
#define COMSIG_ATOM_SET_LIGHT_RANGE "atom_set_light_range"
///Called right before the atom changes the value of light_power to a different one, from base atom/set_light_power(): (new_power)
#define COMSIG_ATOM_SET_LIGHT_POWER "atom_set_light_power"
///Called right before the atom changes the value of light_color to a different one, from base atom/set_light_color(): (new_color)
#define COMSIG_ATOM_SET_LIGHT_COLOR "atom_set_light_color"
///Called right before the atom changes the value of light_on to a different one, from base atom/set_light_on(): (new_value)
#define COMSIG_ATOM_SET_LIGHT_ON "atom_set_light_on"
///called on a movable (NOT living) when someone starts pulling it (atom/movable/puller, state, force)
#define COMSIG_ATOM_START_PULL "movable_start_pull"
///called on /living when someone starts pulling it (atom/movable/puller, state, force)
#define COMSIG_LIVING_START_PULL "living_start_pull"
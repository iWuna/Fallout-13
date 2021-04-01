#define HAS_TRAIT(target, trait) (target.status_traits ? (target.status_traits[trait] ? TRUE : FALSE) : FALSE)
#define HAS_TRAIT_FROM(target, trait, source) (target.status_traits ? (target.status_traits[trait] ? (source in target.status_traits[trait]) : FALSE) : FALSE)
#define HAS_TRAIT_NOT_FROM(target, trait, source) (target.status_traits ? (target.status_traits[trait] ? (length(target.status_traits[trait] - source) > 0) : FALSE) : FALSE)

//mob traits
#define TRAIT_BLIND 			"blind"
#define TRAIT_MUTE				"mute"
#define TRAIT_EMOTEMUTE			"emotemute"
#define TRAIT_DEAF				"deaf"
#define TRAIT_NEARSIGHT			"nearsighted"
#define TRAIT_FAT				"fat"
#define TRAIT_HUSK				"husk"
#define TRAIT_NOCLONE			"noclone"
#define TRAIT_CLUMSY			"clumsy"
#define TRAIT_DUMB				"dumb"
#define TRAIT_MONKEYLIKE		"monkeylike" //sets IsAdvancedToolUser to FALSE
#define TRAIT_PACIFISM			"pacifism"
#define TRAIT_IGNORESLOWDOWN	"ignoreslow"
#define TRAIT_IGNOREDAMAGESLOWDOWN	"ignoredamageslow"
#define TRAIT_GOTTAGOFAST		"fast"
#define TRAIT_GOTTAGOREALLYFAST	"2fast"
#define TRAIT_LEGIONBOIS		"SpeedyLegionBois"
#define TRAIT_FAKEDEATH			"fakedeath"
#define TRAIT_DISFIGURED		"disfigured"
#define TRAIT_XENO_HOST			"xeno_host"	//Tracks whether we're gonna be a baby alien's mummy.
#define TRAIT_STUNIMMUNE		"stun_immunity"
#define TRAIT_PARALYZEIMMUNE	"paralyze_immunity"
#define TRAIT_SLEEPIMMUNE		"sleep_immunity"
#define TRAIT_PUSHIMMUNE		"push_immunity"
#define TRAIT_SHOCKIMMUNE		"shock_immunity"
#define TRAIT_STABLEHEART		"stable_heart"
#define TRAIT_RESISTHEAT		"resist_heat"
#define TRAIT_RESISTHEATHANDS	"resist_heat_handsonly" //For when you want to be able to touch hot things, but still want fire to be an issue.
#define TRAIT_RESISTCOLD		"resist_cold"
#define TRAIT_RESISTHIGHPRESSURE	"resist_high_pressure"
#define TRAIT_RESISTLOWPRESSURE	"resist_low_pressure"
#define TRAIT_RADIMMUNE			"rad_immunity"
#define TRAIT_VIRUSIMMUNE		"virus_immunity"
#define TRAIT_PIERCEIMMUNE		"pierce_immunity"
#define TRAIT_NODISMEMBER		"dismember_immunity"
#define TRAIT_NOFIRE			"nonflammable"
#define TRAIT_NOGUNS			"no_guns"
#define TRAIT_NOHUNGER			"no_hunger"
#define TRAIT_EASYDISMEMBER		"easy_dismember"
#define TRAIT_LIMBATTACHMENT 	"limb_attach"
#define TRAIT_TOXINLOVER		"toxinlover"
#define TRAIT_NOBREATH			"no_breath"
#define TRAIT_ANTIMAGIC			"anti_magic"
#define TRAIT_HOLY				"holy"
#define TRAIT_DEPRESSION		"depression"
#define TRAIT_JOLLY				"jolly"
#define TRAIT_MEDEBIL				"no_med"
#define TRAIT_HARD_YARDS        "hard_yards"
#define TRAIT_NOCRITDAMAGE		"no_crit"
#define TRAIT_NOSLIPWATER		"noslip_water"
#define TRAIT_NOSLIPALL			"noslip_all"
#define TRAIT_NODEATH			"nodeath"
#define TRAIT_NOHARDCRIT		"nohardcrit"
#define TRAIT_NOSOFTCRIT		"nosoftcrit"

#define TRAIT_ALCOHOL_TOLERANCE	"alcohol_tolerance"
#define TRAIT_AGEUSIA			"ageusia"
#define TRAIT_HEAVY_SLEEPER		"heavy_sleeper"
#define TRAIT_NIGHT_VISION		"night_vision"
#define TRAIT_LIGHT_STEP		"light_step"
#define TRAIT_SPIRITUAL			"spiritual"
#define TRAIT_VORACIOUS			"voracious"
#define TRAIT_SELF_AWARE		"self_aware"
#define TRAIT_FREERUNNING		"freerunning"
#define TRAIT_SKITTISH			"skittish"
#define TRAIT_POOR_AIM			"poor_aim"
#define TRAIT_PROSOPAGNOSIA		"prosopagnosia"
#define	TRAIT_DRUNK_HEALING		"drunk_healing"
#define TRAIT_BIG_LEAGUES		"big_leagues"
#define TRAIT_TRAPPER			"trapper"
#define TRAIT_IRONFIST			"iron_fist"
#define TRAIT_PSYCHO			"psycho"
#define	TRAIT_LIFEGIVER			"lifegiver"
#define TRAIT_UNDERPREPARED		"underprepared"
#define TRAIT_CAT_EYES_NV		"night_vision_cat_eyes"

#define TRAIT_WILDWASTELAND		"wild_wasteland"

#define	TRAIT_CHEMWHIZ			"chemwhiz"
#define TRAIT_TECHNOPHOBE		"luddite" //Cannot use autolathes/biogens
#define TRAIT_TECHNOPHREAK		"technophreak"	//needed to use the autolathe, renamed and sprited 30/06/2020
#define TRAIT_PA_WEAR           "pa_wear"
#define TRAIT_MEDICALEXPERT		"Field Surgeon" //Can do revival and restoration surgery
#define TRAIT_ADVANCED_SURGEON	"Brain Surgery" //lobotomy, pacification, viral bonding
#define TRAIT_PRACTITIONER		"Practitioner" //Has access to FoA specific surgeries
#define TRAIT_MACHINE_SPIRITS	"machine_spirits" //for tribe unique functions.


// fallout crafting traits
#define TRAIT_GUNSMITH_ONE      "gunsmith_one"
#define TRAIT_GUNSMITH_TWO      "gunsmith_two"
#define TRAIT_GUNSMITH_THREE    "gunsmith_three"
#define TRAIT_GUNSMITH_FOUR     "gunsmith_four"
#define TRAIT_MASTER_GUNSMITH   "master_gunsmith"
#define TRAIT_MAGIC_HANDS   "magic_hands"

// common trait sources
#define TRAIT_GENERIC "generic"
#define EYE_DAMAGE "eye_damage"
#define GENETIC_MUTATION "genetic"
#define OBESITY "obesity"
#define MAGIC_TRAIT "magic"
#define TRAUMA_TRAIT "trauma"
#define SPECIES_TRAIT "species"
#define ORGAN_TRAIT "organ"
#define ROUNDSTART_TRAIT "roundstart" //cannot be removed without admin intervention

// unique trait sources, still defines
#define STATUE_MUTE "statue"
#define CHANGELING_DRAIN "drain"
#define CHANGELING_HIVEMIND_MUTE "ling_mute"
#define ABYSSAL_GAZE_BLIND "abyssal_gaze"
#define HIGHLANDER "highlander"
#define TRAIT_HULK "hulk"
#define STASIS_MUTE "stasis"
#define GENETICS_SPELL "genetics_spell"
#define EYES_COVERED "eyes_covered"


// arousal code'n shit
#define TRAIT_PERMABONER		"permanent_arousal"
#define TRAIT_NEVERBONER		"never_aroused"
#define TRAIT_MASO              "masochism"
#define TRAIT_PHARMA            "hepatic_pharmacokinesis"
#define TRAIT_PARA              "paraplegic"
#define TRAIT_EMPATH			"empath"
#define TRAIT_FRIENDLY			"friendly"
#define TRAIT_ASSBLASTUSA       "assblastusa"
#define TRAIT_CULT_EYES 		"cult_eyes"
#define TRAIT_XRAY_VISION       "xray_vision"
#define TRAIT_THERMAL_VISION    "thermal_vision"
#define TRAIT_CUM_PLUS			"cum_plus"
#define TRAIT_NEVER_CLONE       "donotclone"
#define	TRAIT_CROCRIN_IMMUNE    "crocin_immune"
#define TRAIT_NYMPHO			"nymphomania"
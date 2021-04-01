/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	department_flag = NCR
	selection_color = "#ffeeaa"
	verbs = list(/mob/living/carbon/human/proc/emote_ncr)

	access = list(ACCESS_NCR, ACCESS_NCROFFDUTY)
	minimal_access = list(ACCESS_NCR, ACCESS_NCROFFDUTY)
	forbids = "В НКР запрещено: Наркотики, препараты и алкоголь запрещены на службе. Расстрел безоружных, или сдавшихся элементов без разрешения. Нарушение дисциплины и уход в самоволку без официально увольнения или отпускного.."
	enforces = "В НКР ожидается: Подчинение приказам начальства. Соблюдение законов Республики. Добросовестное обращение с военнопленными, запрет на их уничтожение без согласия руководства. Нахождение в униформе на службе. ."
	objectivesList = list("Руководство поставило нам следующие цели: установить форпост на радиовышке, очистить её от рейдеров","Руководство поставило нам следующие цели: нейтрализуйте и поймайте опасные криминальные элементы", "Руководство поставило нам следующие цели: выследите работорговцев, спасите рабов и установите доверительные отношения с местными в регионе.","Руководство поставило нам следующие цели: укрепите силы НКР в регионе: укрепите базу, проведите разведку за Легионом, наладьте отношения с местными.")

/datum/outfit/job/ncr/
	name = "NCRdatums"
	jobtype = /datum/job/ncr/
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = /obj/item/radio/headset/headset_ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	gloves = /obj/item/clothing/gloves/f13/ncr

/*
Colonel
*/
/datum/job/ncr/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
	faction = "NCR"
	minimal_access = list(ACCESS_NCR_COMMAND, ACCESS_NCR, ACCESS_NCROFFDUTY)
	access = list(ACCESS_NCR_COMMAND, ACCESS_NCR, ACCESS_NCROFFDUTY)
	head_announce = list("Security")
	supervisors = "Генерал"
	req_admin_notify = 1
	verbs = list(/mob/living/carbon/human/proc/emote_ncr_command)

	total_positions = 0
	spawn_positions = 0

	exp_requirements = 800
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13colonel

/datum/outfit/job/ncr/f13colonel/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13colonel
	name 		= "NCR Colonel"
	jobtype 	= /datum/job/ncr/f13colonel
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory 	= /obj/item/clothing/accessory/ncr
	suit 		= /obj/item/clothing/suit/armor/f13/power_armor/t45d/sierra
	head 		= /obj/item/clothing/head/beret/ncr
	belt        = /obj/item/storage/belt/military/assault/ncr
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store  = /obj/item/gun/ballistic/automatic/marksman
	shoes       = /obj/item/clothing/shoes/f13/military/ncr_officer
	gloves      = /obj/item/clothing/gloves/f13/leather/ncr_officer
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45=3, \
		/obj/item/ammo_box/magazine/m556/rifle=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/m1911=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/bag/money/small/ncr)

/*
Captain
*/
/datum/job/ncr/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	head_announce = list("Security")
	department_head = list("NCR Colonel")
	minimal_access = list(ACCESS_NCR_COMMAND, ACCESS_NCR, ACCESS_NCROFFDUTY)
	access = list(ACCESS_NCR_COMMAND, ACCESS_NCR, ACCESS_NCROFFDUTY)
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	description = "Вы – командующий офицер местных сил в Пахрумпе. Вы попали в данное место за проступки, и как оказалось, в управление вам был дан штрафбат. В вашем распоряжении находится база и прилегающие территории в виде городка, жителей которого вы должны защищать. Лейтенанты, как и Рейнджеры – ваши прямые подчиненные (В случае с Рейнджерами, лучше поставить им определенные цели, ведь их основная цель в регионе немного отличнее от вашей, нежели кидать их в бой вместе с основными силами) Разрабатывая логистику, укрепляя базу и работая совместно с рейнджерами, вы проводите дисциплинарное воспитание штрафбата. Ваша главная цель – установить влияние НКР в регионе, что станет плацдармом для его контроля в будущем. Хоть вы и попали сюда за провинности, она была незначительна, вы должны соблюдать дисциплину в лагере, и следить за её порядком. В данном случае вам может помочь военная полиция НКР."
	supervisors = "Colonel"
	req_admin_notify = 1
	verbs = list(/mob/living/carbon/human/proc/emote_ncr_command)

	exp_requirements = 700
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13captain

	loadout_options = list(
	/datum/outfit/loadout/captinf, //Unique R82 assault rifle
	/datum/outfit/loadout/captscout, //Unique scoped m1 garand
	)

/datum/outfit/job/ncr/f13captain/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13captain
	name = "NCR Captain"
	jobtype 	= /datum/job/ncr/f13captain
	id 			= /obj/item/card/id/dogtag/ncrcaptain
	uniform		= /obj/item/clothing/under/f13/ncr/officer
	accessory 	= /obj/item/clothing/accessory/ncr/CPT
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/captain
	suit_store 	= /obj/item/gun/ballistic/automatic/pistol/ninemil
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	shoes       = /obj/item/clothing/shoes/f13/military/ncr_officer
	neck = 		/obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/twohanded/binocs=1, \
		/obj/item/storage/bag/money/small/ncr, \
		/obj/item/clothing/mask/ncr_facewrap)

/datum/job/ncr/f13captain/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")
	H.add_quirk("Lifegiver")
	H.add_quirk("Self-Aware")

/datum/outfit/loadout/captscout
	name = "Scout"
	head = 			/obj/item/clothing/head/beret/ncr_scout_lt
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr_scout
	gloves = 		/obj/item/clothing/gloves/rifleman
	l_hand 	= 		/obj/item/gun/ballistic/automatic/m1garand/republicspride
	uniform = 		/obj/item/clothing/under/f13/ncr/scout
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
	/obj/item/ammo_box/magazine/garand308=3)

/datum/outfit/loadout/captinf
	name = "Infantry"
	head = 		/obj/item/clothing/head/beret/ncr
	gloves = 	/obj/item/clothing/gloves/f13/leather/ncr_officer
	belt = 		/obj/item/storage/belt/military/assault/ncr
	l_hand = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle/r82
	backpack_contents = list(
	/obj/item/ammo_box/magazine/m556/rifle/assault=2)

/*
Ambassador
*/

/datum/job/ncr/f13ambassador
	title = "NCR Ambassador"
	department_head = list("NCR Colonel")
	flag = F13AMBASSADOR
	head_announce = list("Security")
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	description = "Вы – дипломатическое лицо, и политический атташе для сил НКР в регионе. Вы не участвуете в конфликтах, и предпочитаете наоборот – их избегать. Ваша цель – наладить контакты с местными, и совместно с военными укрепить силы НКР в регионе. Вам известны проблемы с местным штрафбатом, так что вы будете гарантом законности. В случае, если капитан является абсолютно некомпетентным – военная полиция переходит под ваше управление. При её отсутствии, вам достаточно отправить рапорт в штаб. Помните, что у вас большое бюрократическое влияние. ."
	supervisors = "Полковник и высшее руководство"
	req_admin_notify = 1

	exp_requirements = 100
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13ambassador

/datum/outfit/job/ncr/f13ambassador
	name = "NCR Ambassador"
	jobtype 	= /datum/job/ncr/f13ambassador
	id 			= /obj/item/card/id/dogtag/ncrambassador
	uniform		= /obj/item/clothing/under/f13/gentlesuit
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	shoes 		= /obj/item/clothing/shoes/laceup
	suit		= /obj/item/clothing/suit/toggle/lawyer/black
	l_hand = /obj/item/storage/briefcase
	gloves      = null
	backpack_contents = list(
		/obj/item/ammo_box/a357=1, \
		/obj/item/gun/ballistic/revolver/police=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/bag/money/small/ncr=1,
		/obj/item/megaphone=1)

/*
Lieutenant
*/

/datum/job/ncr/f13lieutenant
	title = "NCR Lieutenant"
	department_head = list("NCR Captain")
	minimal_access = list(ACCESS_NCR_COMMAND, ACCESS_NCR, ACCESS_NCROFFDUTY)
	access = list(ACCESS_NCR_COMMAND, ACCESS_NCR, ACCESS_NCROFFDUTY)
	flag = F13LIEUTENANT
	total_positions = 1
	spawn_positions = 1
	faction = "NCR"
	description = "Вы напрямую руководите сержантским и рядовым составом. Вы подчиняетесь Капитану. В отсутствие капитана, вы тесно сотрудничаете с Рейнджерами. Вы поддерживаете дисциплину, разрабатываете патрули, планы, тренировки и миссии. Если есть задание, которое не могут выполнить командный состав, вы можете привлечь к участию рейнджеров.."
	supervisors = "Капитан и выше"
	selection_color = "#fff5cc"
	verbs = list(/mob/living/carbon/human/proc/emote_ncr_command)

	exp_requirements = 500
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13lieutenant

	loadout_options = list(
	/datum/outfit/loadout/ltmedic, //Grease gun, meds
	/datum/outfit/loadout/ltinf, //Assault carbine, extra ammo
	/datum/outfit/loadout/ltscout, //DKS, trekking
	/datum/outfit/loadout/ltmp // Pump riot, baton, beanbags
	)

/datum/outfit/job/ncr/f13lieutenant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13lieutenant
	name = "NCR Lieutenant"
	jobtype	= /datum/job/ncr/f13lieutenant
	id = 		/obj/item/card/id/dogtag/ncrlieutenant
	uniform	= 	/obj/item/clothing/under/f13/ncr/officer
	accessory = /obj/item/clothing/accessory/ncr/LT
	head = 		/obj/item/clothing/head/beret/ncr
	neck = 		/obj/item/storage/belt/holster
	glasses = 	/obj/item/clothing/glasses/sunglasses/big
	shoes = 	/obj/item/clothing/shoes/f13/military/ncr_officer
	gloves = 	/obj/item/clothing/gloves/f13/leather/ncr_officer
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/ammo_box/magazine/m9mm=2, \
		/obj/item/twohanded/binocs=1, \
		/obj/item/storage/bag/money/small/ncrofficers, \
		/obj/item/clothing/mask/ncr_facewrap)

/datum/outfit/loadout/ltmedic
	name = "Medic"
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	glasses = 		/obj/item/clothing/glasses/hud/health
	gloves = 		/obj/item/clothing/gloves/color/latex/nitrile
	mask = 			/obj/item/clothing/mask/surgical
	suit_store = 	/obj/item/gun/ballistic/automatic/greasegun
	belt = 			/obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun=2,
		/obj/item/clothing/accessory/armband/medblue=1,
		/obj/item/storage/pill_bottle/mining=1,
		/obj/item/storage/firstaid/regular=1,
		/obj/item/book/granter/trait/chemistry=1,
		/obj/item/book/granter/trait/field_surgery=1,
		/obj/item/reagent_containers/hypospray/CMO=1)

/datum/outfit/loadout/ltinf
	name = "Infantry"
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	suit_store = 	/obj/item/gun/ballistic/automatic/assault_carbine
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/book/granter/trait/trekking=1)

/datum/outfit/loadout/ltscout
	name = "Scout"
	head = 			/obj/item/clothing/head/beret/ncr_scout_lt
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr_scout
	gloves = 		/obj/item/clothing/gloves/rifleman
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/scout/officer
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/sniper
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	uniform = 		/obj/item/clothing/under/f13/ncr/scout
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308=3,
		/obj/item/book/granter/trait/trekking=1)

/datum/outfit/loadout/ltmp
	name = "Military Police"
	accessory = 	/obj/item/clothing/accessory/armband/black
	head = 			/obj/item/clothing/head/f13/ncr/mp
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	suit_store = 	/obj/item/gun/ballistic/shotgun/riot
	belt = 			/obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/storage/box/rubbershot = 1, \
		/obj/item/storage/box/rubbershot/beanbag = 1, \
		/obj/item/melee/classic_baton= 1
	)

/*
Sergeant
*/

/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	department_head = list("NCR Captain")
	flag = F13SERGEANT
	total_positions = 2
	spawn_positions = 2
	faction = "NCR"
	description = "Вы напрямую руководите рядовым составом, подчиняясь приказам Лейтенанта. Руководите рядовым составом, и следите за их исполнением рядовым составом, чтобы они исполняли их в точности. Так же в обязанности входит установка дисциплины в этом штрафбате. Вы несете ответственность за обучение, и благосостояние рядового состава войск НКР.."
	supervisors = "Лейтенант и выше"
	selection_color = "#fff5cc"

	exp_requirements = 250
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13sergeant

	loadout_options = list(
	/datum/outfit/loadout/sgtinf, //Service rifle, extra ammo
	/datum/outfit/loadout/sgtscout, //Marksman rifle
	/datum/outfit/loadout/sgtmp, //Drum riot shotgun, baton, beanbags
	/datum/outfit/loadout/sgtmech //Salvaged power armor, LMG
	)

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id = 			/obj/item/card/id/dogtag/ncrsergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	neck = 			/obj/item/storage/belt/holster
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	gloves =        /obj/item/clothing/gloves/f13/ncr
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/ammo_box/magazine/m9mm=2, \
		/obj/item/storage/bag/money/small/ncrofficers, \
		/obj/item/clothing/mask/ncr_facewrap)

/datum/outfit/loadout/sgtinf
	name = "Infantry"
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	head = 			/obj/item/clothing/head/f13/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=5
	)

/datum/outfit/loadout/sgtmp
	name = "Military Police"
	accessory = 	/obj/item/clothing/accessory/ncr/SGT
	accessory = 	/obj/item/clothing/accessory/armband/black
	head = 			/obj/item/clothing/head/f13/ncr/mp
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	suit_store = 	/obj/item/gun/ballistic/automatic/shotgun/riot
	belt = 			/obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/d12g=2, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/storage/box/rubbershot = 1, \
		/obj/item/storage/box/rubbershot/beanbag = 1, \
		/obj/item/melee/classic_baton= 1
	)

/datum/outfit/loadout/sgtscout
	name = "Scout"
	accessory = 	/obj/item/clothing/accessory/ncr/SSGT
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/scout/veteran
	head = 			/obj/item/clothing/head/beret/ncr_scout
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr_scout
	gloves = 		/obj/item/clothing/gloves/rifleman
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	uniform = 		/obj/item/clothing/under/f13/ncr/scout
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3)

/datum/outfit/loadout/sgtmech
	name = "Mechanized"
	accessory = 	/obj/item/clothing/accessory/ncr/SSGT
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/ncr
	head = 			/obj/item/clothing/head/helmet/f13/power_armor/t45b
	belt = 			/obj/item/storage/belt/military/assault/ncr
	back = 			/obj/item/minigunpackbal
/*
Corporal
*/

/datum/job/ncr/f13specialist
	title = "NCR Corporal"
	department_head = list("NCR Captain")
	flag = F13SPECIALIST
	faction = "NCR"
	total_positions = 4
	spawn_positions = 4
	description = "Вы – младший сержант, со специальным набором навыков (При выборе военной полиции вы остаетесь в приделах базы и подчиняетесь напрямую Капитану или же Администратору), в иных случаях вы подчиняетесь своему Сержанту, выполняя его приказы для достижения хороших результатов и успеха НКР.."
	supervisors = "Сержант и выше"
	selection_color = "#fff5cc"

	exp_requirements = 230
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13specialist

	loadout_options = list(
	/datum/outfit/loadout/specmedic, //Medkit, medHUD, patches, needler
	/datum/outfit/loadout/speceng, //C4, toolbelt, welding goggles
	/datum/outfit/loadout/specscout, //Scoped hunting rifle, binoculars
	/datum/outfit/loadout/specmp, //Hunting shotgun, baton, beanbags
	///datum/outfit/loadout/specmech //Power armor, assault rifle
	)


/datum/outfit/job/ncr/f13specialist
	name = "NCR Corporal"
	jobtype = /datum/job/ncr/f13specialist
	uniform =  		/obj/item/clothing/under/f13/ncr
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	neck = 			/obj/item/storage/belt/holster
	accessory = /obj/item/clothing/accessory/ncr/CPL
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/clothing/mask/ncr_facewrap=1
		)

/datum/outfit/loadout/specmedic
	name = "Medic"
	glasses = 		/obj/item/clothing/glasses/hud/health
	head = 			/obj/item/clothing/head/f13/ncr/medic
	gloves = 		/obj/item/clothing/gloves/color/latex/nitrile
	mask = 			/obj/item/clothing/mask/surgical
	belt = 			/obj/item/storage/belt/military/assault/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	suit_store = 	/obj/item/gun/ballistic/revolver/needler
	backpack_contents = list(
		/obj/item/clothing/accessory/armband/medblue=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=3,
		/obj/item/book/granter/trait/chemistry=1,
		/obj/item/book/granter/trait/field_surgery=1,
		/obj/item/storage/pill_bottle/mining=1,
		/obj/item/storage/firstaid/regular=1,
		/obj/item/ammo_box/needle=3
		)

/datum/outfit/loadout/speceng
	name = "Engineer"
	glasses = 		/obj/item/clothing/glasses/welding
	gloves = 		/obj/item/clothing/gloves/color/yellow
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	head = 			/obj/item/clothing/head/f13/ncr/goggles
	backpack_contents = list(
		/obj/item/grenade/plastic=1,
		/obj/item/stack/sheet/metal/fifty=2,
		/obj/item/stack/sheet/glass/fifty=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/book/granter/trait/techno=1,
		/obj/item/book/granter/trait/gunsmith=1
		)

/datum/outfit/loadout/specscout
	name = "Scout"
	suit_store = 	/obj/item/gun/ballistic/shotgun/remington/scoped
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/scout
	head = 			/obj/item/clothing/head/beret/ncr_scout
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	gloves = 		/obj/item/clothing/gloves/rifleman
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr_scout
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	uniform = 		/obj/item/clothing/under/f13/ncr/scout
	backpack_contents = list(
		/obj/item/ammo_box/a308=3,
		/obj/item/twohanded/binocs=1
		)

/datum/outfit/loadout/specmp
	name = "Military Police"
	accessory = 	/obj/item/clothing/accessory/armband/black
	head = 			/obj/item/clothing/head/f13/ncr/mp
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	suit_store = 	/obj/item/gun/ballistic/shotgun/hunting
	belt = 			/obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, , \
		/obj/item/storage/box/rubbershot = 1, \
		/obj/item/storage/box/rubbershot/beanbag = 1, \
		/obj/item/melee/classic_baton=1
	)

/datum/outfit/loadout/specmech
	name = "Mechanized"
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/ncr
	head = 			/obj/item/clothing/head/helmet/f13/power_armor/t45b
	belt = 			/obj/item/storage/belt/military/assault/ncr
	suit_store = 	/obj/item/gun/ballistic/automatic/assault_rifle

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault = 2, \
		/obj/item/book/granter/trait/trekking=1,
	)
/*
NCR Heavy Trooper
*/

/*
/datum/job/ncr/f13ncrht
	title = "NCR Heavy Trooper"
	flag = F13NCRHT
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	description = "You are a corporal or a Sergeant who has been selected for the special duty of Heavy Trooper. You are exceptionally physically fit, being conditioned to wear the many, many pounds of salvaged power armor; and trained with your R84 LMG. You are the poster-child of the NCR Embassy, and should act accordingly."
	supervisors = "the officers"
	selection_color = "#fff5cc"

	exp_requirements = 265
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13ncrht

	loadout_options = list(
	/datum/outfit/loadout/heavycpl,
	/datum/outfit/loadout/heavysgt,
	)

/datum/outfit/job/ncr/f13ncrht
	name = "NCR Heavy Trooper"
	jobtype = /datum/job/ncr/f13ncrht
	id = 			/obj/item/card/id/dogtag/ncrht
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit_store = 	/obj/item/gun/ballistic/automatic/lmg
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/ncr
	head = 			/obj/item/clothing/head/helmet/f13/power_armor/t45b
	belt =          /obj/item/storage/belt/military/NCR_Bandolier
	glasses = 		null
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/book/granter/trait/trekking=1, \
		/obj/item/ammo_box/magazine/lmg=3
		)

/datum/outfit/loadout/heavycpl
	name = "Heavy Corporal"
	backpack_contents = list(
		/obj/item/clothing/accessory/ncr/CPL=1,
		)

/datum/outfit/loadout/heavysgt
	name = "Heavy Sergeant"
	backpack_contents = list(
		/obj/item/clothing/accessory/ncr/SGT=1,
		)
*/

/*
NCR Military Police
*/

/*
/datum/job/ncr/f13ncrmp
	title = "NCR Military Police"
	flag = F13NCRMP
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	description = "You are the primary enforcers of NCR law within the ranks of the local embassy. You are technically exempt from the standard chain of command, answering only to High-Command, and specifically, the NCR Office of Special Investigations (NCROSI). "
	supervisors = "NCROSI"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13ncrmp

	exp_requirements = 300
	exp_type = EXP_TYPE_NCR

/datum/outfit/job/ncr/f13ncrmp
	name = "NCR Military Police"
	jobtype = /datum/job/ncr/f13ncrmp
	id = 			/obj/item/card/id/dogtag/ncrmp
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/armband/black
	head = 			/obj/item/clothing/head/f13/ncr/mp
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store = 	/obj/item/gun/ballistic/shotgun/sc_pump
	r_hand = 		/obj/item/melee/classic_baton
	belt =          /obj/item/storage/belt/military/NCR_Bandolier
	glasses = 		null
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrenlisted, \
		/obj/item/storage/box/rubbershot = 1, \
		/obj/item/storage/box/rubbershot/beanbag =1, \
		)
*/

/*
Trooper
*/

/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	department_head = list("NCR Captain")
	flag = F13TROOPER
	faction = "NCR"
	total_positions = 5
	spawn_positions = 5
	description = "Вы – основной хребет армии, и основная движущая военная сила НКР. Вы отвечаете перед всеми вышестоящими в цепи командования, принимая приказы от своего Сержанта, а так же приказы от других офицеров: Капитана или Лейтенанта. Вы попали в штрафбат за некоторые проступки, но вам дали шанс их исправить. Особо отличившиеся получают звание рядового первого класса, за верную и совестную службу НКР.."
	supervisors = "Капрал и выше"
	selection_color = "#fff5cc"
	exp_requirements = 100
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13trooper

/*
	loadout_options = list(
	/datum/outfit/loadout/trooperfrontline, //Service rifle
	/datum/outfit/loadout/trooperranged //Hunting rifle
	)
*/

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	head = 			/obj/item/clothing/head/f13/ncr/goggles
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	belt =          /obj/item/storage/belt/military/assault/ncr
	glasses = 		null
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted, \
		/obj/item/clothing/mask/ncr_facewrap, \
		/obj/item/ammo_box/magazine/m556/rifle=2)

/*
/datum/outfit/loadout/trooperfrontline
	name = "Front-Line Trooper"
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman/servicerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3)

/datum/outfit/loadout/trooperranged
	name = "Ranged Trooper"
	suit_store = /obj/item/gun/ballistic/shotgun/remington
	backpack_contents = list(
		/obj/item/ammo_box/a308=3
		)
*/

/*
Recruit
*/

/datum/job/ncr/f13recruit
	title = "NCR Recruit"
	department_head = list("NCR Captain")
	flag = F13RECRUIT
	faction = "NCR"
	total_positions = 10
	spawn_positions = 10
	description = "Вы - боец с самым низким рангом в армии, только что завершив базовую боевую подготовку. Используйте навыки и знания, которые вы приобрели во время базового обучения, и выполняйте приказы, данные руководителями более высокого ранга. ."
	supervisors = "Капрал и выше, при отсутствии офицеров - сами рядовые первого класса"
	selection_color = "#fff5cc"
	exp_requirements = 50
	exp_type = EXP_TYPE_WASTELAND

	outfit = /datum/outfit/job/ncr/f13recruit

/datum/outfit/job/ncr/f13recruit
	name = "NCR Recruit"
	jobtype = 		/datum/job/ncr/f13recruit
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform = 		/obj/item/clothing/under/f13/ncr
	accessory = 	/obj/item/clothing/accessory/ncr/REC
	head = 			/obj/item/clothing/head/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store =	/obj/item/gun/ballistic/automatic/pistol/ninemil
	gloves = null
	backpack_contents = list(
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/stack/medical/gauze=1, \
		/obj/item/storage/bag/money/small/ncrenlisted)

//NCR Administrator
/datum/job/ncr/f13ncradmin
	title = "NCR Administrator"
	department_head = list("NCR Captain")
	flag = F13NCRADMIN
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	description = "Будучи Администратором, вы осуществляете руководство над городком. Армия НКР – ваши верные защитники и помощники в становлении порядка. Вы должны следить за потребностями поселенцев, и являться связующим звеном между гражданскими и военными.  . "
	supervisors = "Амбассадор или Капитан"
	selection_color = "#fff5cc"

	exp_requirements = 110
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13ncradmin

/datum/outfit/job/ncr/f13ncradmin
	name = "NCR Administrator"
	jobtype = /datum/job/ncr/f13ncradmin
	id = 			/obj/item/card/id/dogtag/ncradmin
	uniform =  		/obj/item/clothing/under/suit_jacket/tan
	glasses =		/obj/item/clothing/glasses/sunglasses
	shoes = 		/obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(
		/obj/item/storage/secure/briefcase=1, \
		/obj/item/pen/fountain=1, \
		/obj/item/pen/fourcolor=1, \
		/obj/item/clipboard=1, \
		/obj/item/stamp=1, \
		/obj/item/stamp/denied=1)

//NCR Citizen
/datum/job/ncr/f13ncrcitizen
	title = "NCR Citizen"
	department_head = list("NCR Captain")
	flag = F13NCRCITIZEN
	faction = "NCR"
	total_positions = 8
	spawn_positions = 8
	access = list()
	description = "Как гражданин НКР, вы верите, что потенциал на западе иссяк и что граница имеет множество возможностей для вторжения и использования. Находясь в относительной безопасностью благодаря Республике, вы несете ответственность за то, чтобы быть частью городского сообщества и поддерживать порядок в поселении. Вы можете вести переговоры с администратором или другим руководством НКР, чтобы помочь им в достижении целей или преследовать свои собственные цели в качестве независимой единицы НКР..."
	supervisors = "Администратор НКР"
	selection_color = "#fff5cc"
	exp_requirements = 40
	exp_type = EXP_TYPE_WASTELAND

	access = list(ACCESS_NCROFFDUTY)
	minimal_access = list(ACCESS_NCROFFDUTY)

	outfit = /datum/outfit/job/ncr/f13ncrcitizen

	loadout_options = list(
	/datum/outfit/loadout/brahminbaron,
	/datum/outfit/loadout/sharecropper,
	/datum/outfit/loadout/mechanic,
	/datum/outfit/loadout/offduty
	)

/datum/outfit/job/ncr/f13ncrcitizen
	ears = /obj/item/radio/headset
	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/caravaneer
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	glasses = /obj/item/clothing/glasses/orange
	backpack_contents = list(
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/loadout/brahminbaron
	name = "Brahmin Baron"
	backpack_contents = list(
		/obj/item/clothing/under/f13/gentlesuit=1,
		/obj/item/clothing/suit/jacket/leather=1,
		/obj/item/clothing/head/collectable/tophat=1,
		/obj/item/clothing/shoes/f13/fancy=1,
		/obj/item/stack/f13Cash/ncr=1,
		/obj/item/clothing/glasses/monocle=1,
		/obj/item/staff/stick=1)

/datum/outfit/loadout/sharecropper
	name = "Sharecropper"
	backpack_contents = list(
		/obj/item/clothing/under/overalls=1,
		/obj/item/clothing/suit/f13/vest=1,
		/obj/item/clothing/head/f13/cowboy=1,
		/obj/item/reagent_containers/glass/bucket=1,
		/obj/item/cultivator=1,
		/obj/item/shovel/spade=1,
		/obj/item/reagent_containers/glass/bottle/nutrient/rh=2,
		/obj/item/hatchet=1
		)

/datum/outfit/loadout/mechanic
	name = "Mechanic"
	backpack_contents = list(
		/obj/item/clothing/under/f13/mechanic=1,
		/obj/item/clothing/suit/apron/overalls=1,
		/obj/item/clothing/head/hardhat/dblue=1,
		/obj/item/clothing/shoes/workboots=1,
		/obj/item/storage/belt/utility/full/engi=1,
		/obj/item/clothing/glasses/welding=1,
		/obj/item/book/granter/trait/techno
		)

/datum/outfit/loadout/offduty
	name = "Off Duty"
	backpack_contents = list(
		/obj/item/clothing/under/f13/cowboyt=1,
		/obj/item/clothing/suit/det_suit=1,
		/obj/item/clothing/shoes/f13/military/ncr=1,
		/obj/item/clothing/gloves/f13/ncr=1,
		/obj/item/kitchen/knife/combat=1
		)

/*
Veteran Ranger
*/

/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	department_head = list("NCR Captain")
	flag = F13VETRANGER
	faction = "NCR"
	total_positions = 1
	spawn_positions = 1
	description = "Вы напрямую подчиняетесь напрямую Капитану. Вы можете работать самостоятельно, или же в команде, для выполнения поставленных задач. Вы можете примкнуть к операциям солдат НКР, и принять на себя роль офицера, если остальные погибли, или не прибыли в регион вообще. Ваша основная цель – улучшить мнение о себе и Республике в регионе, выследить рейдеров и работорговцев, и совершить над ними правосудие в случае нарушения ими закона.."
	supervisors = "Капитан и выше"
	selection_color = "#ffeeaa"

	exp_requirements = 670
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13vetranger

	loadout_options = list(
	/datum/outfit/loadout/vrclassic, //AMR and Sequoia,
	/datum/outfit/loadout/vrlite, //Rangemaster and Sequoia,
	/datum/outfit/loadout/vrbrush, //Scoped Brushgun and Sequoia

	//whitelist
	/datum/outfit/loadout/vrelite
	)

/datum/job/ncr/f13vetranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")
	H.add_quirk("Lifegiver")
	H.add_quirk("Iron Fist")

/datum/outfit/job/ncr/f13vetranger/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/ncr/f13vetranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform =  		/obj/item/clothing/under/f13/vetranger
	belt =			/obj/item/storage/belt/military/assault/ncr
	gloves =		/obj/item/clothing/gloves/rifleman
	shoes =			/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/orange
	r_pocket = 		/obj/item/twohanded/binocs
	neck = 			/obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/sequoia=1, \
		/obj/item/ammo_box/c4570=3, \
		/obj/item/kitchen/knife/bowie=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)

/datum/outfit/loadout/vrclassic
	name = "Classic Veteran Ranger"
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	suit_store = /obj/item/gun/ballistic/shotgun/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/a50MG=3)

/datum/outfit/loadout/vrlite
	name = "Light Veteran Ranger"
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	suit_store = /obj/item/gun/ballistic/automatic/rangemaster
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m762/ext=2)

/datum/outfit/loadout/vrbrush
	name = "Brush Veteran Ranger"
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/hunting/brush/scoped
	backpack_contents = list(
		/obj/item/ammo_box/tube/c4570=3)


/datum/outfit/loadout/vrelite
	name = "Elite Veteran Ranger"
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/eliteriot
	suit = /obj/item/clothing/suit/armor/f13/rangercombat/eliteriot
	suit_store = /obj/item/gun/ballistic/shotgun/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/a50MG=3,
		)
	whitelist = list("hellpony", "fiaskin")

/*
Ranger -- Split into Patrol and Scout

/datum/job/ncr/f13ranger
	title = "NCR Ranger"
	flag = F13RANGER
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	description = "As a Ranger, you perform reconnaissance, seize or destroy assets, and capture or recover designated targets in service to the Republic. Your reason for being sent here is to find and exploit local assets within the Region in order to prepare the area for the Republic's eventual arrival."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"

	outfit = /datum/outfit/job/ncr/f13ranger

	loadout_options = list(
	/datum/outfit/loadout/prclassic, //Scoped Sniper rifle and .44,
	/datum/outfit/loadout/prlite, //Marksman carbine and .44,
	/datum/outfit/loadout/prtrail //Scoped Trail carbine and .44
	)

/datum/job/ncr/f13ranger/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")

/datum/outfit/job/ncr/f13ranger/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/ncr/f13ranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform =  		/obj/item/clothing/under/f13/ranger
	belt =			/obj/item/storage/belt/military/assault/ncr
	gloves =		/obj/item/clothing/gloves/patrol
	shoes =			/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29/alt,
		/obj/item/ammo_box/m44=2, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)
	r_pocket = /obj/item/twohanded/binocs

/datum/outfit/loadout/prclassic
	name = "Classic Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr
	head = /obj/item/clothing/head/f13/ranger
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308=3)

/datum/outfit/loadout/prlite
	name = "Light Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr
	head = /obj/item/clothing/head/f13/ranger
	suit_store = /obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3)

/datum/outfit/loadout/prtrail
	name = "Trail Ranger"
	uniform = /obj/item/clothing/under/f13/trailranger
	suit = /obj/item/clothing/suit/armor/f13/trailranger
	head = /obj/item/clothing/head/f13/trailranger
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/hunting/trail/scoped
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44=2,
		/obj/item/gun/ballistic/revolver/m29=1,
		/obj/item/ammo_box/m44=2
		)
*/

//Patrol Ranger
/datum/job/ncr/f13rangerpatrol
	title = "NCR Patrol Ranger"
	department_head = list("NCR Captain")
	flag = F13RANGERPATROL
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	description = "Как Патрульный Рейнджер, вы патрулируете пустошь, помогаете нуждающимся или находящимся в беде, а также захватываете, восстанавливаете или нейтрализуете цели во службу Республики. Вы были отправлены сюда для улучшения общественного мнения о Республике, служа обществу, неся правосудие и подавляя работорговцев с рейдерами в регионе. Так как в рядах рейнджерах  нет определенных званий, что подразумевает под собой взаимоуважение в ваших рядах. Но обычно, командующим в среде Рейнджеров являются Ветераны Рейнджеры – в силу своего опыта и знаний, что могут дать преимущество вашим силам.."
	supervisors = "Ветеран Рейнджер"
	selection_color = "#fff5cc"

	exp_requirements = 560
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13rangerpatrol

/datum/job/ncr/f13rangerpatrol/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")

/datum/outfit/job/ncr/f13ranger/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13rangerpatrol
	name = "NCR Patrol Ranger"
	jobtype = /datum/job/ncr/f13rangerpatrol
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform =  		/obj/item/clothing/under/f13/patrolranger
	suit =			/obj/item/clothing/suit/armor/f13/combat/ncr
	head =			/obj/item/clothing/head/f13/ranger
	belt =			/obj/item/storage/belt/military/assault/ncr
	gloves =		/obj/item/clothing/gloves/patrol
	shoes =			/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/orange
	suit_store =	/obj/item/gun/ballistic/automatic/marksman
	r_pocket = 		/obj/item/twohanded/binocs
	neck = 			/obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29,
		/obj/item/ammo_box/m44=2, \
		/obj/item/ammo_box/magazine/m556/rifle=2, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)


//Scout Ranger
/datum/job/ncr/f13rangerscout
	title = "NCR Scout Ranger"
	department_head = list("NCR Captain")
	flag = F13RANGERSCOUT
	faction = "NCR"
	total_positions = 2
	spawn_positions = 2
	description = "Как Скаут Рейнджер, вы выполняете разведку, а также участвуете в специальных операция Республики. Вы были отправлены сюда для  нейтрализации угроз для Республики, а так же помощи Патрульным Рейнджерам в поиске Работорговцев и Рейдеров, для осуществления над ними правосудия. Так как в рядах рейнджерах  нет определенных званий, что подразумевает под собой взаимоуважение в ваших рядах. Но обычно, командующим в среде Рейнджеров являются Ветераны Рейнджеры – в силу своего опыта и знаний, что могут дать преимущество вашим силам.    ."
	supervisors = "Ветеран Рейнджер"
	selection_color = "#fff5cc"

	exp_requirements = 450
	exp_type = EXP_TYPE_NCR

	outfit = /datum/outfit/job/ncr/f13rangerscout

	loadout_options = list(
	/datum/outfit/loadout/rangerrecon, //Scoped .308 Sniper rifle and .44,
	/datum/outfit/loadout/rangertrail //M1 Garand and .44,
	)

/datum/job/ncr/f13rangerscout/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")
	H.add_quirk("Light Step")

/datum/outfit/job/ncr/f13ranger/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/datum/outfit/job/ncr/f13rangerscout
	name = "NCR Scout Ranger"
	jobtype = /datum/job/ncr/f13rangerscout
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform = 		/obj/item/clothing/under/f13/trailranger
	gloves =		/obj/item/clothing/gloves/patrol
	shoes =			/obj/item/clothing/shoes/laced
	glasses = 		/obj/item/clothing/glasses/sunglasses
	r_pocket = 		/obj/item/twohanded/binocs
	neck = 			/obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29,
		/obj/item/ammo_box/m44=2, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/bowie=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/storage/bag/money/small/ncrofficers)

/datum/outfit/loadout/rangerrecon
	name = "Recon Ranger"
	suit =	/obj/item/clothing/suit/toggle/armor/f13/rangerrecon
	head =	/obj/item/clothing/head/beret/ncr_recon_ranger
	belt =	/obj/item/storage/belt/military/reconbandolier
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308=4)

/datum/outfit/loadout/rangertrail
	name = "Trail Ranger"
	suit =	/obj/item/clothing/suit/armor/f13/trailranger
	head =	/obj/item/clothing/head/f13/trailranger
	belt =	/obj/item/storage/belt/military/assault/ncr
	suit_store = /obj/item/gun/ballistic/automatic/m1garand
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308=4)

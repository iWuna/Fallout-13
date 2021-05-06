/obj/item/mark
	name = "postal mark"
	desc = "Важная бумажка для курьера, если вы не курьер, отдайте её ему."
	icon = 'icons/obj/quest_items.dmi'
	icon_state = "marka1"

/obj/item/mark/New()
	..()
	icon_state = "marka[rand(1,8)]"

/obj/item/parcel
	name = "parcel"
	desc = "Посылка явно содержащая в себе что-то ценное, а может и не очень."
	icon = 'icons/obj/quest_items.dmi'
	icon_state = "bigbox"
	item_state = "bigbox"
	w_class = WEIGHT_CLASS_SMALL

	var/datum/mind/for_who = null

	var/mob/living/carbon/human/faction = null

	var/fuckup_chance = 60
	var/prepared = FALSE

	var/list/possible_item = list(
	/obj/item/crafting/duct_tape,
	/obj/item/gun/ballistic/automatic/toy/pistol/unrestricted,
	/obj/item/gun/ballistic/shotgun/toy/unrestricted,
	/obj/item/flashlight,
	/obj/item/wirecutters,
	/obj/item/reagent_containers/food/drinks/bottle/vodka,
	/obj/item/reagent_containers/food/drinks/bottle/sunset,
	/obj/item/reagent_containers/food/drinks/bottle/f13nukacola,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey,
	/obj/item/reagent_containers/food/drinks/bottle/wine,
	/obj/item/reagent_containers/food/snacks/f13/crisps,
	/obj/item/reagent_containers/food/snacks/f13/steak,
	/obj/item/reagent_containers/food/snacks/f13/porknbeans,
	/obj/item/reagent_containers/food/snacks/f13/borscht,
	/obj/item/reagent_containers/food/snacks/donut,
	/obj/item/storage/fancy/cigarettes/cigpack_bigboss,
	/obj/item/seeds/cannabis,
	/obj/item/seeds/cannabis/rainbow,
	/obj/item/seeds/random,
	/obj/item/nuke_core,
	/obj/item/camera/spooky,
	/obj/item/condom,
	/obj/item/pda/pimp_boy_3000,
	/obj/item/soap/deluxe,
	/obj/item/stealthboy/makeshift,
	/obj/item/stealthboy,
	/obj/item/stock_parts/cell/super,
	/obj/item/stock_parts/cell/ammo/alien,
	/obj/item/stock_parts/cell/ammo/ec,
	/obj/item/stock_parts/cell/ammo/ecp,
	/obj/item/stock_parts/cell/ammo/mfc,
	/obj/item/stock_parts/cell/ammo/ultracite,
	/obj/item/taperecorder/empty,
	/obj/item/trash/f13/electronic/toaster,
	/obj/item/survivalcapsule/merchant,
	/obj/item/pizzabox/vegetable,
	/obj/item/pizzabox/pineapple,
	/obj/item/pizzabox/margherita,
	/obj/item/lipstick/random,
	/obj/item/lighter,
	/obj/item/katana/scrap,
	/obj/item/instrument/harmonica,
	/obj/item/healthanalyzer/advanced,
	/obj/item/encryptionkey/headset_enclave,
	/obj/item/disk/tech_disk/followers,
	/obj/item/ammo_box/needle,
	/obj/item/blueprint/weapon/AER9/limited,
	/obj/item/blueprint/weapon/R82/limited,
	/obj/item/blueprint/weapon/plasmarifle/limited,
	/obj/item/blueprint/misc/stim,
	/obj/item/blueprint/armor/combat,
	/obj/item/blueprint/weapon/trail_carbine,
	/obj/item/book/granter/trait/gunsmith_one,
	/obj/item/book/granter/trait/gunsmith_two,
	/obj/item/book/granter/trait/gunsmith_three,
	/obj/item/book/granter/trait/gunsmith_four,
	/obj/item/book/granter/trait/field_surgery,
	/obj/item/book/granter/trait/trekking,
	/obj/item/gun/ballistic/automatic/pistol/n99/executive,
	/obj/item/gun/ballistic/automatic/pistol/n99,
	/obj/item/ammo_box/magazine/m10mm_adv,
	/obj/item/gun/ballistic/automatic/pistol/m1911,
	/obj/item/gun/ballistic/automatic/m1garand/oldglory,
	/obj/item/gun/ballistic/automatic/smg10mm,
	/obj/item/ammo_box/magazine/m10mm_auto,
	/obj/item/gun/ballistic/automatic/type93,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/gun/energy/laser/wattz,
	/obj/item/gun/energy/laser/plasma/alien,
	/obj/item/gun/energy/laser/plasma/pistol,
	)

	var/list/possible_item_screwup = list(
	/obj/item/crafting/duct_tape,
	/obj/item/paper,
	/mob/living/simple_animal/hostile/wolf,
	/mob/living/simple_animal/hostile/deathclaw/power_armor/maid,
	/mob/living/simple_animal/hostile/cazador/young,
	/mob/living/simple_animal/chick,
	/mob/living/simple_animal/hostile/gecko,
	/obj/item/condom/filled,
	/obj/item/newspaper,
	/obj/item/paperplane,
	/obj/item/soap/homemade,
	/obj/item/stock_parts/cell/crap,
	/obj/item/tape/random,
	/obj/item/trash/f13/tin,
	/obj/item/trash/f13/rotten,
	/obj/item/shovel/tribal_spade,
	/obj/item/shard,
	/obj/item/seeds/grass,
	/obj/item/seeds/nettle,
	/obj/item/organ/brain,
	/obj/item/lipstick/random,
	/obj/item/folder/blue,
	/obj/item/ammo_box/bbs,
	/obj/item/assembly/mousetrap/armed,
	/obj/item/gun/ballistic/automatic/tribalbow,
	/obj/item/ammo_box/magazine/internal/tribalbow,
	/obj/item/gun/energy/laser/practice/sc_laser,
	/obj/item/gun/energy/laser/plasma/pistol
	)

/obj/item/parcel/New()
	..()
	icon_state = pick("bigbox", "longbox", "smallbox")

	for(var/mob/living/player in GLOB.player_list)
		if(player.stat != DEAD && !isanimal(player) && ishuman(player))
			for_who = player

	message_admins("посылка для [for_who] создана.")

/obj/item/parcel/attackby(obj/item/I, mob/user, params)
	..()

	if(!prepared)
		if(istype(I, /obj/item/crafting/duct_tape))
			flick("[icon_state]_prepare", src)
			if(do_after(user, 5, target = src))
				if(icon_state == "bigbox")
					icon_state = "bigbox1"
					item_state = "bigbox"
				if(icon_state == "longbox")
					icon_state = "longbox1"
					item_state = "longbox"
				if(icon_state == "smallbox")
					icon_state = "smallbox1"
					item_state = "smallbox"
				desc = "Посылка явно содержащая в себе что-то ценное, предназначена для [for_who.name]."
				qdel(I)
				prepared = TRUE
				fuckup_chance = rand(50,70)
	else
		if(istype(I, /obj/item/kitchen/knife) | istype(I, /obj/item/claymore/machete) | istype(I, /obj/item/switchblade))
			if (!isturf(src.loc) || !(locate(/obj/structure/table) in src.loc) && !(locate(/obj/structure/table/optable) in src.loc))
				to_chat(user, "<span class='warning'>Вы должны делать это на столе.</span>")
				return FALSE
			if(user == for_who)
				if(do_after(user, 30, target = src))
					var/obj/item/booty = pick(possible_item)
					booty = new booty(loc)
					new /obj/item/mark(loc)
					to_chat(user, "<span class='notice'>Вы нашли [booty] внутри посылки.</span>")
					qdel(src)
			else
				if(do_after(user, 50, target = src))
					if(prob(fuckup_chance))
						to_chat(user, "<span class='notice'>Вы умудрились сломать содержимое посылки...</span>")
						new /obj/effect/gibspawner/robot(src.loc)
						qdel(src)
					else
						var/obj/item/booty = pick(possible_item_screwup)
						booty = new booty(loc)
						to_chat(user, "<span class='notice'>Вы нашли [booty] внутри [src].</span>")
						qdel(src)
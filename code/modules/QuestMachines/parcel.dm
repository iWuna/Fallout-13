/obj/item/mark
	name = "postal mark"
	desc = "An important piece of paper for the courier, if you are not a courier, give it to him."
	icon = 'icons/obj/quest_items.dmi'
	icon_state = "marka1"

/obj/item/mark/New()
	..()
	icon_state = "marka[rand(1,8)]"

/obj/item/parcel
	name = "parcel"
	desc = "The package clearly contains something valuable, and maybe not so much."
	icon = 'icons/obj/quest_items.dmi'
	icon_state = "bigbox"
	item_state = "bigbox"
	w_class = WEIGHT_CLASS_SMALL

	var/datum/mind/recipient = null

	var/mob/living/carbon/human/faction = null

	var/screwup_chance = 60
	var/prepared = FALSE

	var/list/success_list = list(
	/obj/item/crafting/duct_tape,
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
	/obj/item/reagent_containers/hypospray/medipen/stimpak/super,
	/obj/item/reagent_containers/pill/patch/voodoo,
	/obj/item/reagent_containers/pill/patch/medcase,
	/obj/item/reagent_containers/pill/patch/steady,
	/obj/item/reagent_containers/pill/patch/coyotechew,
	/obj/item/storage/pill_bottle/chem_tin/cateye,
	/obj/item/storage/pill_bottle/chem_tin/buffout,
	/obj/item/storage/pill_bottle/chem_tin/mentats,
	/obj/item/storage/fancy/cigarettes/cigpack_bigboss,
	/obj/item/seeds/cannabis,
	/obj/item/seeds/cannabis/rainbow,
	/obj/item/seeds/random,
	/obj/item/seeds/gatfruit,
	/obj/item/nuke_core,
	/obj/item/camera/spooky,
	/obj/item/pda/pimp_boy_3000,
	/obj/item/soap/deluxe,
	/obj/item/stealthboy/mk2,
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
	/obj/item/book/granter/trait/gunsmith,
	/obj/item/book/granter/trait/gunsmith_one,
	/obj/item/book/granter/trait/gunsmith_two,
	/obj/item/book/granter/trait/gunsmith_three,
	/obj/item/book/granter/trait/gunsmith_four,
	/obj/item/book/granter/trait/field_surgery,
	/obj/item/book/granter/trait/trekking,
	/obj/item/book/granter/trait/pa_wear,
	/obj/item/book/granter/trait/brain_surgery,
	/obj/item/book/granter/trait/techno,
	/obj/item/book/granter/trait/chemistry,
	/obj/item/ammo_box/magazine/m10mm_adv,
	/obj/item/ammo_box/magazine/m10mm_auto,
	/obj/item/gun/ballistic/automatic/type93,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/gun/energy/laser/wattz,
	/obj/item/gun/energy/laser/plasma/alien,
	/obj/item/gun/energy/laser/plasma/pistol,
	/obj/item/clothing/suit/armor/f13/combat/stealth,
	/obj/item/clothing/suit/armor/f13/gunnerplates,
	/obj/item/clothing/suit/armor/f13/ghostechoe,
	/obj/item/clothing/suit/armor/f13/atomzealot,
	/obj/item/clothing/suit/armor/heavy,
	/obj/item/gun/ballistic/revolver/m29/alt,
	/obj/item/gun/ballistic/revolver/m29/coltwalker,
	/obj/item/gun/ballistic/revolver/sequoia/scoped,
	/obj/item/gun/ballistic/revolver/thatgun,
	/obj/item/gun/ballistic/revolver/zhurong,
	/obj/item/gun/ballistic/revolver/widowmaker,
	/obj/item/gun/ballistic/shotgun/bb,
	/obj/item/gun/ballistic/shotgun/lasmusket,
	/obj/item/gun/ballistic/shotgun/ww2rifle,
	/obj/item/gun/ballistic/shotgun/toy/unrestricted,
	/obj/item/gun/ballistic/automatic/tribalbow,
	/obj/item/gun/ballistic/automatic/toy/pistol/unrestricted,
	/obj/item/gun/ballistic/automatic/m1garand/oldglory,
	/obj/item/gun/ballistic/automatic/smg10mm,
	/obj/item/gun/ballistic/automatic/pistol/n99/executive,
	/obj/item/gun/ballistic/automatic/pistol/n99,
	/obj/item/gun/ballistic/automatic/pistol/m1911,
	/obj/item/kitchen/knife/cosmicheated,
	/obj/item/kitchen/knife/combat/bayonet,
	/obj/item/claymore/machete/pipe/pan,
	/obj/item/twohanded/sledgehammer/warmace,
	/obj/item/clothing/gloves/krav_maga/sec,
	/obj/item/clothing/gloves/f13/doom,
	/obj/item/shishkebabpack,
	/obj/item/melee/skateboard,
	/obj/item/trash/f13/electronic/toaster/atomics,
	/obj/item/crafting/campfirekit
	)

	var/list/failure_list = list(
	/obj/item/crafting/duct_tape,
	/obj/item/paper,
	/mob/living/simple_animal/hostile/wolf,
	/mob/living/simple_animal/hostile/deathclaw/power_armor/maid,
	/mob/living/simple_animal/hostile/cazador/young,
	/mob/living/simple_animal/chick,
	/mob/living/simple_animal/hostile/gecko,
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
	/obj/item/gun/energy/laser/plasma/pistol,
	/obj/item/crafting/campfirekit,
	/obj/item/stack/crafting/metalparts/five,
	/obj/item/stack/crafting/metalparts,
	/obj/item/stack/crafting/metalparts/three,
	/obj/item/stack/crafting/goodparts/three,
	/obj/item/stack/crafting/goodparts/five,
	/obj/item/stack/crafting/goodparts,
	/obj/item/stack/crafting/electronicparts,
	/obj/item/stack/crafting/electronicparts/five,
	/obj/item/stack/crafting/electronicparts/three,
	/obj/item/crafting/lunchbox,
	/obj/item/switchblade/penknife,
	/obj/item/kitchen/knife/cosmicdirty
	)

/obj/item/parcel/New()
	..()
	icon_state = pick("bigbox", "longbox", "smallbox")

	for(var/mob/living/player in shuffle(GLOB.player_list))
		if(player.stat != DEAD && !isanimal(player) && ishuman(player) && player.mind)
			recipient = player.mind
			break

	message_admins("parcel for [recipient] generated.")

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
				desc = "A package clearly containing something valuable is intended for [recipient.name]."
				qdel(I)
				prepared = TRUE
				screwup_chance = rand(50,70)
	else
		if(istype(I, /obj/item/kitchen/knife) | istype(I, /obj/item/claymore/machete) | istype(I, /obj/item/switchblade))
			if (!isturf(src.loc) || !(locate(/obj/structure/table) in src.loc) && !(locate(/obj/structure/table/optable) in src.loc))
				to_chat(user, "<span class='warning'>You need table to do this.</span>")
				return FALSE
			if(user.mind == recipient)
				if(do_after(user, 30, target = src))
					var/obj/item/booty = pick(success_list)
					booty = new booty(loc)
					new /obj/item/mark(loc)
					to_chat(user, "<span class='notice'>You found [booty] inside of parcel.</span>")
					qdel(src)
			else
				if(do_after(user, 50, target = src))
					if(prob(screwup_chance))
						to_chat(user, "<span class='notice'>You managed to break the contents of the parcel...</span>")
						new /obj/effect/gibspawner/robot(src.loc)
						qdel(src)
					else
						var/obj/item/booty = pick(failure_list)
						booty = new booty(loc)
						to_chat(user, "<span class='notice'>You found [booty] inside of parcel.</span>")
						qdel(src)
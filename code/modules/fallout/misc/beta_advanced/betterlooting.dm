/mob/living/simple_animal
	var/looted = FALSE
	var/looting = FALSE

/mob/living/simple_animal/proc/getLootObject(var/modifer)
/*
	var/list/trash = list (
		/obj/item/trash/f13/bubblegum = 1,
		/obj/item/trash/f13/bubblegum_large = 1,
		/obj/item/trash/f13/cram = 1,
		/obj/item/trash/f13/cram_large = 1,
		/obj/item/trash/f13/yumyum = 1,
		/obj/item/trash/f13/fancylads = 1,
		/obj/item/trash/f13/sugarbombs = 1,
		/obj/item/trash/f13/crisps = 1,
		/obj/item/trash/f13/steak = 1,
		/obj/item/trash/f13/specialapples = 1,
		/obj/item/trash/f13/dandyapples = 1,
		/obj/item/trash/f13/blamco_large = 1,
		/obj/item/trash/f13/blamco = 1,
		/obj/item/trash/f13/mechanist = 1,
		/obj/item/trash/f13/instamash = 1,
		/obj/item/trash/f13/porknbeans = 1,
		/obj/item/trash/f13/borscht = 1,
		/obj/item/trash/f13/dog = 1,
		/obj/item/trash/f13/mre = 1,
		/obj/item/trash/f13/rotten = 1
	)
*/

	var/list/common = list (/obj/item/stack/f13Cash/random/ncr/low = 37
	)

	var/list/uncommon = list (/obj/item/stack/f13Cash/random/bottle_cap/low = 20,
	/obj/item/stack/f13Cash/random/ncr/low = 35
	)

	var/list/unusual = list (/obj/item/reagent_containers/food/snacks/f13/mre = 40,
	/obj/item/reagent_containers/food/snacks/f13/porknbeans = 40,
	/obj/item/reagent_containers/food/snacks/f13/dandyapples = 35
	)

	var/list/rare = list (/obj/item/reagent_containers/hypospray/medipen/stimpak = 5,
	/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 5,
	/obj/item/stack/f13Cash/random/bottle_cap/med = 25
	)

	var/rarity = rand(1, 100)
	var/list/rarity_range = list (50 * modifer, 60 * modifer, 75 * modifer, 90 * modifer)

	var/list/loot = null

	if(rarity > rarity_range[1])
		loot = common

	if(rarity > rarity_range[2])
		loot = uncommon

	if(rarity > rarity_range[3])
		loot = unusual

	if(rarity > rarity_range[4])
		loot = rare

	if(loot != null)
		var/obj/item = pickweight(loot)
		return item
	else
		return null

/mob/living/simple_animal/proc/loot(var/mob/living/carbon/player)
	if(looted)
		return

	if(looting)
		return

	looting = TRUE
	if(!do_mob(player, src, 20))
		looting = FALSE
		return

	looting = FALSE
	looted = TRUE

	player.visible_message("[player] searching in [src] body.")

	// 0 LUCK = 0.3. 10 LUCK = 1.2
	// var/modifer = 0.3 + (player.special_l * 0.05) + (player.special_l < 3 * 0.15)

	// DEATHCLAW = 1.3 MOLERAT = 0.67
	// modifer *= 0.6 + (XP * 0.04)

	var/itemType = getLootObject(1 / 0.3)
	if(itemType == null)
		player.visible_message("<span class='notice'>Empty.</span>")
		return

	var/itemTypeString = "[itemType]"
	var/obj/item = new itemTypeString()

	player.dropItemToGround(item)
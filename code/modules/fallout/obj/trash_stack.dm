/obj/item/storage/trash_stack
	name = "pile of garbage"
	desc = "a pile of garbage. Smells as good, as it looks, though it may contain something useful. Or may not"
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "Junk_1"
	anchored = TRUE
	density = FALSE
	var/list/loot_players = list()

/obj/item/storage/trash_stack/Initialize()
	. = ..()
	icon_state = "Junk_[rand(1,12)]"
	GLOB.trash_piles += src

/obj/item/storage/trash_stack/Destroy()
	GLOB.trash_piles -= src
	. = ..()

/obj/item/storage/trash_stack/attack_hand(mob/user)
	var/turf/ST = get_turf(src)
	if(user?.a_intent != INTENT_HARM)
		if(user in loot_players)
			to_chat(user, "<span class='notice'>You already have looted [src].</span>")
			return
		playsound(user, get_sfx("rustle"), 50)
		if(do_after(user, scale_agility(40, user), target = loc))
			if(user in loot_players)
				to_chat(user, "<span class='notice'>You already have looted [src].</span>")
				return
			for(var/i=0, i < rand(1, 1 + user.special.trash_items_mod), i++)
				var/itemtype = pickweight(GLOB.trash_list)
				if(itemtype)
					to_chat(user, "<span class='notice'>You scavenge through the filthy [src].</span>")
					var/obj/item/item = new itemtype(ST)
					if(istype(item))
						item.from_trash = TRUE
			loot_players += user
	else
		return ..()


/obj/item/storage/trash_stack/attackby(obj/item/I, mob/user)
	if(user?.a_intent != INTENT_HARM && istype(I, /obj/item/shovel))
		var/obj/item/shovel/S = I
		var/turf/ST = get_turf(src)
		if(user in loot_players)
			to_chat(user, "<span class='notice'>You already have looted [src].</span>")
			return
		playsound(user, 'sound/effects/shovel_dig.ogg', 50)
		if(do_after(user, scale_agility(20, user), target = loc))
			if(user in loot_players)
				to_chat(user, "<span class='notice'>You already have looted [src].</span>")
				return
			for(var/i=0, i < rand(3, 3 + user.special.trash_items_mod), i++)
				var/itemtype = pickweight(GLOB.trash_list)
				if(itemtype)
					to_chat(user, "<span class='notice'>You scavenge through the filthy [src] with the [S].</span>")
					var/obj/item/item = new itemtype(ST)
					if(istype(item))
						item.from_trash = TRUE
			loot_players += user
	else
		return ..()

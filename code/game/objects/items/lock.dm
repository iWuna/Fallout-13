GLOBAL_LIST_EMPTY(global_locks)
/obj/item/lock_construct
	name = "\improper lock"
	icon = 'icons/fallout/objects/keys.dmi'
	icon_state = "closed_lock"
	w_class = WEIGHT_CLASS_SMALL
	var/lock_data
	var/static/lock_uid = 1
	var/locked = FALSE
	var/prying = FALSE //if somebody is trying to pry us off

/obj/item/lock_construct/Initialize() // Same system machines use for UID. Could probably add a global UID for everything if you wanted and use it for shenanigans, or simpler loading.
	..()
	lock_data = lock_uid++
	name = "lock #[lock_data]"
	desc = "A heavy-duty lock for doors. It has [lock_data] engraved on it."
	GLOB.global_locks += src

/obj/item/lock_construct/Destroy()
	..()
	GLOB.global_locks -= src

/obj/item/lock_construct/attackby(obj/item/I, mob/user) // Blatantly borrowed from Baystation coders and modified for simplicity. Thanks for pointing me in that direction, Rhicora.
	if(iskey(I))
		var/obj/item/key/K = I
		if(!K.lock_data)
			to_chat(user, "<span class='notice'>You fashion \the [I] to unlock \the [src]</span>")
			K.attach_id(lock_data)
			K.desc = "A simple key for locks. It has [K.lock_data] engraved on it."
		else
			to_chat(user, "<span class='warning'>\The [I] already unlocks something...</span>")
		return
	if(islock(I))
		var/obj/item/lock_construct/L = I
		L.lock_data = src.lock_data
		to_chat(user, "<span class='notice'>You copy the lock from \the [src] to \the [L], making them identical.</span>")
		L.name = "lock #[lock_data]"
		L.desc = "A heavy-duty lock for doors. It has [L.lock_data] engraved on it."
		return
	..()

/obj/item/lock_construct/proc/check_key(obj/item/key/K, mob/user = null)
	if(K.lock_data == src.lock_data) //if the key matches us
		if(locked)
			user.visible_message("<span class='warning'>[user] unlocks \the [src].</span>")
			locked = FALSE
		else
			user.visible_message("<span class='warning'>[user] locks \the [src].</span>")
			locked = TRUE
	else
		to_chat(user, "<span class='warning'>This is the wrong key!</span>")

/obj/item/lock_construct/proc/check_chain(obj/item/storage/keys_chain/KC, mob/user = null)
	for(var/obj/item/key/K in KC.contents)
		if(K.lock_data == src.lock_data) //if the key matches us
			if(locked)
				user.visible_message("<span class='warning'>[user] unlocks \the [src].</span>")
				locked = FALSE
			else
				user.visible_message("<span class='warning'>[user] locks \the [src].</span>")
				locked = TRUE
			return
	to_chat(user, "<span class='warning'>Keys do not match!</span>")

/obj/item/lock_construct/proc/check_locked()
	return locked

/obj/item/lock_construct/proc/pry_off(mob/living/user, atom/A)
	if(!prying)
		user.visible_message("<span class='notice'>[user] starts prying [src] off [A].</span>", \
							 "<span class='notice'>You start prying [src] off [A].</span>")
		var/time_to_open = 50
		if(locked)
			time_to_open = 500
		playsound(src, 'sound/machines/airlock_alien_prying.ogg',100,1) //is it aliens or just the CE being a dick?
		prying = TRUE
		var/result = do_after(user, time_to_open, target = A)
		prying = FALSE
		if(result)
			user.visible_message("<span class='notice'>[src] breaks off [A] and falls to pieces.</span>")
			return TRUE
	return FALSE


/obj/item/storage/keys_chain
	name = "key chain"
	desc = "You can store keys here!"
	icon = 'icons/fallout/objects/keys.dmi'
	icon_state = "keychain_0"
	slot_flags = ITEM_SLOT_ID
	w_class = WEIGHT_CLASS_TINY

/obj/item/storage/keys_chain/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.can_hold = typecacheof(/obj/item/key)
	STR.rustle_sound = FALSE
	STR.interact_sound = "sound/items/keychain.ogg"

/obj/item/storage/keys_chain/update_icon()
	if(contents.len > 4)
		icon_state = "keychain_4"
	else
		icon_state = "keychain_[contents.len]"
	..()

/obj/item/weapon/storage/keys_set/proc/get_key_with_id(id)
	for(var/obj/item/door_key/K in contents)
		if(K.id == id)
			return K
	return null


/obj/item/key
	name = "\improper key"
	icon = 'icons/fallout/objects/keys.dmi'
	icon_state = "key"
	slot_flags = SLOT_BELT|SLOT_EARS
	var/static/list/used_ids = list()
	w_class = WEIGHT_CLASS_TINY
	var/lock_data = ""

/obj/item/key/New()
	..()
	if(lock_data)
		attach_id(lock_data)

/obj/item/key/proc/attach_id(lock_data)
	src.lock_data = lock_data
	icon_state = "key_offset"
	name = "key #[lock_data]"
	if(!overlays_cache || !overlays_cache["usable_key"])
		var/icon/O = icon('icons/fallout/objects/keys.dmi', "key_overlay")
		if(!used_ids[num2text(lock_data)])
			var/color = rgb(rand(50,255), rand(50,255), rand(50,255))
			O.ColorTone(color)
			used_ids[num2text(lock_data)] = color
		else
			O.ColorTone(used_ids[num2text(lock_data)])
		add_overlay(O)

/obj/item/key/Initialize()
	. = ..()
	desc = "A simple key for locks. It has [src.lock_data ? src.lock_data : "nothing"] engraved on it."

/obj/item/key/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/rods))
		var/obj/item/stack/rods/M = I
		to_chat(user, "<span class='notice'>You begin to shape a rod into [src]...</span>")
		if(do_after(user, 35, target = src))
			if(M.get_amount() < 1 || !M)
				return
			var/obj/item/key/S = new /obj/item/key
			M.use(1)
			user.put_in_hands(S)
			to_chat(user, "<span class='notice'>You make a [S] identical to the old [src].</span>")
			S.attach_id(lock_data)
	else
		return ..()
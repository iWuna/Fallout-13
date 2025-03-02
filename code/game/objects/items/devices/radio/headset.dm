/obj/item/radio/headset
	name = "radio headset"
	desc = "An updated, modular intercom that fits over the head. Takes encryption keys."
	icon_state = "headset"
	item_state = "headset"
	materials = list(MAT_METAL=75)
	subspace_transmission = TRUE
	canhear_range = 0 // can't hear headsets from very far away

	slot_flags = ITEM_SLOT_EARS
	var/obj/item/encryptionkey/keyslot2 = null
	dog_fashion = null
	var/radiosound = 'sound/radio/headset/common.ogg'

/obj/item/radio/headset/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins putting \the [src]'s antenna up [user.p_their()] nose! It looks like [user.p_theyre()] trying to give [user.p_them()]self cancer!</span>")
	return TOXLOSS

/obj/item/radio/headset/examine(mob/user)
	..()
	to_chat(user, "<span class='notice'>To speak into the radio, put a symbol in front of the input text <b>;</b></span>")
	if (command)
		to_chat(user, "<span class='notice'>Alt-click enables loud mode.</span>")

/obj/item/radio/headset/Initialize()
	. = ..()
	recalculateChannels()

/obj/item/radio/headset/Destroy()
	QDEL_NULL(keyslot2)
	return ..()

/obj/item/radio/headset/talk_into(mob/living/M, message, channel, list/spans,datum/language/language)
	if (!listening)
		return ITALICS | REDUCE_RANGE
	if(radiosound)
		playsound(M, radiosound, rand(20, 30), 0, 0, SOUND_FALLOFF_EXPONENT)
	. = ..()

/obj/item/radio/headset/can_receive(freq, level, AIuser)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.ears == src)
			return ..(freq, level)
	else if(AIuser)
		return ..(freq, level)
	return FALSE

/obj/item/radio/headset/attackby(obj/item/W, mob/user, params)
	if (user.a_intent == INTENT_HARM)
		visible_message("<span class='warning'>[user] attempts to destroy the [src]</span>")
		if (do_after(user,50, target = src))
			new /obj/item/stack/crafting/electronicparts (get_turf(user))
			qdel(src)

/obj/item/radio/headset/syndicate //disguised to look like a normal headset for stealth ops

/obj/item/radio/headset/syndicate/alt //undisguised bowman with flash protection
	name = "syndicate headset"
	desc = "A syndicate headset that can be used to hear all radio frequencies. Protects ears from flashbangs. \nTo access the syndicate channel, use ; before speaking."
	icon_state = "syndie_headset"
	item_state = "syndie_headset"

/obj/item/radio/headset/syndicate/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/syndicate/alt/leader
	name = "team leader headset"
	command = TRUE

/obj/item/radio/headset/syndicate/Initialize()
	. = ..()
	make_syndie()

/obj/item/radio/headset/binary
/obj/item/radio/headset/binary/Initialize()
	. = ..()
	qdel(keyslot)
	keyslot = new /obj/item/encryptionkey/binary
	recalculateChannels()

/obj/item/radio/headset/headset_sec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nTo access the security channel, use :s."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_hos

/obj/item/radio/headset/headset_sec/alt
	name = "security bowman headset"
	desc = "This is used by your elite security force. Protects ears from flashbangs.\nTo access the security channel, use :s. vault channel :v"
	icon_state = "sec_headset_alt"
	item_state = "sec_headset_alt"

/obj/item/radio/headset/headset_sec/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_eng
	name = "engineering radio headset"
	desc = "When the engineers wish to chat like girls.\nTo access the engineering channel, use :e."
	icon_state = "eng_headset"
	keyslot = new /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_rob
	name = "robotics radio headset"
	desc = "Made specifically for the roboticists, who cannot decide between departments.\nTo access the engineering channel, use :e. For research, use :n."
	icon_state = "rob_headset"
	keyslot = new /obj/item/encryptionkey/headset_rob

/obj/item/radio/headset/headset_med
	name = "medical radio headset"
	desc = "A headset for the trained staff of the medbay.\nTo access the medical channel, use :m."
	icon_state = "med_headset"
	keyslot = new /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sci
	name = "science radio headset"
	desc = "A sciency headset. Like usual.\nTo access the science channel, use :n."
	icon_state = "sci_headset"
	keyslot = new /obj/item/encryptionkey/headset_sci

/obj/item/radio/headset/headset_medsci
	name = "medical research radio headset"
	desc = "A headset that is a result of the mating between medical and science.\nTo access the medical channel, use :m. For science, use :n."
	icon_state = "medsci_headset"
	keyslot = new /obj/item/encryptionkey/headset_medsci

/obj/item/radio/headset/headset_com
	name = "command radio headset"
	desc = "A headset with a commanding channel.\nTo access the command channel, use :c."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/heads
	command = TRUE

/obj/item/radio/headset/heads/captain
	name = "\proper the captain's headset"
	desc = "The headset of the king.\nChannels are as follows: :c - command, :s - security, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/captain/alt
	name = "\proper the captain's bowman headset"
	desc = "The headset of the boss. Protects ears from flashbangs.\nChannels are as follows: :c - command, :s - security, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/heads/captain/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/heads/rd
	name = "\proper the research director's headset"
	desc = "Headset of the fellow who keeps society marching towards technological singularity.\nTo access the science channel, use :n. For command, use :c."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/rd

/obj/item/radio/headset/heads/hos
	name = "\proper the head of security's headset"
	desc = "The headset of the man in charge of keeping order and protecting the station.\nTo access the security channel, use :s. For command, use :c."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_hos

/obj/item/radio/headset/heads/hos/alt
	name = "\proper the head of security's bowman headset"
	desc = "The headset of the man in charge of keeping order and protecting the station. Protects ears from flashbangs.\nTo access the security channel, use :s. For command, use :c."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/heads/hos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/heads/ce
	name = "\proper the chief engineer's headset"
	desc = "The headset of the guy in charge of keeping the station powered and undamaged.\nTo access the engineering channel, use :e. For command, use :c."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/ce

/obj/item/radio/headset/heads/cmo
	name = "\proper the chief medical officer's headset"
	desc = "The headset of the highly trained medical chief.\nTo access the medical channel, use :m. For command, use :c."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/cmo

/obj/item/radio/headset/heads/hop
	name = "\proper the head of personnel's headset"
	desc = "The headset of the guy who will one day be captain.\nChannels are as follows: :u - supply, :v - service, :c - command."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hop

/obj/item/radio/headset/headset_cargo
	name = "supply radio headset"
	desc = "A headset used by the QM and his slaves.\nTo access the supply channel, use :u."
	icon_state = "cargo_headset"
	keyslot = new /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_cargo/mining
	name = "mining radio headset"
	desc = "Headset used by shaft miners.\nTo access the supply channel, use :u. For science, use :n."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_mining

/obj/item/radio/headset/headset_srv
	name = "service radio headset"
	desc = "Headset used by the service staff, tasked with keeping the station full, happy and clean.\nTo access the service channel, use :v."
	icon_state = "srv_headset"
	keyslot = new /obj/item/encryptionkey/headset_service

//FALLOUT
/obj/item/radio/headset/makeshift
	name = "\proper the radio headset"
	desc = "An updated, modular makeshift intercom that fits over the head. Takes encryption keys."
	icon_state = "make_headset"

/obj/item/radio/headset/makeshift/broken
	name = "\proper the radio headset"
	desc = "An updated, modular makeshift intercom that fits over the head. Takes encryption keys."
	icon_state = "make_headset"

/obj/item/radio/headset/makeshift/broken/ComponentInitialize()
	on = FALSE //Отключает наушник
	frequency = FREQ_SIGNALER //Переключает на канал сигналера
	emped = rand(1337,1488) //Даёт емп заряд
	broadcasting = FALSE //Отключает передачу звука
	listening = FALSE //Отключает получение звука
	freqlock = TRUE //Блокирует на одной частоте



/obj/item/radio/headset/headset_overseer
	name = "\proper the overseer's radio headset"
	desc = "This is used by the vault overseer.\nChannels are as follows: :v - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_overseer

/obj/item/radio/headset/headset_vault_hos
	name = "\proper the chief of security's radio headset"
	desc = "The headset of the man in charge of keeping order and protecting the vault.\nChannels are as follows: :v - vault, :c - command, :s - security."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_hos

/obj/item/radio/headset/headset_vault_hos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault
	name = "\proper vault radio headset"
	desc = "A vault-tec radio.\nChannels are as follows: :v - vault."
	keyslot = new /obj/item/encryptionkey/headset_vault

/obj/item/radio/headset/headset_vaultsec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nTo access the security channel, use :s. To access the vault channel, use :v."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	radiosound = 'sound/radio/headset/security.ogg'

/obj/item/radio/headset/headset_vaultsec/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault_hos/alt
	name = "\proper the head of security's bowman headset"
	desc = "The headset of the man in charge of keeping order and protecting the station. Protects ears from flashbangs.\nTo access the security channel, use :s. For command, use :c. For vault, use :v"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/headset_ncr
	name = "NCR radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w."
	icon_state = "ncr_headset"
	item_state = "ncr_headset"
	keyslot = new /obj/item/encryptionkey/headset_ncr
	radiosound = 'sound/radio/headset/security.ogg'

/obj/item/radio/headset/headset_ncr/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_legion
	name = "Legion radio headset"
	desc = "This is used by Caesar's Legion.\nTo access the Legion channel, use :e."
	icon_state = "legion_headset"
	item_state = "legion_headset"
	keyslot = new /obj/item/encryptionkey/headset_legion
	radiosound = 'sound/radio/headset/security.ogg'

/obj/item/radio/headset/headset_legion/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_bos
	name = "brotherhood radio headset"
	desc = "This is used by the brotherhood of steel.\nTo access the BOS channel, use :q."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_bos
	radiosound = 'sound/radio/headset/bos.mp3'

/obj/item/radio/headset/headset_bos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_enclave
	name = "enclave radio headset"
	desc = "This is used by the enclave.\nTo access the enclave channel, use :z."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_enclave
	radiosound = 'sound/radio/headset/enclave.mp3'

/obj/item/radio/headset/headset_enclave/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_den
	name = "town radio headset"
	desc = "This is used by the town.\nTo access the town channel, use :f."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_den

/obj/item/radio/headset/headset_cent
	name = "\improper Vault-Tec headset"
	desc = "A headset used by the upper echelons of Vault-Tec.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_com
	keyslot2 = new /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/headset_cent/alt
	name = "\improper Vault-Tec bowman headset"
	desc = "A headset especially for emergency response personnel. Protects ears from flashbangs.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null

/obj/item/radio/headset/headset_cent/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/ai
	name = "\proper Integrated Subspace Transceiver "
	keyslot2 = new /obj/item/encryptionkey/ai
	command = TRUE

/obj/item/radio/headset/ai/can_receive(freq, level)
	return ..(freq, level, TRUE)

/obj/item/radio/headset/attackby(obj/item/W, mob/user, params)
	user.set_machine(src)

	if(istype(W, /obj/item/screwdriver))
		if(keyslot || keyslot2)
			for(var/ch_name in channels)
				SSradio.remove_object(src, GLOB.radiochannels[ch_name])
				secure_radio_connections[ch_name] = null

			var/turf/T = user.drop_location()
			if(T)
				if(keyslot)
					keyslot.forceMove(T)
					keyslot = null
				if(keyslot2)
					keyslot2.forceMove(T)
					keyslot2 = null

			recalculateChannels()
			to_chat(user, "<span class='notice'>You pop out the encryption keys in the headset.</span>")

		else
			to_chat(user, "<span class='warning'>This headset doesn't have any unique encryption keys!  How useless...</span>")

	else if(istype(W, /obj/item/encryptionkey))
		if(keyslot && keyslot2)
			to_chat(user, "<span class='warning'>The headset can't hold another key!</span>")
			return

		if(!keyslot)
			if(!user.transferItemToLoc(W, src))
				return
			keyslot = W

		else
			if(!user.transferItemToLoc(W, src))
				return
			keyslot2 = W


		recalculateChannels()
	else
		return ..()


/obj/item/radio/headset/recalculateChannels()
	..()
	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(!(ch_name in src.channels))
				channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			translate_binary = TRUE
		if(keyslot2.syndie)
			syndie = TRUE
		if (keyslot2.independent)
			independent = TRUE

	for(var/ch_name in channels)
		secure_radio_connections[ch_name] = add_radio(src, GLOB.radiochannels[ch_name])

/obj/item/radio/headset/AltClick(mob/living/user)
	if(!istype(user) || !Adjacent(user) || user.incapacitated())
		return
	if (command)
		use_command = !use_command
		to_chat(user, "<span class='notice'>You toggle high-volume mode [use_command ? "on" : "off"].</span>")

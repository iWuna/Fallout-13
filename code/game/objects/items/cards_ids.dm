/* Cards
 * Contains:
 *		DATA CARD
 *		ID CARD
 *		FINGERPRINT CARD HOLDER
 *		FINGERPRINT CARD
 */



/*
 * DATA CARDS - Used for the IC data card reader
 */
/obj/item/card
	name = "card"
	desc = "Does card things."
	icon = 'icons/obj/card.dmi'
	w_class = WEIGHT_CLASS_TINY

	var/list/files = list()

/obj/item/card/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins to swipe [user.p_their()] neck with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/card/data
	name = "data card"
	desc = "A plastic magstripe card for simple and speedy data storage and transfer. This one has a stripe running down the middle."
	icon_state = "data_1"
	obj_flags = UNIQUE_RENAME
	var/function = "storage"
	var/data = "null"
	var/special = null
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	var/detail_color = COLOR_ASSEMBLY_ORANGE

/obj/item/card/data/Initialize()
	.=..()
	update_icon()

/obj/item/card/data/update_icon()
	cut_overlays()
	if(detail_color == COLOR_FLOORTILE_GRAY)
		return
	var/mutable_appearance/detail_overlay = mutable_appearance('icons/obj/card.dmi', "[icon_state]-color")
	detail_overlay.color = detail_color
	add_overlay(detail_overlay)

/obj/item/card/data/attackby(obj/item/I, mob/living/user)
	if(istype(I, /obj/item/integrated_electronics/detailer))
		var/obj/item/integrated_electronics/detailer/D = I
		detail_color = D.detail_color
		update_icon()
	return ..()

/obj/item/proc/GetCard()

/obj/item/card/data/GetCard()
	return src

/obj/item/card/data/full_color
	desc = "A plastic magstripe card for simple and speedy data storage and transfer. This one has the entire card colored."
	icon_state = "data_2"

/obj/item/card/data/disk
	desc = "A plastic magstripe card for simple and speedy data storage and transfer. This one inexplicibly looks like a floppy disk."
	icon_state = "data_3"

/*
 * ID CARDS
 */
/obj/item/card/emag
	desc = "It's a card with a magnetic strip attached to some circuitry."
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	item_flags = NO_MAT_REDEMPTION | NOBLUDGEON
	var/prox_check = TRUE //If the emag requires you to be in range

/obj/item/card/emag/bluespace
	name = "bluespace cryptographic sequencer"
	desc = "It's a blue card with a magnetic strip attached to some circuitry. It appears to have some sort of transmitter attached to it."
	color = rgb(40, 130, 255)
	prox_check = FALSE

/obj/item/card/emag/attack()
	return

/obj/item/card/emag/afterattack(atom/target, mob/user, proximity)
	. = ..()
	var/atom/A = target
	if(!proximity && prox_check)
		return
	A.emag_act(user)

/obj/item/card/emagfake
	desc = "It's a card with a magnetic strip attached to some circuitry. Closer inspection shows that this card is a poorly made replica, with a \"DonkCo\" logo stamped on the back."
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/emagfake/afterattack()
	. = ..()
	playsound(src, 'sound/items/bikehorn.ogg', 50, 1)

/obj/item/card/id
	name = "identification card"
	desc = "A card used to provide ID and determine access across the station."
	var/id_type = "ID Card"
	icon_state = "id"
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	slot_flags = ITEM_SLOT_ID
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/mining_points = 0 //For redeeming at mining equipment vendors
	var/list/access = list()
	var/registered_name = null // The name registered_name on the card
	var/assignment = null
	var/access_txt // mapping aid



/obj/item/card/id/Initialize(mapload)
	. = ..()
	if(mapload && access_txt)
		access = text2access(access_txt)

/obj/item/card/id/vv_edit_var(var_name, var_value)
	. = ..()
	if(.)
		switch(var_name)
			if("assignment","registered_name")
				update_label()

/obj/item/card/id/attack_self(mob/user)
	if(Adjacent(user))
		user.visible_message("<span class='notice'>[user] shows you: [icon2html(src, viewers(user))] [src.name].</span>", \
					"<span class='notice'>You show \the [src.name].</span>")
		add_fingerprint(user)
		return

/obj/item/card/id/examine(mob/user)
	..()
	if(mining_points)
		to_chat(user, "There's [mining_points] mining equipment redemption point\s loaded onto this card.")

/obj/item/card/id/GetAccess()
	return access

/obj/item/card/id/GetID()
	return src

/*
Usage:
update_label()
	Sets the id name to whatever registered_name and assignment is

update_label("John Doe", "Clowny")
	Properly formats the name and occupation and sets the id name to the arguments
*/
/obj/item/card/id/proc/update_label(newname, newjob)
	if(newname || newjob)
		name = "[(!newname)	? "identification card"	: "[newname]'s [id_type]"][(!newjob) ? "" : " ([newjob])"]"
		return

	name = "[(!registered_name)	? "identification card"	: "[registered_name]'s [id_type]"][(!assignment) ? "" : " ([assignment])"]"

/obj/item/card/id/silver
	name = "silver identification card"
	desc = "A silver card which shows honour and dedication."
	icon_state = "silver"
	item_state = "silver_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/id/silver/reaper
	name = "Thirteen's ID Card (Reaper)"
	access = list(ACCESS_MAINT_TUNNELS)
	assignment = "Reaper"
	registered_name = "Thirteen"

/obj/item/card/id/sec
	name = "red identification card"
	desc = "A red card which shows dedication to the Security department."
	icon_state = "sec"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/id/chief
	name = "crimson identification card"
	desc = "A red card which shows dedication and leadership to the Vaults safety and security."
	icon_state = "chief"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/id/gold
	name = "gold identification card"
	desc = "A golden card which shows power and might."
	icon_state = "gold"
	item_state = "gold_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/id/silver/mayor
	name = "Mayor's mayoral permit"
	desc = "A silver encrusted identification permit reserved for the Mayor of Oasis."
	icon_state = "silver"
	item_state = "silver_id"
	id_type = "mayoral permit"

/obj/item/card/id/dendoctor
	name = "doctor's name badge"
	desc = "A plastic-sealed name badge certifying the medical expertise of its holder."
	icon_state = "doctor"
	item_state = "card-doctor"
	id_type = "name badge"


/obj/item/card/id/syndicate
	name = "agent card"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE)
	var/anyone = FALSE //Can anyone forge the ID or just syndicate?

/obj/item/card/id/syndicate/Initialize()
	. = ..()
	var/datum/action/item_action/chameleon/change/chameleon_action = new(src)
	chameleon_action.chameleon_type = /obj/item/card/id
	chameleon_action.chameleon_name = "ID Card"
	chameleon_action.initialize_disguises()

/obj/item/card/id/syndicate/afterattack(obj/item/O, mob/user, proximity)
	if(!proximity)
		return
	if(istype(O, /obj/item/card/id))
		var/obj/item/card/id/I = O
		src.access |= I.access
		if(isliving(user) && user.mind)
			if(user.mind.special_role)
				to_chat(usr, "<span class='notice'>The card's microscanners activate as you pass it over the ID, copying its access.</span>")

/obj/item/card/id/syndicate/attack_self(mob/user)
	if(isliving(user) && user.mind)
		if(user.mind.special_role || anyone)
			if(alert(user, "Action", "Agent ID", "Show", "Forge") == "Forge")
				var/t = copytext(sanitize(input(user, "What name would you like to put on this card?", "Agent card name", registered_name ? registered_name : (ishuman(user) ? user.real_name : user.name))as text | null),1,26)
				if(!t || t == "Unknown" || t == "floor" || t == "wall" || t == "r-wall") //Same as mob/dead/new_player/prefrences.dm
					if (t)
						alert("Invalid name.")
					return
				registered_name = t

				var/u = copytext(sanitize(input(user, "What occupation would you like to put on this card?\nNote: This will not grant any access levels other than Maintenance.", "Agent card job assignment", "Assistant")as text | null),1,MAX_MESSAGE_LEN)
				if(!u)
					registered_name = ""
					return
				assignment = u
				update_label()
				to_chat(user, "<span class='notice'>You successfully forge the ID card.</span>")
				return
	..()

/obj/item/card/id/syndicate/anyone
	anyone = TRUE

/obj/item/card/id/syndicate/nuke_leader
	name = "lead agent card"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/syndicate_command
	name = "syndicate ID card"
	desc = "An ID straight from the Syndicate."
	registered_name = "Syndicate"
	assignment = "Syndicate Overlord"
	access = list(ACCESS_SYNDICATE)

/obj/item/card/id/captains_spare
	name = "Overseer's spare ID"
	desc = "The spare ID of the High Lord himself."
	icon_state = "gold"
	item_state = "gold_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	registered_name = "Captain"
	assignment = "Captain"

/obj/item/card/id/captains_spare/Initialize()
	var/datum/job/captain/J = new/datum/job/captain
	access = J.get_access()
	. = ..()

/obj/item/card/id/centcom
	name = "\improper CentCom ID"
	desc = "An ID straight from Central Command."
	icon_state = "centcom"
	registered_name = "Central Command"
	assignment = "General"

/obj/item/card/id/centcom/Initialize()
	access = get_all_centcom_access()
	. = ..()

/obj/item/card/id/ert
	name = "\improper CentCom ID"
	desc = "An ERT ID card."
	icon_state = "centcom"
	registered_name = "Emergency Response Team Commander"
	assignment = "Emergency Response Team Commander"

/obj/item/card/id/ert/Initialize()
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Security
	registered_name = "Security Response Officer"
	assignment = "Security Response Officer"

/obj/item/card/id/ert/Security/Initialize()
	access = get_all_accesses()+get_ert_access("sec")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Engineer
	registered_name = "Engineer Response Officer"
	assignment = "Engineer Response Officer"

/obj/item/card/id/ert/Engineer/Initialize()
	access = get_all_accesses()+get_ert_access("eng")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Medical
	registered_name = "Medical Response Officer"
	assignment = "Medical Response Officer"

/obj/item/card/id/ert/Medical/Initialize()
	access = get_all_accesses()+get_ert_access("med")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/chaplain
	registered_name = "Religious Response Officer"
	assignment = "Religious Response Officer"

/obj/item/card/id/ert/chaplain/Initialize()
	access = get_all_accesses()+get_ert_access("sec")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/prisoner
	name = "prisoner ID card"
	desc = "You are a number, you are not a free man."
	icon_state = "orange"
	item_state = "orange-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	assignment = "Prisoner"
	registered_name = "Scum"
	var/goal = 0 //How far from freedom?
	var/points = 0

/obj/item/card/id/prisoner/attack_self(mob/user)
	to_chat(usr, "<span class='notice'>You have accumulated [points] out of the [goal] points you need for freedom.</span>")

/obj/item/card/id/prisoner/one
	name = "Prisoner #13-001"
	registered_name = "Prisoner #13-001"

/obj/item/card/id/prisoner/two
	name = "Prisoner #13-002"
	registered_name = "Prisoner #13-002"

/obj/item/card/id/prisoner/three
	name = "Prisoner #13-003"
	registered_name = "Prisoner #13-003"

/obj/item/card/id/prisoner/four
	name = "Prisoner #13-004"
	registered_name = "Prisoner #13-004"

/obj/item/card/id/prisoner/five
	name = "Prisoner #13-005"
	registered_name = "Prisoner #13-005"

/obj/item/card/id/prisoner/six
	name = "Prisoner #13-006"
	registered_name = "Prisoner #13-006"

/obj/item/card/id/prisoner/seven
	name = "Prisoner #13-007"
	registered_name = "Prisoner #13-007"

/obj/item/card/id/mining
	name = "mining ID"
	access = list(ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)

/obj/item/card/id/away
	name = "a perfectly generic identification card"
	desc = "A perfectly generic identification card. Looks like it could use some flavor."
	access = list(ACCESS_AWAY_GENERAL)

/obj/item/card/id/away/hotel
	name = "Staff ID"
	desc = "A staff ID used to access the hotel's doors."
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT)

/obj/item/card/id/away/hotel/securty
	name = "Officer ID"
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT, ACCESS_AWAY_SEC)

/obj/item/card/id/away/old
	name = "a perfectly generic identification card"
	desc = "A perfectly generic identification card. Looks like it could use some flavor."
	access = list(ACCESS_AWAY_GENERAL)

/obj/item/card/id/away/old/sec
	name = "Security Officer ID"
	desc = "Security officers ID card."
	icon_state = "centcom"

/obj/item/card/id/away/old/sci
	name = "Scientist ID"
	desc = "Scientists ID card."
	icon_state = "centcom"

/obj/item/card/id/away/old/eng
	name = "Engineer ID"
	desc = "Engineers ID card."
	icon_state = "centcom"

/obj/item/card/id/away/old/apc
	name = "APC Access ID"
	desc = "Special ID card to allow access to APCs."
	icon_state = "centcom"
	access = list(ACCESS_ENGINE_EQUIP)


////////Dogtag types/////////
//All one subtype for making item path pretty/easily telling what ID cards are dogtags, for gravemarkers

/obj/item/card/id/dogtag
	name = "holo dogtag"
	desc = "An advanced holographic dogtag, that shows the duty of a BoS member."
	icon_state = "holodogtag"
	id_type = "ID tags"

/obj/item/card/id/dogtag/enclave
	name = "holo dogtag"
	desc = "An advanced holographic dogtag, that shows the duty of a Enclave member."
	icon_state = "holodogtag"
	id_type = "ID tags"

/obj/item/card/id/selfassign/attack_self(mob/user)
    if(isliving(user))
        var/mob/living/living_user = user
        if(alert(user, "Action", "Agent ID", "Show", "Forge") == "Forge")
            registered_name = living_user.real_name
            assignment = living_user.job
            update_label()
            to_chat(user, "<span class='notice'>You successfully forge the ID card.</span>")
            return
    ..()

/obj/item/card/id/selfassign
	icon_state = "silver"
	item_state = "silver_id"
	desc = "A rewritable card that allows you to put your name and assignment on it."

/obj/item/card/id/dogtag/deputy
	name = "deputy's badge"
	desc = "A silver badge which shows honour and dedication."
	id_type = "badge"
	assignment = "Deputy"
	icon_state = "deputy"
	item_state = "badge-deputy"
	access = list(ACCESS_BAR, ACCESS_GATEWAY)

/obj/item/card/id/dogtag/deputy/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/dogtag/sheriff))
		var/newname = stripped_input(user, "Who do you want to designate as your deputy?", , "", MAX_NAME_LEN)
		if(newname)
			to_chat(user, "You scribble the [registered_name] for the name on the badge.")
			registered_name = newname
			update_label()
	return ..()

/obj/item/card/id/dogtag/sheriff
	name = "sheriff's badge"
	desc = "A golden Sheriff's badge."
	id_type = "badge"
	icon_state = "sheriff"
	item_state = "badge-sheriff"

/obj/item/card/id/dogtag/town
	name = "citizenship permit"
	desc = "A permit identifying the holder as a citizen of a nearby town."
	icon_state = "doctor"
	item_state = "card-doctor"
	id_type = "citizenship permit"
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/town/mafia
	name = "citizenship permit"
	desc = "A permit identifying the holder as a citizen of a nearby town."
	icon_state = "doctor"
	item_state = "card-doctor"
	id_type = "citizenship permit"
	assignment = "Settler"
	obj_flags = UNIQUE_RENAME
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/town/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/silver/mayor))
		var/newname = stripped_input(user, "Who do you want to grant citizenship to?", , "", MAX_NAME_LEN)
		if(newname)
			to_chat(user, "You scribble the [registered_name] for the name on the permit.")
			registered_name = newname
			update_label()
	return ..()

/obj/item/card/id/dogtag/ncrambassador
	name = "ambassador's permit"
	desc = "An silver encrusted ambassador's permit in a plastic holder."
	icon_state = "silver"
	item_state = "silver"
	id_type = "ambassador's permit"

/obj/item/card/id/dogtag/ncradmin
	name = "Administrators ID"
	desc = "An silver encrusted admins ID in a plastic holder."
	icon_state = "silver"
	item_state = "silver"

/obj/item/card/id/dogtag/ncrtrooper
	name = "trooper's tags"
	desc = "A dog tag proving enlistment."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrmp
	name = "military police tags"
	desc = "A dog tag that associates one with the NCROSI."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrht
	name = "heavy trooper's tags"
	desc = "A dog tag proving the elite status of the heavy trooper."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrsergeant
	name = "sergeant's tags"
	desc = "A chevron decorated dog tag showing NCO-ship."
	icon_state = "ncrdogtagsergeant"

/obj/item/card/id/dogtag/ncrlieutenant
	name = "lieutenant's tags"
	desc = "A silver bar dog tag that denotes a member of the NCR military with a lieutenant commission."
	icon_state = "ncrdogtagofficer"

/obj/item/card/id/dogtag/ncrcaptain
	name = "captain's tags"
	desc = "A dog tag that demands respect from all those subordinate to it. This one belongs to an NCR captain."
	icon_state = "ncrdogtagcaptain"

/obj/item/card/id/dogtag/ncrranger
	name = "ranger tags"
	desc = "A dog tag that invokes fear in those who see it, belonging to someone with a big iron on their hip."
	icon_state = "ncrdogtagranger"

/obj/item/card/id/dogtag/legfollower
	name = "follower medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to a camp follower."
	icon_state = "legionmedallionrecruit"
	id_type = "follower medallion"

/obj/item/card/id/dogtag/legauxilia
	name = "auxilia medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a respected auxilia of the Legion."
	icon_state = "legionmedallionveteran"
	id_type = "auxilia medallion"

/obj/item/card/id/dogtag/legrecruit
	name = "recruit medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to a recruit."
	icon_state = "legionmedallionrecruit"
	id_type = "recruit medallion"

/obj/item/card/id/dogtag/legprime
	name = "prime medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to a prime."
	icon_state = "legionmedallionprime"
	id_type = "prime medallion"

/obj/item/card/id/dogtag/legslavemaster
	name = "slavemaster medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to the dreaded Slavemaster."
	icon_state = "legionmedallionprime"
	id_type = "slavemaster medallion"

/obj/item/card/id/dogtag/legveteran
	name = "veteran medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a veteran, and reeks of iron."
	icon_state = "legionmedallionveteran"
	id_type = "veteran medallion"

/obj/item/card/id/dogtag/legcenturion
	name = "centurion medallion"
	desc = "A golden disc awarded to the most fierce men in the whole legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"
	id_type = "centurion medallion"

/obj/item/card/id/dogtag/legvenator
	name = "venator medallion"
	desc = "A golden disc awarded to the elite hunters of the legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"
	id_type = "venator medallion"
	assignment = "Venator"


/obj/item/card/id/dogtag/legpriest
	name = "priestess medallion"
	desc = "A golden disc awarded to the trusted spiritual guide to the nearby Legion."
	icon_state = "legionmedallioncent"
	item_state = "legionmedallioncent"
	item_color = ""
	id_type = "priestess medallion"

/obj/item/card/id/dogtag/legorator
	name = "orator medallion"
	desc = "A golden disc awarded to the one who is a dedicated ambassador for Caesar's Legion."
	icon_state = "legionmedallioncent"
	item_state = "legionmedallioncent"
	id_type = "orator medallion"

/obj/item/card/id/legionbrand
	name = "Legion's brand"
	desc = "A brand for identifying Caesar's Legion's slaves."
	icon_state = "legionbrand"
	item_state = "slave"
	id_type = "Slave brand"
	item_flags = NODROP

///OUTLAW TAGS////

/obj/item/card/id/rusted
	name = "rusted tags"
	desc = "Decrepit uncared for NCR dogtags, kept as a reminder to something."
	icon_state = "rustedncrtag"
	item_state = "rustedncrtag"

/obj/item/card/id/rusted/rustedmedallion
	name = "rusted medallion"
	desc = "A battered and unkempt legion medallion, kept as a reminder to something."
	icon_state = "rustedmedallion"
	item_state = "rustedmedallion"

/obj/item/card/id/rusted/fadedvaultid
	name = "faded id card"
	desc = "A and worn Vault-Tech issued ID card, broken beyond use, kept as a reminder to something."
	icon_state = "fadedvaultid"
	item_state = "fadedvaultid"

/obj/item/card/id/rusted/brokenholodog
	name = "broken holotag"
	desc = "A BoS issue holotag, it isnt working now though, kept as a reminder to something."
	icon_state = "brokenholodog"
	item_state = "brokenholodog"

/obj/item/card/id/khantattoo
	name = "Great Khan tattoo"
	desc = "A tattoo of the symbol of the Great Khans."
	icon_state = "skin"
	item_state = "skin"
	id_type = "gang tattoo"
	item_flags = NODROP
	access = list(ACCESS_KHAN)


/* Tribal Tags
*/

/obj/item/card/id/tribetattoo
	name = "Tattoo of the machine spirits"
	desc = "A tattoo depicting the five machine spirits in harmony."
	icon_state = "talisman"
	item_state = "talisman"
	id_type = "tribe tattoo"
	item_flags = NODROP
	access = list(ACCESS_TRIBE)
/obj/item/clothing/accessory/badge
	name = "detective's badge"
	desc = "Security Department detective's badge, made from gold."
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "badge"
	slot_flags = ITEM_SLOT_NECK
	attachment_slot = CHEST

	var/stored_name
	var/badge_string = "Corporate Security"

	drop_sound = 'modular_nova/master_files/sound/items/drop/ring.ogg'
	pickup_sound = 'modular_nova/master_files/sound/items/pickup/ring.ogg'

/obj/item/clothing/accessory/badge/old
	name = "faded badge"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	desc = "A faded badge, backed with leather. It bears the emblem of the Forensic division."
	icon_state = "goldbadge"

/obj/item/clothing/accessory/badge/proc/set_name(new_name)
	stored_name = new_name
	name = "[initial(name)] ([stored_name])"

/obj/item/clothing/accessory/badge/proc/set_desc(mob/living/carbon/human/H)

/obj/item/clothing/accessory/badge/attack_self(mob/user as mob)

	if(!stored_name)
		to_chat(user, "You polish your old badge fondly, shining up the surface.")
		set_name(user.real_name)
		return

	if(isliving(user))
		if(stored_name)
			user.visible_message(span_notice("[user] displays their [src.name].\nIt reads: [stored_name], [badge_string]."),span_notice("You display your [src.name].\nIt reads: [stored_name], [badge_string]."))
		else
			user.visible_message(span_notice("[user] displays their [src.name].\nIt reads: [badge_string]."),span_notice("You display your [src.name]. It reads: [badge_string]."))

/obj/item/clothing/accessory/badge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message(span_danger("[user] invades [M]'s personal space, thrusting [src] into their face insistently."),span_danger("You invade [M]'s personal space, thrusting [src] into their face insistently."))
		user.do_attack_animation(M)

// Sheriff Badge (toy)
/obj/item/clothing/accessory/badge/sheriff
	name = "sheriff badge"
	desc = "This town ain't big enough for the two of us, pardner."
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "sheriff"

/obj/item/clothing/accessory/badge/sheriff/attack_self(mob/user as mob)
	user.visible_message("[user] shows their sheriff badge. There's a new sheriff in town!",\
		"You flash the sheriff badge to everyone around you!")

/obj/item/clothing/accessory/badge/sheriff/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message(span_danger("[user] invades [M]'s personal space, the sheriff badge into their face!."),span_danger("You invade [M]'s personal space, thrusting the sheriff badge into their face insistently."))
		user.do_attack_animation(M)

//.Holobadges.
/obj/item/clothing/accessory/badge/holo
	name = "holobadge"
	desc = "This glowing blue badge marks the holder as THE LAW."
	icon_state = "holobadge_lopland"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/badge/holo/cord
	icon_state = "holobadge-cord"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/badge/holo/attack_self(mob/user as mob)
	if(!stored_name)
		to_chat(user, "Waving around a holobadge before swiping an ID would be pretty pointless.")
		return
	return ..()

/obj/item/clothing/accessory/badge/holo/emag_act(remaining_charges, mob/user)
	if(obj_flags & EMAGGED)
		balloon_alert(user, "already cracked")
		return FALSE

	obj_flags |= EMAGGED
	balloon_alert(user, "security checks cracked!")
	to_chat(user, span_danger("You crack the holobadge security checks."))
	return TRUE

/obj/item/clothing/accessory/badge/holo/attackby(obj/item/object as obj, mob/user as mob)
	if(istype(object, /obj/item/card/id))

		var/obj/item/card/id/id_card = null

		if(istype(object, /obj/item/card/id))
			id_card = object

		if(ACCESS_SECURITY in id_card.access || (obj_flags & EMAGGED))
			to_chat(user, "You imprint your ID details onto the badge.")
			set_name(user.real_name)
			badge_string = id_card.assignment
		else
			to_chat(user, "[src] rejects your insufficient access rights.")
		return
	..()

/obj/item/storage/box/holobadge
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."

/obj/item/storage/box/holobadge/PopulateContents()
	. = ..()
	new /obj/item/clothing/accessory/badge/holo(src)
	new /obj/item/clothing/accessory/badge/holo(src)
	new /obj/item/clothing/accessory/badge/holo(src)
	new /obj/item/clothing/accessory/badge/holo(src)
	new /obj/item/clothing/accessory/badge/holo/cord(src)
	new /obj/item/clothing/accessory/badge/holo/cord(src)
	return

/obj/item/clothing/accessory/badge/holo/warden
	name = "warden's holobadge"
	desc = "A silver corporate security badge. Stamped with the words 'Warden.'"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "silverbadge"
	slot_flags = ITEM_SLOT_NECK

/obj/item/clothing/accessory/badge/holo/hos
	name = "head of security's holobadge"
	desc = "An immaculately polished gold security badge. Labeled 'Head of Security.'"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "goldbadge"
	slot_flags = ITEM_SLOT_NECK

/obj/item/clothing/accessory/badge/holo/detective
	name = "detective's holobadge"
	desc = "An immaculately polished gold security badge on leather. Labeled 'Detective.'"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "marshalbadge"
	slot_flags = ITEM_SLOT_NECK

/obj/item/storage/box/holobadge/hos
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."

/obj/item/storage/box/holobadge/hos/PopulateContents()
	. = ..()
	new /obj/item/clothing/accessory/badge/holo(src)
	new /obj/item/clothing/accessory/badge/holo(src)
	new /obj/item/clothing/accessory/badge/holo/warden(src)
	new /obj/item/clothing/accessory/badge/holo/detective(src)
	new /obj/item/clothing/accessory/badge/holo/detective(src)
	new /obj/item/clothing/accessory/badge/holo/hos(src)
	new /obj/item/clothing/accessory/badge/holo/cord(src)
	return

// The newbie pin
/obj/item/clothing/accessory/green_pin
	name = "green pin"
	desc = "A pin given to newly hired personnel on deck."
	icon_state = "green"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/green_pin/examine(mob/user)
	. = ..()
	// How many hours of playtime left until the green pin expires
	var/green_time_remaining = sanitize_integer((PLAYTIME_GREEN - user.client?.get_exp_living(pure_numeric = TRUE) / 60), 0, (PLAYTIME_GREEN / 60))
	if(green_time_remaining > 0)
		. += span_nicegreen("It reads '[green_time_remaining] hour[green_time_remaining >= 2 ? "s" : ""].'")

// Pride Pin Over-ride
/obj/item/clothing/accessory/pride
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'

GLOBAL_LIST_INIT(pride_pin_reskins, list(
	"Rainbow Pride" = "pride",
	"Bisexual Pride" = "pride_bi",
	"Pansexual Pride" = "pride_pan",
	"Asexual Pride" = "pride_ace",
	"Non-binary Pride" = "pride_enby",
	"Transgender Pride" = "pride_trans",
	"Intersex Pride" = "pride_intersex",
	"Lesbian Pride" = "pride_lesbian",
	"Man-Loving-Man / Gay Pride" = "pride_mlm",
	"Genderfluid Pride" = "pride_genderfluid",
	"Genderqueer Pride" = "pride_genderqueer",
	"Aromantic Pride" = "pride_aromantic",
))

/obj/item/clothing/accessory/kneepad
	name = "\improper kneepad"
	desc = "The parent to all kneepads"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "kneepad_cheap"
	slot_flags = ITEM_SLOT_ON_BODY
	attachment_slot = LEGS

/obj/item/clothing/accessory/kneepad/cheap
	name = "improvised kneepads"
	desc = "An old backpack and sheet steel sign have found new life as craftmade PPE. These types of kneepads are common both with freelance scavs and as in field replacements for the attrition experienced by factory made gear."

/obj/item/clothing/accessory/kneepad/basic
	name = "kneepads"
	desc = "Innumerable indistinguishable kneepads like this pair are issued to contract scavenge techs. The compression sleeves are said to improve leg posture, but they tend to lose their elasticity with extended use."
	icon_state = "kneepad_basic"
	inhand_icon_state = "kneepad_basic"

/obj/item/clothing/accessory/kneepad/expensive
	name = "Lopland Tactical Knee Defenders"
	desc = "The Lopland Tactical catalogue devotes two paragraphs to explaining the features on these kneepads, but it still isn't clear how different they are from cheaper models. Some operatives and private owners alike swear they last longer, though."
	icon_state = "kneepad_expensive"
	inhand_icon_state = "kneepad_expensive"

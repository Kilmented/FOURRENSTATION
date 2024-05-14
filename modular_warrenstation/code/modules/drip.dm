// let me explain something to you
// armor tokens are as follows. 1 token = 25, 2 tokens = 50, 3 tokens = 75, 4 tokens = 100
// light armor = 4 tokens, medium armor - 8 tokens, heavy armor = 12 tokens
// players can buy an upgrade midround that gives them one extra token of their choice.
// the following armors are the baseline.

/datum/armor/suit_chameleon/light

	melee = 25

	bomb = 25
	bullet = 25

	energy = 25
	laser = 25

	fire = 25
	acid = 25
	bio = 25

	wound = 0

/obj/item/clothing/suit/chameleon/light
	name = "Type I armor"
	desc = "An armored vest that protects meagerly against most damage types."
	icon_state = "armor"
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	resistance_flags = NONE
	armor_type = /datum/armor/suit_chameleon/light
	actions_types = list(/datum/action/item_action/chameleon/change/suit)
	slowdown = 0.1 // a leetle


/obj/item/clothing/suit/chameleon/light/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_vest_allowed //should at least act like a vest

/datum/armor/suit_chameleon/medium

	melee = 50

	bomb = 50
	bullet = 50

	energy = 50
	laser = 50

	fire = 50
	acid = 50
	bio = 50

	wound = 0

/obj/item/clothing/suit/chameleon/medium
	name = "Type II armor"
	desc = "An armored vest that protects moderately against most damage types."
	icon_state = "armor"
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	resistance_flags = NONE
	armor_type = /datum/armor/suit_chameleon/medium
	actions_types = list(/datum/action/item_action/chameleon/change/suit)
	slowdown = 0.2 // respectable


/obj/item/clothing/suit/chameleon/medium/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_vest_allowed //should at least act like a vest

/datum/armor/suit_chameleon/heavy

	melee = 75

	bomb = 75
	bullet = 75

	energy = 75
	laser = 75

	fire = 75
	acid = 75
	bio = 75

	wound = 0

/obj/item/clothing/suit/chameleon/heavy
	name = "Type III armor"
	desc = "An armored vest that protects maximumly against most damage types."
	icon_state = "armor"
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	resistance_flags = NONE
	armor_type = /datum/armor/suit_chameleon/heavy
	actions_types = list(/datum/action/item_action/chameleon/change/suit)
	slowdown = 0.3 // respectable


/obj/item/clothing/suit/chameleon/heavy/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_vest_allowed //should at least act like a vest

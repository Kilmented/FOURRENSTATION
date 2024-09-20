// Multiple flavors of GUN.
// Here's the types.
// /obj/item/gun/ballistic/automatic // basically comes down to "a semi and or automatic"
// /obj/item/gun/ballistic/rifle // basically comes down to "hit activate once to eject twice to cock between every shot"
// /obj/item/gun/ballistic/shotgun // basically comes down to "hit activate to cock and eject between every shot"
// /obj/item/gun/ballistic/revolver // basically comes down to "a semi but hit activate to drop the whole cylinder"
// That's all the relevant ones. Enjoy.
// Anyways, here's probably what you were looking for. The order is; Defines, Guns, magazines, and -at the very bottom- casings and then projectiles. Take care. - Jaeger

// Happy 100th PR, Warrenstation!

// LINE BREAK FOR DEFINES
// LINE BREAK FOR DEFINES
// LINE BREAK FOR DEFINES

#define DAMAGE_COMPACT_SMALL 25
#define DAMAGE_COMPACT_MEDIUM 35
#define DAMAGE_COMPACT_LARGE 55

#define DAMAGE_MEDIUM_INTERMEDIATE 88
#define DAMAGE_MEDIUM_LARGE 145

#define DAMAGE_SHOTGUN_SMALL 110
#define DAMAGE_SHOTGUN_LARGE 145

#define DAMAGE_HEAVY_SMALL 185
#define DAMAGE_HEAVY_LARGE 250

#define CALIBER_COMPACT_MEDIUM_MSTIM "9x18mm VEB"
#define CALIBER_COMPACT_LARGE_MSTIM "10x25mm VEB"

#define CALIBER_MEDIUM_INTERMEDIATE_MSTIM "7.62x39mm VEB"
#define CALIBER_MEDIUM_LARGE_MSTIM "7.62x54mmR VEB"

#define CALIBER_SHOTGUN_LARGE_MSTIM "12 Gauge VEB"

#define CALIBER_HEAVY_SMALL_MSTIM "12.7x108mm VEB"
#define CALIBER_HEAVY_LARGE_MSTIM "23×115mm VEB"

// these defines are for OPFOR, for use in weapons that are not so easy to obtain, and ammo that is "scarce" putting it lightly
#define CALIBER_COMPACT_SMALL_SS "5.7x28mm SolStill"
#define CALIBER_MEDIUM_LARGE_SS "6.8x51mm SolStill"

// defines for gun stats

#define HIGH_SPEED 0.2
#define DEFAULT_SPEED 0.5
#define LOW_SPEED 0.8

#define HIGH_PAIN 1.5 SECONDS
#define DEFAULT_PAIN 1 SECONDS
#define LOW_PAIN 0.5 SECONDS

#define DEFAULT_RICOCHETS_MAX 5

#define HIGH_RICOCHET_CHANCE 35
#define DEFAULT_RICOCHET_CHANCE 20
#define LOW_RICOCHET_CHANCE 5

#define HIGH_WOUND_BONUS 30
#define DEFAULT_WOUND_BONUS 20
#define LOW_WOUND_BONUS 10

// defines for our embeds

#define HIGH_EMBED_CHANCE 30
#define DEFAULT_EMBED_CHANCE 20
#define LOW_EMBED_CHANCE 10

#define HIGH_EMBEDDED_ITEM_FALLOUT 30
#define DEFAULT_EMBEDDED_ITEM_FALLOUT 15
#define LOW_EMBEDDED_ITEM_FALLOUT 5

#define HIGH_EMBEDDED_PAIN_MULTIPLIER 1.5
#define DEFAULT_EMBEDDED_PAIN_MULTIPLIER 1 // Coefficient of multiplication for the damage the item does while embedded
#define LOW_EMBEDDED_PAIN_MULTIPLIER 0.5

#define HIGH_EMBEDDED_IMPACT_PAIN_MULTIPLIER 6
#define DEFAULT_EMBEDDED_IMPACT_PAIN_MULTIPLIER 4 //Coefficient of multiplication for the damage the item does when it first embeds (this*item.w_class)
#define LOW_EMBEDDED_IMPACT_PAIN_MULTIPLIER 2

#define HIGH_EMBEDDED_UNSAFE_REMOVAL_PAIN_MULTIPLIER 2.5
#define DEFAULT_EMBEDDED_UNSAFE_REMOVAL_PAIN_MULTIPLIER 2 ///Coefficient of multiplication for the damage the item does when it falls out or is removed without a surgery (this*item.w_class)
#define LOW_EMBEDDED_UNSAFE_REMOVAL_PAIN_MULTIPLIER 1.5

#define HIGH_EMBEDDED_UNSAFE_REMOVAL_TIME 150
#define DEFAULT_EMBEDDED_UNSAFE_REMOVAL_TIME 100 //A Time in ticks, total removal time = (this*item.w_class)
#define LOW_EMBEDDED_UNSAFE_REMOVAL_TIME 50

#define HIGH_EMBEDDED_JOSTLE_CHANCE 15
#define DEFAULT_EMBEDDED_JOSTLE_CHANCE 10 //Chance for embedded objects to cause pain every time they move (jostle)
#define LOW_EMBEDDED_JOSTLE_CHANCE 5

#define HIGH_EMBEDDED_JOSTLE_PAIN_MULTIPLIER 1.5
#define DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER 1
#define LOW_EMBEDDED_JOSTLE_PAIN_MULTIPLIER 0.5

#define HIGH_EMBEDDED_PAIN_STAM_PCT 0.8
#define DEFAULT_EMBEDDED_PAIN_STAM_PCT 0.5 //This percentage of all pain will be dealt as stam damage rather than brute (0-1)
#define LOW_EMBEDDED_PAIN_STAM_PCT 0.2

// LINE BREAK FOR CASINGS + PROJECTILES

/obj/projectile/bullet/veb9by18
	name = "9mm bullet"
	icon_state = "gaussweak"
	damage = DAMAGE_COMPACT_MEDIUM
	wound_bonus = LOW_WOUND_BONUS
	bare_wound_bonus = LOW_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = DEFAULT_SPEED

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

/obj/projectile/bullet/veb10by25
	name = "10mm bullet"
	icon_state = "gauss"
	damage = DAMAGE_COMPACT_LARGE
	wound_bonus = DEFAULT_WOUND_BONUS
	bare_wound_bonus = DEFAULT_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = DEFAULT_SPEED

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

/obj/projectile/bullet/veb762by39
	name = "7.62mm bullet"
	icon_state = "gauss"
	damage = DAMAGE_MEDIUM_INTERMEDIATE
	wound_bonus = DEFAULT_WOUND_BONUS
	bare_wound_bonus = DEFAULT_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = DEFAULT_SPEED

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

/obj/projectile/bullet/veb762by54r
	name = "7.62mm bullet"
	icon_state = "gauss"
	damage = DAMAGE_MEDIUM_LARGE
	wound_bonus = DEFAULT_WOUND_BONUS
	bare_wound_bonus = DEFAULT_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = HIGH_SPEED

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

/obj/projectile/bullet/veb12gauge
	name = "12 gauge buckshot cloud"
	icon_state = "guardian" // temp
	damage = DAMAGE_SHOTGUN_LARGE
	wound_bonus = DEFAULT_WOUND_BONUS
	bare_wound_bonus = DEFAULT_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = LOW_SPEED

	wound_falloff_tile = 1
	damage_falloff_tile = 0.25
	range = 20

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

// these bullets are for OPFOR

/obj/projectile/bullet/ss5point7by28
	name = "5.7mm bullet"
	icon_state = "gaussweak"
	damage = DAMAGE_COMPACT_SMALL
	wound_bonus = LOW_WOUND_BONUS
	bare_wound_bonus = LOW_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = DEFAULT_SPEED

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

/obj/projectile/bullet/ss6point8by51
	name = "6.8mm bullet"
	icon_state = "gauss"
	damage = DAMAGE_MEDIUM_LARGE
	wound_bonus = DEFAULT_WOUND_BONUS
	bare_wound_bonus = DEFAULT_WOUND_BONUS
	ricochets_max = DEFAULT_RICOCHETS_MAX
	ricochet_chance = DEFAULT_RICOCHET_CHANCE
	speed = HIGH_SPEED

	stamina = (damage * 2)
	eyeblur = DEFAULT_PAIN
	stutter = DEFAULT_PAIN
	embedding = list(embed_chance=DEFAULT_EMBED_CHANCE,fall_chance=DEFAULT_EMBEDDED_ITEM_FALLOUT,jostle_chance=DEFAULT_EMBEDDED_JOSTLE_CHANCE,ignore_throwspeed_threshold=TRUE,pain_stam_pct=DEFAULT_EMBEDDED_PAIN_STAM_PCT,pain_mult=DEFAULT_EMBEDDED_JOSTLE_PAIN_MULTIPLIER)

// LINE BREAK THE START OF CASINGS
/obj/item/ammo_casing/veb9by18
	name = "9x18mm cartridge"
	desc = "Surplus even from before the Cosmodrome Challenge."

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_COMPACT_MEDIUM_MSTIM
	projectile_type = /obj/projectile/bullet/veb9by18

/obj/item/ammo_casing/veb10by25
	name = "10x25mm cartridge"
	desc = "An older cartridge brought to modern standards."

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_COMPACT_LARGE_MSTIM
	projectile_type = /obj/projectile/bullet/veb10by25

/obj/item/ammo_casing/veb762by39
	name = "7.62x39mm cartridge"
	desc = "It gets the job done."

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_MEDIUM_INTERMEDIATE_MSTIM
	projectile_type = /obj/projectile/bullet/veb762by39

/obj/item/ammo_casing/veb762by54r
	name = "7.62x54mmR cartridge"
	desc = "It gets the job done."

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_MEDIUM_INTERMEDIATE_MSTIM
	projectile_type = /obj/projectile/bullet/veb762by54r

/obj/item/ammo_casing/veb12gauge
	name = "12 gauge buckshot shell"
	desc = "A buckshot shell with five pellets special made to thoroughly ruin someone's day."

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_SHOTGUN_LARGE_MSTIM
	projectile_type = /obj/projectile/bullet/veb12gauge

	variance = 35

/obj/item/ammo_casing/ss5point7by28
	name = "5.7x28mm cartridge"
	desc = "It gets the job do-- hey! This is from the enemy! Traitor!"

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_COMPACT_SMALL_SS
	projectile_type = /obj/projectile/bullet/ss5point7by28

/obj/item/ammo_casing/ss6point8by51
	name = "6.8x51mm cartridge"
	desc = "It gets the job do-- hey! This is from the enemy! Traitor!"

	icon = 'icons/obj/weapons/guns/ammo.dmi'
	icon_state = "s-casing"

	caliber = CALIBER_MEDIUM_LARGE_SS
	projectile_type = /obj/projectile/bullet/ss6point8by51


// LINE BREAK FOR THE START OF AMMO STACKS

/obj/item/ammo_box/magazine/ammo_stack/veb9by18
	name = "9x18m cartridges"
	desc = "A stack of up to 42 9x18mm cartridges."
	caliber = CALIBER_COMPACT_MEDIUM_MSTIM
	ammo_type = /obj/item/ammo_casing/veb9by18
	max_ammo = 42 // all of these are arbitrary numbers based off of pictures I have seen on the internet. I have thin girl hands and not manly grippers so this is to say that none of this is strictly accurate and can be given to or taken from
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/veb9by18/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/veb10by25
	name = "10x25mm cartridges"
	desc = "A stack of up to 34 10x25mm cartridges."
	caliber = CALIBER_COMPACT_LARGE_MSTIM
	ammo_type = /obj/item/ammo_casing/veb10by25
	max_ammo = 34 // all of these are arbitrary numbers based off of pictures I have seen on the internet. I have thin girl hands and not manly grippers so this is to say that none of this is strictly accurate and can be given to or taken from
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/veb10by25/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/veb762by39
	name = "7.62x39mm cartridges"
	desc = "A stack of up to 22 7.62x39mm cartridges."
	caliber = CALIBER_MEDIUM_INTERMEDIATE_MSTIM
	ammo_type = /obj/item/ammo_casing/veb762by39
	max_ammo = 22 // all of these are arbitrary numbers based off of pictures I have seen on the internet. I have thin girl hands and not manly grippers so this is to say that none of this is strictly accurate and can be given to or taken from
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/veb762by39/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/veb762by54r
	name = "7.62x54mmR cartridges"
	desc = "A stack of up to six 7.62x54mmR cartridges."
	caliber = CALIBER_MEDIUM_LARGE_MSTIM
	ammo_type = /obj/item/ammo_casing/veb762by54r
	max_ammo = 6
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/veb762by54r/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/veb12gauge
	name = "12 gauge shells"
	desc = "A stack of up to three 12 gauge shells."
	caliber = CALIBER_SHOTGUN_LARGE_MSTIM
	ammo_type = /obj/item/ammo_casing/veb12gauge
	max_ammo = 3
	casing_x_positions = list(
		-8,
		-4,
		0,
		4,
		8,
	)
	casing_y_padding = 9

/obj/item/ammo_box/magazine/ammo_stack/veb12gauge/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/ss5point7by28
	name = "5.7x28mm cartridges"
	desc = "A stack of up to 50 5.7x28mm cartridges."
	caliber = CALIBER_COMPACT_SMALL_SS
	ammo_type = /obj/item/ammo_casing/ss5point7by28
	max_ammo = 50
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/ss5point7by28/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/ss6point8by51
	name = "6.8x51mm cartridges"
	desc = "A stack of up to 28 6.8x51mm cartridges."
	caliber = CALIBER_MEDIUM_LARGE_SS
	ammo_type = /obj/item/ammo_casing/ss6point8by51
	max_ammo = 28
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/ss6point8by51/prefilled
	start_empty = FALSE

// LINE BREAK FOR GUNS

// LINE BREAK FOR FIRING PINS

/obj/item/firing_pin/wsexplorer
	name = "VEB Firing Pin"
	desc = "A firing pin created and used by VEB to allow the use of guns without the risk of them going off in preprogrammed civil areas."
	icon_state = "firing_pin_explorer"
	fail_message = "Location error!"
	pin_removable = FALSE

// This checks that the user isn't on the ship Z-level.
/obj/item/firing_pin/wsexplorer/pin_auth(mob/living/user)
	var/turf/station_check = get_turf(user)
	if(!station_check || is_centcom_level(station_check.z))
		return FALSE
	return TRUE

/obj/item/firing_pin/implant/wsbroken // for loot
	name = "broken firing pin"
	icon_state = "firing_pin_pindi"
	req_implant = /obj/item/implant/wsbroke_weapons_auth
	fail_message = "It seems to be broken!"

/obj/item/implant/wsbroke_weapons_auth
	name = "broken firearms authentication implant"
	desc = "Would let you shoot your guns, but it's clearly broken"
	icon_state = "auth"
	actions_types = null

/obj/item/firing_pin/wsprimitive // illegal, but crafted
	name = "primitive firing pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation. This one is a primitive version of one, and cannot be removed. "
	pin_removable = FALSE

/obj/item/firing_pin/wsnormal
	name = "firing pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation. This one is as standard as they come, allowing usage everywhere."

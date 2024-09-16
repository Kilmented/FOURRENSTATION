// Multiple flavors of GUN.
// Here's the types.
// /obj/item/gun/ballistic/automatic // basically comes down to "a semi and or automatic"
// /obj/item/gun/ballistic/rifle // basically comes down to "hit activate once to eject twice to cock between every shot"
// /obj/item/gun/ballistic/shotgun // basically comes down to "hit activate to cock and eject between every shot"
// /obj/item/gun/ballistic/revolver // basically comes down to "a semi but hit activate to drop the whole cylinder"
// That's all the relevant ones. Enjoy.
// Anyways, here's probably what you were looking for. The order is; Defines, Guns, magazines, and -at the very bottom- casings and then projectiles. Take care. - Jaeger

// Happy 100th PR, Warrenstation!

// LINE BREAK FOR CALIBER SIZE DEFINES

#define CALIBER_COMPACT "Compact"
#define CALIBER_MEDIUM "Medium"
#define CALIBER_LARGE "Large"

// LINE BREAK FOR CALIBER DEFINES

#define CALIBER_98MM "98mm"

// Special Warrenstation calibers start below!

/obj/item/ammo_box/magazine/uzim9mm
	name = "uzi magazine (9mm)"
	icon_state = "uzi9mm-32"
	base_icon_state = "uzi9mm"
	ammo_type = /obj/item/ammo_casing/ccmm
	caliber = list(CALIBER_9MM, CALIBER_COMPACT)
	max_ammo = 32

/obj/item/ammo_casing/ccmm
	name = "9mm bullet casing"
	desc = "A 9mm bullet casing."
	caliber = list(CALIBER_9MM, CALIBER_COMPACT)
	projectile_type = /obj/projectile/bullet/c9mm

/obj/projectile/bullet/c9mm
	name = "9mm bullet"
	damage = 30
	embedding = list(embed_chance=15, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

// LINE SEPERATION FOR RESKINS

// LINE SEPERATION FOR FIRING PINS

/obj/item/firing_pin/wsexplorer
	name = "SolStill TAC Firing Pin"
	desc = "A firing pin created and used by SolStill to allow civilians to use guns without the risk of them going off in preprogrammed civil areas. TAC doesn't stand for anything, it just sounds cool."
	icon_state = "firing_pin_explorer"
	fail_message = "Location error!"
	pin_removable = FALSE

// This checks that the user isn't on the station Z-level.
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

// LINE SEPERATION FOR AMMO BOXES

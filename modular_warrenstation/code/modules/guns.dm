// Multiple flavors of GUN.
// Here's the types.
// /obj/item/gun/ballistic/automatic // basically comes down to "a semi and or automatic"
// /obj/item/gun/ballistic/rifle // basically comes down to "hit activate once to eject twice to cock between every shot"
// /obj/item/gun/ballistic/shotgun // basically comes down to "hit activate to cock and eject between every shot"
// /obj/item/gun/ballistic/revolver // basically comes down to "a semi but hit activate to drop the whole cylinder"
// That's all the relevant ones. Enjoy.
// Anyways, here's probably what you were looking for. The order is; Defines, Guns, magazines, and -at the very bottom- casings and then projectiles. Take care. - Jaeger

// Happy 100th PR, Warrenstation!

// LINE BREAK FOR CALIBER DEFINES

#define CALIBER_WSCOMPACT "10x25mm Common Security Cartridge"

#define CALIBER_WSMEDIUM "5.56x45mm Common Gothic Cartridge"

#define CALIBER_WSLONG "8.6x70mm Common Magnum Cartridge"

#define CALIBER_WSSHOTGUN "12 gauge Common Cartridge"

// Special Warrenstation calibers start below!

#define CALIBER_WSGRENADE "40x46mm Common Grenade Launcher Cartridge"



// LINE SEPERATION FOR GUN EDITS

/obj/item/gun/ballistic/automatic/pistol/sol
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/pistol/sol/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/automatic/pistol/trappiste
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/c38
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/sol
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/takbok
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_smg
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_smg/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/automatic/m6pdw
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/e_gun/mini
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/modular_laser_rifle/carbine
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/pistol/plasma_thrower
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/pistol/plasma_marksman
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/shotgun_revolver
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/miecz
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_rifle/marksman
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_rifle
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_rifle/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/automatic/sol_rifle/machinegun
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_grenade_launcher
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/evil
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/xhihao_smg
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/shotgun/riot/sol
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/shotgun/riot/sol/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/rifle/boltaction/prime
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/laser
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/laser/hellgun
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/tesla_cannon
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/e_gun
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/energy/modular_laser_rifle
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/lanca
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/wylom
	pin = /obj/item/firing_pin/implant/wsbroken

// LINE SEPERATION FOR RESKINS

// LINE SEPERATION FOR FIRING PINS

/obj/item/firing_pin/wsexplorer
	name = "SolStill TAC Firing Pin"
	desc = "A firing pin created and used by SolStill to allow civilians to use guns without the risk of them going off in civil areas. TAC doesn't stand for anything, it just sounds cool."
	icon_state = "firing_pin_explorer"
	fail_message = "Location error!"

// This checks that the user isn't on the station Z-level.
/obj/item/firing_pin/wsexplorer/pin_auth(mob/living/user)
	var/turf/station_check = get_turf(user)
	if(!station_check || is_station_level(station_check.z))
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

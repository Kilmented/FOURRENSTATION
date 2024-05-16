// Multiple flavors of GUN.
// Here's the types.
// /obj/item/gun/ballistic/automatic // basically comes down to "a semi and or automatic"
// /obj/item/gun/ballistic/rifle // basically comes down to "hit activate once to eject twice to cock between every shot"
// /obj/item/gun/ballistic/shotgun // basically comes down to "hit activate to cock and eject between every shot"
// /obj/item/gun/ballistic/revolver // basically comes down to "a semi but hit activate to drop the whole cylinder"
// That's all the relevant ones. Enjoy.
// Anyways, here's probably what you were looking for. The order is; Defines, Guns, magazines, and -at the very bottom- casings and then projectiles. Take care. - Jaeger



// LINE BREAK FOR CALIBER DEFINES

#define CALIBER_WSCOMPACT "10x25mm Common Security Cartridge"

#define CALIBER_WSMEDIUM "5.56x45mm Common Gothic Cartridge"

#define CALIBER_WSLONG "8.6x70mm Common Magnum Cartridge"

#define CALIBER_WSSHOTGUN "12 gauge Common Cartridge"

// Special Warrenstation calibers start below!

#define CALIBER_WSGRENADE "40x46mm Common Grenade Launcher Cartridge"



// LINE SEPERATION FOR GUN EDITS

/obj/item/gun/ballistic/automatic/pistol/sol
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/pistol/sol/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/automatic/pistol/trappiste
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/c38
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/sol
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/takbok
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_smg
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_smg/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/automatic/m6pdw
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/e_gun/mini
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/modular_laser_rifle/carbine
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/pistol/plasma_thrower
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/pistol/plasma_marksman
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/shotgun_revolver
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/miecz
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_rifle/marksman
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_rifle
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_rifle/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/automatic/sol_rifle/machinegun
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_grenade_launcher
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/evil
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/xhihao_smg
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/shotgun/riot/sol
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/shotgun/riot/sol/evil
	pin = /obj/item/firing_pin/wsnormal

/obj/item/gun/ballistic/rifle/boltaction/prime
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/laser
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/laser/hellgun
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/tesla_cannon
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/e_gun
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/energy/modular_laser_rifle
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/lanca
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/wylom
	pin = /obj/item/firing_pin/wsexplorer

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

/obj/item/ammo_box/wscompact
	name = "10x25mm Common Security ammo box"
	desc = "A box of 10x25mm Common Security cartridges, holds fifty cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	caliber = CALIBER_WSCOMPACT
	ammo_type = /obj/item/ammo_casing/wscompact
	max_ammo = 50

/obj/item/ammo_box/wscompact/hitscan
	name = "10x25mm MilTek Security ammo box"
	desc = "A box of 10x25mm MilTek Security cartridges, holds fifty cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/wscompact/hitscan

/obj/item/ammo_box/wscompact/projectile
	name = "10x25mm RangR Security ammo box"
	desc = "A box of 10x25mm RangR Security cartridges, holds fifty cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/wscompact/projectile

/obj/item/ammo_box/wsmedium
	name = "5.56x45mm Common Gothic ammo box"
	desc = "A box of 5.56x45mm Common Gothic cartridges, holds twenty cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	caliber = CALIBER_WSMEDIUM
	ammo_type = /obj/item/ammo_casing/wsmedium
	max_ammo = 20

/obj/item/ammo_box/wsmedium/hitscan
	name = "5.56x45mm MilTek Gothic ammo box"
	desc = "A box of 5.56x45mm Miltek Gothic cartridges, holds twenty cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/wsmedium/hitscan

/obj/item/ammo_box/wsmedium/projectile
	name = "5.56x45mm RangR Gothic ammo box"
	desc = "A box of 5.56x45mm RangR Gothic cartridges, holds twenty cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/wsmedium/projectile

/obj/item/ammo_box/wslong
	name = "8.6x70mm Common Magnum ammo box"
	desc = "A box of 8.6x70mm Common Magnum cartridges, holds ten cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	caliber = CALIBER_WSLONG
	ammo_type = /obj/item/ammo_casing/wslong
	max_ammo = 10

/obj/item/ammo_box/wslong/hitscan
	name = "8.6x70mm MilTek Magnum ammo box"
	desc = "A box of 8.6x70mm MilTek Magnum cartridges, holds ten cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/wslong/hitscan

/obj/item/ammo_box/wslong/projectile
	name = "8.6x70mm RangR Magnum ammo box"
	desc = "A box of 8.6x70mm RangR Magnum cartridges, holds ten cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/wslong/projectile

/obj/item/ammo_box/wsshotgun
	name = "12 Gauge Common ammo box"
	desc = "A box of 12 Gauge Common cartridges, holds fifteen cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	caliber = CALIBER_WSSHOTGUN
	ammo_type = /obj/item/ammo_casing/wsshotgun
	max_ammo = 15

/obj/item/ammo_box/wsshotgun/hitscan
	name = "12 Gauge MilTek Slug ammo box"
	desc = "A box of 12 Gauge MilTek Slug cartridges, holds fifteen cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/wsshotgun/hitscan

/obj/item/ammo_box/wsshotgun/hitscan
	name = "12 Gauge RangR Flechette ammo box"
	desc = "A box of 12 Gauge RangR Flechette cartridges, holds fifteen cartridges."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "585box"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/wsshotgun/hitscan

// LINE SEPERATION FOR MAGAZINES

/obj/item/ammo_box/magazine/compactpistol
	name = "10 round 10x25mm Security pistol magazine"
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "pistol_35_standard"
	base_icon_state = "pistol_35_standard"
	caliber = CALIBER_WSCOMPACT
	max_ammo = 10
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_TINY
	start_empty = TRUE

/obj/item/ammo_box/magazine/compactpistol/extended
	name = "15 round 10x25mm Security extended pistol magazine"
	icon_state = "pistol_35_stended"
	max_ammo = 15
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_box/magazine/internal/compactrevolver
	name = "8 round 10x25mm Security cylinder"
	max_ammo = 8
	caliber = CALIBER_WSCOMPACT
	start_empty = TRUE

/obj/item/ammo_box/magazine/compactsmg
	name = "30 round 10x25mm Security SMG magazine"
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "pistol_35_stended"
	caliber = CALIBER_WSCOMPACT
	max_ammo = 30 // standard is whatever, short is divided by 1.5, extended is multiplied by 1.5
	w_class = WEIGHT_CLASS_SMALL
	start_empty = TRUE

/obj/item/ammo_box/magazine/compactsmg/short
	name = "20 round 10x25mm Security SMG magazine"
	icon_state = "pistol_35_standard"
	max_ammo = 20
	w_class = WEIGHT_CLASS_TINY // one size shorter than default

/obj/item/ammo_box/magazine/internal/mediumrevolver
	name = "6 round 5.56x45mm Gothic cylinder"
	caliber = CALIBER_WSMEDIUM
	max_ammo = 6
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/mediumboltrifle
	name = "5 round 5.56x45mm Gothic internal magazine"
	caliber = CALIBER_WSMEDIUM
	max_ammo = 5
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/mediumboltrifle/extended
	name = "15 round 5.56x45mm Gothic internal magazine"
	max_ammo = 15

/obj/item/ammo_box/magazine/mediumcarbine
	name = "30 round 5.56x45mm Gothic carbine magazine"
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "rifle_standard"
	ammo_type = /obj/item/ammo_casing/wsmedium
	caliber = CALIBER_WSMEDIUM
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	start_empty = TRUE

/obj/item/ammo_box/magazine/mediumcarbine/short
	name = "20 round 5.56x45mm Gothic carbine magazine"
	icon_state = "rifle_short"
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_TINY

/obj/item/ammo_box/magazine/internal/longrevolver
	name = "4 round 8.6x70mm Magnum cylinder"
	caliber = CALIBER_WSLONG
	max_ammo = 6
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/longboltrifle
	name = "5 round 8.6x70mm Magnum internal magazine"
	caliber = CALIBER_WSLONG
	max_ammo = 5
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/longboltrifle/extended
	name = "10 round 8.6x70mm Magnum internal magazine"
	max_ammo = 8

/obj/item/ammo_box/magazine/longrifle
	name = "10 round 8.6x70mm Magnum magazine"
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "granata_standard"
	ammo_type = /obj/item/ammo_casing/wslong
	max_ammo = 6
	caliber = CALIBER_WSLONG
	start_empty = TRUE

/obj/item/ammo_box/magazine/longrifle/extended
	name = "10 round 8.6x70mm Magnum internal magazine"
	icon_state = "granata_drum"
	max_ammo = 8 // really not much more of an improvement but is parity with the internal version.

/obj/item/ammo_box/magazine/internal/shotgun
	name = "5 round 12 Gauge tube"
	max_ammo = 5
	caliber = CALIBER_WSSHOTGUN
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/shotgun/six
	name = "6 round 12 Gauge tube"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shotgun/eight
	name = "8 round 12 Gauge tube"
	max_ammo = 8

/obj/item/ammo_box/magazine/internal/shotgun/two
	name = "2 round 12 Gauge breech"
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shotgun/two/cylinder
	name = "2 round 12 Gauge cylinder"
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shotgun/one
	name = "1 round 12 Gauge breech"
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/shotgun/three
	name = "3 round 12 Gauge internal magazine"
	max_ammo = 3

/obj/item/ammo_box/magazine/internal/grenade
	name = "1 round 40x46mm Grenade Launcher breech"
	max_ammo = 1
	caliber = CALIBER_WSGRENADE
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/grenade/eight
	name = "8 round 40x46mm Grenade Launcher cylinder"
	max_ammo = 8

// LINE SEPERATION FOR CASINGS

/obj/item/ammo_casing/wscompact
	name = "10x25mm Common Security Cartridge casing"
	desc = "A 10x25mm Common Security Cartridge casing."
	caliber = CALIBER_WSCOMPACT
	projectile_type = /obj/projectile/bullet/wscompact

/obj/item/ammo_casing/wscompact/hitscan
	name = "10x25mm MilTek Security Cartridge casing"
	desc = "A 10x25mm MilTek Security Cartridge casing."
	projectile_type = /obj/projectile/bullet/wscompact/hitscan

/obj/item/ammo_casing/wscompact/projectile
	name = "10x25mm RangR Security Cartridge casing"
	desc = "A 10x25mm RangR Security Cartridge casing."
	projectile_type = /obj/projectile/bullet/wscompact/projectile

/obj/item/ammo_casing/wsmedium
	name = "5.56x45mm Common Cartridge casing"
	desc = "A 5.56x45mm Common Cartridge casing."
	caliber = CALIBER_WSMEDIUM
	projectile_type = /obj/projectile/bullet/wsmedium

/obj/item/ammo_casing/wsmedium/hitscan
	name = "5.56x45mm MilTek Cartridge casing"
	desc = "A 5.56x45mm MilTek Cartridge casing."
	projectile_type = /obj/projectile/bullet/wsmedium/hitscan

/obj/item/ammo_casing/wsmedium/projectile
	name = "5.56x45mm RangR Cartridge casing"
	desc = "A 5.56x45mm RangR Cartridge casing."
	projectile_type = /obj/projectile/bullet/wsmedium/projectile

/obj/item/ammo_casing/wslong
	name = "8.6x70mm Common Magnum Cartridge casing"
	desc = "A 8.6x70mm Common Magnum Cartridge casing."
	caliber = CALIBER_WSLONG
	projectile_type = /obj/projectile/bullet/wslong

/obj/item/ammo_casing/wslong/hitscan
	name = "8.6x70mm MilTek Magnum Cartridge casing"
	desc = "A 8.6x70mm MilTek Magnum Cartridge casing."
	projectile_type = /obj/projectile/bullet/wslong/hitscan

/obj/item/ammo_casing/wslong/projectile
	name = "8.6x70mm RangR Magnum Cartridge casing"
	desc = "A 8.6x70mm RangR Magnum Cartridge casing."
	projectile_type = /obj/projectile/bullet/wslong/projectile

/obj/item/ammo_casing/wsshotgun
	name = "12 gauge Common Buckshot Cartridge"
	desc = "A 12 Gauge Common Buckshot cartridge."
	caliber = CALIBER_WSSHOTGUN
	icon_state = "rshell"
	projectile_type = /obj/projectile/bullet/wsshotgun
	pellets = 4
	variance = 20
	custom_materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*2)

/obj/item/ammo_casing/wsshotgun/rubber
	name = "12 gauge Common Rubbershot Cartridge"
	desc = "A 12 Gauge Common Rubbershot cartridge."
	icon_state = "rshell"
	projectile_type = /obj/projectile/bullet/wsshotgun/rubber
	pellets = 4
	variance = 20
	harmful = FALSE

/obj/item/ammo_casing/wsshotgun/hitscan
	name = "12 gauge MilTek Slug Cartridge"
	desc = "A 12 Gauge MilTek Slug cartridge."
	icon_state = "rshell"
	projectile_type = /obj/projectile/bullet/wsshotgun/hitscan
	pellets = 1
	variance = 0

/obj/item/ammo_casing/wsshotgun/hitscan
	name = "12 gauge RangR Flechette Cartridge"
	desc = "A 12 Gauge RangR Flechette Cartridge."
	icon_state = "rshell"
	projectile_type = /obj/projectile/bullet/wsshotgun/projectile
	pellets = 3
	variance = 10

/obj/item/ammo_casing/wsgrenade/common
	name = "40x46mm Common Grenade Launcher HE Cartridge"
	desc = "A cased high explosive grenade that self activates upon being fired out of a launcher."
	caliber = CALIBER_WSGRENADE
	icon_state = "40mmHE"
	projectile_type = /obj/projectile/bullet/wsgrenade/common

// LINE SEPERATION FOR PROJECTILES

/obj/projectile/bullet/wscompact
	name = "10x25mm Common Security bullet"
	damage = 15
	stamina = 18 // Required. 1.1x the base damage. - small buff for unarmored
	embedding = list(embed_chance=25, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/wscompact/hitscan
	name = "10x25mm MilTek Security bullet" // MilTek's gimmick is +hitscan +AP
	armour_penetration = 15 // +15 AP per size.
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/sniper
	impact_type = /obj/effect/projectile/impact/sniper
	muzzle_type = /obj/effect/projectile/muzzle/sniper
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = LIGHT_COLOR_DIM_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_DIM_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_DIM_YELLOW // Just copy everything from hitscan = true and below, it's p-much the one surefire way to keep things comfy.

/obj/projectile/bullet/wscompact/projectile
	name = "10x25mm RangR Security bullet" // RangR's gimmick is +5 damage + double the embed chance
	damage = 20 // add 5 damage, double the embed chance,
	stamina = 22 // Required. 1.1x the base damage.
	embedding = list(embed_chance=50, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/wsmedium
	name = "5.56x45mm Common Security bullet"
	damage = 30
	stamina = 35 // Required. 1.1x the base damage.
	embedding = list(embed_chance=30, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/wsmedium/hitscan
	name = "5.56x45mm MilTek bullet" // MilTek's gimmick is +hitscan +AP
	armour_penetration = 30 // +15 AP per size.
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/sniper
	impact_type = /obj/effect/projectile/impact/sniper
	muzzle_type = /obj/effect/projectile/muzzle/sniper
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = LIGHT_COLOR_DIM_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_DIM_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_DIM_YELLOW

/obj/projectile/bullet/wsmedium/projectile
	name = "5.56x45mm RangR bullet"
	damage = 35
	stamina = 38.5
	embedding = list(embed_chance=60, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/wslong
	name = "8.6x70mm Common Magnum bullet"
	damage = 45
	stamina = 50
	embedding = list(embed_chance=35, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/wslong/hitscan
	name = "8.6x70mm MilTek Magnum bullet" // MilTek's gimmick is +hitscan +AP
	armour_penetration = 45 // +15 AP per size.
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/sniper
	impact_type = /obj/effect/projectile/impact/sniper
	muzzle_type = /obj/effect/projectile/muzzle/sniper
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = LIGHT_COLOR_DIM_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_DIM_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_DIM_YELLOW

/obj/projectile/bullet/wslong/projectile
	name = "8.6x70mm RangR Magnum bullet"
	damage = 50
	stamina = 55
	embedding = list(embed_chance=70, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/wsshotgun
	name = "12 Gauge Common Buckshot pellet"
	damage = 10
	stamina = 11
	wound_bonus = 5
	bare_wound_bonus = 5
	wound_falloff_tile = -2.5 // low damage + additional dropoff will already curb wounding potential anything past point blank
	embedding = null

/obj/projectile/bullet/wsshotgun/rubber
	name = "12 Gauge Common Rubbershot ball"
	damage = 0
	stamina = 20
	speed = 1.5
	sharpness = NONE
	embedding = null
	wound_bonus = 0
	bare_wound_bonus = 0

/obj/projectile/bullet/wsshotgun/hitscan
	name = "12 Gauge MilTek Slug"
	damage = 45
	stamina = 49.5
	wound_bonus = 5
	bare_wound_bonus = 10
	embedding = list(embed_chance=30, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = 0

/obj/projectile/bullet/wsshotgun/projectile
	name = "12 Gauge RangR Flechette"
	damage = 20
	stamina = 22
	wound_bonus = 5
	bare_wound_bonus = 20
	weak_against_armour = TRUE
	embedding = list(embed_chance=50, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = 0

/obj/projectile/bullet/wsgrenade/common
	name ="40x46mm Common Grenade Launcher HE Cartridge charge"
	desc = "HOLY SHIT!"
	icon_state= "bolter"
	damage = 80
	embedding = null
	shrapnel_type = null

/obj/projectile/bullet/wsgrenade/common/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	explosion(target, devastation_range = -1, light_impact_range = 2, flame_range = 3, flash_range = 1, adminlog = FALSE, explosion_cause = src)
	return BULLET_ACT_HIT

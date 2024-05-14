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



// LINE BREAK FOR GUN TEMPLATES

/obj/item/gun/ballistic/automatic/pistol/wscompactpistol
	name = "\improper M2111"
	desc = "A protoype of an upgrade to a classic .45 handgun rechambered to 10x25mm Security, ready for use in all sectors."
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'
	inhand_icon_state = "colt"
	lefthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_lefthand.dmi'
	righthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/compactpistol
	can_suppress = FALSE
	fire_sound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wscompactrevolver
	name = "\improper C10-8"
	desc = "A prototype revolver chambered in 10x25mm Security, ready for use in all sectors. Eight shots, make them count!"
	icon_state = "revolver"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/compactrevolver
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/wscompactsmg
	name = "\improper NTR SMG"
	desc = "A prototype full-auto 10x25mm Security submachine gun, designated project 'SABER'. Has a threaded barrel for suppressors."
	icon_state = "saber"
	burst_size = 1
	actions_types = list()
	mag_display = TRUE
	empty_indicator = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/compactsmg
	bolt_type = BOLT_TYPE_LOCKING
	show_bolt_icon = FALSE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wsmediumrevolver
	name = "\improper C20-6"
	desc = "A prototype revolver chambered in 5.56x45mm Gothic, ready for use in all sectors. Six shots, enough to kill anything that moves!"
	icon_state = "revolver"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/mediumrevolver
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/rifle/boltaction/wsmediumboltrifle
	name = "\improper Sakhno Precision Rifle"
	desc = "A bleeding edge 'precision' boltrifle that is often given out to the less fortunate to arm themselves against wildlife."
	icon_state = "sakhno"
	inhand_icon_state = "sakhno"
	worn_icon_state = "sakhno"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/mediumboltrifle
	can_bayonet = TRUE
	knife_x_offset = 42
	knife_y_offset = 12
	can_be_sawn_off = FALSE
	weapon_weight = WEAPON_HEAVY
	can_jam = TRUE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/wsmediumcarbine
	name = "\improper NTR ARG-63"
	desc = "SolStill's bleeding edge prototype based on the Stoner design, fitted with a light polymer frame and other tactical furniture, and chambered in 5.56x45 Gothic - nicknamed 'Boarder' by Special Operations teams."
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns_gubman2.dmi'
	icon_state = "arg"
	inhand_icon_state = "arg"
	slot_flags = 0
	accepted_magazine_type = /obj/item/ammo_box/magazine/mediumcarbine
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wslongrevolver
	name = "\improper C30-4"
	desc = "A prototype revolver chambered in 8.6x70mm Magnum, ready for use in all sectors. FOUR shots, more than enough to kill anything that moves!"
	icon_state = "revolver"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/longrevolver
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/rifle/boltaction/wslongboltrifle
	name = "\improper Sakhno Super-Precision Rifle"
	desc = "The standard issue in long boltrifles. Was bleeding edge a week ago."
	icon_state = "sakhno"
	inhand_icon_state = "sakhno"
	worn_icon_state = "sakhno"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/longboltrifle
	can_bayonet = TRUE
	knife_x_offset = 42
	knife_y_offset = 12
	can_be_sawn_off = FALSE
	weapon_weight = WEAPON_HEAVY
	can_jam = TRUE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/sniper_rifle/wslongrifle
	name = "SAG-107 anti-personnel rifle"
	desc = "An illegal Scarborrowed Arms rendition of an prototype bleeding edge rifle."
	icon_state = "sniper2"
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle.ogg'
	suppressed_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle_s.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	load_sound = 'sound/weapons/gun/sniper/mag_insert.ogg'
	rack_sound = 'sound/weapons/gun/sniper/rack.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	can_suppress = TRUE
	can_unsuppress = TRUE
	recoil = 1.8
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/longrifle
	fire_delay = 55
	burst_size = 1
	slot_flags = ITEM_SLOT_BACK
	mag_display = TRUE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wsshotgunrevolver
	name = "\improper C40-2"
	desc = "A prototype revolver chambered in 12 Gauge, ready for use in all sectors. Two shotty shots, what's the point?"
	icon_state = "revolver"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shotgun/two/cylinder
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/shotgun/wsdoublebarrel
	name = "double-barreled shotgun"
	desc = "A true frontier classic."
	icon_state = "dshotgun"
	inhand_icon_state = "shotgun_db"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	force = 10
	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shotgun/two
	obj_flags = UNIQUE_RENAME
	rack_sound_volume = 0
	unique_reskin = list("Default" = "dshotgun",
						"Dark Red Finish" = "dshotgun_d",
						"Ash" = "dshotgun_f",
						"Faded Grey" = "dshotgun_g",
						"Maple" = "dshotgun_l",
						"Rosewood" = "dshotgun_p"
						)
	semi_auto = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	pb_knockback = 3 // it's a super shotgun!
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/shotgun/wspumpshotgun
	name = "\improper S3-X shotgun"
	desc = "A bleeding edge prototype improvement of a traditional shotgun with wood furniture and a five shot tubular magazine on the underneath."
	icon_state = "shotgun"
	worn_icon_state = null
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	inhand_icon_state = "shotgun"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	fire_sound = 'sound/weapons/gun/shotgun/shot.ogg'
	fire_sound_volume = 90
	rack_sound = 'sound/weapons/gun/shotgun/rack.ogg'
	load_sound = 'sound/weapons/gun/shotgun/insert_shell.ogg'
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shotgun
	semi_auto = FALSE
	internal_magazine = TRUE
	casing_ejector = FALSE
	bolt_wording = "pump"
	cartridge_wording = "shell"
	tac_reloads = FALSE
	weapon_weight = WEAPON_HEAVY
	pb_knockback = 2
	pin = /obj/item/firing_pin/implant/wsbroken


// LINE BREAK FOR ACTUAL GUNS

// Guns are broken into two tiers. Loadout, and loot. Loadout is "free" roundstart, and a reduced projectile_damage_multiplier. Found guns are better but require a new pin.

/obj/item/gun/ballistic/automatic/pistol/wscompactpistol/compactsemi
	name = "\improper (COMPANY-MODEL REDACTED) Clarissa"
	desc = "An autoloading pistol chambered in 10x25mm Security. Held to the SolStill standard- means it's just reliable enough to take out rats and terrorists."
	icon = 'modular_warrenstation/icons/obj/guns/thirtytwo.dmi'
	inhand_icon_state = "clarissa"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	can_suppress = TRUE
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wscompactrevolver/compactrevolver
	name = "\improper (COMPANY-MODEL REDACTED) Detective"
	desc = "A compact revolver chambered in 10x25mm Security. Designed to be reminiscent of the Noir days, designs of its ilk are modernized to carry eight shots."
	icon = 'modular_warrenstation/icons/obj/guns/thirtytwo.dmi'
	inhand_icon_state = "detective"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wsmediumrevolver/mediumrevolver
	name = "\improper (COMPANY-MODEL REDACTED) Mistral"
	desc = "A modernized revolver chambered in 5.56x45mm Gothic. A classic design, the first of its kind to be updated for standardized ammunition."
	icon = 'modular_warrenstation/icons/obj/guns/thirtytwo.dmi'
	inhand_icon_state = "mistral"
	w_class = WEIGHT_CLASS_NORMAL
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/revolver/wslongrevolver/longrevolver
	name = "\improper (COMPANY-MODEL REDACTED) Hornet"
	desc = "A large revolver chambered in 8.6x70mm Magnum. Seemingly a misnomer, the name alludes to the stinging in the wrists after use."
	icon = 'modular_warrenstation/icons/obj/guns/thirtytwo.dmi'
	inhand_icon_state = "hornet"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/wscompactsmg/compactsmg
	name = "\improper (COMPANY-MODEL REDACTED) Vector"
	desc = "A fully automatic folding stock 10x25mm Security submachine gun. Once a design owned by a dead company, it has been revitalized sees popular use in mercenary circles."
	icon = 'modular_warrenstation/icons/obj/guns/fourtyeight.dmi'
	inhand_icon_state = "vector"
	burst_size = 1
	actions_types = list()
	empty_indicator = FALSE
	bolt_type = BOLT_TYPE_LOCKING
	show_bolt_icon = TRUE
	can_suppress = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_SUITSTORE
	projectile_damage_multiplier = 0.9 // haha.
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/automatic/wsmediumcarbine/mediumrifle
	name = "\improper (COMPANY-MODEL REDACTED) Lord"
	desc = "A semi-automatic 5.56x45mm Gothic rifle. The right arm of SolStill's free worlds."
	icon = 'modular_warrenstation/icons/obj/guns/fourtyeight.dmi'
	inhand_icon_state = "lord"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_SUITSTORE
	accepted_magazine_type = /obj/item/ammo_box/magazine/mediumcarbine
	can_suppress = FALSE
	fire_delay = 1
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/rifle/boltaction/wsmediumboltrifle/mediumboltgun
	name = "\improper (COMPANY-MODEL REDACTED) Zatvor"
	desc = "A bolt action 5.56x45mm Gothic rifle. It's awfully.. something. Will totally get the job done, though."
	icon = 'modular_warrenstation/icons/obj/guns/fourtyeight.dmi'
	inhand_icon_state = "zatvor"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/mediumboltrifle
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_SUITSTORE
	can_jam = FALSE
	projectile_damage_multiplier = 1.4
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/rifle/boltaction/wslongboltrifle/longboltgun
	name = "\improper (COMPANY-MODEL REDACTED) Kubok"
	desc = "A bolt action 8.6x70mm Magnum rifle. Slower than most, but sends slugs down range like nobody's business."
	icon = 'modular_warrenstation/icons/obj/guns/fourtyeight.dmi'
	inhand_icon_state = "kubok"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/longboltrifle
	can_bayonet = FALSE
	can_be_sawn_off = FALSE
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_SUITSTORE
	can_jam = FALSE
	projectile_damage_multiplier = 1.5
	pin = /obj/item/firing_pin/implant/wsbroken

/obj/item/gun/ballistic/shotgun/wspumpshotgun/shotgun
	name = "\improper (COMPANY-MODEL REDACTED) Kuh"
	desc = "A bleeding edge prototype improvement of a traditional shotgun with wood furniture and a five shot tubular magazine on the underneath."
	icon = 'modular_warrenstation/icons/obj/guns/fourtyeight.dmi'
	inhand_icon_state = "kuh"
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	w_class = BULKY
	force = 10
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_SUITSTORE
	weapon_weight = WEAPON_HEAVY
	pb_knockback = 2
	pin = /obj/item/firing_pin/implant/wsbroken

// LINE SEPERATION FOR LOADOUT VERSIONS

/obj/item/gun/ballistic/automatic/pistol/wscompactpistol/compactsemi/loadout
	projectile_damage_multiplier = 0.9
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/wscompactrevolver/compactrevolver/loadout
	projectile_damage_multiplier = 0.9
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/wsmediumrevolver/mediumrevolver/loadout
	projectile_damage_multiplier = 0.9
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/revolver/wslongrevolver/longrevolver/loadout
	projectile_damage_multiplier = 0.8 // haha.
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/wscompactsmg/compactsmg/loadout
	projectile_damage_multiplier = 0.8
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/automatic/wsmediumcarbine/loadout
	projectile_damage_multiplier = 0.9
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/rifle/boltaction/wsmediumboltrifle/mediumboltgun/loadout
	projectile_damage_multiplier = 1.3
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/rifle/boltaction/wslongboltrifle/longboltgun/loadout
	projectile_damage_multiplier = 1.3
	pin = /obj/item/firing_pin/wsexplorer

/obj/item/gun/ballistic/shotgun/wspumpshotgun/shotgun
	projectile_damage_multiplier = 0.9
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

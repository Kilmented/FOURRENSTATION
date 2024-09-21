// Over-under 8mm marsian super rifle

/obj/item/gun/ballistic/marsian_super_rifle
	name = "\improper Fukiya double-barrel rifle"
	desc = "A double-barrel over-under rifle of considerable length that fires the powerful 8mm Marsian cartridge."

	icon = 'modular_warrenstation/lethalguns/icons/guns48x.dmi'
	icon_state = "fukiya"

	worn_icon = 'modular_warrenstation/lethalguns/icons/mob_sprites/worn.dmi'
	worn_icon_state = "fukiya"

	lefthand_file = 'modular_warrenstation/lethalguns/icons/mob_sprites/lefthand.dmi'
	righthand_file = 'modular_warrenstation/lethalguns/icons/mob_sprites/righthand.dmi'
	inhand_icon_state = "fukiya"

	SET_BASE_PIXEL(-8, 0)

	fire_sound = 'modular_warrenstation/lethalguns/sound/chokyu/chokyu.wav'
	load_sound = 'modular_warrenstation/lethalguns/sound/ramu/ramu_load.wav'
	can_suppress = FALSE

	pickup_sound = 'modular_warrenstation/lethalguns/sound/pickup_sounds/drop_heavygun.wav'
	drop_sound = 'modular_warrenstation/lethalguns/sound/pickup_sounds/drop_heavygun.wav'

	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force = 15

	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/c8marsian

	can_bayonet = FALSE
	can_be_sawn_off = FALSE
	semi_auto = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	can_be_sawn_off = FALSE
	internal_magazine = TRUE
	casing_ejector = FALSE
	can_bayonet = FALSE

	cartridge_wording = "shell"
	tac_reloads = FALSE
	weapon_weight = WEAPON_HEAVY

	pb_knockback = 2
	recoil = 2
	muzzle_flash_lum = 3
	muzzleflash_iconstate = "muzzle_flash_medium"

/obj/item/gun/ballistic/marsian_super_rifle/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/gun_launches_little_guys, throwing_force = 3, throwing_range = 5)

/obj/item/gun/ballistic/marsian_super_rifle/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_XHIHAO)

/obj/item/gun/ballistic/marsian_super_rifle/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/marsian_super_rifle/examine_more(mob/user)
	. = ..()

	. += "The Fukiya is an over-under sporting rifle that saw popular use on both Mars and Jupiter. \
		This is due to the weapon's ability to hurt both heavily modded targets in the case of Mars, \
		or heavily armored targets in the case of Jupiter."

	return .

/obj/item/gun/ballistic/marsian_super_rifle/starts_empty
	spawn_magazine_type = /obj/item/ammo_box/magazine/internal/c8marsian/starts_empty

// Magazine fed bolt-action rifle firing 8mm marsian

/obj/item/gun/ballistic/rifle/chokyu
	name = "\improper Chokyu sniper rifle"
	desc = "A boltaction sniper rifle firing 8mm marsian rounds. Fits Chokyu sniper magazines."

	icon = 'modular_warrenstation/lethalguns/icons/guns48x.dmi'
	icon_state = "chokyu"

	worn_icon = 'modular_warrenstation/lethalguns/icons/mob_sprites/worn.dmi'
	worn_icon_state = "evilgun"

	lefthand_file = 'modular_warrenstation/lethalguns/icons/mob_sprites/lefthand.dmi'
	righthand_file = 'modular_warrenstation/lethalguns/icons/mob_sprites/righthand.dmi'
	inhand_icon_state = "evilgun"

	inhand_x_dimension = 32
	inhand_y_dimension = 32

	fire_sound = 'modular_warrenstation/lethalguns/sound/chokyu/chokyu.wav'
	load_sound = 'modular_warrenstation/lethalguns/sound/chokyu/chokyu_magin.wav'
	rack_sound = 'modular_warrenstation/lethalguns/sound/chokyu/chokyu_boltout.wav'
	bolt_drop_sound = 'modular_warrenstation/lethalguns/sound/chokyu/chokyu_boltin.wav'
	suppressed_sound = 'modular_warrenstation/lethalguns/sound/chokyu/chokyu_silenced.wav'
	can_suppress = TRUE
	can_unsuppress = TRUE

	pickup_sound = 'modular_warrenstation/lethalguns/sound/pickup_sounds/drop_heavygun.wav'
	drop_sound = 'modular_warrenstation/lethalguns/sound/pickup_sounds/drop_heavygun.wav'

	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	weapon_weight = WEAPON_HEAVY
	recoil = 2

	accepted_magazine_type = /obj/item/ammo_box/magazine/c8marsian
	internal_magazine = FALSE

	can_bayonet = FALSE
	can_be_sawn_off = FALSE
	mag_display = TRUE
	tac_reloads = TRUE
	rack_delay = 1 SECONDS
	suppressor_x_offset = 10

	muzzle_flash_lum = 3
	muzzleflash_iconstate = "muzzle_flash_medium"

/obj/item/gun/ballistic/rifle/chokyu/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 3)

/obj/item/gun/ballistic/rifle/chokyu/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_XHIHAO)

/obj/item/gun/ballistic/rifle/chokyu/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/rifle/chokyu/examine_more(mob/user)
	. = ..()

	. += "The Chokyu was a special purpose sniper rifle designed for Solfed operations forces. \
		A rifle that can be compacted for easier transport, while having sufficient accuracy to \
		take out targets at long range. This is all combined with a powerful round that is able to \
		readily handle most targets."

	return .

/obj/item/gun/ballistic/rifle/chokyu/starts_empty
	spawnwithmagazine = FALSE

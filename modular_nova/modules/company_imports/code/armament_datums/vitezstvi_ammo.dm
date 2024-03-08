/datum/armament_entry/company_import/vitezstvi
	category = VITEZSTVI_AMMO_NAME
	company_bitflag = CARGO_COMPANY_VITEZSTVI_AMMO

// Weapon accessories

/datum/armament_entry/company_import/vitezstvi/accessory
	subcategory = "Weapon Accessories"

/datum/armament_entry/company_import/vitezstvi/accessory/suppressor
	item_type = /obj/item/suppressor/standard
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/vitezstvi/accessory/small_case
	item_type = /obj/item/storage/toolbox/guncase/nova/pistol/empty
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/vitezstvi/accessory/large_case
	item_type = /obj/item/storage/toolbox/guncase/nova/empty
	cost = PAYCHECK_COMMAND * 2

// Boxes of non-shotgun ammo

/datum/armament_entry/company_import/vitezstvi/ammo_boxes
	subcategory = "Ammunition Boxes"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/strilka_rubber
	item_type = /obj/item/ammo_box/c310_cargo_box/rubber

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/cesarzowa_rubber
	item_type = /obj/item/ammo_box/c27_54cesarzowa/rubber

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/sol35_disabler
	item_type = /obj/item/ammo_box/c35sol/incapacitator

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/sol35_ripper
	item_type = /obj/item/ammo_box/c35sol/ripper
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/sol40_disabler
	item_type = /obj/item/ammo_box/c40sol/fragmentation

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/sol40_pierce
	item_type = /obj/item/ammo_box/c40sol/pierce
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/trappiste585_disabler
	item_type = /obj/item/ammo_box/c585trappiste/incapacitator

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/trappiste585_hollowpoint
	item_type = /obj/item/ammo_box/c585trappiste/hollowpoint
	cost = PAYCHECK_CREW * 2

// Revolver speedloaders

/datum/armament_entry/company_import/vitezstvi/speedloader
	subcategory = "Speedloaders"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/vitezstvi/speedloader/detective_lethal
	item_type = /obj/item/ammo_box/c38

/datum/armament_entry/company_import/vitezstvi/speedloader/detective_dumdum
	item_type = /obj/item/ammo_box/c38/dumdum

/datum/armament_entry/company_import/vitezstvi/speedloader/detective_bouncy
	item_type = /obj/item/ammo_box/c38/match

// Shotgun boxes

/datum/armament_entry/company_import/vitezstvi/shot_shells
	subcategory = "Shotgun Shells"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/vitezstvi/shot_shells/slugs
	item_type = /obj/item/ammo_box/advanced/s12gauge

/datum/armament_entry/company_import/vitezstvi/shot_shells/buckshot
	item_type = /obj/item/ammo_box/advanced/s12gauge/buckshot

/datum/armament_entry/company_import/vitezstvi/shot_shells/beanbag_slugs
	item_type = /obj/item/ammo_box/advanced/s12gauge/bean

/datum/armament_entry/company_import/vitezstvi/shot_shells/rubbershot
	item_type = /obj/item/ammo_box/advanced/s12gauge/rubber

/datum/armament_entry/company_import/vitezstvi/shot_shells/magnum_buckshot
	item_type = /obj/item/ammo_box/advanced/s12gauge/magnum

/datum/armament_entry/company_import/vitezstvi/shot_shells/express_buckshot
	item_type = /obj/item/ammo_box/advanced/s12gauge/express

/datum/armament_entry/company_import/vitezstvi/shot_shells/hunter_slug
	item_type = /obj/item/ammo_box/advanced/s12gauge/hunter

/datum/armament_entry/company_import/vitezstvi/shot_shells/flechettes
	item_type = /obj/item/ammo_box/advanced/s12gauge/flechette

/datum/armament_entry/company_import/vitezstvi/shot_shells/hornet_nest
	item_type = /obj/item/ammo_box/advanced/s12gauge/beehive

/datum/armament_entry/company_import/vitezstvi/shot_shells/stardust
	item_type = /obj/item/ammo_box/advanced/s12gauge/antitide

/datum/armament_entry/company_import/vitezstvi/shot_shells/confetti
	item_type = /obj/item/ammo_box/advanced/s12gauge/honkshot

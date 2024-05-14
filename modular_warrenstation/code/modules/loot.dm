//
//
// BASETYPE
//
//

/obj/structure/maintenance_loot_structure
	name = "abandoned crate"
	icon = 'modular_warrenstation/icons/obj/loot_structures.dmi'
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	obj_flags = CAN_BE_HIT
	pass_flags_self = LETPASSTHROW|LETPASSCLICKS
	max_integrity = 100

	/// What storage datum we use
	var/storage_datum_to_use = /datum/storage/maintenance_loot_structure
	/// Weighted list of the loot that can spawn in this
	var/list/loot_weighted_list = list(
		/obj/effect/spawner/random/maintenance = 1,
	)
	/// This one is going to be weird, a string of dice to use when rolling number of contents
	var/loot_spawn_dice_string = "2d4+1"

/obj/structure/maintenance_loot_structure/Initialize(mapload)
	. = ..()
	create_storage(storage_type = storage_datum_to_use)
	make_contents()

// Since it doesn't want to play nice for whatever reason
/obj/structure/maintenance_loot_structure/attack_hand(mob/living/user)
	if(!user.can_perform_action(src, NEED_HANDS))
		return ..()
	atom_storage.open_storage(user)
	return TRUE

/// Fills random contents into this structure's inventory, starting a loop to respawn loot if the container is empty later
/obj/structure/maintenance_loot_structure/proc/make_contents()
	var/refill_check_time = 10 MINUTES
	if(!length(contents))
		spawn_loot()
		refill_check_time = 30 MINUTES
	addtimer(CALLBACK(src, PROC_REF(make_contents)), refill_check_time)

/// Spawns a random amount of loot into the structure, random numbers based on the amount of storage slots inside it
/obj/structure/maintenance_loot_structure/proc/spawn_loot()
	var/random_loot_amount = roll(loot_spawn_dice_string)
	for(var/loot_spawn in 1 to random_loot_amount)
		var/obj/new_loot = pick_weight(loot_weighted_list)
		new new_loot(src)
	Shake(2, 2, 1 SECONDS)

/datum/storage/maintenance_loot_structure
	max_slots = 9
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 6
	numerical_stacking = FALSE
	rustle_sound = FALSE
	screen_max_columns = 3
	/// What sound this makes when people open it's storage
	var/opening_sound = 'modular_warrenstation/sound/plastic.mp3'

/datum/storage/maintenance_loot_structure/open_storage(mob/to_show)
	. = ..()
	if(!.)
		return
	playsound(parent, opening_sound, 50, TRUE)

// Loot items basetype, for convenience
/obj/item/epic_loot
	name = "epic loot!!!!!"
	desc = "Unknown purpose, unknown maker, unknown value. The only thing I know for real: There will be loot."
	icon = 'modular_warrenstation/icons/obj/epic_loot.dmi'
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	inhand_icon_state = "binoculars"
	w_class = WEIGHT_CLASS_SMALL

//
//
// ITEMS
//
//

// Grenade fuze, an old design from an old time past. You can still make a pretty good grenade with it though
/obj/item/epic_loot/grenade_fuze
	name = "grenade fuze"
	desc = "The fuze of an older grenade type that used to see common use around known space."
	icon_state = "fuze"
	inhand_icon_state = "pen"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// The filter part of a water filter machine, though these machines are insanely rare due to modern synthesis technology
/obj/item/epic_loot/water_filter
	name = "water filter cartridge"
	desc = "A blue polymer tube filled with filter medium for use in an industrial water filtration unit."
	icon_state = "water_filter"
	inhand_icon_state = "miniFE"
	drop_sound = 'sound/items/handling/weldingtool_drop.ogg'
	pickup_sound = 'sound/items/handling/weldingtool_pickup.ogg'

// Analog thermometer, how to tell temperature before gas analyzers were cool
/obj/item/epic_loot/thermometer
	name = "analog thermometer"
	desc = "A highly outdated, and likely broken, analog thermometer."
	icon_state = "thermometer"
	inhand_icon_state = "razor"
	drop_sound = 'sound/items/handling/multitool_drop.ogg'
	pickup_sound = 'sound/items/handling/multitool_pickup.ogg'

// A box of nails, impossible tech on a space station
/obj/item/epic_loot/nail_box
	name = "box of nails"
	desc = "A pristine box of nails, a method of keeping things together that happens to be insanely rare in space."
	icon_state = "nails"
	inhand_icon_state = "rubberducky"
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// Used for joining together plastics, ideally.
/obj/item/epic_loot/cold_weld
	name = "tube of cold weld"
	desc = "A tube of cold weld, used to join together plastics, usually for repair."
	icon_state = "cold_weld"
	inhand_icon_state = "razor"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// An electronic motor
/obj/item/epic_loot/electric_motor
	name = "electric motor"
	desc = "An electrically driven motor for industrial applications."
	icon_state = "motor"
	inhand_icon_state = "miniFE"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound = 'sound/items/handling/cardboardbox_pickup.ogg'

// Current converters, these change one rating of current into another in a mostly safe manner
/obj/item/epic_loot/current_converter
	name = "current converter"
	desc = "A device for regulating electric current that passes through it."
	icon_state = "current_converter"
	inhand_icon_state = "miniFE"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/weldingtool_drop.ogg'
	pickup_sound = 'sound/items/handling/weldingtool_pickup.ogg'

// Signal amplifiers, used to take a faint signal and return it stronger than before
/obj/item/epic_loot/signal_amp
	name = "signal amplifier"
	desc = "A device for taking weakened input signals and strengthening them for use or listening."
	icon_state = "signal_amp"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// Thermal camera modules
/obj/item/epic_loot/thermal_camera
	name = "thermal camera module"
	desc = "An infrared sensing device used for the production of thermal camera systems."
	icon_state = "thermal"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// Shuttle gyroscopes, AKA how a shuttle realizes which way it's pointing
/obj/item/epic_loot/shuttle_gyro
	name = "shuttle gyroscope"
	desc = "A bulky device used by shuttles and other space faring vessels to find the direction they are facing."
	icon_state = "shuttle_gyro"
	inhand_icon_state = "miniFE"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

/obj/item/epic_loot/shuttle_gyro/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

// Phased array elements, combine a bunch together to get god's strongest radar, or whatever else you can think of
/obj/item/epic_loot/phased_array
	name = "phased array element"
	desc = "An element of a larger phased array. These combine together to produce sensing and scanning devices used on most common space-faring vessels."
	icon_state = "phased_array"
	inhand_icon_state = "blankplaque"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// Shuttle batteries, used to power electronics while the engines are off
/obj/item/epic_loot/shuttle_battery
	name = "shuttle battery"
	desc = "A massive shuttle-grade battery, used to keep the electronics of space-faring vessel powered while the main engines are de-activated."
	icon_state = "ship_battery"
	inhand_icon_state = "blankplaque"
	w_class = WEIGHT_CLASS_BULKY
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound = 'sound/items/handling/cardboardbox_pickup.ogg'

/obj/item/epic_loot/shuttle_battery/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

// Industrial fuel conditioner, used to keep most fuel-burning machines within regulations for waste emissions
/obj/item/epic_loot/fuel_conditioner
	name = "fuel conditioner"
	desc = "A polymer canister of advanced fuel conditioner, used to keep fuel burning vehicles and machines burning relatively clean."
	icon_state = "fuel_conditioner"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound = 'sound/items/handling/cardboardbox_pickup.ogg'

// Bullet and stab resistant fabric, use lots to make something stop bullets a bit better
/obj/item/epic_loot/aramid
	name = "high-resistance fabric"
	desc = "A yellow weaved fabric that has exceptional resistance to piercing and slashing, as well as a number of other common damage sources."
	icon_state = "aramid"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

// You know they make your pouches and such out of this stuff?
/obj/item/epic_loot/cordura
	name = "polymer weave fabric"
	desc = "Common high-strength fabric used in the production of a large number of equipment."
	icon_state = "cordura"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

// It's like the one above but for different stuff
/obj/item/epic_loot/ripstop
	name = "tear-resistant fabric"
	desc = "A reinforced fabric made to be highly resistant to tearing, and to have a limited ability to repair itself."
	icon_state = "ripstop"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

// Computer fans
/obj/item/epic_loot/device_fan
	name = "device fan"
	desc = "An electronics cooling fan, used to keep computers and the like at reasonable temperatures while working."
	icon_state = "device_fan"
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// A display of some sort, this one probably still works
/obj/item/epic_loot/display
	name = "display"
	desc = "An electronic display, used in any number of machines to display information to users."
	icon_state = "display"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// A display of some sort, this one for sure does not work
/obj/item/epic_loot/display_broken
	name = "broken display"
	desc = "An electronic display, used in any number of machines to display information to users. This one is broken."
	icon_state = "display_broken"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// You think nvidia still makes this shit? Nah son we got the konjin preemo stuff here
/obj/item/epic_loot/graphics
	name = "graphics processor"
	desc = "A large processor card for the handling of computer generated graphics."
	icon_state = "graphics"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// A military general-use circuit board
/obj/item/epic_loot/military_circuit
	name = "military-grade circuit board"
	desc = "A small circuit board commonly seen used by military-grade electronics."
	icon_state = "circuit_military"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// A civilian general-use circuit board
/obj/item/epic_loot/civilian_circuit
	name = "general-purpose circuit board"
	desc = "A small circuit board commonly seen used by general-purpose electronics."
	icon_state = "civilian_circuit"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// A computer processor unit
/obj/item/epic_loot/processor
	name = "processor core"
	desc = "The processing core of a computer, the small chip responsible for all of the inner workings of most devices."
	icon_state = "processor"
	inhand_icon_state = "razor"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// A computer power supply
/obj/item/epic_loot/power_supply
	name = "computer power supply"
	desc = "A computer power supply, used to provide regulated electric power to other components of a computer."
	icon_state = "psu"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

// A drive for reading data from data disks in computers
/obj/item/epic_loot/disk_drive
	name = "hard-disk reader"
	desc = "A device for reading and writing data to hard-disks, one of the most common data storage media on the frontier."
	icon_state = "disk_drive"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

/obj/item/keycard/epic_loot
	name = "broken keycard"
	desc = "You shouldn't have this."
	icon = 'modular_warrenstation/icons/obj/epic_loot.dmi'
	icon_state = "keycard_basetype"
	color = "#ffffff"
	puzzle_id = "黄昏の"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

/obj/item/keycard/epic_loot/green
	name = "green keycard"
	desc = "A standard keycard with a green trim."
	icon_state = "keycard_green"
	puzzle_id = "epic_loot_green"

/obj/item/keycard/epic_loot/teal
	name = "teal keycard"
	desc = "A standard keycard with a teal trim."
	icon_state = "keycard_teal"
	puzzle_id = "epic_loot_teal"

/obj/item/keycard/epic_loot/blue
	name = "blue keycard"
	desc = "A standard keycard with a blue trim."
	icon_state = "keycard_blue"
	puzzle_id = "epic_loot_blue"

/obj/item/keycard/epic_loot/ourple
	name = "purple keycard"
	desc = "A standard keycard with a purple trim."
	icon_state = "keycard_ourple"
	puzzle_id = "epic_loot_purple"

/obj/item/keycard/epic_loot/red
	name = "red keycard"
	desc = "A standard keycard with a red trim."
	icon_state = "keycard_red"
	puzzle_id = "epic_loot_red"

/obj/item/keycard/epic_loot/orange
	name = "orange keycard"
	desc = "A standard keycard with an orange trim."
	icon_state = "keycard_orange"
	puzzle_id = "epic_loot_orange"

/obj/item/keycard/epic_loot/yellow
	name = "yellow keycard"
	desc = "A standard keycard with a yellow trim."
	icon_state = "keycard_yellow"
	puzzle_id = "epic_loot_yellow"

/obj/item/keycard/epic_loot/black
	name = "black keycard"
	desc = "A standard keycard with a black trim."
	icon_state = "keycard_evil"
	puzzle_id = "epic_loot_black"

// Vein finder, uses strong LED lights to reveal veins in someone's body. Perhaps the name "LEDX" rings a bell
/obj/item/epic_loot/vein_finder
	name = "medical vein locator"
	desc = "A small device with a number of high intensity lights on one side. Used by medical professionals to locate veins in someone's body."
	icon_state = "vein_finder"
	inhand_icon_state = "headset"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

/obj/item/epic_loot/vein_finder/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(!proximity_flag)
		return
	if(!ishuman(target))
		return
	user.visible_message(
		"[user] determines that [target] does, in fact, have veins.",
		"You determine that [target] does, in fact, have veins."
	)
	new /obj/effect/temp_visual/medical_holosign(get_turf(target), user)

// Eyescope, a now rare device that was used to check the eyes of patients before the universal health scanner became common
/obj/item/epic_loot/eye_scope
	name = "medical eye-scope"
	desc = "An outdated device used to examine a patient's eyes. Rare now due to the outbreak of the universal health scanner."
	icon_state = "eyescope"
	inhand_icon_state = "zippo"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

// An old press pass, perhaps of an unlucky soul who was reporting on the incident that made this place abandoned in the first place
/obj/item/epic_loot/press_pass
	name = "expired press pass"
	desc = "An old lanyard with an expired press pass stuck to it. Most of the text has worn off, you can't tell who it was for or who it was issued by."
	icon_state = "press_pass"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

// A computer SSD
/obj/item/epic_loot/ssd
	name = "solid-state drive"
	desc = "A solid-state drive for computers, may even contain some still-valuable information on it!"
	icon_state = "ssd"
	inhand_icon_state = "razor"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

// A computer hard drive
/obj/item/epic_loot/hdd
	name = "hard drive"
	desc = "A hard drive for computers, may even contain some still-valuable information on it!"
	icon_state = "hard_disk"
	inhand_icon_state = "razor"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

// Military-grade flash drives, made for use specifically with military computers
/obj/item/epic_loot/military_flash
	name = "military flash drive"
	desc = "A military-grade flash drive for use in matching military-grade computer systems. Might even contain some still-valuable information on it!"
	icon_state = "military_flash"
	inhand_icon_state = "razor"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

// Someone's personal diary, or bootleg captain's log, whatever
/obj/item/epic_loot/diary
	name = "sealed diary"
	desc = "An old, apparently well-kept diary with unknown information inside. May hold important data on the location it was found in."
	icon_state = "diary"
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'

// A slimmer version of the regular diary
/obj/item/epic_loot/slim_diary
	name = "sealed slim diary"
	desc = "An old, apparently well-kept diary with unknown information inside. May hold important data on the location it was found in."
	icon_state = "slim_diary"
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'

// Straight up, a brick of plasma-cringe explosive, keep away from fire
/obj/item/epic_loot/plasma_explosive
	name = "brick of plasma-based explosive"
	desc = "A really quite dangerous brick of a plasma-based explosive. Usually, a demolition charge or something of the sort, but, it's still a <b>bomb</b>."
	icon_state = "plasma_explosive"
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound = 'sound/items/handling/cardboardbox_pickup.ogg'

/obj/item/epic_loot/plasma_explosive/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/explodable, 0, 1, 3, 5, 5)

// A folder from some corporation with likely valuable data inside
/obj/item/epic_loot/corpo_folder
	name = "corporate data folder"
	desc = "A blue folder with no label of who it's from. What is labeled, however, is the series of marks of confidential or trade secret information inside."
	icon_state = "nt_folders"
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'

// Brown unlabeled folder of doom, may contain government secrets
/obj/item/epic_loot/intel_folder
	name = "intelligence folder"
	desc = "A an unmarked, unassuming folder for documents. What is labeled, however, is the series of marks of confidential or trade secret information inside."
	icon_state = "documents"
	drop_sound = 'sound/items/handling/book_drop.ogg'
	pickup_sound = 'sound/items/handling/book_pickup.ogg'

// A small chainlet made of silver
/obj/item/epic_loot/silver_chainlet
	name = "silver chainlet"
	desc = "A small chainlet for decorating clothing or other items, made from silver."
	icon_state = "silver_chain"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

// A small chainlet made of gold
/obj/item/epic_loot/gold_chainlet
	name = "gold chainlet"
	desc = "A small chainlet for decorating clothing or other items, made from gold."
	icon_state = "gold_chain"
	drop_sound = 'sound/items/handling/disk_drop.ogg'
	pickup_sound = 'sound/items/handling/disk_pickup.ogg'

//
//
// STRUCTURES
//
//

/datum/storage/maintenance_loot_structure/ammo_box
	max_slots = 6
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 6
	screen_max_columns = 3
	opening_sound = 'modular_warrenstation/sound/wood_crate_3.mp3'

/obj/structure/maintenance_loot_structure/ammo_box
	name = "ammunition box"
	desc = "A military-grade lockbox for secure storage of ammunition."
	icon_state = "ammo_box"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/ammo_box
	loot_spawn_dice_string = "1d10-4"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_ammunition = 1,
	)

/obj/structure/maintenance_loot_structure/ammo_box/super_evil
	icon_state = "cache"

/obj/structure/maintenance_loot_structure/ammo_box/random
	icon_state = "ammo_box_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"ammo_box",
		"cache",
	)

/obj/structure/maintenance_loot_structure/ammo_box/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/computer
	max_slots = 4
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 4
	screen_max_columns = 2
	opening_sound = 'modular_warrenstation/sound/plastic.mp3'

/obj/structure/maintenance_loot_structure/computer_tower
	name = "computer tower"
	desc = "A relatively compact computer unit, missing it's monitor. May still contain valuable components inside."
	icon_state = "alienware"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/computer
	loot_spawn_dice_string = "1d7-3"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_computer_parts = 1,
	)

/obj/structure/maintenance_loot_structure/computer_tower/white
	icon_state = "alienware_honeycrisp"

/obj/structure/maintenance_loot_structure/computer_tower/eighties
	icon_state = "alienware_tan_man"

/obj/structure/maintenance_loot_structure/computer_tower/random
	icon_state = "alienware_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"alienware",
		"alienware_honeycrisp",
		"alienware_tan_man",
	)

/obj/structure/maintenance_loot_structure/computer_tower/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/file_cabinet
	max_slots = 6
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 6
	screen_max_columns = 2
	opening_sound = 'modular_warrenstation/sound/cabinet.mp3'

/obj/structure/maintenance_loot_structure/file_cabinet
	name = "filing cabinet"
	desc = "A large filing cabinet, it even comes with terrible sounding unlubricated rails!"
	icon_state = "files"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/file_cabinet
	loot_spawn_dice_string = "1d10-4"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_documents = 1,
	)

/obj/structure/maintenance_loot_structure/file_cabinet/white
	icon_state = "files_clean"

/obj/structure/maintenance_loot_structure/file_cabinet/random
	icon_state = "files_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"files",
		"files_clean",
	)

/obj/structure/maintenance_loot_structure/file_cabinet/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/grenade_box
	max_slots = 4
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 4
	screen_max_columns = 2
	opening_sound = 'modular_warrenstation/sound/wood_crate_2.mp3'

/obj/structure/maintenance_loot_structure/grenade_box
	name = "grenade box"
	desc = "A military-grade grenade box for secure storage of explosives."
	icon_state = "grenade_box"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/grenade_box
	loot_spawn_dice_string = "1d6-2"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_grenade_or_explosive = 1,
	)

/obj/structure/maintenance_loot_structure/grenade_box/evil
	icon_state = "grenade_box_evil"

/obj/structure/maintenance_loot_structure/grenade_box/random
	icon_state = "grenade_box_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"grenade_box",
		"grenade_box_evil",
	)

/obj/structure/maintenance_loot_structure/grenade_box/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/gun_box
	max_slots = 4
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 4
	screen_max_columns = 4
	opening_sound = 'modular_warrenstation/sound/wood_crate_3.mp3'

/obj/structure/maintenance_loot_structure/gun_box
	name = "large gun case"
	desc = "A military-grade gun case for secure storage of firearms."
	icon_state = "guncrate"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/gun_box
	loot_spawn_dice_string = "1d8-4"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_ammunition = 4,
		/obj/effect/spawner/random/epic_loot/random_silly_arms = 2,
		/obj/effect/spawner/random/epic_loot/random_serious_arms = 1,
	)

/obj/structure/maintenance_loot_structure/gun_box/evil
	icon_state = "guncrate_dark"

/obj/structure/maintenance_loot_structure/gun_box/random
	icon_state = "guncrate_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"guncrate",
		"guncrate_dark",
	)

/obj/structure/maintenance_loot_structure/gun_box/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/large_crate
	max_slots = 16
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 16
	screen_max_columns = 4
	opening_sound = 'modular_warrenstation/sound/wood_crate_3.mp3'

/obj/structure/maintenance_loot_structure/large_crate
	name = "ration supply box"
	desc = "A large crate for transporting equally large amounts of food supplies around."
	icon_state = "foodcrate"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/large_crate
	loot_spawn_dice_string = "4d5-4"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_provisions = 1,
	)

/obj/structure/maintenance_loot_structure/large_crate/medical
	name = "medical supply box"
	desc = "A large crate for transporting equally large amounts of medical supplies around."
	icon_state = "medcrate"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/medical_stack_item = 3,
		/obj/effect/spawner/random/epic_loot/medical_stack_item_advanced = 1,
		/obj/effect/spawner/random/epic_loot/medical_tools = 3,
		/obj/effect/spawner/random/epic_loot/medpens = 2,
		/obj/effect/spawner/random/epic_loot/medpens_combat_based_redpilled = 1,
	)

/obj/structure/maintenance_loot_structure/large_crate/medical/airdrop
	icon_state = "supplydrop"

/obj/structure/maintenance_loot_structure/large_crate/engineering
	name = "engineering supply box"
	desc = "A large crate for transporting equally large amounts of tools and components around."
	icon_state = "toolcrate"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_tools = 1,
		/obj/effect/spawner/random/epic_loot/random_components = 1,
		/obj/effect/spawner/random/epic_loot/random_computer_parts = 1,
	)

/obj/structure/maintenance_loot_structure/large_crate/engineering/airdrop
	icon_state = "supplydrop_yellow"

/obj/structure/maintenance_loot_structure/large_crate/military
	name = "military supply box"
	desc = "A large crate for transporting equally large amounts of militar."
	icon_state = "supplydrop_green"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_other_military_loot = 4,
		/obj/effect/spawner/random/epic_loot/random_ammunition = 3,
		/obj/effect/spawner/random/epic_loot/random_silly_arms = 3,
		/obj/effect/spawner/random/epic_loot/random_serious_arms = 1,
	)

/obj/effect/spawner/random/epic_loot/random_supply_crate
	name = "random supply crate spawner"
	desc = "Automagically transforms into a random supply crate, hopefully filled with goodies."
	icon = 'modular_warrenstation/icons/obj/loot_structures.dmi'
	icon_state = "crate_random"
	loot = list(
		/obj/structure/maintenance_loot_structure/large_crate,
		/obj/structure/maintenance_loot_structure/large_crate/medical,
		/obj/structure/maintenance_loot_structure/large_crate/medical/airdrop,
		/obj/structure/maintenance_loot_structure/large_crate/engineering,
		/obj/structure/maintenance_loot_structure/large_crate/engineering/airdrop,
		/obj/structure/maintenance_loot_structure/large_crate/military,
	)

/datum/storage/maintenance_loot_structure/medical_box
	max_slots = 6
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 6
	screen_max_columns = 3
	opening_sound = 'modular_warrenstation/sound/plastic.mp3'

/obj/structure/maintenance_loot_structure/medbox
	name = "emergency medical box"
	desc = "A large, atmos-sealed plastic container for holding emergency medical supplies."
	icon_state = "medbox"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/medical_box
	loot_spawn_dice_string = "1d10-4"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/medical_stack_item = 2,
		/obj/effect/spawner/random/epic_loot/medical_tools = 2,
		/obj/effect/spawner/random/epic_loot/medpens = 1,
	)

/obj/structure/maintenance_loot_structure/medbox/advanced_loot
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/medical_stack_item_advanced = 2,
		/obj/effect/spawner/random/epic_loot/medical_tools = 2,
		/obj/effect/spawner/random/epic_loot/medpens = 2,
		/obj/effect/spawner/random/epic_loot/medpens_combat_based_redpilled = 1,
	)
	loot_spawn_dice_string = "1d6"

/obj/structure/maintenance_loot_structure/medbox/bleu
	icon_state = "medbox_blue"

/obj/structure/maintenance_loot_structure/medbox/advanced_loot/bleu
	icon_state = "medbox_blue"

/obj/structure/maintenance_loot_structure/medbox/red
	icon_state = "medbox_red"

/obj/structure/maintenance_loot_structure/medbox/advanced_loot/red
	icon_state = "medbox_red"

/obj/structure/maintenance_loot_structure/medbox/random
	icon_state = "medbox_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"medbox",
		"medbox_blue",
		"medbox_red",
	)

/obj/structure/maintenance_loot_structure/medbox/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/obj/structure/maintenance_loot_structure/medbox/random/advanced_loot
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/medical_stack_item_advanced = 2,
		/obj/effect/spawner/random/epic_loot/medical_tools = 2,
		/obj/effect/spawner/random/epic_loot/medpens = 2,
		/obj/effect/spawner/random/epic_loot/medpens_combat_based_redpilled = 1,
	)
	loot_spawn_dice_string = "1d6"

/datum/storage/maintenance_loot_structure/military_case
	max_slots = 8
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 8
	screen_max_columns = 4
	opening_sound = 'modular_nova/modules/epic_loot/sound/containers/wood_crate_3.mp3'

/obj/structure/maintenance_loot_structure/military_case
	name = "military storage box"
	desc = "A military-grade storage chest for general use."
	icon_state = "guncrate"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/military_case
	loot_spawn_dice_string = "1d8-4"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_other_military_loot = 4,
		/obj/effect/spawner/random/epic_loot/random_ammunition = 3,
		/obj/effect/spawner/random/epic_loot/random_silly_arms = 2,
		/obj/effect/spawner/random/epic_loot/random_serious_arms = 1,
	)

/obj/structure/maintenance_loot_structure/military_case/evil
	icon_state = "guncrate_dark"

/obj/structure/maintenance_loot_structure/military_case/super_evil
	icon_state = "larpbox"

/obj/structure/maintenance_loot_structure/military_case/random
	icon_state = "military_crate_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"military_crate",
		"military_crate_dark",
		"larpbox",
	)

/obj/structure/maintenance_loot_structure/military_case/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/register
	max_slots = 2
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 2
	screen_max_columns = 2
	opening_sound = 'modular_warrenstation/sound/wood_crate_2.mp3'

/obj/structure/maintenance_loot_structure/register
	name = "credits register"
	desc = "A compact computing unit to handle transfers of credits between accounts. May still contain currency left behind!"
	icon_state = "register_small"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/register
	loot_spawn_dice_string = "1d3-1"
	loot_weighted_list = list(
		/obj/effect/spawner/random/entertainment/coin = 1,
		/obj/effect/spawner/random/entertainment/money_small/one = 2,
		/obj/effect/spawner/random/entertainment/money/one = 1,
	)

/obj/structure/maintenance_loot_structure/register/white
	icon_state = "register_small_clean"

/obj/structure/maintenance_loot_structure/register/big
	icon_state = "register_big"

/obj/structure/maintenance_loot_structure/register/big_white
	icon_state = "register_big_clean"

/obj/structure/maintenance_loot_structure/register/random
	icon_state = "register_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"register_small",
		"register_small_clean",
		"register_big",
		"register_big_clean",
	)

/obj/structure/maintenance_loot_structure/register/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/desk_safe
	max_slots = 2
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 2
	screen_max_columns = 1
	opening_sound = 'modular_warrenstation/sound/wood_crate_3.mp3'

/obj/structure/maintenance_loot_structure/desk_safe
	name = "compact safe"
	desc = "A not-so-secure safe meant to fit around or under desks."
	icon_state = "safe"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/desk_safe
	loot_spawn_dice_string = "1d3-1"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_strongbox_loot = 1,
		/obj/effect/spawner/random/entertainment/money_small/one = 1,
	)

/obj/structure/maintenance_loot_structure/desk_safe/bleu
	icon_state = "safe_blue"

/obj/structure/maintenance_loot_structure/desk_safe/random
	icon_state = "safe_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"safe",
		"safe_blue",
	)

/obj/structure/maintenance_loot_structure/desk_safe/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/toolbox
	max_slots = 6
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 6
	screen_max_columns = 3
	opening_sound = 'modular_warrenstation/sound/wood_crate_1.mp3'

/obj/structure/maintenance_loot_structure/toolbox
	name = "heavy toolbox"
	desc = "An industrial grade toolbox, for when you need to carry a LOT of things to a job. \
		It's previous owner has smartly attached this one pretty firmly to whatever surface it's on, \
		to prevent theft."
	icon_state = "toolbox"
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/toolbox
	loot_spawn_dice_string = "1d8-2"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_tools = 2,
		/obj/effect/spawner/random/epic_loot/random_components = 1,
	)

/obj/structure/maintenance_loot_structure/toolbox/yellow
	icon_state = "toolbox_yellow"

/obj/structure/maintenance_loot_structure/toolbox/red
	icon_state = "toolbox_red"

/obj/structure/maintenance_loot_structure/toolbox/random
	icon_state = "toolbox_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"toolbox",
		"toolbox_yellow",
		"toolbox_red",
	)

/obj/structure/maintenance_loot_structure/toolbox/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

/datum/storage/maintenance_loot_structure/jacket
	max_slots = 2
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 4
	screen_max_columns = 2
	opening_sound = 'sound/items/handling/cloth_pickup.ogg'

/obj/structure/maintenance_loot_structure/wall_jacket
	name = "hanging jacket"
	desc = "Someone's old, now abandoned jacket. Maybe there's still stuff in the pockets?"
	icon_state = "jacket_green"
	density = FALSE
	storage_datum_to_use = /datum/storage/maintenance_loot_structure/jacket
	loot_spawn_dice_string = "1d4-2"
	loot_weighted_list = list(
		/obj/effect/spawner/random/entertainment/coin = 1,
		/obj/effect/spawner/random/entertainment/money_small/one = 1,
		/obj/effect/spawner/random/entertainment/money/one = 1,
		/obj/effect/spawner/random/entertainment/cigarette_pack = 1,
		/obj/effect/spawner/random/entertainment/cigarette = 1,
		/obj/effect/spawner/random/entertainment/wallet_lighter = 1,
		/obj/effect/spawner/random/epic_loot/pocket_sized_valuables = 1,
	)

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/Initialize(mapload)
	. = ..()
	find_and_hang_on_wall()

/obj/structure/maintenance_loot_structure/wall_jacket/yellow
	icon_state = "jacket_yellow"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket/yellow, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/blue
	icon_state = "jacket_blue"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket/blue, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/police
	icon_state = "jacket_police"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket/police, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/black
	icon_state = "jacket_black"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket/black, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/military
	icon_state = "jacket_military"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket/military, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/random
	icon_state = "jacket_random"
	/// The different icon states we can swap to when initializing
	var/list/random_icon_states = list(
		"jacket_green",
		"jacket_yellow",
		"jacket_blue",
		"jacket_police",
		"jacket_black",
		"jacket_military",
	)

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/maintenance_loot_structure/wall_jacket/random, 28)

/obj/structure/maintenance_loot_structure/wall_jacket/random/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

//
//
// SPAWNERS
//
//

/obj/effect/spawner/random/epic_loot
	name = "extraction loot spawner"
	desc = "Gods please let there be nobody extract camping."
	icon = 'modular_warrenstation/icons/obj/epic_loot.dmi'
	icon_state = null

/obj/effect/spawner/random/epic_loot/chainlet
	name = "random chainlet spawner"
	desc = "Automagically transforms into a random chainlet made of valuable metals."
	icon_state = "random_chain"
	loot = list(
		/obj/item/epic_loot/silver_chainlet = 2,
		/obj/item/epic_loot/gold_chainlet = 1,
	)

/obj/effect/spawner/random/epic_loot/pocket_sized_valuables
	name = "random pocket sized valuables spawner"
	desc = "Automagically transforms into a random valuable that would reasonably be in someone's coat pocket."
	icon_state = "random_pocket_valuable"
	loot = list(
		/obj/effect/spawner/random/epic_loot/chainlet = 2,
		/obj/item/epic_loot/press_pass = 2,
		/obj/item/epic_loot/military_flash = 2,
		/obj/item/epic_loot/slim_diary = 2,
		/obj/effect/spawner/random/epic_loot/random_keycard = 1,
	)

/obj/effect/spawner/random/epic_loot/medical_stack_item
	name = "random medical item spawner"
	desc = "Automagically transforms into a random medical stack item."
	icon_state = "random_med_stack"
	loot = list(
		/obj/item/stack/medical/bruise_pack = 3,
		/obj/item/stack/medical/gauze = 2,
		/obj/item/stack/medical/gauze/sterilized = 1,
		/obj/item/stack/medical/suture/emergency = 3,
		/obj/item/stack/medical/suture/coagulant = 2,
		/obj/item/stack/medical/suture/bloody = 1,
		/obj/item/stack/medical/ointment = 3,
		/obj/item/stack/medical/ointment/red_sun = 2,
		/obj/item/stack/medical/mesh = 1,
		/obj/item/stack/medical/aloe = 2,
		/obj/item/stack/medical/bone_gel/one = 2,
		/obj/item/stack/medical/bandage/makeshift = 2,
		/obj/item/stack/medical/bandage = 1,
		/obj/item/stack/sticky_tape/surgical = 2,
		/obj/item/reagent_containers/blood/random = 1,
		// Chemjaks
		/obj/item/reagent_containers/cup/bottle/epinephrine = 2,
		/obj/item/reagent_containers/cup/bottle/morphine = 1,
		/obj/item/reagent_containers/cup/bottle/mannitol = 1,
		/obj/item/reagent_containers/cup/bottle/multiver = 2,
		/obj/item/reagent_containers/cup/bottle/ammoniated_mercury = 2,
		/obj/item/reagent_containers/cup/bottle/syriniver = 1,
		/obj/item/reagent_containers/cup/bottle/synaptizine = 1,
		/obj/item/reagent_containers/cup/bottle/fentanyl = 1,
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 2,
		/obj/item/reagent_containers/cup/bottle/diphenhydramine = 1,
		/obj/item/reagent_containers/cup/bottle/potass_iodide = 2,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 2,
		/obj/item/reagent_containers/cup/bottle/atropine = 1,
		/obj/item/reagent_containers/syringe = 2,
		// Medigels
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 2,
		/obj/item/reagent_containers/medigel/synthflesh = 1,
		// Pill bottles
		/obj/item/storage/pill_bottle/iron = 2,
		/obj/item/storage/pill_bottle/potassiodide = 2,
		/obj/item/storage/pill_bottle/painkiller = 2,
		/obj/item/storage/pill_bottle/probital = 2,
		/obj/item/storage/pill_bottle/happinesspsych = 1,
		/obj/item/storage/pill_bottle/lsdpsych = 1,
		/obj/item/storage/pill_bottle/mannitol = 2,
		/obj/item/storage/pill_bottle/multiver = 2,
		/obj/item/storage/pill_bottle/mutadone = 1,
		/obj/item/storage/pill_bottle/neurine = 1,
		/obj/item/storage/pill_bottle/ondansetron = 1,
		/obj/item/storage/pill_bottle/psicodine = 1,
	)

/obj/effect/spawner/random/epic_loot/medical_stack_item_advanced
	name = "random advanced medical item spawner"
	desc = "Automagically transforms into a random advanced medical stack item."
	icon_state = "random_med_stack_adv"
	loot = list(
		/obj/item/stack/medical/bruise_pack = 3,
		/obj/item/stack/medical/gauze = 2,
		/obj/item/stack/medical/gauze/sterilized = 2,
		/obj/item/stack/medical/suture = 3,
		/obj/item/stack/medical/suture/coagulant = 3,
		/obj/item/stack/medical/suture/bloody = 2,
		/obj/item/stack/medical/suture/medicated = 1,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/stack/medical/ointment/red_sun = 3,
		/obj/item/stack/medical/mesh = 3,
		/obj/item/stack/medical/mesh/bloody = 2,
		/obj/item/stack/medical/mesh/advanced = 1,
		/obj/item/stack/medical/aloe = 2,
		/obj/item/stack/medical/bone_gel = 2,
		/obj/item/stack/medical/bandage = 2,
		/obj/item/stack/sticky_tape/surgical = 2,
		/obj/item/stack/medical/poultice = 1,
		/obj/item/stack/medical/wound_recovery = 1,
		/obj/item/stack/medical/wound_recovery/rapid_coagulant = 1,
		/obj/item/reagent_containers/blood/random = 2,
		// Chemjaks
		/obj/item/reagent_containers/cup/bottle/epinephrine = 1,
		/obj/item/reagent_containers/cup/bottle/morphine = 2,
		/obj/item/reagent_containers/cup/bottle/mannitol = 1,
		/obj/item/reagent_containers/cup/bottle/multiver = 2,
		/obj/item/reagent_containers/cup/bottle/ammoniated_mercury = 2,
		/obj/item/reagent_containers/cup/bottle/syriniver = 2,
		/obj/item/reagent_containers/cup/bottle/synaptizine = 2,
		/obj/item/reagent_containers/cup/bottle/fentanyl = 2,
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 1,
		/obj/item/reagent_containers/cup/bottle/diphenhydramine = 1,
		/obj/item/reagent_containers/cup/bottle/potass_iodide = 2,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 3,
		/obj/item/reagent_containers/cup/bottle/atropine = 2,
		/obj/item/reagent_containers/syringe = 3,
		// Medigels
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 2,
		/obj/item/reagent_containers/medigel/synthflesh = 1,
		// Pill bottles
		/obj/item/storage/pill_bottle/iron = 2,
		/obj/item/storage/pill_bottle/potassiodide = 2,
		/obj/item/storage/pill_bottle/painkiller = 2,
		/obj/item/storage/pill_bottle/probital = 2,
		/obj/item/storage/pill_bottle/happinesspsych = 1,
		/obj/item/storage/pill_bottle/lsdpsych = 1,
		/obj/item/storage/pill_bottle/mannitol = 2,
		/obj/item/storage/pill_bottle/multiver = 2,
		/obj/item/storage/pill_bottle/mutadone = 1,
		/obj/item/storage/pill_bottle/neurine = 1,
		/obj/item/storage/pill_bottle/ondansetron = 1,
		/obj/item/storage/pill_bottle/psicodine = 1,
		// Medkits
		/obj/effect/spawner/random/epic_loot/medkit = 1,
	)

/obj/effect/spawner/random/epic_loot/medical_tools
	name = "random medical tools spawner"
	desc = "Automagically transforms into a random medical tools of various sorts."
	icon_state = "random_med_tools"
	loot = list(
		/obj/item/bonesetter = 2,
		/obj/item/cautery = 2,
		/obj/item/cautery/cruel = 1,
		/obj/item/clothing/neck/stethoscope = 2,
		/obj/item/flashlight/pen = 2,
		/obj/item/flashlight/pen/paramedic = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/healthanalyzer/simple/disease = 2,
		/obj/item/hemostat = 2,
		/obj/item/hypospray = 2,
		/obj/item/hypospray/mkii = 1,
		/obj/item/storage/box/bandages = 1,
		/obj/item/bodybag = 2,
		/obj/item/bodybag/stasis = 1,
		/obj/item/blood_filter = 2,
		/obj/item/circular_saw = 2,
		/obj/item/clothing/gloves/latex/nitrile = 2,
		/obj/item/clothing/mask/surgical = 2,
		/obj/item/retractor = 2,
		/obj/item/scalpel = 2,
		/obj/item/shears = 1,
		/obj/item/surgical_drapes = 2,
		/obj/item/surgicaldrill = 2,
		/obj/item/handheld_soulcatcher = 1,
		/obj/item/epic_loot/vein_finder = 1,
		/obj/item/epic_loot/eye_scope = 1,
		/obj/item/reagent_containers/dropper = 2,
		/obj/item/reagent_containers/cup/beaker = 2,
		/obj/item/reagent_containers/cup/beaker/large = 1,
		/obj/item/reagent_containers/cup/bottle = 2,
		/obj/item/reagent_containers/cup/vial/small = 2,
		/obj/item/reagent_containers/cup/vial/large = 1,
		/obj/item/reagent_containers/cup/tube = 2,
		/obj/item/reagent_containers/syringe = 2,
		/obj/item/defibrillator = 2,
		/obj/item/defibrillator/loaded = 1,
		/obj/item/emergency_bed = 2,
		/obj/effect/spawner/random/epic_loot/medkit = 2,
	)

/obj/effect/spawner/random/epic_loot/medkit
	name = "random medkit spawner"
	desc = "Automagically transforms into a random medkit of some sort."
	icon_state = "random_medkit"
	loot = list(
		/obj/item/storage/medkit/civil_defense/stocked = 3,
		/obj/item/storage/medkit/civil_defense/comfort/stocked = 3,
		/obj/item/storage/medkit/frontier/stocked = 2,
		/obj/item/storage/medkit/combat_surgeon/stocked = 2,
		/obj/item/storage/backpack/duffelbag/deforest_medkit/stocked = 1,
		/obj/item/storage/backpack/duffelbag/deforest_surgical/stocked = 1,
	)

/obj/effect/spawner/random/epic_loot/medpens
	name = "random autoinjectors spawner"
	desc = "Automagically transforms into random autoinjectors of various types."
	icon_state = "random_medpen_spawner"
	loot = list(
		/obj/item/reagent_containers/hypospray/medipen/deforest/occuisate = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/adrenaline = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/morpital = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/lipital = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/meridine = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/synephrine = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/calopine = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/coagulants = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/krotozine = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/lepoturi = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/psifinil = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/halobinin = 2,
	)

/obj/effect/spawner/random/epic_loot/medpens_combat_based_redpilled
	name = "random combat autoinjectors spawner"
	desc = "Automagically transforms into a random combat focused autoinjector."
	icon_state = "random_medpen_advanced"
	loot = list(
		/obj/item/reagent_containers/hypospray/medipen/deforest/adrenaline = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/morpital = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/lipital = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/synephrine = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/calopine = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/coagulants = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/krotozine = 3,
		/obj/item/reagent_containers/hypospray/medipen/deforest/lepoturi = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/twitch = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/demoneye = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/aranepaine = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/pentibinin = 2,
		/obj/item/reagent_containers/hypospray/medipen/deforest/synalvipitol = 2,
	)

/obj/effect/spawner/random/epic_loot/random_components
	name = "random components spawner"
	desc = "Automagically transforms into components."
	icon_state = "random_component"
	loot = list(
		/obj/item/epic_loot/water_filter = 2,
		/obj/item/epic_loot/thermometer = 2,
		/obj/item/epic_loot/nail_box = 2,
		/obj/item/epic_loot/cold_weld = 2,
		/obj/item/epic_loot/electric_motor = 1,
		/obj/item/epic_loot/current_converter = 1,
		/obj/item/epic_loot/signal_amp = 1,
		/obj/item/epic_loot/thermal_camera = 1,
		/obj/item/epic_loot/shuttle_gyro = 1,
		/obj/item/epic_loot/phased_array = 1,
		/obj/item/epic_loot/shuttle_battery = 1,
		/obj/item/epic_loot/fuel_conditioner = 2,
		/obj/item/epic_loot/aramid = 2,
		/obj/item/epic_loot/cordura = 2,
		/obj/item/epic_loot/ripstop = 2,
		/obj/item/epic_loot/display = 1,
		/obj/item/epic_loot/display_broken = 2,
		/obj/item/epic_loot/civilian_circuit = 2,
	)

/obj/effect/spawner/random/epic_loot/random_tools
	name = "random tools spawner"
	desc = "Automagically transforms into a tool of some sort."
	icon_state = "random_tool"
	loot = list(
		// Wrench
		/obj/item/wrench = 3,
		/obj/item/wrench/bolter = 2,
		/obj/item/wrench/caravan = 1,
		/obj/item/wrench/combat = 1,
		// Screwdriver
		/obj/item/screwdriver = 3,
		/obj/item/screwdriver/omni_drill = 2,
		/obj/item/screwdriver/caravan = 1,
		// Crowbar
		/obj/item/crowbar = 3,
		/obj/item/crowbar/large/doorforcer = 2,
		/obj/item/crowbar/red/caravan = 1,
		// Wirecutters
		/obj/item/wirecutters = 3,
		/obj/item/wirecutters/caravan = 1,
		// Welder
		/obj/item/weldingtool = 3,
		/obj/item/weldingtool/largetank = 3,
		/obj/item/weldingtool/electric/arc_welder = 2,
		/obj/item/weldingtool/experimental = 1,
		// Multitool
		/obj/item/multitool = 2,
		/obj/item/multitool/ai_detect = 1,
		// Rapid whatever tools
		/obj/item/pipe_dispenser = 1,
		/obj/item/construction/rcd = 1,
		/obj/item/construction/rtd = 1,
		// Misc tools and related items
		/obj/item/stack/cable_coil = 3,
		/obj/item/flashlight = 2,
		/obj/item/flashlight/flare = 3,
		/obj/item/grenade/chem_grenade/metalfoam = 2,
		/obj/item/geiger_counter = 2,
		/obj/item/analyzer = 2,
		// Various methods of insulation
		/obj/item/clothing/gloves/color/yellow = 2,
		/obj/item/clothing/gloves/chief_engineer = 1,
		/obj/item/clothing/gloves/atmos = 1,
		// Misc utility clothing
		/obj/item/clothing/gloves/tinkerer = 1,
		/obj/item/clothing/head/utility/welding = 2,
		/obj/item/clothing/head/utility/hardhat/welding = 1,
		/obj/item/clothing/glasses/meson = 3,
		/obj/item/clothing/glasses/meson/engine = 2,
		/obj/item/storage/belt/utility = 2,
		/obj/item/clothing/shoes/magboots = 2,
		// Tapes
		/obj/item/stack/sticky_tape = 2,
		/obj/item/stack/sticky_tape/super = 1,
		// Cells
		/obj/item/stock_parts/cell/upgraded = 2,
		/obj/item/stock_parts/cell/crap = 3,
		// Masks
		/obj/item/clothing/mask/gas/sechailer = 2,
		/obj/item/clothing/mask/gas = 3,
		/obj/item/clothing/mask/gas/atmos/frontier_colonist = 2,
		// Air tanks
		/obj/item/tank/internals/nitrogen/belt = 1,
		/obj/item/tank/internals/emergency_oxygen/engi = 2,
		/obj/item/tank/internals/emergency_oxygen/double = 1,
	)

/obj/effect/spawner/random/epic_loot/random_computer_parts
	name = "random computer parts spawner"
	desc = "Automagically transforms into a part from a computer of some sort."
	icon_state = "random_electronic_part"
	loot = list(
		/obj/item/epic_loot/signal_amp = 2,
		/obj/item/epic_loot/device_fan = 2,
		/obj/item/epic_loot/graphics = 1,
		/obj/item/epic_loot/military_circuit = 1,
		/obj/item/epic_loot/civilian_circuit = 2,
		/obj/item/epic_loot/processor = 2,
		/obj/item/epic_loot/power_supply = 2,
		/obj/item/epic_loot/disk_drive = 2,
		/obj/item/epic_loot/ssd = 1,
		/obj/item/epic_loot/hdd = 1,
		/obj/item/epic_loot/military_flash = 1,
	)

/obj/effect/spawner/random/epic_loot/random_documents
	name = "random documents spawner"
	desc = "Automagically transforms into some form of documents, valuable or not."
	icon_state = "random_documents"
	loot = list(
		/obj/item/folder/white = 2,
		/obj/item/folder/blue = 2,
		/obj/item/folder/ancient_paperwork = 2,
		/obj/item/paper_bin = 2,
		/obj/item/paper_bin/bundlenatural = 2,
		/obj/item/paper_bin/carbon = 2,
		/obj/item/epic_loot/intel_folder = 1,
		/obj/item/epic_loot/corpo_folder = 1,
		/obj/item/epic_loot/slim_diary = 1,
		/obj/item/epic_loot/diary = 1,
		/obj/item/computer_disk/maintenance = 2,
	)

/obj/effect/spawner/random/epic_loot/random_strongbox_loot
	name = "random strongbox loot spawner"
	desc = "Automagically transforms into some kind of item that would be kept in a safe."
	icon_state = "random_strongbox_loot"
	loot = list(
		/obj/item/folder/ancient_paperwork = 3,
		/obj/item/epic_loot/intel_folder = 2,
		/obj/item/epic_loot/corpo_folder = 2,
		/obj/item/epic_loot/slim_diary = 3,
		/obj/item/epic_loot/diary = 2,
		/obj/item/epic_loot/ssd = 1,
		/obj/item/epic_loot/hdd = 1,
		/obj/item/epic_loot/military_flash = 1,
		/obj/effect/spawner/random/epic_loot/chainlet = 2,
		/obj/item/computer_disk/maintenance = 2,
		/obj/effect/spawner/random/epic_loot/random_keycard = 1,
	)


/obj/effect/spawner/random/epic_loot/random_grenade_or_explosive
	name = "random grenade or explosive spawner"
	desc = "Automagically transforms into some kind of explosive or grenade."
	icon_state = "random_bomb"
	loot = list(
		/obj/item/grenade/antigravity = 1,
		/obj/item/grenade/barrier = 3,
		/obj/item/grenade/c4 = 1,
		/obj/item/grenade/firecracker = 2,
		/obj/item/grenade/flashbang = 3,
		/obj/item/grenade/frag = 2,
		/obj/item/grenade/mirage = 3,
		/obj/item/grenade/smokebomb = 3,
		/obj/item/grenade/stingbang = 2,
		/obj/item/grenade/iedcasing/spawned = 2,
		/obj/item/grenade/syndieminibomb/concussion = 1,
		/obj/item/grenade/clusterbuster/smoke = 1,
		/obj/item/grenade/chem_grenade/teargas = 2,
		/obj/item/epic_loot/plasma_explosive = 2,
		/obj/item/epic_loot/grenade_fuze = 3,
	)

/obj/effect/spawner/random/epic_loot/random_ammunition
	name = "random ammunition spawner"
	desc = "Automagically transforms into some kind of ammo for a weapon."
	icon_state = "random_ammo"
	loot = list(
		// Ammo boxes
		// .38
		/obj/item/ammo_box/c38 = 2,
		/obj/item/ammo_box/c38/dumdum = 2,
		/obj/item/ammo_box/c38/match = 1,
		// .35
		/obj/item/ammo_box/c35sol = 2,
		/obj/item/ammo_box/c35sol/ripper = 2,
		/obj/item/ammo_box/c35sol/incapacitator = 2,
		// .40
		/obj/item/ammo_box/c40sol = 1,
		/obj/item/ammo_box/c40sol/pierce = 1,
		/obj/item/ammo_box/c40sol/incendiary = 2,
		/obj/item/ammo_box/c40sol/fragmentation = 2,
		// .585
		/obj/item/ammo_box/c585trappiste = 1,
		/obj/item/ammo_box/c585trappiste/hollowpoint = 1,
		/obj/item/ammo_box/c585trappiste/incapacitator = 2,
		// .980
		/obj/item/ammo_box/c980grenade = 2,
		/obj/item/ammo_box/c980grenade/riot = 2,
		/obj/item/ammo_box/c980grenade/smoke = 2,
		/obj/item/ammo_box/c980grenade/shrapnel = 1,
		/obj/item/ammo_box/c980grenade/shrapnel/phosphor = 1,
		// .310
		/obj/item/ammo_box/strilka310 = 2,
		/obj/item/ammo_box/strilka310/surplus = 2,
		/obj/item/ammo_box/c310_cargo_box = 1,
		/obj/item/ammo_box/c310_cargo_box/rubber = 2,
		/obj/item/ammo_box/c310_cargo_box/piercing = 1,
		// .27-54
		/obj/item/ammo_box/c27_54cesarzowa = 2,
		/obj/item/ammo_box/c27_54cesarzowa/rubber = 2,
		// .60
		/obj/item/ammo_casing/p60strela = 2,
		// Magazines
		/obj/item/ammo_box/magazine/c35sol_pistol = 2,
		/obj/item/ammo_box/magazine/c35sol_pistol/stendo = 1,
		/obj/item/ammo_box/magazine/c40sol_rifle = 2,
		/obj/item/ammo_box/magazine/c40sol_rifle/standard = 1,
		/obj/item/ammo_box/magazine/c585trappiste_pistol = 2,
		/obj/item/ammo_box/magazine/c980_grenade = 1,
		/obj/item/ammo_box/magazine/c980_grenade/drum = 1,
		/obj/item/ammo_box/magazine/lanca = 2,
		/obj/item/ammo_box/magazine/miecz = 2,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 2,
		/obj/item/ammo_box/magazine/wylom = 1,
		// Shotgun shells
		/obj/item/ammo_box/advanced/s12gauge/antitide = 2,
		/obj/item/ammo_box/advanced/s12gauge/bean = 2,
		/obj/item/ammo_box/advanced/s12gauge/beehive = 2,
		/obj/item/ammo_box/advanced/s12gauge/buckshot = 1,
		/obj/item/ammo_box/advanced/s12gauge/express = 1,
		/obj/item/ammo_box/advanced/s12gauge/flechette = 1,
		/obj/item/ammo_box/advanced/s12gauge/incendiary = 1,
		/obj/item/ammo_box/advanced/s12gauge/magnum = 1,
		/obj/item/ammo_box/advanced/s12gauge/rubber = 2,
	)

/obj/effect/spawner/random/epic_loot/random_silly_arms
	name = "random silly arms spawner"
	desc = "Automagically transforms into a not-so-serious firearm."
	icon_state = "random_common_gun"
	loot = list(
		/obj/item/gun/ballistic/automatic/pistol/sol = 2,
		/obj/item/gun/ballistic/automatic/pistol/sol/evil = 1,
		/obj/item/gun/ballistic/automatic/pistol/trappiste = 1,
		/obj/item/gun/ballistic/revolver/c38 = 2,
		/obj/item/gun/ballistic/revolver/sol = 2,
		/obj/item/gun/ballistic/revolver/takbok = 1,
		/obj/item/gun/ballistic/automatic/sol_smg = 1,
		/obj/item/gun/ballistic/automatic/sol_smg/evil = 1,
		/obj/item/gun/ballistic/automatic/m6pdw = 1,
		/obj/item/gun/energy/e_gun/mini = 2,
		/obj/item/gun/energy/modular_laser_rifle/carbine = 1,
		/obj/item/gun/ballistic/automatic/pistol/plasma_thrower = 2,
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = 2,
		/obj/item/gun/ballistic/revolver/shotgun_revolver = 2,
		/obj/item/gun/ballistic/automatic/miecz = 1,
	)

/obj/effect/spawner/random/epic_loot/random_serious_arms
	name = "random serious arms spawner"
	desc = "Automagically transforms into a super serious firearm."
	icon_state = "random_rare_gun"
	loot = list(
		/obj/item/gun/ballistic/automatic/sol_rifle/marksman = 2,
		/obj/item/gun/ballistic/automatic/sol_rifle = 1,
		/obj/item/gun/ballistic/automatic/sol_rifle/evil = 1,
		/obj/item/gun/ballistic/automatic/sol_rifle/machinegun = 1,
		/obj/item/gun/ballistic/automatic/sol_grenade_launcher = 1,
		/obj/item/gun/ballistic/automatic/sol_grenade_launcher/evil = 1,
		/obj/item/gun/ballistic/automatic/xhihao_smg = 2,
		/obj/effect/spawner/random/sakhno = 2,
		/obj/item/gun/ballistic/shotgun/riot/sol = 2,
		/obj/item/gun/ballistic/shotgun/riot/sol/evil = 1,
		/obj/item/gun/ballistic/rifle/boltaction/prime = 1,
		/obj/item/gun/energy/laser = 2,
		/obj/item/gun/energy/laser/hellgun = 1,
		/obj/item/gun/energy/tesla_cannon = 1,
		/obj/item/gun/energy/e_gun = 1,
		/obj/item/gun/energy/modular_laser_rifle = 1,
		/obj/item/gun/ballistic/automatic/lanca = 1,
		/obj/item/gun/ballistic/automatic/wylom = 1,
	)

/obj/effect/spawner/random/epic_loot/random_other_military_loot
	name = "random military loot spawner"
	desc = "Automagically transforms into some kind of misc. military loot item."
	icon_state = "random_loot_military"
	loot = list(
		/obj/item/clothing/mask/gas/sechailer = 1,
		/obj/item/clothing/mask/gas = 2,
		/obj/item/clothing/mask/gas/atmos/frontier_colonist = 1,
		/obj/item/clothing/head/helmet/sf_peacekeeper = 2,
		/obj/item/clothing/head/helmet/sf_peacekeeper/debranded = 1,
		/obj/item/clothing/suit/armor/sf_peacekeeper = 2,
		/obj/item/clothing/suit/armor/sf_peacekeeper/debranded = 1,
		/obj/item/folder/ancient_paperwork = 3,
		/obj/item/epic_loot/intel_folder = 2,
		/obj/item/epic_loot/slim_diary = 3,
		/obj/item/epic_loot/ssd = 1,
		/obj/item/epic_loot/hdd = 1,
		/obj/item/epic_loot/military_flash = 1,
		/obj/item/computer_disk/maintenance = 2,
		/obj/item/computer_disk/black_market = 1,
		/obj/item/epic_loot/plasma_explosive = 1,
		/obj/item/epic_loot/grenade_fuze = 2,
		/obj/item/epic_loot/signal_amp = 2,
		/obj/item/epic_loot/thermal_camera = 1,
		/obj/item/epic_loot/shuttle_gyro = 1,
		/obj/item/epic_loot/phased_array = 1,
		/obj/item/epic_loot/shuttle_battery = 1,
		/obj/item/epic_loot/aramid = 1,
		/obj/item/epic_loot/cordura = 1,
		/obj/item/epic_loot/ripstop = 1,
		/obj/item/epic_loot/military_circuit = 2,
		/obj/effect/spawner/random/epic_loot/medkit = 1,
		/obj/effect/spawner/random/epic_loot/random_keycard = 1,
	)

/obj/effect/spawner/random/epic_loot/random_provisions
	name = "random provisions spawner"
	desc = "Automagically transforms into some kind of potentially edible meal."
	icon_state = "random_food"
	loot = list(
		/obj/item/food/sustenance_bar = 3,
		/obj/item/food/sustenance_bar/cheese = 2,
		/obj/item/food/sustenance_bar/mint = 2,
		/obj/item/food/sustenance_bar/neapolitan = 2,
		/obj/item/food/vendor_snacks/mothmallow = 1,
		/obj/item/food/vendor_snacks/moth_bag = 3,
		/obj/item/food/vendor_snacks/moth_bag/cheesecake = 2,
		/obj/item/food/vendor_snacks/moth_bag/cheesecake/honey = 2,
		/obj/item/food/vendor_snacks/moth_bag/fuel_jack = 3,
		/obj/item/food/vendor_tray_meal/side/cornbread = 2,
		/obj/item/food/vendor_tray_meal/side/moffin = 2,
		/obj/item/food/vendor_tray_meal/side/roasted_seeds = 2,
		/obj/item/food/bluefeather_crisp = 3,
		/obj/item/food/brain_pate = 2,
		/obj/item/food/branrequests = 3,
		/obj/item/food/breadslice/corn = 2,
		/obj/item/food/breadslice/reispan = 2,
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/breadslice/root = 2,
		/obj/item/food/butter = 3,
		/obj/item/food/candy = 3,
		/obj/item/food/canned/beans = 3,
		/obj/item/food/canned/peaches = 3,
		/obj/item/food/canned/tomatoes = 3,
		/obj/item/food/canned/tuna = 3,
		/obj/item/food/cheese/firm_cheese_slice = 2,
		/obj/item/food/cheese/firm_cheese = 1,
		/obj/item/food/chocolatebar = 2,
		/obj/item/food/cnds/random = 3,
		/obj/item/food/colonial_course/pljeskavica = 1,
		/obj/item/food/colonial_course/nachos = 1,
		/obj/item/food/colonial_course/blins = 1,
		/obj/item/food/cornchips/random = 2,
		/obj/item/food/peanuts/random = 2,
		/obj/item/food/ready_donk = 1,
		/obj/item/food/ready_donk/donkhiladas = 1,
		/obj/item/food/ready_donk/donkrange_chicken = 1,
		/obj/item/food/ready_donk/mac_n_cheese = 1,
		/obj/item/food/ready_donk/nachos_grandes = 1,
		/obj/item/food/semki = 3,
		/obj/item/food/spacers_sidekick = 2,
		/obj/item/food/sticko/random = 3,
		// Ingredients
		/obj/item/reagent_containers/cup/glass/bottle/juice/limejuice = 2,
		/obj/item/reagent_containers/cup/glass/bottle/juice/orangejuice = 2,
		/obj/item/reagent_containers/cup/glass/bottle/juice/pineapplejuice = 2,
		/obj/item/reagent_containers/condiment/milk = 1,
		/obj/item/reagent_containers/condiment/sugar/small_ration = 2,
		/obj/item/reagent_containers/condiment/flour/small_ration = 2,
		/obj/item/reagent_containers/condiment/small_ration_korta_flour = 2,
		/obj/item/reagent_containers/condiment/cherryjelly = 1,
		/obj/item/reagent_containers/condiment/rice/small_ration = 2,
		/obj/item/reagent_containers/condiment/soymilk/small_ration = 2,
		/obj/item/reagent_containers/condiment/cornmeal = 1,
		/obj/item/storage/box/spaceman_ration/meats = 1,
		/obj/item/storage/box/spaceman_ration/meats/lizard = 1,
		/obj/item/storage/box/spaceman_ration/meats/fish = 1,
		/obj/item/storage/box/spaceman_ration/plants = 2,
		/obj/item/storage/box/spaceman_ration/plants/alternate = 2,
		/obj/item/storage/box/spaceman_ration/plants/lizard = 2,
		/obj/item/storage/box/spaceman_ration/plants/mothic = 2,
		/obj/item/storage/box/papersack/ration_bread_slice = 1,
		/obj/item/storage/box/colonial_rations = 1,
	)

/obj/effect/spawner/random/entertainment/money/one
	spawn_loot_count = 1

/obj/effect/spawner/random/entertainment/money_small/one
	spawn_loot_count = 1

/obj/effect/spawner/random/epic_loot/random_keycard
	name = "random keycard spawner"
	desc = "Automagically transforms into a random colored keycard."
	icon_state = "keycard_random"
	loot = list(
		/obj/item/keycard/epic_loot/green = 1,
		/obj/item/keycard/epic_loot/teal = 1,
		/obj/item/keycard/epic_loot/blue = 1,
		/obj/item/keycard/epic_loot/ourple = 1,
		/obj/item/keycard/epic_loot/red = 1,
		/obj/item/keycard/epic_loot/orange = 1,
		/obj/item/keycard/epic_loot/yellow = 1,
		/obj/item/keycard/epic_loot/black = 1,
	)

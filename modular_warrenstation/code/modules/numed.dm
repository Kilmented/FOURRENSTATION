/datum/reagent/consumable/tricordrazine
	name = "Tricordrazine"
	description = "A gulp a day keeps the Medibot away! A refined mix of chemicals that heals most damage types fairly quickly."
	color = "#FF8CFF" // rgb: 255, 140, 255
	quality = DRINK_VERYGOOD
	taste_description = "bubblegum"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/tricordrazine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update = affected_mob.adjustBruteLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustToxLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/consumable/bicaridine
	name = "Bicaridine"
	description = "A gulp a day keeps the Medibot away! A refined mix of chemicals that heals brute damage quickly."
	color = "#ff5d5d"
	quality = DRINK_VERYGOOD
	taste_description = "cherries"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/bicaridine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update = affected_mob.adjustBruteLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/consumable/kelotane
	name = "Kelotane"
	description = "A gulp a day keeps the Medibot away! A refined mix of chemicals that heals burn damage quickly."
	color = "#ffa65d"
	quality = DRINK_VERYGOOD
	taste_description = "oranges"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/kelotane/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustFireLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/consumable/dylovene
	name = "Dylovene"
	description = "A gulp a day keeps the Medibot away! A refined mix of chemicals that heals toxin damage quickly."
	color = "#90ff5d"
	quality = DRINK_VERYGOOD
	taste_description = "green apples"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/dylovene/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update += affected_mob.adjustToxLoss(-1 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/chemical_reaction/drink/tricordrazine
	results = list(/datum/reagent/consumable/tricordrazine = 3)
	required_reagents = list(/datum/reagent/consumable/bicaridine = 1, /datum/reagent/consumable/kelotane = 1, /datum/reagent/consumable/dylovene = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_BRUTE | REACTION_TAG_BURN | REACTION_TAG_TOXIN | REACTION_TAG_OXY

/datum/chemical_reaction/drink/bicaridine
	results = list(/datum/reagent/consumable/bicaridine = 3)
	required_reagents = list(/datum/reagent/carbon = 1, /datum/reagent/oxygen = 1, /datum/reagent/consumable/sugar = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_BRUTE

/datum/chemical_reaction/drink/kelotane
	results = list(/datum/reagent/consumable/kelotane = 2)
	required_reagents = list(/datum/reagent/silicon = 1, /datum/reagent/carbon = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_BURN

/datum/chemical_reaction/drink/dylovene
	results = list(/datum/reagent/consumable/dylovene = 3)
	required_reagents = list(/datum/reagent/nitrogen = 1, /datum/reagent/silicon = 1, /datum/reagent/potassium = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_BURN

// SYNTH REPAIR HOTSTUFF

// Used to stop synth structural damage
/obj/item/stack/medical/wound_recovery/robofoam
	name = "robotic repair spray"
	singular_name = "robotic repair spray"
	desc = "A needle-tip foam gun filled with an advanced synthetic foam that rapidly \
		fills and stabilizes structural damage in synthetics. The damaged area will be \
		vulnerable to further damage while the foam hardens"
	icon = 'modular_nova/modules/deforest_medical_items/icons/stack_items.dmi'
	icon_state = "robofoam"
	inhand_icon_state = "implantcase"
	applicable_wounds = list(
		/datum/wound/blunt/robotic,
	)
	max_amount = 2
	amount = 2
	merge_type = /obj/item/stack/medical/wound_recovery/robofoam
	treatment_sound = 'sound/effects/spray.ogg'
	causes_pain = FALSE

/obj/item/stack/medical/wound_recovery/robofoam/examine(mob/user)
	. = ..()
	. += span_notice("This <b>cheaper</b> foam can only be used to fill <b>structural</b> wounds on synthetics.")
	return .

/obj/item/stack/medical/wound_recovery/robofoam/post_heal_effects(amount_healed, mob/living/carbon/healed_mob, mob/user)
	. = ..()
	healed_mob.reagents.add_reagent(/datum/reagent/medicine/nanite_slurry, 5)
	healed_mob.reagents.add_reagent(/datum/reagent/medicine/coagulant/fabricated, 5)

// Used to cure practically any synthetic wound
/obj/item/stack/medical/wound_recovery/robofoam_super
	name = "premium robotic repair spray"
	singular_name = "premium robotic repair spray"
	desc = "A needle-tip foam gun filled with an advanced synthetic foam that rapidly \
		fills and stabilizes structural damage in synthetics. The damaged area will be \
		vulnerable to further damage while the foam hardens. \
		This special premium type can also be used to repair almost any possible type \
		of synthetic damage."
	icon = 'modular_nova/modules/deforest_medical_items/icons/stack_items.dmi'
	icon_state = "robofoam_super"
	inhand_icon_state = "implantcase"
	applicable_wounds = list(
		/datum/wound/blunt/robotic,
		/datum/wound/muscle/robotic,
		/datum/wound/electrical_damage,
		/datum/wound/burn/robotic,
	)
	max_amount = 2
	amount = 2
	merge_type = /obj/item/stack/medical/wound_recovery/robofoam_super
	treatment_sound = 'sound/effects/spray.ogg'
	causes_pain = FALSE

/obj/item/stack/medical/wound_recovery/robofoam_super/examine(mob/user)
	. = ..()
	. += span_notice("This more <b>expensive</b> foam can be used to fill <b>any</b> type of wound on synthetics.")
	return .

/obj/item/stack/medical/wound_recovery/robofoam_super/post_heal_effects(amount_healed, mob/living/carbon/healed_mob, mob/user)
	. = ..()
	healed_mob.reagents.add_reagent(/datum/reagent/medicine/coagulant/fabricated, 5)
	healed_mob.reagents.add_reagent(/datum/reagent/medicine/nanite_slurry, 5)
	healed_mob.reagents.add_reagent(/datum/reagent/dinitrogen_plasmide, 5)

// Synth repair patch, gives the synth a small amount of healing chems
/obj/item/reagent_containers/pill/robotic_patch
	name = "robotic patch"
	desc = "A chemical patch for touch-based applications on synthetics."
	icon = 'modular_nova/modules/deforest_medical_items/icons/stack_items.dmi'
	icon_state = "synth_patch"
	inhand_icon_state = null
	possible_transfer_amounts = list()
	volume = 40
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 3 SECONDS
	dissolvable = FALSE

/obj/item/reagent_containers/pill/robotic_patch/attack(mob/living/L, mob/user)
	if(ishuman(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, span_warning("The limb is missing!"))
			return
		if(!IS_ROBOTIC_LIMB(affecting))
			to_chat(user, span_notice("Robotic patches won't work on an organic limb!"))
			return
	return ..()

/obj/item/reagent_containers/pill/robotic_patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return FALSE
	return TRUE

// The actual patch
/obj/item/reagent_containers/pill/robotic_patch/synth_repair
	name = "robotic repair patch"
	desc = "A sealed patch with a small nanite swarm along with electrical coagulant reagents to repair small amounts of synthetic damage."
	icon_state = "synth_patch"
	list_reagents = list(
		/datum/reagent/medicine/nanite_slurry = 10,
		/datum/reagent/dinitrogen_plasmide = 5,
		/datum/reagent/medicine/coagulant/fabricated = 10,
	)


// Medpen for robots that fixes toxin damage and purges synth chems but slows them down for a bit
/obj/item/reagent_containers/hypospray/medipen/deforest/robot_system_cleaner
	name = "synthetic cleaner autoinjector"
	desc = "A Deforest branded autoinjector, loaded with system cleaner for purging synthetics of reagents."
	base_icon_state = "robor"
	icon_state = "robor"
	list_reagents = list(
		/datum/reagent/medicine/system_cleaner = 15,
		/datum/reagent/dinitrogen_plasmide = 5,
	)

// Medpen for robots that fixes brain damage but slows them down for a bit
/obj/item/reagent_containers/hypospray/medipen/deforest/robot_liquid_solder
	name = "synthetic smart-solder autoinjector"
	desc = "A Deforest branded autoinjector, loaded with liquid solder to repair synthetic processor core damage."
	base_icon_state = "robor_brain"
	icon_state = "robor_brain"
	list_reagents = list(
		/datum/reagent/medicine/liquid_solder = 15,
		/datum/reagent/dinitrogen_plasmide = 5,
	)


// recipe for the biogen

/datum/design/organic_printer_synth_patch
	name = "Robotic Repair Patch"
	id = "organic_repair_patch"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/reagent_containers/pill/robotic_patch/synth_repair
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)

/datum/design/organic_printer_repair_foam
	name = "Robotic Repair Spray"
	id = "organic_repair_foam"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	build_path = /obj/item/stack/sticky_tape/surgical
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_DEFOREST_MEDICAL,
	)


// Pre-packed medkit for healing synths and repairing their wounds rapidly in the field
/obj/item/storage/medkit/robotic_repair
	name = "robotic repair equipment kit"
	desc = "An industrial-strength plastic box filled with supplies for repairing synthetics from critical damage."
	icon = 'modular_nova/modules/deforest_medical_items/icons/storage.dmi'
	icon_state = "synth_medkit"
	inhand_icon_state = "medkit"
	worn_icon = 'modular_nova/modules/deforest_medical_items/icons/worn/worn.dmi'
	worn_icon_teshari = 'modular_nova/modules/deforest_medical_items/icons/worn/worn_teshari.dmi'
	worn_icon_state = "frontier"
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'

/obj/item/storage/medkit/robotic_repair/Initialize(mapload)
	. = ..()
	var/static/list/list_of_everything_mechanical_medkits_can_hold = list_of_everything_medkits_can_hold + list(
		/obj/item/stack/cable_coil,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/multitool,
		/obj/item/plunger,
		/obj/item/clothing/head/utility/welding,
		/obj/item/clothing/glasses/welding,
	)
	var/static/list/exception_cache = typecacheof(
		/obj/item/clothing/head/utility/welding,
	)

	atom_storage.set_holdable(list_of_everything_mechanical_medkits_can_hold)
	LAZYINITLIST(atom_storage.exception_hold)
	atom_storage.exception_hold = atom_storage.exception_hold + exception_cache
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL

/obj/item/storage/medkit/robotic_repair/stocked

/obj/item/storage/medkit/robotic_repair/stocked/PopulateContents()
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze = 1,
		/obj/item/reagent_containers/pill/robotic_patch/synth_repair = 2,
		/obj/item/stack/medical/wound_recovery/robofoam = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/robot_system_cleaner = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/coagulants = 1, // Coagulants help electrical damage
		/obj/item/healthanalyzer/simple = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/medkit/robotic_repair/preemo
	name = "premium robotic repair equipment kit"
	desc = "An industrial-strength plastic box filled with supplies for repairing synthetics from critical damage. \
		This one has extra storage on the sides for even more equipment than the standard medkit model."
	icon_state = "synth_medkit_super"

/obj/item/storage/medkit/robotic_repair/preemo/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_slots = 12
	atom_storage.max_total_storage = 12 * WEIGHT_CLASS_NORMAL

/obj/item/storage/medkit/robotic_repair/preemo/stocked

/obj/item/storage/medkit/robotic_repair/preemo/stocked/PopulateContents()
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze/twelve = 1,
		/obj/item/stack/cable_coil/thirty = 1,
		/obj/item/reagent_containers/pill/robotic_patch/synth_repair = 4,
		/obj/item/stack/medical/wound_recovery/robofoam = 1,
		/obj/item/stack/medical/wound_recovery/robofoam_super = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/robot_system_cleaner = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/robot_liquid_solder = 1,
		/obj/item/reagent_containers/hypospray/medipen/deforest/coagulants = 1,
		/obj/item/healthanalyzer/simple = 1,
	)
	generate_items_inside(items_inside,src)


// For our version of the Med-Vend. Turns all $$$ into EXPENSIVE medical supplies
/obj/machinery/vending/deforest_medvend
	name = "\improper VigorTechLLC Med-Vend"
	desc = "A vending machine providing a selection of medical supplies."
	icon = 'modular_nova/modules/deforest_medical_items/icons/vendor.dmi'
	icon_state = "medvend"
	panel_type = "panel15"
	light_mask = "medvend-light-mask"
	max_integrity = 99999 // simply good luck
	tiltable = FALSE
	light_color = LIGHT_COLOR_LIGHT_CYAN
	product_slogans = "Medical care at regulation-mandated reasonable prices!;DeForest is not liable for accidents due to supply misuse!"
	product_categories = list(
		list(
			"name" = "First Aid",
			"icon" = "notes-medical",
			"products" = list(
				/obj/item/stack/medical/ointment/red_sun = 20,
				/obj/item/stack/medical/ointment = 20,
				/obj/item/stack/medical/bruise_pack = 20,
				/obj/item/stack/medical/gauze/sterilized = 20,
				/obj/item/stack/medical/suture/coagulant = 20,
				/obj/item/stack/medical/suture = 20,
				/obj/item/stack/medical/suture/bloody = 20,
				/obj/item/stack/medical/mesh = 20,
				/obj/item/stack/medical/mesh/bloody = 20,
				/obj/item/stack/medical/bandage = 20,
				/obj/item/reagent_containers/pill/robotic_patch/synth_repair = 20,
				/obj/item/stack/medical/wound_recovery = 20,
				/obj/item/stack/medical/wound_recovery/rapid_coagulant = 20,
				/obj/item/stack/medical/wound_recovery/robofoam = 20,
				/obj/item/stack/medical/wound_recovery/robofoam_super = 20,
				/obj/item/storage/pill_bottle/painkiller = 20,
				/obj/item/storage/medkit/civil_defense/stocked = 20,
			),
		),
		list(
			"name" = "Autoinjectors",
			"icon" = "syringe",
			"products" = list(
				/obj/item/reagent_containers/hypospray/medipen/deforest/occuisate = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/adrenaline = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/morpital = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/lipital = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/meridine = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/calopine = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/coagulants = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/lepoturi = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/psifinil = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/halobinin = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/robot_system_cleaner = 20,
				/obj/item/reagent_containers/hypospray/medipen/deforest/robot_liquid_solder = 20,
			),
		),
	)
	contraband = list(
		/obj/item/reagent_containers/hypospray/medipen/deforest/pentibinin = 20,
		/obj/item/reagent_containers/hypospray/medipen/deforest/synephrine = 20,
		/obj/item/reagent_containers/hypospray/medipen/deforest/krotozine = 20,
		/obj/item/reagent_containers/hypospray/medipen/deforest/aranepaine = 20,
		/obj/item/reagent_containers/hypospray/medipen/deforest/synalvipitol = 20,
		/obj/item/reagent_containers/hypospray/medipen/deforest/twitch = 20,
		/obj/item/reagent_containers/hypospray/medipen/deforest/demoneye = 20,
	)

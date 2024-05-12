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

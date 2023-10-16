/datum/config_entry/flag/disable_antag_opt_in_preferences
	default = FALSE

/datum/preference/toggle/master_antag_opt_in_preferences
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "master_antag_opt_in_pref"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = TRUE

/datum/preference/toggle/master_antag_opt_in_preferences/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_antag_opt_in_preferences))
		return FALSE

	return TRUE

/datum/preference/toggle/master_antag_opt_in_preferences/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_antag_opt_in_preferences))
		return FALSE
	. = ..()

/datum/preference/toggle/antag_opt_in
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER
	savefile_key = "antag_opt_in_pref"
	default_value = FALSE

/datum/preference/toggle/antag_opt_in/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_antag_opt_in_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_antag_opt_in_preferences)

/datum/preference/toggle/antag_opt_in/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_antag_opt_in_preferences))
		return FALSE
	if(!preferences.read_preference(/datum/preference/toggle/master_antag_opt_in_preferences))
		return FALSE
	. = ..()



/datum/preference/choiced/antag_opt_in_status
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "antag_opt_in_status_pref"

/datum/preference/choiced/antag_opt_in_status/init_possible_values()
	return list("No", "Yes - Kidnap / Inconvenience", "Yes - Kill", "Yes - Round Remove")

/datum/preference/choiced/antag_opt_in_status/create_default_value()
	return "No"

/datum/preference/choiced/antag_opt_in_status/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_antag_opt_in_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_antag_opt_in_preferences)

/datum/preference/choiced/antag_opt_in_status/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_antag_opt_in_preferences))
		return "No"
	if(!preferences.read_preference(/datum/preference/toggle/master_antag_opt_in_preferences))
		return "No"
	. = ..()

/datum/preference/choiced/antag_opt_in_status/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE


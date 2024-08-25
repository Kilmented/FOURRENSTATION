/// Some starter text sent to the Hemophage initially, because Hemophages have shit to do to stay alive.
#define HEMOPHAGE_SPAWN_TEXT "You are an [span_danger("Hemophage")]. You will slowly but constantly lose blood if outside of a closet-like object. If inside a closet-like object, or in pure darkness, you will slowly heal, at the cost of blood. You may gain more blood by grabbing a live victim and using your drain ability."


/datum/species/hemophage
	name = "Hemophage"
	id = SPECIES_HEMOPHAGE
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_OXYIMMUNE,
		TRAIT_VIRUSIMMUNE,
		TRAIT_LITERATE,
		TRAIT_DRINKS_BLOOD,
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_HUMANOID | MOB_ORGANIC
	exotic_bloodtype = "U"
	mutantheart = /obj/item/organ/internal/heart/hemophage
	mutantliver = /obj/item/organ/internal/liver/hemophage
	mutantstomach = /obj/item/organ/internal/stomach/hemophage
	mutanttongue = /obj/item/organ/internal/tongue/hemophage
	mutantlungs = null
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	examine_limb_id = SPECIES_HUMAN
	skinned_type = /obj/item/stack/sheet/animalhide/human
	veteran_only = FALSE // eat it

/datum/species/hemophage/allows_food_preferences()
	return FALSE

/datum/species/hemophage/get_default_mutant_bodyparts()
	return list(
		"legs" = list("Normal Legs", FALSE),
	)

/datum/species/hemophage/check_roundstart_eligible()
	if(check_holidays(HALLOWEEN))
		return TRUE

	return ..()

/datum/species/hemophage/on_species_gain(mob/living/carbon/human/new_hemophage, datum/species/old_species, pref_load)
	. = ..()
	to_chat(new_hemophage, HEMOPHAGE_SPAWN_TEXT)
	new_hemophage.update_body()


/datum/species/hemophage/get_species_description()
	return "Oftentimes feared or pushed out of society for the predatory nature of their condition, \
		Hemophages are typically mixed around various Frontier populations, keeping their true nature hidden while \
		reaping both the benefits and easy access to prey, enjoying unpursued existences on the Frontier."


/datum/species/hemophage/get_species_lore()
	return list(
		"Though known by many other names, 'Hemophages' are those that have found themselves the host of a bloodthirsty infection. 'Natural' hemophages have their infection first overtake their body through the bloodstream, though methods vary. \
		Even adopting pets is made nigh-on-impossible for them. Those that exist typically end up part of oft-ephemeral networks of others of their kind, offering time-sensitive advice on where certain 'low-risk' or 'less-than-legal' meals may be found and forcing themselves to work past their base instincts to cooperate to an extent; anything else would mean death."
	)


/datum/species/hemophage/prepare_human_for_preview(mob/living/carbon/human/human)
	human.skin_tone = "albino"
	human.hair_color = "#1d1d1d"
	human.hairstyle = "Pompadour (Big)"
	regenerate_organs(human, src, visual_only = TRUE)
	human.update_body(TRUE)


/datum/species/hemophage/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "moon",
			SPECIES_PERK_NAME = "Darkness Affinity",
			SPECIES_PERK_DESC = "A Hemophage is only at home in the darkness, the infection \
								within a Hemophage seeking to return them to a healthy state \
								whenever it can be in the shadow. However, light artificial or \
								otherwise irritates their bodies and the cancer keeping them alive, \
								not harming them but keeping them from regenerating. Modern \
								Hemophages have been known to use lockers as a convenient \
								source of darkness, while the extra protection they provide \
								against background radiations allows their tumor to avoid \
								having to expend any blood to maintain minimal bodily functions \
								so long as their host remains stationary in said locker.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "biohazard",
			SPECIES_PERK_NAME = "Viral Symbiosis",
			SPECIES_PERK_DESC = "Hemophages, due to their condition, cannot get infected by \
								other viruses and don't actually require an external source of oxygen \
								to stay alive.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "tint",
			SPECIES_PERK_NAME = "The Thirst",
			SPECIES_PERK_DESC = "In place of eating, Hemophages suffer from the Thirst, caused by their tumor. \
								Thirst of what? Blood! Their tongue allows them to grab people and drink \
								their blood, and they will suffer severe consequences if they run out. As a note, \
								it doesn't matter whose blood you drink, it will all be converted into your blood \
								type when consumed. That being said, the blood of other sentient humanoids seems \
								to quench their Thirst for longer than otherwise-acquired blood would.",
		),
	)

	return to_add


/datum/species/hemophage/create_pref_blood_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "tint",
		SPECIES_PERK_NAME = "Universal Blood",
		SPECIES_PERK_DESC = "[plural_form] have blood that appears to be an amalgamation of all other \
							blood types, made possible thanks to some special antigens produced by \
							their tumor, making them able to receive blood of any other type, so \
							long as it is still human-like blood.",
		),
	)

	return to_add


// We don't need to mention that they're undead, as the perks that come from it are otherwise already explicited, and they might no longer be actually undead from a gameplay perspective, eventually.
/datum/species/hemophage/create_pref_biotypes_perks()
	return


#undef HEMOPHAGE_SPAWN_TEXT

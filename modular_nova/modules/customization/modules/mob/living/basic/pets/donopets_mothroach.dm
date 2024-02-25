/mob/living/basic/mothroach/pet
	name = "pet mothroach"
	desc = "A domestic mothroach that has learnt commands."

	ai_controller = /datum/ai_controller/basic_controller/mothroach/pet

	// doesn't include attack bc mothroaches are prolly too weak for that
	var/static/list/pet_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/good_boy,
		/datum/pet_command/follow,
		/datum/pet_command/point_targeting/fetch,
		/datum/pet_command/play_dead,
	)

/mob/living/basic/mothroach/pet/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/obeys_commands, pet_commands)

/// needs to be able to speak per normal, plan commands, and flee if they feel threatened
/datum/ai_controller/basic_controller/mothroach/pet
	blackboard = list(
		BB_VISION_RANGE = AI_DOG_VISION_RANGE,
		BB_PET_TARGETING_STRATEGY = /datum/targeting_strategy/basic/not_friends,
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic/holding_object,
		BB_TARGET_HELD_ITEM = /obj/item/clothing/under/color/grey, //they're coming for your clothing
	)
	planning_subtrees = list(
		/datum/ai_planning_subtree/random_speech/mothroach,
		/datum/ai_planning_subtree/pet_planning,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/flee_target,
	)



/// == DOINATOR PET: Mr. Fluff, Central's Mothroach, ckey centralsmith ==
/mob/living/basic/mothroach/pet/mr_fluff
	name = "Mr. Fluff"
	desc = "Central's beloved pet mothroach, Mr. Fluff.  He looks so happy to be here!"
	gender = MALE
	icon = 'modular_nova/master_files/icons/mob/pets.dmi'
	icon_state = "mr_fluff"
	icon_living = "mr_fluff"
	icon_dead = "mr_fluff_dead"

/obj/item/clothing/head/mob_holder/pet/donopet_centralsmith
	name = "Mr. Fluff"
	desc = "Central's beloved pet mothroach, Mr. Fluff.  He looks so happy to be here!"
	icon = 'modular_nova/master_files/icons/mob/pets.dmi'
	icon_state = "mr_fluff"

	starting_pet = /mob/living/basic/mothroach/pet/mr_fluff

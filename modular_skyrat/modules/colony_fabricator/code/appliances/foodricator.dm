/obj/machinery/biogenerator/foodricator
	name = "organic rations printer"
	desc = "An advanced machine seen in frontier outposts and colonies capable of turning organic plant matter into \
		various foods or ingredients. The best friend of a chef where deliveries are inconsistent or simply don't exist. \
		Some of those that consume the food from this complain that the foods it makes have poor taste, though they must \
		not appreciate being able to eat steak and eggs for breakfast with a lack of any livestock at all in the colony."
	icon = 'modular_skyrat/modules/colony_fabricator/icons/foodricator.dmi'
	circuit = null
	anchored = FALSE
	pass_flags = PASSTABLE
	efficiency = 1
	productivity = 2
	anchored_tabletop_offset = 8
	show_categories = list(
		RND_CATEGORY_AKHTER_FOODRICATOR_INGREDIENTS,
		RND_CATEGORY_AKHTER_FOODRICATOR_BAGS,
		RND_CATEGORY_AKHTER_FOODRICATOR_SNACKS,
		RND_CATEGORY_AKHTER_FOODRICATOR_UTENSILS,
		RND_CATEGORY_AKHTER_SEEDS,
	)

/obj/machinery/biogenerator/foodricator/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_FRONTIER)

/obj/machinery/biogenerator/foodricator/RefreshParts()
	. = ..()
	efficiency = 1
	productivity = 3

/obj/machinery/biogenerator/foodricator/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	default_unfasten_wrench(user, tool)
	return ITEM_INTERACT_SUCCESS

/obj/machinery/biogenerator/foodricator/default_deconstruction_crowbar()
	return

// Deployable item for cargo for the rations printer

/obj/item/flatpacked_machine/organics_ration_printer
	name = "organic rations printer parts kit"
	icon = 'modular_skyrat/modules/colony_fabricator/icons/foodricator.dmi'
	icon_state = "biogenerator_parts"
	type_to_deploy = /obj/machinery/biogenerator/foodricator

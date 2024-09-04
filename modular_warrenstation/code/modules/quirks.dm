// how much nutrition do we lose
#define MAGIC_NUTRITION_MILD 1.5
#define MAGIC_NUTRITION_MODERATE 2.5
#define MAGIC_NUTRITION_SEVERE 4
#define MAGIC_MANA_REGAIN_TICK 1

/datum/quirk/magical
	name = "Magical"
	desc = "You've got access to other kinds of Lich particles that to basically everybody else, \
		appears outwardly as magic. You get an assortment of lesser spells fuelled by your mana and nutrition - manage them wisely!"
	gain_text = span_notice("Magical potential floods your nervous system!")
	lose_text = span_notice("Mundanity descends upon you as your magic power flees...")
	value = 4
	quirk_flags = QUIRK_PROCESSES
	medical_record_text = "Subject appears to have enhanced sensitivity to resonance exudate, and is able to manifest supernatural phenomena."
	mob_trait = TRAIT_MAGICALLY_GIFTED
	icon = FA_ICON_MAGIC
	/// The mana value held by the quirk and used to power quirk-only spells.
	var/mana = 100
	/// The maximum possible mana value, in case we want to increase this at any point.
	var/max_mana = 100
	/// The list of spells we've added for cleanup upon quirk removal.
	var/list/added_spells = list()
	/// TimerID for the mana notification alert
	var/mana_notify
	/// Is regeneration currently halted at the moment?
	var/halt_regen = FALSE
	/// The bonded item we've marked. Holding this gives us a pretty big mana regeneration efficiency buff.
	var/obj/bonded_item
	/// Our current mana regeneration modifier. Scale this UP to make things more efficient.
	var/regeneration_mana_modifier = 0
	/// Our current nutrition efficiency modifier. Scale this DOWN to make things more efficient.
	var/regeneration_nutrition_modifier = 0

/datum/quirk/magical/process(seconds_per_tick)
	var/mob/living/carbon/human/human_holder = quirk_holder
	if (human_holder.stat == DEAD)
		return

	var/regained_mana = FALSE
	var/regen_bonus_mana = 1.0
	var/regen_bonus_nutrition = 1.0

	//we're holding our bonded item! yippee! give us some regen buffs.
	if (bonded_item && human_holder.get_active_held_item() == bonded_item)
		regen_bonus_mana += regeneration_mana_modifier
		regen_bonus_nutrition += regeneration_nutrition_modifier

	//may also wanna put some reagents checking in here so we can have stuff that'll help restore mana quickly
	// like chems or wiz fizz or whatever
	if ((mana < max_mana) && !halt_regen && human_holder.nutrition > 0)
		// we're low on mana so regain it!
		regained_mana = TRUE
		if (mana < max_mana*0.3)
			human_holder.adjust_nutrition(-(MAGIC_NUTRITION_SEVERE*regen_bonus_nutrition))
			mana += (MAGIC_MANA_REGAIN_TICK * 2.5) * regen_bonus_mana
		else if (mana < max_mana*0.6)
			human_holder.adjust_nutrition(-(MAGIC_NUTRITION_MODERATE*regen_bonus_nutrition))
			mana += (MAGIC_MANA_REGAIN_TICK * 1.5) * regen_bonus_mana
		else
			human_holder.adjust_nutrition(-(MAGIC_NUTRITION_MILD*regen_bonus_nutrition))
			mana += (MAGIC_MANA_REGAIN_TICK) * regen_bonus_mana

		//ensure we never exceed the max mana from regen
		mana = min(max_mana, mana)
	else
		//clear out the mana timer in case we have it, since we've got full mana now
		if (mana_notify)
			mana_notify_reset()

	if (regained_mana)
		human_holder.apply_status_effect(/datum/status_effect/mana_regeneration)
	else
		human_holder.remove_status_effect(/datum/status_effect/mana_regeneration)

/datum/quirk/magical/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder

	//lesser arcane barrage - costs 25 mana to summon and 2 mana per shot for 30 shots total (85 mana)
	var/datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser/barrage = new /datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser()
	barrage.Grant(human_holder)
	added_spells += barrage

	//shift - 35 mana telegram scepter jaunt for 5 tiles instead of 8, up to 3 tiles imprecision depending on flux & mana
	var/datum/action/cooldown/spell/pointed/shift/shift_spell = new /datum/action/cooldown/spell/pointed/shift
	shift_spell.Grant(human_holder)
	added_spells += shift_spell

	//lesser fleshmend: an exercise in why real wizards use staves and wands for healing. excruciatingly painful triage healing
	var/datum/action/cooldown/spell/touch/fleshmend_lesser/fleshmend_spell = new /datum/action/cooldown/spell/touch/fleshmend_lesser
	fleshmend_spell.Grant(human_holder)
	added_spells += fleshmend_spell

	// bonded item: basically instant summons but we also get a small buff to mana regeneration when holding it (larger if it's a staff)
	var/datum/action/cooldown/spell/summonitem/lesser/summon_spell = new /datum/action/cooldown/spell/summonitem/lesser
	summon_spell.Grant(human_holder)
	added_spells += summon_spell

/datum/quirk/magical/remove()
	QDEL_LIST(added_spells)

/datum/quirk/magical/proc/can_cast_spell(mana_cost)
	if (mana_cost <= mana)
		return TRUE
	else
		return FALSE

/datum/quirk/magical/proc/set_bonded_item(obj/item/thing)
	// Sets whatever the hell our bonded item is and adjusts regen modifiers appropriately.
	regeneration_mana_modifier = initial(regeneration_mana_modifier)
	regeneration_nutrition_modifier = initial(regeneration_nutrition_modifier)

	// for a little extra flavor, if our bonded item is any kind of staff (even a kludged, player-crafted renamed one), lets give it a pretty ample mana regen buff
	if (findtext(thing.name, "staff"))
		regeneration_mana_modifier += 0.25

	//let's make nutrition a little easier for everyone too
	regeneration_nutrition_modifier -= 0.15
	regeneration_mana_modifier += 0.25

	bonded_item = thing

/// To be called inside spells/items that should consume mana from the Magical quirk. Deducts mana and calls appropriate checks.
/datum/quirk/magical/proc/cast_quirk_spell(mana_cost)
	mana -= mana_cost
	mana = max(0, mana)
	on_cast_mana_checks()

/datum/quirk/magical/proc/start_mana_notify()
	// Handles starting the mana notification timer.
	var/mob/living/carbon/human/human_holder = quirk_holder
	mana_notify = addtimer(CALLBACK(src, PROC_REF(mana_notify_reset), human_holder), 3 SECONDS, TIMER_STOPPABLE | TIMER_DELETE_ME)

/datum/quirk/magical/proc/mana_notify_reset()
	// Resets the mana notification timer cleanly.
	deltimer(mana_notify)
	mana_notify = null

/datum/quirk/magical/proc/on_cast_mana_checks()
	var/mob/living/carbon/human/human_holder = quirk_holder

	var/half_threshold = max_mana * 0.5
	var/critical_threshold = max_mana * 0.2

	if (!mana_notify)
		// check to see if the player needs to get mana level alerts
		if (mana <= critical_threshold)
			human_holder.balloon_alert(human_holder, "mana critically low!!!")
			start_mana_notify()
		else if (mana <= half_threshold)
			human_holder.balloon_alert(human_holder, "half mana left!")
			start_mana_notify()

	// are we casting on an empty stomach? that's no good.
	switch(human_holder.nutrition)
		if (1 to NUTRITION_LEVEL_STARVING)
			if (rand(3))
				human_holder.adjustStaminaLoss(35)
				human_holder.visible_message(
					span_danger("[human_holder] looks exhausted, breathing heavily!"),
					span_danger("Lacking any calorific reserves, your body struggles with your mana channeling!"),
				)
		if (0)
			//nothing's in the tank, boss. nighty night
			human_holder.visible_message(
				span_danger("[human_holder] teeters on the spot for a moment, then collapses from exhaustion."),
				span_userdanger("You expend the last bit of energy you have left, and promptly fall unconscious!")
			)
			human_holder.SetSleeping(10 SECONDS)
			to_chat(human_holder, span_boldnotice("You really need to get something to eat!"))

#undef MAGIC_NUTRITION_MILD
#undef MAGIC_NUTRITION_MODERATE
#undef MAGIC_NUTRITION_SEVERE
#undef MAGIC_MANA_REGAIN_TICK

/particles/mana_regain
	icon = 'icons/effects/particles/echo.dmi'
	icon_state = list("echo1" = 3, "echo2" = 1, "echo3" = 1)
	width = 40
	height = 80
	count = 1000
	spawning = 1
	lifespan = 1 SECONDS
	fade = 0.5 SECONDS
	friction = 0.25
	position = generator(GEN_SPHERE, 12, 12, NORMAL_RAND)
	drift = generator(GEN_VECTOR, list(-1, 1), list(1, 1), NORMAL_RAND)
	color = COLOR_BLUE_LIGHT

/atom/movable/screen/alert/status_effect/mana_regeneration
	name = "Regenerating Mana"
	desc = "Your body and mind are currently converting nutrition into mana to fuel your magical arts."
	icon_state = "cell_overcharge1"

/datum/status_effect/mana_regeneration
	id = "mana_regeneration"
	status_type = STATUS_EFFECT_REFRESH
	duration = 3 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/mana_regeneration

/datum/status_effect/mana_regeneration/update_particles()
	if(isnull(particle_effect))
		particle_effect = new(owner, /particles/mana_regain)

	particle_effect.alpha = 200
	var/original_duration = initial(duration)
	if(original_duration == -1)
		return
	animate(particle_effect, alpha = 50, time = original_duration)

/datum/status_effect/mana_regeneration/refresh(effect, ...)
	. = ..()
	update_particles()

/datum/action/cooldown/spell/summonitem/lesser
	name = "Bonded Object"
	desc = "This spell allows you to tie some of your mana to a treasured object of yours, \
		allowing you to retrieve it from just about anywhere within a five solar system radius. \
		In addition, while held in your hands, your bonded item will help you regenerate mana more efficiently, \
		and if it is a staff of some kind, even more efficiently again."
	invocation_type = INVOCATION_NONE
	/// How much mana does this cost to use?
	var/mana_cost = 25

/datum/action/cooldown/spell/summonitem/lesser/cast(mob/living/cast_on)
	var/mob/living/carbon/human/owner_human = owner
	var/datum/quirk/magical/mage = owner_human.get_quirk(/datum/quirk/magical)
	if (!mage)
		owner.balloon_alert(owner, "can't cast: no magical talent!")
		return FALSE

	if (!mage.bonded_item)
		if (!mage.can_cast_spell(mana_cost*3))
			owner.balloon_alert(owner, "not enough mana (need 75 to bond an item)")
			return FALSE
		mage.cast_quirk_spell(mana_cost*3) //increase mana cost to 75 if we're bonding an item for the first time
	else
		if (!mage.can_cast_spell(mana_cost))
			owner.balloon_alert(owner, "not enough mana!")
			return FALSE
		mage.cast_quirk_spell(mana_cost)

	. = ..()

/datum/action/cooldown/spell/summonitem/lesser/mark_item(obj/to_mark)
	. = ..()
	var/mob/living/carbon/human/owner_human = owner
	var/datum/quirk/magical/mage = owner_human.get_quirk(/datum/quirk/magical)
	if (mage && marked_item)
		mage.set_bonded_item(marked_item)

/datum/action/cooldown/spell/summonitem/lesser/unmark_item()
	. = ..()
	var/mob/living/carbon/human/owner_human = owner
	var/datum/quirk/magical/mage = owner_human.get_quirk(/datum/quirk/magical)
	if (mage && marked_item)
		mage.bonded_item = null

// LESSER ARCANE BARRAGE
/datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser
	name = "Lesser Arcane Barrage"
	desc = "Unleash a small torrent of energy at your foes with this spell. \
		Consumes 2 mana with every shot, and will spend up to 60 before dispersing."
	button_icon_state = "arcane_barrage"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	cooldown_time = 10 SECONDS

	item_type = /obj/item/gun/magic/wand/arcane_barrage/lesser
	/// The cost in mana to initially channel this spell
	var/mana_cost = 25

/datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser/cast(atom/cast_on)
	var/mob/living/carbon/human/owner_human = owner
	var/datum/quirk/magical/mage = owner_human.get_quirk(/datum/quirk/magical)
	if (!mage)
		owner.balloon_alert(owner, "can't cast: no magical talent!")
		return FALSE

	if (!mage.can_cast_spell(mana_cost))
		owner.balloon_alert(owner, "not enough mana!")
		return FALSE

	. = ..()

	//tell the quirk we've cast this spell and deduct initial mana accordingly
	mage.cast_quirk_spell(mana_cost)

/datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser

/obj/item/ammo_casing/magic/arcane_barrage/lesser
	projectile_type = /obj/projectile/magic/arcane_barrage/lesser

/obj/projectile/magic/arcane_barrage/lesser
	name = "lesser arcane bolt"
	icon_state = "arcane_barrage"
	damage = 10
	damage_type = BURN
	hitsound = 'sound/weapons/barragespellhit.ogg'

/obj/item/gun/magic/wand/arcane_barrage/lesser
	name = "lesser arcane barrage"
	ammo_type = /obj/item/ammo_casing/magic/arcane_barrage/lesser
	// How much quirk mana does this cost to fire?
	var/cost_to_fire = 2

/obj/item/gun/magic/wand/arcane_barrage/lesser/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	. = ..()
	if(!.)
		return
	if(!charges)
		user.dropItemToGround(src, TRUE)
	if (ishuman(user))
		var/mob/living/carbon/human/human_user = user
		var/datum/quirk/magical/magic_quirk = human_user.get_quirk(/datum/quirk/magical)
		// check to make sure we have enough mana to cast and if we can, deduct, etc
		if (magic_quirk && magic_quirk.can_cast_spell(cost_to_fire))
			magic_quirk.cast_quirk_spell(cost_to_fire)
		else
			human_user.balloon_alert(human_user, "out of mana!")
			user.dropItemToGround(src, TRUE)

/datum/action/cooldown/spell/touch/fleshmend_lesser
	name = "Lesser Fleshmend"
	desc = "Tought to nearly every apprentice by the Spinward Independent Magicians, \
		this spell transmutes a portion of the target's blood and the caster's mana into freshly grown bands \
		of new flesh with one slight caveat: <b>it is EXCRUCIATINGLY painful for the recipient.</b> It also \
		cannot completely mend flesh - some medical assistance will be required, but it is enough to a mage \
		or their apprentice back on their feet (and maybe wishing they weren't)."
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	button_icon = 'icons/mob/actions/actions_revenant.dmi'
	button_icon_state = "r_transmit"

	school = SCHOOL_SANGUINE
	cooldown_time = 60 SECONDS

	invocation_type = INVOCATION_NONE
	invocation = "Tronsum Lunae Santinus Eurekant Oonzu" //if you know, you know

	hand_path = /obj/item/melee/touch_attack/fleshmend_lesser
	can_cast_on_self = TRUE // yeah but... do you want to?
	/// The amount of mana from the magical quirk this costs to cast.
	var/mana_cost = 15
	/// How much mana each tick of healing uses
	var/mana_per_heal_tick = 5

/datum/action/cooldown/spell/touch/fleshmend_lesser/cast(mob/living/carbon/cast_on)
	var/mob/living/carbon/human/owner_human = owner
	var/datum/quirk/magical/mage = owner_human.get_quirk(/datum/quirk/magical)
	if (!mage)
		owner.balloon_alert(owner, "can't cast: no magical talent!")
		return FALSE

	if (!mage.can_cast_spell(mana_cost))
		owner.balloon_alert(owner, "not enough mana!")
		return FALSE

	mage.cast_quirk_spell(mana_cost)
	. = ..()

/datum/action/cooldown/spell/touch/fleshmend_lesser/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/victim, mob/living/carbon/human/caster)
	var/datum/quirk/magical/mage = caster.get_quirk(/datum/quirk/magical)
	if (!mage)
		caster.balloon_alert(caster, "can't cast: no magical talent!")
		return TRUE

	if (!mage.can_cast_spell(mana_cost))
		caster.balloon_alert(caster, "not enough mana!")
		return FALSE

	if (!ishuman(victim))
		caster.balloon_alert(caster, "can't heal that!")
		return FALSE

	var/mob/living/carbon/human/human_victim = victim
	//only works if they're pretty severely brute/burn injured and not much else
	if ((human_victim.getBruteLoss() + human_victim.getFireLoss()) < 44)
		caster.balloon_alert(caster, "not injured enough!")
		return FALSE

	//otherwise, LET'S GET HEALING YAAAY
	caster.visible_message(
		span_danger("[caster] hovers [caster.p_their()] hands over [human_victim] and closes [caster.p_their()] eyes, the flesh of their exposed wounds writhing angrily..."),
		span_notice("You hover your hands over [human_victim] and begin forcing flesh to knit and mend itself...")
	)
	caster.whisper(invocation)
	mage.halt_regen = TRUE // stop regenerating mana while we channel
	var/sound/channel_sound = sound('sound/magic/cosmic_energy.ogg')
	channel_sound.pitch = 1.25

	while (do_after(caster, 1 SECONDS, human_victim) && (human_victim.getBruteLoss() + human_victim.getFireLoss()) > 44 && mage.can_cast_spell(mana_per_heal_tick))
		human_victim.adjustBruteLoss(-5, updating_health = TRUE)
		human_victim.adjustFireLoss(-2.5, updating_health = TRUE)
		human_victim.bleed(1.5)
		playsound(caster, channel_sound, 75, extrarange = MEDIUM_RANGE_SOUND_EXTRARANGE)

		if (human_victim.stat == UNCONSCIOUS)
			human_victim.adjustOxyLoss(-2.5) //just a smidge so crit people aren't unconscious for seven hundred years

		mage.cast_quirk_spell(mana_per_heal_tick)
		if (prob(66))
			//pain time
			human_victim.visible_message(
				span_danger("[human_victim] involuntarily writhes in agony as [caster] continues to mend their flesh together!"),
				span_userdanger("A bolt of RAW AGONY ricochets through your being as nerves that were never meant to touch, touch. It is EXCRUCIATING!!!")
			)
			human_victim.Knockdown(6 SECONDS)
			human_victim.set_jitter_if_lower(5 SECONDS)
			if (prob(50))
				human_victim.emote("scream")

	mage.halt_regen = FALSE
	return TRUE


/obj/item/melee/touch_attack/fleshmend_lesser
	name = "\improper blood-wreathed hand"
	desc = "Uh, this really doesn't look like healing magic, boss..."
	icon = 'icons/obj/weapons/hand.dmi'
	icon_state = "scream_for_me"
	inhand_icon_state = "disintegrate"

/datum/action/cooldown/spell/pointed/shift
	name = "Lesser Shift"
	desc = "Jaunt through the ether a short distance, incurring minor teleportation flux \
		and leaving some of your stomach contents behind. Becomes less accurate the lower on mana you are, and if you have \
		more flux accrued on your person. Teleporting with flux will hurt you a little bit."
	button_icon = 'icons/mob/actions/actions_revenant.dmi'
	button_icon_state = "r_transmit"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	check_flags = AB_CHECK_CONSCIOUS | AB_CHECK_INCAPACITATED
	antimagic_flags = MAGIC_RESISTANCE_HOLY
	cooldown_time = 3 SECONDS
	cast_range = 5
	/// Cost of the cast in quirk mana
	var/mana_cost = 35

/datum/action/cooldown/spell/pointed/shift/is_valid_target(atom/cast_on)
	. = ..()
	if (!.)
		return FALSE

	var/turf/start_turf = get_turf(owner)
	var/turf/target_turf = get_turf(cast_on)

	if(get_dist(start_turf, target_turf) > cast_range)
		owner.balloon_alert(owner, "too far!")
		return FALSE

	if(!(target_turf in view(owner, owner.client?.view || world.view)))
		owner.balloon_alert(owner, "out of view!")
		return FALSE

	if(target_turf.is_blocked_turf(exclude_mobs = TRUE, source_atom = owner))
		owner.balloon_alert(owner, "obstructed!")
		return FALSE

/datum/action/cooldown/spell/pointed/shift/cast(atom/cast_on)
	. = ..()
	handle_teleport(cast_on)

/datum/action/cooldown/spell/pointed/shift/proc/handle_teleport(atom/cast_on)
	// most of this is copy-pasted from teleport_rod.dm and adjusted to work w/ magic quirk
	var/mob/living/carbon/human/owner_human = owner
	var/turf/start_turf = get_turf(owner)
	var/turf/target_turf = get_turf(cast_on)
	var/teleport_precision = 0 // we start perfectly precise and get less depending on factors like flux/mana
	var/datum/quirk/magical/mage = owner_human.get_quirk(/datum/quirk/magical)

	if (!mage)
		owner.balloon_alert(owner, "can't cast: no magical talent!")
		return

	//can we cast the spell to begin with?
	if (!mage.can_cast_spell(mana_cost))
		owner.balloon_alert(owner, "not enough mana!")
		return

	if (mage.mana < (mage.max_mana*0.5))
		teleport_precision += 1
	if (mage.mana < (mage.max_mana*0.25))
		teleport_precision += 1
	if (owner.has_status_effect(/datum/status_effect/teleport_flux/shift))
		teleport_precision += 1

	var/tp_result = do_teleport(
		teleatom = owner,
		destination = target_turf,
		precision = teleport_precision,
		no_effects = TRUE,
		channel = TELEPORT_CHANNEL_MAGIC,
	)

	if(!tp_result)
		owner.balloon_alert(owner, "shift failed!")
		return

	//tell the magic quirk we've successfully cast the spell
	mage.cast_quirk_spell(mana_cost)

	var/sound/teleport_sound = sound('sound/magic/summonitems_generic.ogg')
	teleport_sound.pitch = 0.25
	new /obj/effect/temp_visual/teleport_flux(start_turf, owner.dir)
	new /obj/effect/temp_visual/teleport_flux(get_turf(owner), owner.dir)
	playsound(start_turf, teleport_sound, 90, extrarange = MEDIUM_RANGE_SOUND_EXTRARANGE)
	playsound(owner, teleport_sound, 90, extrarange = MEDIUM_RANGE_SOUND_EXTRARANGE)

	//clear some reagents from our stomach for jaunting
	var/obj/item/organ/user_stomach = owner.get_organ_slot(ORGAN_SLOT_STOMACH)
	owner.reagents?.remove_all(0.50, relative = TRUE)
	user_stomach?.reagents?.remove_all(0.50, relative = TRUE)
	if(owner.has_status_effect(/datum/status_effect/teleport_flux/perma))
		return

	if(owner.has_status_effect(/datum/status_effect/teleport_flux/shift))
		// The status effect handles the damage, but we'll add a special pop up for rod usage specifically
		owner.balloon_alert(owner, "too soon!")

	owner_human.apply_status_effect(/datum/status_effect/teleport_flux/shift)

/datum/status_effect/teleport_flux/shift
	duration = 12 SECONDS

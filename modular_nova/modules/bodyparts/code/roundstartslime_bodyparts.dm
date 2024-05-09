// Roundstartslimes!

/obj/item/bodypart/head/jelly
	can_dismember = TRUE //Their organs are in their chest now, all slime subspecies, so they can safely be decapitated.

/obj/item/bodypart/head/jelly/slime/roundstart
	is_dimorphic = TRUE
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/chest/jelly/slime/roundstart
	is_dimorphic = TRUE
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/left/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/arm/right/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/left/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/right/jelly/slime/roundstart
	icon_greyscale = BODYPART_ICON_ROUNDSTARTSLIME
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/head/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= 60
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/arm/left/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= 60
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/arm/right/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= 60
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/leg/left/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= 60
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

/obj/item/bodypart/leg/right/jelly/drop_limb(special, dismembered, move_to_floor = FALSE)
	if(special)
		return ..()

	to_chat(owner, span_warning("Your [name] splatters with an unnerving squelch!"))
	playsound(owner, 'sound/effects/blobattack.ogg', 60, TRUE)
	owner.blood_volume -= 60
	. = ..()
	drop_organs(src, TRUE)
	qdel(src)
	return .

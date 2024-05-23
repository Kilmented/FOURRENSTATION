//Rather than assigning a security officer to each department, Nova departments get their own allied Guards!
//Most related code is in this file; uniform icons are in the relevant department's .dmi

//SORT ORDER: Sci, Generic, Med, Engi, Cargo, Serv

/*
	UNIFORMS
*/
/obj/item/clothing/under/rank/security/officer/blueshirt/nova
	//Effectively the same as TG's blueshirt, including icon. The /nova path makes it easier for sorting.
	name = "science guard's uniform"
	unique_reskin = null

/obj/item/clothing/under/rank/security/officer/blueshirt/nova/orderly
	name = "orderly uniform"
	desc = "White scrubs with gray pants underneath. Be warned, wearers of this uniform may only take the Hippocratic Oath as a suggestion."
	icon_state = "orderly_uniform"
	worn_icon_state = "orderly_uniform"
	icon = 'modular_nova/master_files/icons/obj/clothing/under/medical.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/under/medical.dmi'
	worn_icon_digi = 'modular_nova/master_files/icons/mob/clothing/under/medical_digi.dmi'

/obj/item/clothing/under/rank/security/officer/blueshirt/nova/engineering_guard
	name = "engineering guard uniform"
	desc = "Effectively just padded hi-vis coveralls, they do the trick both inside of, and while keeping people out of, a hardhat zone."
	icon_state = "engineering_guard_uniform"
	worn_icon_state = "engineering_guard_uniform"
	icon = 'modular_nova/master_files/icons/obj/clothing/under/engineering.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/under/engineering.dmi'
	worn_icon_digi = 'modular_nova/master_files/icons/mob/clothing/under/engineering_digi.dmi'

/obj/item/clothing/under/rank/security/officer/blueshirt/nova/customs_agent
	name = "customs agent uniform"
	desc = "A cargo-brown short-sleeve shirt, and cargo shorts in an authoritative charcoal color. Only for the FTU's finest strong-hands."
	icon_state = "customs_uniform"
	worn_icon_state = "customs_uniform"
	icon = 'modular_nova/master_files/icons/obj/clothing/under/cargo.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/under/cargo.dmi'
	worn_icon_digi = 'modular_nova/master_files/icons/mob/clothing/under/cargo_digi.dmi'

/obj/item/clothing/under/rank/security/officer/blueshirt/nova/bouncer
	name = "bouncer uniform"
	desc = "Short-sleeves and jeans, for that aura of cool that makes the drunk people listen."
	icon_state = "bouncer"
	worn_icon_state = "bouncer"
	icon = 'modular_nova/master_files/icons/obj/clothing/under/civilian.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/under/civilian.dmi'
	worn_icon_digi = 'modular_nova/master_files/icons/mob/clothing/under/civilian_digi.dmi'

/*
	SUITS
*/
/obj/item/clothing/suit/armor/vest/blueshirt/nova
	//Effectively the same as TG's blueshirt, including icon. The /nova path makes it easier for sorting.
	icon = 'modular_nova/master_files/icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/suits/armor.dmi'
	unique_reskin = null
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/armor/vest/blueshirt/nova/guard //Badge-less version of the blueshirt vest
	icon_state = "guard_armor"
	worn_icon_state = "guard_armor"

/obj/item/clothing/suit/armor/vest/blueshirt/nova/orderly
	name = "armored orderly coat"
	desc = "An armored coat, in a deep paramedic blue. It'll keep you padded while dealing with troublesome patients."
	icon_state = "medical_coat"
	worn_icon_state = "medical_coat"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/suit/armor/vest/blueshirt/nova/engineering_guard
	name = "armored engineering guard coat"
	desc = "An armored coat whose hazard strips are worn to the point of uselessness. It'll keep you protected while clearing hazard zones at least."
	icon_state = "engineering_coat"
	worn_icon_state = "engineering_coat"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/suit/armor/vest/blueshirt/nova/customs_agent
	name = "armored customs agent coat"
	desc = "An armored coat, with intricately woven patterns and details. This should help keep you safe from unruly customers."
	icon_state = "customs_coat"
	worn_icon_state = "customs_coat"

/*
	HEAD
*/
/obj/item/clothing/head/helmet/blueshirt/nova
	//Effectively the same as TG's blueshirt, including icon. The /nova path makes it easier for sorting.
	//The base one is used for science guards, and the sprite is unchanged
	unique_reskin = null

/obj/item/clothing/head/helmet/blueshirt/nova/guard //Version of the blueshirt helmet without a blue line. Used by all dept guards right now.
	icon = 'modular_nova/master_files/icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/head/helmet.dmi'
	icon_state = "mallcop_helm"
	worn_icon_state = "mallcop_helm"

/obj/item/clothing/head/beret/sec/science
	name = "science guard beret"
	desc = "A robust beret with an Erlenmeyer flask emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon_state = "beret_badge"
	greyscale_colors = "#8D008F#F2F2F2"

/obj/item/clothing/head/beret/sec/medical
	name = "medical officer beret"
	desc = "A robust beret with a Medical insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	greyscale_colors = "#16313D#F2F2F2" //Paramed blue to (mostly) match their vest (as opposed to medical white)

/obj/item/clothing/head/beret/sec/engineering
	name = "engineer officer beret"
	desc = "A robust beret with a hazard symbol emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	greyscale_colors = "#FFBC30#F2F2F2"

/obj/item/clothing/head/beret/sec/cargo
	name = "cargo officer beret"
	desc = "A robust beret with a Crate emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	greyscale_colors = "#c99840#F2F2F2"

/obj/item/clothing/head/beret/sec/service
	name = "bouncer beret"
	desc = "A robust beret with a simple badge emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	greyscale_colors = "#5E8F2D#F2F2F2"

/*
	BELT
*/
/obj/item/storage/belt/security/department_guard
	icon_state = "engine"
	worn_icon_state = "engine"
	icon = 'modular_nova/modules/goofsec/icons/belts.dmi'
	worn_icon = 'modular_nova/modules/goofsec/icons/belt_worn.dmi'
	unique_reskin = null

/obj/item/storage/belt/security/department_guard/science
	name = "science guard belt"
	icon_state = "science"
	worn_icon_state = "science"

/obj/item/storage/belt/security/department_guard/science/PopulateContents()
	new /obj/item/restraints/handcuffs/cable/pink(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/ammo_box/magazine/pepperball(src)
	new /obj/item/gun/ballistic/automatic/pistol/pepperball(src)

/obj/item/storage/belt/security/department_guard/medical
	name = "medical guard belt"
	icon_state = "medical"
	worn_icon_state = "medical"

/obj/item/storage/belt/security/department_guard/medical/PopulateContents()
	new /obj/item/restraints/handcuffs/cable/blue(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/ammo_box/magazine/pepperball(src)
	new /obj/item/gun/ballistic/automatic/pistol/pepperball(src)

/obj/item/storage/belt/security/department_guard/engineering
	name = "engineer guard belt"
	icon_state = "engine"
	worn_icon_state = "engine"

/obj/item/storage/belt/security/department_guard/engineering/PopulateContents()
	new /obj/item/restraints/handcuffs/cable/yellow(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/ammo_box/magazine/pepperball(src)
	new /obj/item/gun/ballistic/automatic/pistol/pepperball(src)

/obj/item/storage/belt/security/department_guard/cargo
	name = "cargo guard belt"
	icon_state = "cargo"
	worn_icon_state = "cargo"

/obj/item/storage/belt/security/department_guard/cargo/PopulateContents()
	new /obj/item/restraints/handcuffs/cable/orange(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/ammo_box/magazine/pepperball(src)
	new /obj/item/gun/ballistic/automatic/pistol/pepperball(src)

/obj/item/storage/belt/security/department_guard/service
	name = "service guard belt"
	icon_state = "service"
	worn_icon_state = "service"

/obj/item/storage/belt/security/department_guard/service/PopulateContents()
	new /obj/item/restraints/handcuffs/cable/green(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/ammo_box/magazine/pepperball(src)
	new /obj/item/gun/ballistic/automatic/pistol/pepperball(src)

/*
* Garment Bags
*/

/obj/item/storage/bag/garment/science_guard
	name = "science guard's garments"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the science guard."

/obj/item/storage/bag/garment/science_guard/PopulateContents()
	generate_items_inside(list(
		/obj/item/radio/headset/headset_sci = 2,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/clothing/under/rank/security/officer/blueshirt/nova = 2,
		/obj/item/clothing/head/helmet/blueshirt/nova = 2,
		/obj/item/clothing/head/beret/sec/science = 2,
		/obj/item/clothing/suit/armor/vest/blueshirt/nova = 2,
		/obj/item/clothing/glasses/hud/security = 2,
	), src)

/obj/item/storage/bag/garment/orderly
	name = "orderly's garments"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the orderly."

/obj/item/storage/bag/garment/orderly/PopulateContents()
	generate_items_inside(list(
		/obj/item/radio/headset/headset_med = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/under/rank/security/officer/blueshirt/nova/orderly = 2,
		/obj/item/clothing/head/helmet/blueshirt/nova/guard = 2,
		/obj/item/clothing/head/beret/sec/medical = 2,
		/obj/item/clothing/suit/armor/vest/blueshirt/nova/orderly = 2,
		/obj/item/clothing/glasses/hud/security = 2,
	), src)

/obj/item/storage/bag/garment/engineering_guard
	name = "engineering guard's garments"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the engineering guard."

/obj/item/storage/bag/garment/engineering_guard/PopulateContents()
	generate_items_inside(list(
		/obj/item/radio/headset/headset_eng = 2,
		/obj/item/clothing/shoes/workboots = 2,
		/obj/item/clothing/under/rank/security/officer/blueshirt/nova/engineering_guard = 2,
		/obj/item/clothing/head/helmet/blueshirt/nova/guard = 2,
		/obj/item/clothing/head/beret/sec/engineering = 2,
		/obj/item/clothing/suit/armor/vest/blueshirt/nova/engineering_guard = 2,
		/obj/item/clothing/glasses/hud/security = 2,
	), src)

/obj/item/storage/bag/garment/customs_agent
	name = "customs agent's garments"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the customs agent."

/obj/item/storage/bag/garment/customs_agent/PopulateContents()
	generate_items_inside(list(
		/obj/item/radio/headset/headset_cargo = 2,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/clothing/under/rank/security/officer/blueshirt/nova/customs_agent = 2,
		/obj/item/clothing/head/helmet/blueshirt/nova/guard = 2,
		/obj/item/clothing/head/beret/sec/cargo = 2,
		/obj/item/clothing/suit/armor/vest/blueshirt/nova/customs_agent = 2,
		/obj/item/clothing/glasses/hud/security = 2,
		/obj/item/clothing/glasses/hud/gun_permit = 2,
	), src)

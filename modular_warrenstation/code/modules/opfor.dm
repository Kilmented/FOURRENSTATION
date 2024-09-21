/mob/living/basic/trooper/gakster/ranged/mstim
	desc = "A rear echelon deserter armed with a Seiba 10x25mm submachinegun. They look pretty angry."
	loot = list(/obj/effect/mob_spawn/corpse/human/mstimdeserter, /obj/item/lethalcash/bundle/c10, /obj/item/ammo_box/magazine/veb10by25/submachinegun)
	ai_controller = /datum/ai_controller/basic_controller/trooper/gakster/ranged
	r_hand = /obj/item/gun/ballistic/automatic/heide_smg

	casingtype = /obj/item/ammo_casing/spent
	projectilesound = 'modular_warrenstation/lethalguns/sound/seiba/seiba.wav'
	burst_shots = 3
	ranged_cooldown = 0.4 SECONDS

/obj/effect/mob_spawn/corpse/human/mstimdeserter
	name = "\improper MSTIM Deserter Corpse"
	outfit = /datum/outfit/mstimdeserter
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

/datum/outfit/mstimdeserter
	name = "\improper MSTIM Deserter Corpse"
	uniform = /obj/item/clothing/under/frontier_colonist
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	gloves = /obj/item/clothing/gloves/frontier_colonist
	mask = /obj/item/clothing/mask/gas/sechailer/half_mask
	head = /obj/item/clothing/head/helmet/sec
	back = /obj/item/storage/backpack/industrial/frontier_colonist

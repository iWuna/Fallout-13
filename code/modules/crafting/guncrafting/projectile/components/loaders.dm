/obj/item/prefabs/complex/ammo_loader
    name = "Basic Ammo Loader"
    desc = ""
    icon_state = "ammo" //whatever
    part_type = "ammo"
    tags = list()
    incompatible_tags = list()

/obj/item/prefabs/complex/ammo_loader/m556
	name = "556 Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m556
	complexity = 30
	caliber_name = "5.56"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m762
	name = "762 Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m762
	complexity = 80
	caliber_name = "7.62"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m9mm
	name = "9mm Simple Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m9mm
	complexity = 10
	caliber_name = "9mm"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m9mmdouble
	name = "9mm Double Stack Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	complexity = 15
	caliber_name = "9mm"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m9mmext
	name = "9mm Extended Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	complexity = 20
	caliber_name = "9mm"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m10mm
	name = "10mm Simple Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	complexity = 12
	caliber_name = "10mm"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m10mmdouble
	name = "10mm Double Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m10mm_auto
	complexity = 20
	caliber_name = "10mm"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m45mm
	name = ".45 Simple Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/m45
	complexity = 8
	caliber_name = ".45"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m45mmdouble
	name = ".45 Double Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/greasegun
	complexity = 18
	caliber_name = ".45"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m45mmext
	name = ".45 Extended Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	complexity = 30
	caliber_name = ".45"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m50AE
	name = ".50AE Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/a50
	complexity = 30
	caliber_name = ".50"
	incompatible_tags = list("revolver")

/obj/item/prefabs/complex/ammo_loader/m12g
	name = "12g Drum Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/d12g
	complexity = 60
	caliber_name = "12g"
	incompatible_tags = list("bonusdmg","burst","revolver","pistol")

/obj/item/prefabs/complex/ammo_loader/m4570
	name = "45-70 Internal Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube4570
	complexity = 60
	caliber_name = ".45-70"
	incompatible_tags = list("pistol")
	canpulloutmag = FALSE

/obj/item/prefabs/complex/ammo_loader/m44
	name = ".44 Internal Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube44
	complexity = 15
	caliber_name = ".44"
	incompatible_tags = list("pistol")
	canpulloutmag = FALSE

/obj/item/prefabs/complex/ammo_loader/m357
	name = ".357 Internal Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube357
	complexity = 10
	caliber_name = ".357"
	incompatible_tags = list("pistol")
	canpulloutmag = FALSE

/obj/item/prefabs/complex/ammo_loader/m50MG
	name = ".50MG Internal Magazine Loader"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/antimateriel
	complexity = 80
	caliber_name = ".50"
	tags = list("semiauto")
	incompatible_tags = list("automatic","pistol","shotgun")
	canpulloutmag = FALSE
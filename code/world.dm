//This file is just for the necessary /world definition
//Try looking in game/world.dm

/world
	mob = /mob/dead/new_player
	turf = /turf/open/indestructible/ground/outside/desert
	area = /area/f13/wasteland
	view = "15x15"
	hub = "Exadv1.spacestation13"
	name = "\[RU\] Fallout 13 - NEW ERA"
	fps = 20
#ifdef FIND_REF_NO_CHECK_TICK
	loop_checks = FALSE
#endif

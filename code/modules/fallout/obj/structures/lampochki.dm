// The lighting system
//
// consists of light fixtures (/obj/machinery/light) and light tube/bulb items (/obj/item/light)

#define LIGHT_EMERGENCY_POWER_USE 0.2 //How much power emergency lights will consume per tick
// status values shared between lighting fixtures and items
#define LIGHT_OK 0
#define LIGHT_EMPTY 1
#define LIGHT_BROKEN 2
#define LIGHT_BURNED 3

/obj/machinery/light/small_old
	icon_state = "bulb_old"
	base_state = "bulb_old"
	fitting = "bulb_old"
	brightness = 4
	desc = "A small lighting fixture."
	light_type = /obj/item/light/bulb

/obj/machinery/light/small_old/broken
	status = LIGHT_BROKEN
	icon_state = "bulb_old-broken"

/obj/machinery/light/small_old/built
	icon_state = "bulb_old-empty"

/obj/machinery/light/small_old/built/Initialize()
	. = ..()
	status = LIGHT_EMPTY
	update(0)

#undef LIGHT_EMERGENCY_POWER_USE
#undef LIGHT_OK
#undef LIGHT_EMPTY
#undef LIGHT_BROKEN
#undef LIGHT_BURNED

#define RESTART_COUNTER_PATH "data/round_counter.txt"

GLOBAL_VAR(security_mode)
GLOBAL_VAR(restart_counter)
GLOBAL_PROTECT(security_mode)

//This happens after the Master subsystem new(s) (it's a global datum)
//So subsystems globals exist, but are not initialised
/world/New()
#ifdef DEBUG
	enable_debugger()
#endif
#ifdef REFERENCE_TRACKING
	enable_reference_tracking()
#endif

	log_world("World loaded at [time_stamp()]!")

	SetupExternalRSC()

	GLOB.config_error_log = GLOB.world_manifest_log = GLOB.world_pda_log = GLOB.sql_error_log = GLOB.world_href_log = GLOB.world_runtime_log = GLOB.world_attack_log = GLOB.world_game_log = "data/logs/config_error.log" //temporary file used to record errors with loading config, moved to log directory once logging is set bl

	CheckSecurityMode()

	make_datum_references_lists()	//initialises global lists for referencing frequently used datums (so that we only ever do it once)

	TgsNew()

	GLOB.revdata = new



	config.Load(params[OVERRIDE_CONFIG_DIRECTORY_PARAMETER])

	//SetupLogs depends on the RoundID, so lets check
	//DB schema and set RoundID if we can
	SSdbcore.CheckSchemaVersion()
	SSdbcore.SetRoundID()
	SetupLogs()

	load_admins()
	LoadVerbs(/datum/verbs/menu)
	if(CONFIG_GET(flag/usewhitelist))
		load_whitelist()
	LoadBans()

	reload_custom_roundstart_items_list()  // From Citadel - custom loadout item loader init point.

	GLOB.timezoneOffset = text2num(time2text(0,"hh")) * 36000

	if(fexists(RESTART_COUNTER_PATH))
		GLOB.restart_counter = text2num(trim(file2text(RESTART_COUNTER_PATH)))
		fdel(RESTART_COUNTER_PATH)

	if(NO_INIT_PARAMETER in params)
		return

	Master.Initialize(10, FALSE)

	if(TEST_RUN_PARAMETER in params)
		HandleTestRun()

/world/Del()
#ifdef DEBUG
	disable_debugger()
#endif

/world/proc/HandleTestRun()
	//trigger things to run the whole process
	Master.sleep_offline_after_initializations = FALSE
	SSticker.start_immediately = TRUE
	CONFIG_SET(number/round_end_countdown, 0)
	var/datum/callback/cb
#ifdef UNIT_TESTS
	cb = CALLBACK(GLOBAL_PROC, /proc/RunUnitTests)
#else
	cb = VARSET_CALLBACK(SSticker, force_ending, TRUE)
#endif
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, /proc/addtimer, cb, 10 SECONDS))

/world/proc/SetupExternalRSC()
#if (PRELOAD_RSC == 0)
	GLOB.external_rsc_urls = world.file2list("[global.config.directory]/external_rsc_urls.txt","\n")
	var/i=1
	while(i<=GLOB.external_rsc_urls.len)
		if(GLOB.external_rsc_urls[i])
			i++
		else
			GLOB.external_rsc_urls.Cut(i,i+1)
#endif

/world/proc/SetupLogs()
	var/override_dir = params[OVERRIDE_LOG_DIRECTORY_PARAMETER]
	if(!override_dir)
		GLOB.log_directory = "data/logs/[time2text(world.realtime, "YYYY/MM/DD")]/round-"
		if(GLOB.round_id)
			GLOB.log_directory += "[GLOB.round_id]"
		else
			GLOB.log_directory += "[replacetext(time_stamp(), ":", ".")]"
	else
		GLOB.log_directory = "data/logs/[override_dir]"

	GLOB.world_game_log = "[GLOB.log_directory]/game.log"
	GLOB.world_attack_log = "[GLOB.log_directory]/attack.log"
	GLOB.world_pda_log = "[GLOB.log_directory]/pda.log"
	GLOB.world_manifest_log = "[GLOB.log_directory]/manifest.log"
	GLOB.world_href_log = "[GLOB.log_directory]/hrefs.log"
	GLOB.sql_error_log = "[GLOB.log_directory]/sql.log"
	GLOB.world_qdel_log = "[GLOB.log_directory]/qdel.log"
	GLOB.world_runtime_log = "[GLOB.log_directory]/runtime.log"
	GLOB.query_debug_log = "[GLOB.log_directory]/query_debug.log"
	GLOB.href_exploit_attempt_log = "[GLOB.log_directory]/href_exploit_attempt.log"

#ifdef UNIT_TESTS
	GLOB.test_log = file("[GLOB.log_directory]/tests.log")
	start_log(GLOB.test_log)
#endif
	start_log(GLOB.world_game_log)
	start_log(GLOB.world_attack_log)
	start_log(GLOB.world_pda_log)
	start_log(GLOB.world_manifest_log)
	start_log(GLOB.world_href_log)
	start_log(GLOB.world_qdel_log)
	start_log(GLOB.world_runtime_log)

	GLOB.changelog_hash = md5('html/changelog.html') //for telling if the changelog has changed recently
	if(fexists(GLOB.config_error_log))
		fcopy(GLOB.config_error_log, "[GLOB.log_directory]/config_error.log")
		fdel(GLOB.config_error_log)

	if(GLOB.round_id)
		log_game("Round ID: [GLOB.round_id]")

	// This was printed early in startup to the world log and config_error.log,
	// but those are both private, so let's put the commit info in the runtime
	// log which is ultimately public.
	log_runtime(GLOB.revdata.get_log_message())

/world/proc/CheckSecurityMode()
	//try to write to data
	if(!text2file("The world is running at least safe mode", "data/server_security_check.lock"))
		GLOB.security_mode = SECURITY_ULTRASAFE
		warning("/tg/station 13 is not supported in ultrasafe security mode. Everything will break!")
		return

	//try to shell
	if(shell("echo \"The world is running in trusted mode\"") != null)
		GLOB.security_mode = SECURITY_TRUSTED
	else
		GLOB.security_mode = SECURITY_SAFE
		warning("/tg/station 13 uses many file operations, a few shell()s, and some external call()s. Trusted mode is recommended. You can download our source code for your own browsing and compilation at https://github.com/tgstation/tgstation")

/world/Topic(T, addr, master, key)
	TGS_TOPIC	//redirect to server tools if necessary

	var/static/list/topic_handlers = TopicHandlers()

	var/list/input = params2list(T)
	var/datum/world_topic/handler
	for(var/I in topic_handlers)
		if(I in input)
			handler = topic_handlers[I]
			break

	if((!handler || initial(handler.log)) && config && CONFIG_GET(flag/log_world_topic))
		log_topic("\"[T]\", from:[addr], master:[master], key:[key]")

	if(!handler)
		return

	handler = new handler()
	return handler.TryRun(input)

/world/proc/AnnouncePR(announcement, list/payload)
	var/static/list/PRcounts = list()	//PR id -> number of times announced this round
	var/id = "[payload["pull_request"]["id"]]"
	if(!PRcounts[id])
		PRcounts[id] = 1
	else
		++PRcounts[id]
		if(PRcounts[id] > PR_ANNOUNCEMENTS_PER_ROUND)
			return

	var/final_composed = "<span class='announce'>PR: [announcement]</span>"
	for(var/client/C in GLOB.clients)
		C.AnnouncePR(final_composed)

/world/proc/FinishTestRun()
	set waitfor = FALSE
	var/list/fail_reasons
	if(GLOB)
		if(GLOB.total_runtimes != 0)
			fail_reasons = list("Total runtimes: [GLOB.total_runtimes]")
#ifdef UNIT_TESTS
		if(GLOB.failed_any_test)
			LAZYADD(fail_reasons, "Unit Tests failed!")
#endif
		if(!GLOB.log_directory)
			LAZYADD(fail_reasons, "Missing GLOB.log_directory!")
	else
		fail_reasons = list("Missing GLOB!")
	if(!fail_reasons)
		text2file("Success!", "[GLOB.log_directory]/clean_run.lk")
	else
		log_world("Test run failed!\n[fail_reasons.Join("\n")]")
	sleep(0)	//yes, 0, this'll let Reboot finish and prevent byond memes
	qdel(src)	//shut it down

/world/Reboot(reason = 0, fast_track = FALSE)
	TgsReboot()
	if (reason || fast_track) //special reboot, do none of the normal stuff
		if (usr)
			log_admin("[key_name(usr)] Has requested an immediate world restart via client side debugging tools")
			message_admins("[key_name_admin(usr)] Has requested an immediate world restart via client side debugging tools")
		to_chat(world, "<span class='boldannounce'>Rebooting World immediately due to host request</span>")
	else
		to_chat(world, "<span class='boldannounce'>Rebooting world...</span>")
		Master.Shutdown()	//run SS shutdowns

	if(TEST_RUN_PARAMETER in params)
		FinishTestRun()
		return

	if(TgsAvailable())
		var/do_hard_reboot
		// check the hard reboot counter
		var/ruhr = CONFIG_GET(number/rounds_until_hard_restart)
		switch(ruhr)
			if(-1)
				do_hard_reboot = FALSE
			if(0)
				do_hard_reboot = TRUE
			else
				if(GLOB.restart_counter >= ruhr)
					do_hard_reboot = TRUE
				else
					text2file("[++GLOB.restart_counter]", RESTART_COUNTER_PATH)
					do_hard_reboot = FALSE

		if(do_hard_reboot)
			log_world("World hard rebooted at [time_stamp()]")
			shutdown_logging() // See comment below.
			TgsEndProcess()

	log_world("World rebooted at [time_stamp()]")
	shutdown_logging() // Past this point, no logging procs can be used, at risk of data loss.
	..()

/world/proc/update_status()

	var/list/features = list()

	if(GLOB.master_mode)
		features += GLOB.master_mode

	if (!GLOB.enter_allowed)
		features += "closed"

	var/s = ""
	var/hostedby
	if(config) // this should definitely have handlers for just being a config in it's entirety, instead of this mess
		var/server_name = CONFIG_GET(string/servername)
		if (server_name)
			s += "<b>[server_name]</b> &#8212; "
		features += "[CONFIG_GET(flag/norespawn) ? "no " : ""]respawn"
		if(CONFIG_GET(flag/allow_vote_mode))
			features += "vote"
		hostedby = CONFIG_GET(string/hostedby)

	s += "Med RP \[https://discord.gg/GEMmJYV]<br>"

	var/n = 0
	for (var/mob/M in GLOB.player_list)
		if (M.client)
			n++

	if (n > 1)
		features += "~[n] players"
	else if (n > 0)
		features += "~[n] player"

	if (!host && hostedby)
		features += "hosted by <b>[hostedby]</b>"

	if (features)
		s += ": [jointext(features, ", ")]"

	status = s

/world/proc/update_hub_visibility(new_visibility)
	if(new_visibility == GLOB.hub_visibility)
		return
	GLOB.hub_visibility = new_visibility
	if(GLOB.hub_visibility)
		hub_password = "kMZy3U5jJHSiBQjr"
	else
		hub_password = "SORRYNOPASSWORD"

/world/proc/incrementMaxZ()
	maxz++
	SSmobs.MaxZChanged()
	SSidlenpcpool.MaxZChanged()

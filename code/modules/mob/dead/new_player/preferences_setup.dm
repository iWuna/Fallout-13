
	//The mob should have a gender you want before running this proc. Will run fine without H
/datum/preferences/proc/random_character(gender_override)
	if(gender_override)
		gender = gender_override
	else
		gender = pick(MALE,FEMALE)
	underwear = random_underwear(gender)
	undie_color = random_short_color()
	undershirt = random_undershirt(gender)
	shirt_color = random_short_color()
	socks = random_socks()
	socks_color = random_short_color()
	skin_tone = random_skin_tone()
	hair_style = random_hair_style(gender)
	facial_hair_style = random_facial_hair_style(gender)
	hair_color = random_short_color()
	facial_hair_color = hair_color
	eye_color = random_eye_color()
	if(!pref_species)
		var/rando_race = pick(GLOB.roundstart_races)
		pref_species = new rando_race()
	features = random_features()
	age = rand(AGE_MIN,AGE_MAX)

/datum/preferences/proc/update_preview_icon(equip_job = TRUE)
	// Determine what job is marked as 'High' priority, and dress them up as such.
	var/datum/job/previewJob = get_highest_job()

	// Set up the dummy for its photoshoot
	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)
	// Apply the Dummy's preview background first so we properly layer everything else on top of it.
	mannequin.add_overlay(mutable_appearance('modular_citadel/icons/ui/backgrounds.dmi', bgstate, layer = SPACE_LAYER))
	copy_to(mannequin)

	// Determine what job is marked as 'High' priority, and dress them up as such.
	var/highRankFlag = job_civilian_high | job_medsci_high | job_engsec_high | job_ncr_high | job_legion_high | job_bos_high | job_den_high | job_vault_high | job_wasteland_high | job_enclave_high

	if(job_civilian_low & F13DWELLER) //if(job_civilian_low & ASSISTANT)
		previewJob = SSjob.GetJob("Dweller") // previewJob = SSjob.GetJob("Assistant")
	else if(highRankFlag)
		var/highDeptFlag
		if(job_civilian_high)
			highDeptFlag = CIVILIAN
		else if(job_medsci_high)
			highDeptFlag = MEDSCI
		else if(job_engsec_high)
			highDeptFlag = ENGSEC
		else if(job_ncr_high)
			highDeptFlag = NCR
		else if(job_legion_high)
			highDeptFlag = LEGION
		else if(job_bos_high)
			highDeptFlag = BOS
		else if(job_den_high)
			highDeptFlag = DEN
		else if(job_vault_high)
			highDeptFlag = VAULT
		else if(job_wasteland_high)
			highDeptFlag = WASTELAND
		else if(job_enclave_high)
			highDeptFlag = ENCLAVE

		for(var/datum/job/job in SSjob.occupations)
			if(job.flag == highRankFlag && job.department_flag == highDeptFlag)
				previewJob = job
				break

	if(previewJob)
		mannequin.job = previewJob.title
		previewJob.equip(mannequin, TRUE)
	COMPILE_OVERLAYS(mannequin)
	parent.show_character_previews(new /mutable_appearance(mannequin))
	unset_busy_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)

/datum/preferences/proc/get_highest_job()

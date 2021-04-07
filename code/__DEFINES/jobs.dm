
#define ENGSEC			(1<<0)

#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)


#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define CHEMIST			(1<<2)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
#define VIROLOGIST		(1<<6)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
#define COOK			(1<<3)
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
#define MINER			(1<<8)
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)

#define JOB_DISPLAY_ORDER_DEFAULT 0

//F13

#define NCR				(1<<3)

#define F13COLONEL		(1<<0)
#define F13AMBASSADOR	(1<<1)
#define F13CAPTAIN		(1<<2)
#define F13LIEUTENANT   (1<<3)
#define F13SERGEANT		(1<<4)
#define F13SPECIALIST	(1<<5)
#define F13NCRMP		(1<<6)
#define F13NCRHT		(1<<7)
#define F13TROOPER		(1<<8)
#define F13RECRUIT		(1<<9)
#define F13VETRANGER	(1<<10)
#define F13RANGERPATROL	(1<<11)
#define F13RANGERSCOUT	(1<<12)
#define F13NCRCITIZEN	(1<<13)
#define	F13NCRADMIN		(1<<14)

#define LEGION			(1<<4)

#define F13LEGATE		(1<<0)
#define F13CENTURION	(1<<1)
#define F13ORATOR		(1<<2)
#define F13PRIESTESS 	(1<<3)
#define F13DECANREC		(1<<4)
#define F13DECAN		(1<<5)
#define F13DECANVET		(1<<6)
#define F13VEXILLARIUS	(1<<7)
#define F13EXPLORER		(1<<8)
#define F13VENATOR		(1<<9)
#define F13VETLEGIONARY	(1<<10)
#define F13LEGIONARY	(1<<11)
#define F13RECRUITLEG	(1<<12)
#define F13AUXILIA		(1<<13)
#define F13LEGIONSLAVE	(1<<14)
#define F13SLAVEMASTER	(1<<15)

#define BOS				(1<<5)

#define F13ELDER		(1<<0)
#define F13SENTINEL		(1<<1)
#define F13SENIORPALADIN	(1<<2)
#define F13PALADIN		(1<<3)
#define F13KNIGHTCAPTAIN	(1<<4)
#define F13SENIORKNIGHT	(1<<5)
#define F13KNIGHT		(1<<6)
#define F13HEADSCRIBE	(1<<7)
#define F13SENIORSCRIBE (1<<8)
#define F13SCRIBE		(1<<9)
#define F13INITIATE		(1<<10)
#define F13OFFDUTYBOS	(1<<11)

#define DEN				(1<<6)

#define F13SHERIFF		(1<<0)
#define F13DENDOC       (1<<1)
#define F13SETTLER		(1<<2)
#define F13FARMER		(1<<3)
#define F13PROSPECTOR	(1<<4)
#define F13DEPUTY		(1<<5)
#define F13MAYOR		(1<<6)
#define F13PREACHER		(1<<7)
#define F13SHOPKEEPER	(1<<8)
#define F13FAITHFUL		(1<<9) // WHAT IS BITFLAG. WHAT DOES IT DO. WHERE IS THIS INFO USED.
#define F13BANKER		(1<<10)	// IDK MAN BUT IT SEEMS IMPORTANT
#define F13BARKEEP		(1<<11)

#define VAULT			(1<<7)

#define F13OVERSEER		(1<<0)
#define F13HOS			(1<<1)
#define F13DOCTOR		(1<<2)
#define F13VAULTSCIENTIST	(1<<3)
#define F13OFFICER		(1<<4)
#define F13VAULTENGINEER	(1<<5)
#define F13DWELLER		(1<<6)
#define F13AI			(1<<7)
#define F13CYBORG		(1<<8)

#define WASTELAND		(1<<8)

#define F13CULTLEADER	(1<<0)
#define F13WASTELANDER	(1<<1)
#define F13RAIDER		(1<<2)
#define F13PUSHER		(1<<3)
#define F13PUNRAIDER	(1<<4)
#define F13DETECTIVE	(1<<5)
#define EVENTCOVEN		(1<<6)
#define F13LOCUSTCAPTAIN	(1<<7)
#define F13LOCUST		(1<<8)
#define F13COUREER		(1<<9)

#define ENCLAVE			(1<<8)

#define F13USCOMMANDER	(1<<0)
#define F13USMEDIC		(1<<1)
#define F13USPRIVATE	(1<<2)
#define F13USSCIENTIST	(1<<3)
#define F13USENGINEER	(1<<4)
#define F13USCOLONIST	(1<<5)

#define TRIBAL			(1<<10)

#define F13CHIEF		(1<<0)
#define F13SHAMAN		(1<<1)
#define F13HHUNTER		(1<<2)
#define F13VILLAGER		(1<<3)
#define F13HUNTER		(1<<4)

#define FOLLOWERS		(1<<11)

#define	F13LEADPRACTITIONER	(1<<0)
#define	F13PRACTITIONER	(1<<1)
#define F13FOLLOWERGUARD	(1<<2)
#define F13FOLLOWERVOLUNTEER	(1<<3)
#define F13PROFESSOR	(1<<4)


#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_SLOTFULL 5
#define JOB_UNAVAILABLE_WHITELIST 6
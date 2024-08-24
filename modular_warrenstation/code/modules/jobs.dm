// These are all removals for a variety of reasons.

/datum/job/atmospheric_technician // Future alt title.
	job_flags = null

/datum/job/curator // Doesn't fit as an actual traditional job. Fun assistant gimmick though! We sadly do not have a proper library. Yet.
	job_flags = null

/datum/job/chaplain // Doesn't fit as an actual traditional job. Fun assistant gimmick though! You'll be outright replaced with proper magic, though.
	job_flags = null

/datum/job/clown // Doesn't fit as an actual traditional job. Fun assistant gimmick though! All your sexy clothes, abilities, and quirks will be character customization soon.
	job_flags = null

/datum/job/chemist // Future alt title.
	job_flags = null

/datum/job/coroner // Future alt title.
	job_flags = null

/datum/job/geneticist // Future alt title.
	job_flags = null

/datum/job/head_of_personnel // I don't want HOP and First Mate frotting for power.
	job_flags = null

/datum/job/head_of_security
	job_flags = null // I don't want Warden and HOS frotting for power, shit's weird.

/datum/job/janitor // Clean up after yourself. SOP will literally tell you to clean your messy ass gooncave you call a department.
	job_flags = null

/datum/job/lawyer // No traditional court.
	job_flags = null

/datum/job/mime // Doesn't fit as an actual traditional job. Fun assistant gimmick though! All your sexy clothes, abilities, and quirks will be character customization soon.
	job_flags = null

/datum/job/nanotrasen_consultant // I don't want SSS and First Mate frotting for power shit's weird.
	job_flags = null

/datum/job/paramedic // The ship is not even one hundred fifty meters from tip to tail. You will NOT struggle to find bodies. Even then, at five minutes of being dead, a teleport back to the ship sickbay option will be avaliable.
	job_flags = null

/datum/job/prisoner // No permabrig. If someone is harshing the vibe enough to deserve a permanent punishment, character death is the intended answer.
	job_flags = null

/datum/job/psychologist // Future alt title.
	job_flags = null

/datum/job/virologist
	job_flags = null

/datum/job/bitrunner
	job_flags = null

/datum/job/barber
	job_flags = null

/////////////header/////////////
// the following are alt titles
/////////////header/////////////

/**
 * This is the file you should use to add alternate titles for each job, just
 * follow the way they're done here, it's easy enough and shouldn't take any
 * time at all to add more or add some for a job that doesn't have any.
 */

/datum/job
	/// The list of alternative job titles people can pick from, null by default.
	var/list/alt_titles = null


/datum/job/ai
	alt_titles = list(
		"AI",
		"Automated Overseer",
		"Ship Intelligence",
	)

/datum/job/assistant
	alt_titles = list(
		"Assistant",
		"Vagabond",
		"Artist",
		"Businessman",
		"Businesswoman",
		"Civilian",
		"Entertainer",
		"Freelancer",
		"Tourist",
		"Trader",
		"Off-Duty Crew",
		"Colonist",

// Borrowed from Barber

		"Barber",
		"Aethestician",
		"Colorist",
		"Stylist",

// Borrowed from Chaplain

		"Chaplain",
		"Imam",
		"Magister",
		"Monk",
		"Nun",
		"Oracle",
		"Preacher",
		"Priest",
		"Priestess",
		"Pontifex",
		"Rabbi",
		"Reverend",
		"Shrine Maiden",
		"Shrine Guardian",

// Borrowed from Clown

		"Clown",
		"Comedian",
		"Jester",
		"Joker",

// Borrowed from Curator

		"Curator",
		"Archivist",
		"Conservator",
		"Journalist",
		"Librarian",

// Borrowed from Mime

		"Mime",
		"Mummer",
		"Pantomimist",

// Borrowed from Lawyer

		"Lawyer",
		"Defense Attorney",
		"Legal Clerk",
		"Prosecutor",
		"Public Defender",

// Borrowed from Janitor

		"Janitor",
		"Concierge",
		"Custodial Technician",
		"Custodian",
		"Maid",
		"Sanitation Technician",
	)

/datum/job/bartender
	alt_titles = list(
		"Bartender",
		"Barista",
		"Barkeeper",
		"Mixologist",
	)

/datum/job/blueshield
	alt_titles = list(
		"Blueshield",
		"Command Bodyguard",
		"Executive Protection Agent",
	)

/datum/job/botanist
	alt_titles = list(
		"Botanist",
		"Botanical Researcher",
		"Florist",
		"Gardener",
		"Herbalist",
		"Hydroponicist",
		"Mycologist",
		"Junior Botanist",
	)

/datum/job/captain
	alt_titles = list(
		"First Mate",
		"First Officer",
	)

/datum/job/cargo_technician
	alt_titles = list(
		"Warehouse Technician",
		"Commodities Trader",
		"Deck Worker",
		"Inventory Associate",
		"Mailman",
		"Mail Carrier",
		"Receiving Clerk",
		"Union Associate",

// Borrowed from Custom's Agent

		"Customs Agent",
	)

/datum/job/chief_engineer
	alt_titles = list(
		"Chief Engineer",
		"Engineering Foreman",
		"Head of Engineering",
	)

/datum/job/chief_medical_officer
	alt_titles = list(
		"Chief Medical Officer",
		"Chief Physician",
		"Head of Medical",
		"Head Physician",
		"Medical Director",
	)


/datum/job/cook
	alt_titles = list(
		"Cook",
		"Butcher",
		"Chef",
		"Culinary Artist",
		"Sous-Chef",
		"Junior Chef",
	)

/datum/job/cyborg
	alt_titles = list(
		"Cyborg",
		"Android",
		"Robot",
	)

/datum/job/doctor
	alt_titles = list(
		"Medical Doctor",
		"General Practitioner",
		"Medical Resident",
		"Nurse",
		"Physician",
		"Surgeon",
		"Medical Student",

// Borrowed from Chemist

		"Chemist",
		"Pharmacist",
		"Pharmacologist",
		"Trainee Pharmacist",

// Borrowed from Coroner

		"Coroner",
		"Forensic Pathologist",
		"Funeral Director",
		"Medical Examiner",
		"Mortician",

// Borrowed from Orderly, a return to its proper definition

		"Orderly",

// Borrowed from Psychologist

		"Psychologist",
		"Counsellor",
		"Psychiatrist",
		"Therapist",

// Borrowed from Paramedic

		"Paramedic",
		"Emergency Medical Technician",
		"Search and Rescue Technician",
	)

/datum/job/quartermaster
	alt_titles = list(
		"Quartermaster",
		"Deck Chief",
		"Head of Supply",
		"Logistics Coordinator",
		"Supply Foreman",
		"Supply Forewoman",
		"Supply Foreperson",
		"Union Requisitions Officer",
		"Warehouse Supervisor",
	)

/datum/job/research_director
	alt_titles = list(
		"Research Director",
		"Biorobotics Director",
		"Chief Science Officer",
		"Lead Researcher",
		"Research Supervisor",
		"Provost",
		"Silicon Administrator",
	)

/datum/job/roboticist
	alt_titles = list(
		"Roboticist",
		"Biomechanical Engineer",
		"Cyberneticist",
		"Apprentice Roboticist",
	)

/datum/job/scientist
	alt_titles = list(
		"Scientist",
		"Anomalist",
		"Circuitry Designer",
		"Cytologist",
		"Graduate Student",
		"Lab Technician",
		"Ordnance Technician",
		"Plasma Researcher",
		"Resonance Researcher",
		"Theoretical Physicist",
		"Xenoarchaeologist",
		"Xenobiologist",
		"Research Assistant",

// Borrowed from Geneticist

		"Geneticist",
		"Gene Tailor",
		"Mutation Researcher",
	)

/datum/job/shaft_miner
	alt_titles = list(
		"Union Miner",
		"Excavator",
		"Drill Technician",
		"Prospector",
		"Spelunker",
		"Apprentice Miner",
	)

/datum/job/station_engineer
	alt_titles = list(
		"Ship Engineer",
		"Electrician",
		"Emergency Damage Control Technician",
		"Engine Technician",
		"EVA Technician",
		"Mechanic",
		"Apprentice Engineer",

// Borrowed from Atmospheric Technician

		"Atmospheric Technician",
		"Emergency Fire Technician",
		"Firefighter",
		"Life Support Technician",

// Borrowed from Janitor

		"Maintenance Technician",
	)

/datum/job/warden
	alt_titles = list(
		"Warden",
		"Sergeant",
		"Dispatch Officer",

// Borrowed from Head of Security

		"Head of Security",
		"Chief of Security",
	)

/datum/job/security_officer
	alt_titles = list(
		"Security Officer",
		"Peacekeeper",
		"Security Operative",
		"Security Cadet",
	)

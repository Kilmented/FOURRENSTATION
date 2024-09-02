/datum/holiday
	///Name of the holiday itself. Visible to players.
	var/name = "If you see this the holiday calendar code is broken"

	///What day of begin_month does the holiday begin on?
	var/begin_day = 1
	///What month does the holiday begin on?
	var/begin_month = 0
	/// What day of end_month does the holiday end? Default of 0 means the holiday lasts a single.
	var/end_day = 0
	/// What month does the holiday end on?
	var/end_month = 0
	/// for christmas neverending, or testing. Forces a holiday to be celebrated.
	var/always_celebrate = FALSE
	/// Held variable to better calculate when certain holidays may fall on, like easter.
	var/current_year = 0
	/// How many years are you offsetting your calculations for begin_day and end_day on. Used for holidays like easter.
	var/year_offset = 0
	///Timezones this holiday is celebrated in (defaults to three timezones spanning a 50 hour window covering all timezones)
	var/list/timezones = list(TIMEZONE_LINT, TIMEZONE_UTC, TIMEZONE_ANYWHERE_ON_EARTH)
	///If this is defined, drones/assistants without a default hat will spawn with this item in their head clothing slot.
	var/obj/item/holiday_hat
	///When this holiday is active, does this prevent mail from arriving to cargo? Try not to use this for longer holidays.
	var/mail_holiday = FALSE
	var/poster_name = "generic celebration poster"
	var/poster_desc = "A poster for celebrating some holiday. Unfortunately, its unfinished, so you can't see what the holiday is."
	var/poster_icon = "holiday_unfinished"
	/// Color scheme for this holiday
	var/list/holiday_colors
	/// The default pattern of the holiday, if the requested pattern is null.
	var/holiday_pattern = PATTERN_DEFAULT

// This proc gets run before the game starts when the holiday is activated. Do festive shit here.
/datum/holiday/proc/celebrate()
	if(mail_holiday)
		SSeconomy.mail_blocked = TRUE
	return

// When the round starts, this proc is ran to get a text message to display to everyone to wish them a happy holiday
/datum/holiday/proc/greet()
	return "Have a happy [name]!"

// Returns special prefixes for the station name on certain days. You wind up with names like "Christmas Object Epsilon". See new_station_name()
/datum/holiday/proc/getStationPrefix()
	//get the first word of the Holiday and use that
	var/i = findtext(name, " ")
	return copytext(name, 1, i)

// Return 1 if this holidy should be celebrated today
/datum/holiday/proc/shouldCelebrate(dd, mm, yyyy, ddd)
	if(always_celebrate)
		return TRUE

	if(!end_day)
		end_day = begin_day
	if(!end_month)
		end_month = begin_month
	if(end_month > begin_month) //holiday spans multiple months in one year
		if(mm == end_month) //in final month
			if(dd <= end_day)
				return TRUE

		else if(mm == begin_month)//in first month
			if(dd >= begin_day)
				return TRUE

		else if(mm in begin_month to end_month) //holiday spans 3+ months and we're in the middle, day doesn't matter at all
			return TRUE

	else if(end_month == begin_month) // starts and stops in same month, simplest case
		if(mm == begin_month && (dd in begin_day to end_day))
			return TRUE

	else // starts in one year, ends in the next
		if(mm >= begin_month && dd >= begin_day) // Holiday ends next year
			return TRUE
		if(mm <= end_month && dd <= end_day) // Holiday started last year
			return TRUE

	return FALSE

/// Procs to return holiday themed colors for recoloring atoms
/datum/holiday/proc/get_holiday_colors(atom/thing_to_color, pattern = holiday_pattern)
	if(!holiday_colors)
		return
	switch(pattern)
		if(PATTERN_DEFAULT)
			return holiday_colors[(thing_to_color.y % holiday_colors.len) + 1]
		if(PATTERN_VERTICAL_STRIPE)
			return holiday_colors[(thing_to_color.x % holiday_colors.len) + 1]

/proc/request_holiday_colors(atom/thing_to_color, pattern)
	switch(pattern)
		if(PATTERN_RANDOM)
			return "#[random_short_color()]"
		if(PATTERN_RAINBOW)
			var/datum/holiday/pride_week/rainbow_datum = new()
			return rainbow_datum.get_holiday_colors(thing_to_color, PATTERN_DEFAULT)
	if(!length(GLOB.holidays))
		return
	for(var/holiday_key in GLOB.holidays)
		var/datum/holiday/holiday_real = GLOB.holidays[holiday_key]
		if(!holiday_real.holiday_colors)
			continue
		return holiday_real.get_holiday_colors(thing_to_color, pattern || holiday_real.holiday_pattern)

// The actual holidays

// JANUARY

// FEBRUARY

/datum/holiday/groundhog
	name = "Groundhog Day"
	begin_day = 2
	begin_month = FEBRUARY

/datum/holiday/nz
	name = "Waitangi Day"
	timezones = list(TIMEZONE_NZDT, TIMEZONE_CHADT)
	begin_day = 6
	begin_month = FEBRUARY
	holiday_colors = list(
		COLOR_UNION_JACK_BLUE,
		COLOR_WHITE,
		COLOR_UNION_JACK_RED,
		COLOR_WHITE,
	)

/datum/holiday/nz/greet()
	var/nz_age = text2num(time2text(world.timeofday, "YYYY")) - 1840
	return "On this day [nz_age] years ago, New Zealand's Treaty of Waitangi, the founding document of the nation, was signed!"

/datum/holiday/valentines
	name = VALENTINES
	begin_day = 13
	end_day = 15
	begin_month = FEBRUARY
	poster_name = "lovey poster"
	poster_desc = "A poster celebrating all the relationships built today. Of course, you probably don't have one."
	poster_icon = "holiday_love"

/datum/holiday/random_kindness
	name = "Random Acts of Kindness Day"
	begin_day = 17
	begin_month = FEBRUARY
	poster_name = "act of kindness poster"
	poster_desc = "A poster notifying the reader today is 'Act of Kindness' day. What a nice thing to do."
	poster_icon = "holiday_kind"

/datum/holiday/random_kindness/greet()
	return "Go do some random acts of kindness for a stranger!"

/datum/holiday/leap
	name = "Leap Day"
	begin_day = 29
	begin_month = FEBRUARY

// MARCH

/datum/holiday/pi
	name = "Pi Day"
	begin_day = 14
	begin_month = MARCH
	poster_name = "pi day poster"
	poster_desc = "A poster celebrating the 3.141529th day of the year. At least theres free pie."
	poster_icon = "holiday_pi"

/datum/holiday/no_this_is_patrick
	name = "St. Patrick's Day"
	begin_day = 17
	begin_month = MARCH
	holiday_hat = /obj/item/clothing/head/soft/green
	holiday_colors = list(
		COLOR_IRISH_GREEN,
		COLOR_WHITE,
		COLOR_IRISH_ORANGE,
	)
	holiday_pattern = PATTERN_VERTICAL_STRIPE

/datum/holiday/no_this_is_patrick/greet()
	return "Happy National Inebriation Day!"

// APRIL

/datum/holiday/april_fools
	name = APRIL_FOOLS
	begin_month = APRIL
	begin_day = 1
	end_day = 2
	holiday_hat = /obj/item/clothing/head/chameleon/broken

/datum/holiday/april_fools/celebrate()
	. = ..()
	SSjob.set_overflow_role(/datum/job/clown)
	SSticker.login_music = 'sound/ambience/clown.ogg'
	for(var/i in GLOB.new_player_list)
		var/mob/dead/new_player/P = i
		if(P.client)
			P.client.playtitlemusic()

/datum/holiday/april_fools/get_holiday_colors(atom/thing_to_color)
	return "#[random_short_color()]"

/datum/holiday/spess
	name = "Cosmonautics Day"
	begin_day = 12
	begin_month = APRIL
	holiday_hat = /obj/item/clothing/head/syndicatefake

/datum/holiday/spess/greet()
	return "On this day over 600 years ago, Comrade Yuri Gagarin first ventured into space!"

/datum/holiday/fourtwenty
	name = "Four-Twenty"
	begin_day = 20
	begin_month = APRIL
	holiday_hat = /obj/item/clothing/head/rasta
	holiday_colors = list(
		COLOR_ETHIOPIA_GREEN,
		COLOR_ETHIOPIA_YELLOW,
		COLOR_ETHIOPIA_RED,
	)

/datum/holiday/tea
	name = "National Tea Day"
	begin_day = 21
	begin_month = APRIL

/datum/holiday/earth
	name = "Earth Day"
	begin_day = 22
	begin_month = APRIL

/datum/holiday/anz
	name = "ANZAC Day"
	timezones = list(TIMEZONE_TKT, TIMEZONE_TOT, TIMEZONE_NZST, TIMEZONE_NFT, TIMEZONE_LHST, TIMEZONE_AEST, TIMEZONE_ACST, TIMEZONE_ACWST, TIMEZONE_AWST, TIMEZONE_CXT, TIMEZONE_CCT, TIMEZONE_CKT, TIMEZONE_NUT)
	begin_day = 25
	begin_month = APRIL
	holiday_hat = /obj/item/food/grown/poppy

// MAY

/datum/holiday/labor
	name = "Labor Day"
	begin_day = 1
	begin_month = MAY
	holiday_hat = /obj/item/clothing/head/utility/hardhat
	mail_holiday = TRUE

/datum/holiday/firefighter
	name = "Firefighter's Day"
	begin_day = 4
	begin_month = MAY
	holiday_hat = /obj/item/clothing/head/utility/hardhat/red


/datum/holiday/bee
	name = "Bee Day"
	begin_day = 20
	begin_month = MAY

// JUNE

/// Garbage DAYYYYY
/// Huh?.... NOOOO
/// *GUNSHOT*
/// AHHHGHHHHHHH
/datum/holiday/garbageday
	name = GARBAGEDAY
	begin_day = 17
	end_day = 17
	begin_month = JUNE

/datum/holiday/summersolstice
	name = "Summer Solstice"
	begin_day = 21
	begin_month = JUNE
	holiday_hat = /obj/item/clothing/head/costume/garland

/datum/holiday/pride_week
	name = PRIDE_WEEK
	begin_month = JUNE
	// Stonewall was June 28th, this captures its week.
	begin_day = 23
	end_day = 29
	holiday_colors = list(
		COLOR_PRIDE_PURPLE,
		COLOR_PRIDE_BLUE,
		COLOR_PRIDE_GREEN,
		COLOR_PRIDE_YELLOW,
		COLOR_PRIDE_ORANGE,
		COLOR_PRIDE_RED,
	)

// JULY

/datum/holiday/doctor
	name = "Doctor's Day"
	begin_day = 1
	begin_month = JULY
	holiday_hat = /obj/item/clothing/head/costume/nursehat

/datum/holiday/usa
	name = "US Independence Day"
	timezones = list(TIMEZONE_EDT, TIMEZONE_CDT, TIMEZONE_MDT, TIMEZONE_MST, TIMEZONE_PDT, TIMEZONE_AKDT, TIMEZONE_HDT, TIMEZONE_HST)
	begin_day = 4
	begin_month = JULY
	mail_holiday = TRUE
	holiday_hat = /obj/item/clothing/head/cowboy/brown
	holiday_colors = list(
		COLOR_OLD_GLORY_BLUE,
		COLOR_OLD_GLORY_RED,
		COLOR_WHITE,
		COLOR_OLD_GLORY_RED,
		COLOR_WHITE,
	)

/datum/holiday/writer
	name = "Writer's Day"
	begin_day = 8
	begin_month = JULY

/datum/holiday/france
	name = "Bastille Day"
	timezones = list(TIMEZONE_CEST)
	begin_day = 14
	begin_month = JULY
	holiday_hat = /obj/item/clothing/head/beret
	mail_holiday = TRUE
	holiday_colors = list(
		COLOR_FRENCH_BLUE,
		COLOR_WHITE,
		COLOR_FRENCH_RED
	)
	holiday_pattern = PATTERN_VERTICAL_STRIPE

/datum/holiday/france/greet()
	return "Do you hear the people sing?"

/datum/holiday/hotdogday
	name = HOTDOG_DAY
	begin_day = 17
	begin_month = JULY

/datum/holiday/hotdogday/greet()
	return "Happy National Hot Dog Day!"

/datum/holiday/friendship
	name = "Friendship Day"
	begin_day = 30
	begin_month = JULY

/datum/holiday/friendship/greet()
	return "Have a magical [name]!"

// AUGUST

/datum/holiday/indigenous //Indigenous Peoples' Day from Earth!
	name = "International Day of the World's Indigenous Peoples"
	begin_month = AUGUST
	begin_day = 9

// AUGUST

/datum/holiday/ukraine
	name = "Independence Day of Ukraine"
	begin_month = AUGUST
	begin_day = 24
	holiday_colors = list(COLOR_TRUE_BLUE, COLOR_TANGERINE_YELLOW)

// SEPTEMBER

//Tiziran Unification Day is celebrated on Sept 1st, the day on which lizards were made a roundstart race

/datum/holiday/questions
	name = "Stupid-Questions Day"
	begin_day = 28
	begin_month = SEPTEMBER

/datum/holiday/questions/greet()
	return "Are you having a happy [name]?"

// OCTOBER

/datum/holiday/animal
	name = "Animal's Day"
	begin_day = 4
	begin_month = OCTOBER

/datum/holiday/smile
	name = "Smiling Day"
	begin_day = 7
	begin_month = OCTOBER
	holiday_hat = /obj/item/clothing/head/costume/papersack/smiley

/datum/holiday/boss
	name = "Boss' Day"
	begin_day = 16
	begin_month = OCTOBER
	holiday_hat = /obj/item/clothing/head/hats/tophat

/datum/holiday/un_day
	name = "Anniversary of the Foundation of the United Nations"
	begin_month = OCTOBER
	begin_day = 24

/datum/holiday/un_day/greet()
	return "On this day in 1945, the United Nations was founded, laying the foundation for humanity's united government!"

/datum/holiday/halloween
	name = HALLOWEEN
	begin_day = 29
	begin_month = OCTOBER
	end_day = 2
	end_month = NOVEMBER
	holiday_colors = list(COLOR_MOSTLY_PURE_ORANGE, COLOR_PRISONER_BLACK)

/datum/holiday/halloween/greet()
	return "Have a spooky Halloween!"

// NOVEMBER

/datum/holiday/vegan
	name = "Vegan Day"
	begin_day = 1
	begin_month = NOVEMBER

/datum/holiday/october_revolution
	name = "October Revolution"
	begin_day = 6
	begin_month = NOVEMBER
	end_day = 7
	holiday_colors = list(
		COLOR_MEDIUM_DARK_RED,
		COLOR_GOLD,
		COLOR_MEDIUM_DARK_RED,
	)

/datum/holiday/lifeday
	name = "Life Day"
	begin_day = 17
	begin_month = NOVEMBER

/datum/holiday/kindness
	name = "Kindness Day"
	begin_day = 13
	begin_month = NOVEMBER

/datum/holiday/flowers
	name = "Flowers Day"
	begin_day = 19
	begin_month = NOVEMBER
	holiday_hat = /obj/item/food/grown/moonflower

/datum/holiday/hello
	name = "Saying-'Hello' Day"
	begin_day = 21
	begin_month = NOVEMBER

/datum/holiday/hello/greet()
	return "[pick(list("Aloha", "Bonjour", "Hello", "Hi", "Greetings", "Salutations", "Bienvenidos", "Hola", "Howdy", "Ni hao", "Guten Tag", "Konnichiwa", "G'day cunt"))]! " + ..()

// DECEMBER

/datum/holiday/festive_season
	name = FESTIVE_SEASON
	begin_day = 1
	begin_month = DECEMBER
	end_day = 31
	holiday_hat = /obj/item/clothing/head/costume/santa

/datum/holiday/festive_season/greet()
	return "Have a nice festive season!"

/datum/holiday/human_rights
	name = "Human-Rights Day"
	begin_day = 10
	begin_month = DECEMBER

/datum/holiday/monkey
	name = MONKEYDAY
	begin_day = 14
	begin_month = DECEMBER

/datum/holiday/doomsday
	name = "Mayan Doomsday Anniversary"
	begin_day = 21
	begin_month = DECEMBER

/datum/holiday/xmas
	name = CHRISTMAS
	begin_day = 23
	begin_month = DECEMBER
	end_day = 27
	holiday_hat = /obj/item/clothing/head/costume/santa
	mail_holiday = TRUE
	holiday_colors = list(
		COLOR_CHRISTMAS_GREEN,
		COLOR_CHRISTMAS_RED,
	)

/datum/holiday/xmas/greet()
	return "Have a merry Christmas!"

/datum/holiday/boxing
	name = "Boxing Day"
	begin_day = 26
	begin_month = DECEMBER

/datum/holiday/new_year
	name = NEW_YEAR
	begin_day = 31
	begin_month = DECEMBER
	end_day = 2
	end_month = JANUARY
	holiday_hat = /obj/item/clothing/head/costume/festive
	mail_holiday = TRUE

// MOVING DATES

/datum/holiday/friday_thirteenth
	name = "Friday the 13th"

/datum/holiday/friday_thirteenth/shouldCelebrate(dd, mm, yyyy, ddd)
	if(dd == 13 && ddd == FRIDAY)
		return TRUE
	return FALSE

/datum/holiday/programmers
	name = "Programmers' Day"

/datum/holiday/programmers/shouldCelebrate(dd, mm, yyyy, ddd) //Programmer's day falls on the 2^8th day of the year
	if(mm == 9)
		if(yyyy/4 == round(yyyy/4)) //Note: Won't work right on September 12th, 2200 (at least it's a Friday!)
			if(dd == 12)
				return TRUE
		else
			if(dd == 13)
				return TRUE
	return FALSE

// ISLAMIC

/datum/holiday/islamic
	name = "Islamic calendar code broken"

/datum/holiday/islamic/shouldCelebrate(dd, mm, yyyy, ddd)
	var/datum/foreign_calendar/islamic/cal = new(yyyy, mm, dd)
	return ..(cal.dd, cal.mm, cal.yyyy, ddd)

/datum/holiday/islamic/ramadan
	name = "Start of Ramadan"
	begin_month = 9
	begin_day = 1
	end_day = 3

/datum/holiday/islamic/ramadan/end
	name = "End of Ramadan"
	end_month = 10
	begin_day = 28
	end_day = 1

// HEBREW

/datum/holiday/hebrew
	name = "If you see this the Hebrew holiday calendar code is broken"

/datum/holiday/hebrew/shouldCelebrate(dd, mm, yyyy, ddd)
	var/datum/foreign_calendar/hebrew/cal = new(yyyy, mm, dd)
	return ..(cal.dd, cal.mm, cal.yyyy, ddd)

/datum/holiday/hebrew/hanukkah
	name = "Hanukkah"
	begin_day = 25
	begin_month = 9
	end_day = 2
	end_month = 10

/datum/holiday/hebrew/hanukkah/greet()
	return "Happy [pick("Hanukkah", "Chanukah")]!"

/datum/holiday/hebrew/passover
	name = "Passover"
	begin_day = 15
	begin_month = 1
	end_day = 22

// HOLIDAY ADDONS

/datum/holiday/xmas/celebrate()
	. = ..()
	SSticker.OnRoundstart(CALLBACK(src, PROC_REF(roundstart_celebrate)))
	GLOB.maintenance_loot += list(
		list(
			/obj/item/clothing/head/costume/santa = 1,
			/obj/item/gift/anything = 1,
			/obj/item/toy/xmas_cracker = 3,
		) = maint_holiday_weight,
	)

/datum/holiday/xmas/proc/roundstart_celebrate()
	for(var/obj/machinery/computer/security/telescreen/entertainment/Monitor as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/computer/security/telescreen/entertainment))
		Monitor.icon_state_on = "entertainment_xmas"

	for(var/mob/living/basic/pet/dog/corgi/ian/Ian in GLOB.mob_living_list)
		Ian.place_on_head(new /obj/item/clothing/head/helmet/space/santahat(Ian))


// EASTER (this having it's own spot should be understandable)

/datum/holiday/easter
	name = EASTER
	holiday_hat = /obj/item/clothing/head/costume/rabbitears
	var/const/days_early = 1 //to make editing the holiday easier
	var/const/days_extra = 1

/datum/holiday/easter/shouldCelebrate(dd, mm, yyyy, ddd)
	if(!begin_month)
		current_year = text2num(time2text(world.timeofday, "YYYY"))
		var/list/easterResults = EasterDate(current_year+year_offset)

		begin_day = easterResults["day"]
		begin_month = easterResults["month"]

		end_day = begin_day + days_extra
		end_month = begin_month
		if(end_day >= 32 && end_month == MARCH) //begins in march, ends in april
			end_day -= 31
			end_month++
		if(end_day >= 31 && end_month == APRIL) //begins in april, ends in june
			end_day -= 30
			end_month++

		begin_day -= days_early
		if(begin_day <= 0)
			if(begin_month == APRIL)
				begin_day += 31
				begin_month-- //begins in march, ends in april

	return ..()

/datum/holiday/easter/celebrate()
	. = ..()
	GLOB.maintenance_loot += list(
		list(
			/obj/item/surprise_egg = 15,
			/obj/item/storage/basket/easter = 15
		) = maint_holiday_weight,
	)

/datum/holiday/easter/greet()
	return "Greetings! Have a Happy Easter and keep an eye out for Easter Bunnies!"

/// Takes a holiday datum, a starting month, ending month, max amount of days to test in, and min/max year as input
/// Returns a list in the form list("yyyy/m/d", ...) representing all days the holiday runs on in the tested range
/proc/poll_holiday(datum/holiday/path, min_month, max_month, min_year, max_year, max_day)
	var/list/deets = list()
	for(var/year in min_year to max_year)
		for(var/month in min_month to max_month)
			for(var/day in 1 to max_day)
				var/datum/holiday/new_day = new path()
				if(new_day.shouldCelebrate(day, month, year, iso_to_weekday(day_of_month(year, month, day))))
					deets += "[year]/[month]/[day]"
	return deets

/// Does the same as [/proc/poll_holiday], but prints the output to admins instead of returning it
/proc/print_holiday(datum/holiday/path, min_month, max_month, min_year, max_year, max_day)
	var/list/deets = poll_holiday(path, min_month, max_month, min_year, max_year, max_day)
	message_admins("The accepted dates for [path] in the input range [min_year]-[max_year]/[min_month]-[max_month]/1-[max_day] are [deets.Join("\n")]")

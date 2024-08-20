/datum/language/akulan
	name = "Te Velu Akko"
	desc = "Translating to 'The Song of the King', this language was custom-made in Agurkrral to allow those with little education, including aliens, to better integrate into Azulean society. \
			It's easy to learn as a result and is characterised by hard consonants followed by soft vowel strings. \
			An underwater element exists, featuring great emphasis on close physical proximity, variations in pitch, high-frequency sounds, and clicking. \
			This part may require genemods for non-Azulean speakers."

// Cute. Too bad the description takes up the whole fucking desc box. For that, you're getting a secret tag. Idiot.

	key = "Z"
	flags = TONGUELESS_SPEECH
	space_chance = 70
	// Syllables derived from the Maori language.
	syllables = list (
		"ā", "ē", "ī", "ō", "a", "e", "i", "o", "u", "ha", "he", "hi", "ho", "hu", "ka", "ke", "ki", "ko", "ku", "ma", "me", "mi", "mo", "mu", "na", "ne", "ni", "no", "nu",
		"nga", "nge", "ngi", "ngo", "ngu", "pa", "pe", "pi", "po", "pu", "ra", "re", "ri", "ro", "ru", "ta", "te", "ti", "to", "tu", "wa", "we", "wi", "wo", "wu", "wha", "whe", "whi",
	)
	icon_state = "azulean"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 94

	secret = TRUE

/datum/language/terrum
	name = "Terrum"
	desc = "A language commonly used by constructs with no dedicated vocalization organs."
	key = "g"
	space_chance = 40
	syllables = list(
		"sha", "vu", "nah", "ha", "yom", "ma", "cha", "ar", "et", "mol", "lua",
		"ch", "na", "sh", "ni", "yah", "bes", "ol", "hish", "ev", "la", "ot", "la",
		"khe", "tza", "chak", "hak", "hin", "hok", "lir", "tov", "yef", "yfe",
		"cho", "ar", "kas", "kal", "ra", "lom", "im", "'", "'", "'", "'", "bok",
		"erev", "shlo", "lo", "ta", "im", "yom"
	)
	icon_state = "golem"
	default_priority = 90

	secret = TRUE

/datum/language/vox
	name = "Vox Standard"
	desc = "A form of hybrid encoded language employed by the biomechanical Vox species, characterized by sounding extremely annoying and irritating to those who don't recognize it. It usually requires an implant to be spoken in its entirety."
	key = "V"
	flags = TONGUELESS_SPEECH
	space_chance = 40
	syllables = list("ti","ti","ti","hi","hi","ki","ki","ki","ki","ya","ta","ha","ka","ya", "yi", "chi","cha","kah","SKRE","AHK","EHK","RAWK","KRA","AAA","EEE","KI","II","KRI","KA")
	icon_state = "vox-pidgin"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 99

	secret = TRUE

/datum/language/xerxian
	name = "Xerxian"
	desc = "An evolved, streamlined form of Semitic tongues that come from the Middle East - primarily Arabic. Despite its ancient origins, it's still spoken by many cultures and colonies that came from the Arab League and general Middle Eastern regions."
	key = "a"
	flags = TONGUELESS_SPEECH
	syllables = list(
		"a", "ah", "aah", "ba", "lah", "tha", "shah", "sa", "cha", "zah", "in", "al", "an", "har", "kham",
		"i", "ih", "bi", "lih", "thih", "sha", "shih", "sih", "chi", "zih", "ji", "nn", "jo", "ja",
		"o", "oh", "boh", "loh", "tho", "sho", "so", "cho", "zo", "ya", "yi", "yo", "far", "haft"
	)
	icon_state = "xerxian"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 95

	secret = TRUE

/datum/language/yangyu
	name = "Pan-Asianic Mandarin"
	desc = "Simply, the convergent evolution of all Asian languages. If you're a speaker, you're either someone who should know WELL about your family's traditions and history, or someone who doesn't care."
	key = "Y"
	flags = TONGUELESS_SPEECH
	space_chance = 70
	syllables = list (
		"ai", "ang", "bai", "beng", "bian", "biao", "bie", "bing", "cai", "can", "cao", "cei", "ceng", "chai", "chan", "chang",
		"chen", "chi", "chong", "chou", "chu", "chuai", "chuang", "chui", "chun", "dai", "dao", "dang", "deng", "diao", "dong", "duan",
		"fain", "fang", "feng", "fou", "gai", "gang", "gao", "gong", "guai", "guang", "hai", "han", "hang", "hao", "heng", "huai", "ji", "jiang",
		"jiao", "jin", "jun", "kai", "kang", "kong", "kuang", "lang", "lao", "liang", "ling", "long", "luan", "mao", "meng", "mian", "miao",
		"ming", "miu", "nyai", "nang", "nao", "neng", "nyang", "nuan", "qi", "qiang", "qiao", "quan", "qing", "sen", "shang", "shao", "shuan", "song", "tai",
		"tang", "tian", "tiao", "tong", "tuan", "wai", "wang", "wei", "weng", "xi", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xuan", "xue", "yan", "yang",
		"yao", "yin", "ying", "yong", "yuan", "zang", "zao", "zeng", "zhai", "zhang",
		"zhen", "zhi", "zhuai", "zhui", "zou", "zun", "zuo"
	)
	icon_state = "hanzi"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 94

/datum/language/siiktajr
	name = "Siik'tajr"
	desc = "Overly complicated and with a turbulent history, this tongue comprised of short-form speech mixed with growls and meows is native to the Tajara. Due to the size of their Empire, countless dialects and different idioms exist - making a simple uniform way to teach this language almost impossible. After first contact, Humans describe the tongue as sounding somewhat similar to old Scandinavian languages in some form or another. It's rarely seen spoken by those not native to Taj, though certain genemodder groups have picked up a form of the tongue."
	key = "3"
	flags = TONGUELESS_SPEECH
	sentence_chance = 9
	space_chance = 60
	syllables = list(
		"aa","ai","ar","au","e","ee","ei","et","rr","rr","ta","tten","for","får","grr","grå","grrå","gra","grår","gär","grii",
		"grri","dra","haak","häi","hain","hal","hii","hel","hie","hää","ja","jaa","juu","jy","jä","jääs","ka","kai",
		"kamp","ki","kir","keii","kar","karr","kat","kyi","kyy","laan","lii","lan","luu","lyk","luin","mar","mi",
		"mii","mir","myi","myk","myrr","nai","nen","nei","nii","niik","nja","nya","nya","nyä","nyå","ii'r","mrr","mer","merr","nys",
		"nyt","no","oo","on","pa","paa","paek","ruus","ryys","rr","rr","ryö","rän","rää","rö","rik","tiik","rryn","sa","ssen",
		"sen","sii","sse","sä","säi","taj","tajr","tärr","tau","tuu","tuss","ut","utt","va","veii","vai","varr",
		"ven","vel","velt","verr","vit","vii","viik","virr","vir","vo","vå","vår","vårr","vorr","vyy","vy","vä","ä",
		"äh","äk","äl","äm","än","ån","är","år","äs","ås","ää","har","för","svar","på","stra","sve","sverr","då",
		"län","ny","kor","stå","vär","nning","mmen","ärr","det","vil"
	)
	icon_state = "siiktajr"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 90

	secret = TRUE

/datum/language/common
	name = "Anglo-American"
	desc = "A language descended from North American English and the United Kingdom's English. A lot of people came to Europe after North America was rendered uninhabitable by corporate greed. \
			Features loanwords from all over Earth, and thus, the rest of space. The official language of SolStill!"
	key = "0"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100

	icon_state = "galcom"

/datum/language/common/syllables = list(
	// each sublist has an equal chance of being picked, so each syllable has an equal chance of being english or chinese
	list(
		"a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao",
		"bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "cei", "cen", "ceng", "cha", "chai",
		"chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chua", "chuai", "chuan", "chuang", "chui", "chun",
		"chuo", "ci", "cong", "cou", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "dei",
		"den", "deng", "di", "dian", "diao", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e",
		"ei", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga", "gai", "gan", "gang",
		"gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha",
		"hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hm", "hng", "hong", "hou", "hu", "hua", "huai", "huan",
		"huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan",
		"jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "kei", "ken", "keng", "kong", "kou", "ku", "kua", "kuai",
		"kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian",
		"liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "luan", "lun", "luo", "ma", "mai", "man", "mang",
		"mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na",
		"nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ng", "ni", "nian", "niang", "niao", "nie", "nin", "ning",
		"niu", "nong", "nou", "nu", "nuan", "nuo", "o", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng",
		"pi", "pian", "piao", "pie", "pin", "ping", "po", "pou", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin",
		"qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou",
		"ru", "rua", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sei", "sen", "seng", "sha",
		"shai", "shan", "shang", "shao", "she", "shei", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui",
		"shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te",
		"teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan",
		"wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu",
		"xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan",
		"yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai", "zhan", "zhang", "zhao",
		"zhe", "zhei", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi",
		"zong", "zou", "zuan", "zui", "zun", "zuo", "zu",
	),
	list(
		"al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
		"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
		"ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin",
		"his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi",
	),
)

/datum/language/schechi
	name = "Schechi"
	desc = "The very structurally loose creole tongue of the Teshari, host to hundreds of dialects almost different enough to resemble their own languages. \
	Originally developed on Sirisai, Schechi has made its way across the Teshari diaspora as a commonly agreed upon way for entirely different packs to communicate."
	key = "F"
	space_chance = 40
	syllables = list(
		"i", "ii", "si", "aci", "hi", "ni", "li", "schi", "tari",
		"e", "she", "re", "me", "ne",  "te", "se", "le", "ai",
		"a", "ra", "ca", "scha", "tara", "sa", "la", "na", "ce",
		"re", "se", "shi", "ti", "le", "la", "lu", "tu", "shu",
	)
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	icon_state = "schechi"
	default_priority = 90

	secret = TRUE

/datum/language/skrell
	name = "Skrelluq"
	desc = "Popularly known as \"Skrellian\" by foreigners, this newly-discovered language that the Skrell employ follows no traditional speech patterns. It relies on various differently-pitched warbles and low-frequency sound to construct different sentences, and is nearly inaudible to non-Skrell and anyone lacking an appropriate implant."
	space_chance = 100
	flags = TONGUELESS_SPEECH
	key = "K"
	syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix","*","!")
	default_priority = 90
	icon_state = "skrell"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'

	secret = TRUE

/datum/language/shadowtongue
	name = "Shadowtongue"
	desc = "What a grand and intoxicating innocence."
	key = "x"
	space_chance = 50
	syllables = list(
		"er", "sint", "en", "et", "nor", "bahr", "sint", "un", "ku'elm", "lakor", "eri",
		"noj", "dashilu", "as", "ot", "lih", "morh", "ghinu", "kin", "sha", "marik", "jibu",
		"sudas", "fut", "kol", "bivi", "pohim", "devohr", "ru", "huirf", "neiris", "sut",
		"devehr", "iru", "gher", "gan", "ujil", "lacor", "bahris", "ghar", "alnef", "wah",
		"khurdhar", "bar", "et", "ilu", "dash", "diru", "noj", "de", "damjulan", "luvahr",
		"telshahr", "tifur", "enhi", "am", "bahr", "nei", "neibahri", "n'chow", "n'wah",
		"s'wit", "b'vehk", "f'lah", "muth", "sera", "sedura", "bal", "dun"
	)
	icon_state = "shadow"
	default_priority = 90

	secret = TRUE // dog this is just cringe

/datum/language/piratespeak
	name = "Spatial Sea-tongue"
	desc = "The language of Space Pirates. It's rough, convoluted, and tough to decipher on purpose."
	space_chance = 60
	syllables = list(
		"yaye", "alya", "chirka", "tikat", "bazar", "oi", "yo", "meit", "grok", "ken", "berk", "cohon", "pendeo", "mark",
		"ho", "take", "yeer", "cur", "yoro", "armn", "tirta", "ren", "wap", "wop", "ran", "cro", "woh"
	)
	secret = TRUE

/datum/language/panslavic
	name = "Pan-Slavic"
	desc = "An elaborate mix of various Slavic languages with similar properties that has long since become the official language of the NRI, with a steady amount of relevance in SolFed colonies with Slavic descendants and various types of trading posts and spaceports across Human space - it even managed to find a niche in communication with other species."
	key = "P"
	flags = TONGUELESS_SPEECH
	syllables = list(
		"do", "ber", "sve", "tel", "po", "ča", "sen", "jag", "nje", "sla", "do",
		"led", "klo", "ba", "sa", "pa", "ra", "diž", "nik", "vol", "ko", "vi", "ži",
		"ra", "fa", "zob", "na", "ščet", "ka", "zgo", "do", "vi", "na", "zah", "ra",
		"da", "tam", "ten", "led", "nič", "ka", "zá", "pis", "ník", "krá", "va",
		"ku", "ku", "ři", "ce", "ve", "přo", "vé", "ma", "so", "mo", "cný", "pi",
		"kan", "tní", "o", "ran", "žo", "vý", "vlast", "nos", "ti", "hvi", "li", "na",
		"mіs", "ce", "vij", "snі", "da", "nok", "kva", "so", "lja", "char", "ka", "mіs",
		"jacj", "gar", "na", "ne", "pra", "vil", "niy", "min", "dal", "io", "lam", "pa",
		"i", "zo", "bra", "ze", "ni", "e", "is", "kus", "stvo", "bi", "bli", "o", "te",
		"ka", "bas", "se", "in", "fut", "bol", "o", "fis", "po", "che", "mu", "ru",
		"bash", "ka", "kuh", "nia", "rech", "nik", "gor", "ko", "pi", "le", "ti", "na",
		"ko", "ni", "spa", "va", "ha", "so", "ba", "sve", "ska", "nov", "cha", "nik",
		"zem", "lya", "kan", "ce", "la", "ri", "јa", "snezh", "ne", "pa", "da", "vi", "ne"
	)
	icon_state = "russian"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 95

	secret = TRUE

	// Pan-SLAVIC? Do you even understand what you WROTE? "Hm, let's combine all the people who HATE EACHOTHER to DEATH in a singular language! Nothing can go wrong!" I bet you a Russian shitgoblin wrote this.
/datum/language/mushroom
	name = "Mushroom"
	desc = "A language that consists of the sound of periodic gusts of spore-filled air being released."
	key = "y"
	sentence_chance = 0
	default_priority = 80
	syllables = list("poof", "pff", "pFfF", "piff", "puff", "pooof", "pfffff", "piffpiff", "puffpuff", "poofpoof", "pifpafpofpuf")

	secret = TRUE

/datum/language/moffic
	name = "Mothic"
	desc = "Spoken colloquially by the Mothfolk of Va Lumla, the early iteration of Mothic emerged when Fueljacks relied on their receptors for simple, one-worded pheromones to communicate, and navigate the often fatal maintenance tunnels sprawled throughout the fleet. \
	 	The moths developed gesticulation through antennas and wings to convey deeper intent, with mandibles providing emotional context through clicks and trills. \
	 	After First Contact, human speakers managed to achieve a similar effect from clicking their tongue to roof, and steer the tone with the width of their mouth while using their hands in place of antennas. \
	 	It is informally spoken, deploying many slangs and shorthands from Common. Has phonetic resemblance to Italian."
	space_chance = 40
	// Syllables derived from Italian.
	syllables = list(
		"a", "an", "ar", "ave", "avo", "are", "ale", "be", "buo", "ca", "cie", "cr",
		"ch", "che", "co", "cco", "ce", "cu", "ci", "ccia", "ccio", "da", "di", "do",
		"e", "é", "ere", "ette", "fa", "fu", "fo", "gi", "gio", "gn", "go", "gu", "ni",
		"gri", "ia", "iei", "ile", "imo", "l", "la", "lla", "le", "li", "lia", "lio",
		"lo", "lu", "me", "mi", "mo", "mos", "na", "ne", "no", "nuo", "o", "ò", "oi",
		"or", "os", "otto", "qua", "que", "qui", "pi", "po", "rò", "sa", "se", "si",
		"sto", "ua", "ue", "ui", "un", "ta", "tra", "te", "tri", "tre", "tro", "to",
		"ti", "va", "vi", "ve", "vo", "veni", "ver", "tu", "dru", "bi", "en", "je",
		"dici", "tru", "zo", "ze", "ul", "bo", "ba", "gh", "ino", "etta", "i", "in",
		"chh", "rio", "ie", "bar", "bas", "die", "ter", "pa", "pe", "pu", "fe", "fi",
	)

	secret = TRUE

/datum/language/monkey
	name = "Chimpanzee"
	desc = "Ook ook ook."
	key = "1"
	space_chance = 100
	syllables = list("oop", "aak", "chee", "eek")
	default_priority = 80

	icon_state = "animal"

	secret = TRUE

/datum/language/gutter
	name = "Plutonian"
	desc = "Plutonian derives from the original French and Spanish settlers that made up the original Plutonian Colonization mission. It's a kinder word for what was essentially the Anglo-Americans kicking out their closest neighbors to make for more space to put an immediately bloated and strained population."
	key = "G"
	flags = TONGUELESS_SPEECH
	syllables = list (
		"bai", "cai", "jai", "quai", "vai", "dei", "lei", "quei", "sei", "noi", "quoi", "voi", "beu", "queu", "seu", "gan", "zan", "quan", "len", "ten",
		"ba", "be", "bi", "bo", "bu", "ca", "ce", "ci", "co", "cu", "da", "de", "di", "do", "du", "fa", "fe", "fi", "fo", "fu", "ga", "gue", "gui", "go",
		"gu", "ña", "ñe", "ñi", "ño", "ñu", "que", "qui", "cha", "che", "chi", "cho", "chu", "lla", "lle", "lli", "llo", "llu",
		"tá", "vé", "sál", "fáb", "l'e", "seu", "deu", "meu", "vai", "ción", "tá"
	)
	icon_state = "gutter"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 40

/datum/language/chitinclick
	name = "Chitinclick"
	desc = "A popular non-Human language that finds extensive use by various types of anthropomorphic invertebrates. It consists of complex flutters, chittering, antenna movements, and sparse guttural syllables."
	key = "C"
	space_chance = 40
	//References some replaced languages.
	syllables = list(
		// Original
		"a", "ak", "ae", "ai", "az", "ba", "bz", "bu", "bh", "br", "bi",
		"c", "ca", "ci", "ch", "chk", "cr", "cl", "ce", "cu", "cli", "cla",
		"du", "dr", "dri", "de", "do", "dza", "dk", "g", "ga", "gr", "dz",
		"gi", "gchk", "i", "ii", "ik", "it", "il", "ie", "iz", "ir", "io",
		"pi", "pz", "pe", "po", "phk", "k", "kz", "kl", "ka", "kli", "kh",
		"kch", "vh", "vr", "vz", "veh", "mr", "mz", "mi", "ma", "mhk", "zz",
		"ze", "zu", "zo", "za", "nz", "zi", "fz", "fr", "f", "fi", "click",
		"chit", "rr", "ru", "ra", "rzz", "ri", "re",
		// Buzzwords
		"zz", "buzz", "ZZ",
	)
	icon_state = "chitinclick"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'

	secret = TRUE

/datum/language/canilunzt
	name = "Canilunzt"
	desc = "A somewhat simple language consisting of heavily articulate barks, growls, yapping, and combined movements of the tail and ears. It's natively spoken by the Vulpkanin, although certain groups of gene modders have adopted it as a secondary form of communication. Its parlance has been loosely compared to the Germanic language group."
	key = "7"
	flags = TONGUELESS_SPEECH
	space_chance = 80
	syllables = list (
		"rah","mur","ru","ke","grok","wen","tot","sch",
		"grst","crentz","cet","waz","et","du","kor","heizt","loch","jach","qet","anzhem","icht",
		"unt","kech","gech","flei","deint","weim","kan","neiz","mende","lak","jen","gor","bor",
		"kol","hau","au","vau","amh","av","vogh","guau","hev","haf","auh","bhao","jau","yar","owff",
		"ghav","buh","rur","ya","cen","bar","kuk","tek","qat","uk","wu","vuh","tah","tch","schz",
		"auch","ist","ein","entch","zwichs","tut","mir","wo","bis","es","vor","nic","gro","lll",
		"enem","zandt","tzch","noch","hel","ischt","far","wa","baram","iereng","tech","lach","sam",
		"mak","lich","gen","or","ag","eck","gec","stag","onn","bin","ket","einech","cresthz","azunein","ghzth"
	)
	icon_state = "canilunzt"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 90

	secret = TRUE

/datum/language/calcic
	name = "Calcic"
	desc = "The disjointed and staccato language of plasmamen. Also understood by skeletons."
	key = "b"
	space_chance = 10
	syllables = list(
		"k", "ck", "ack", "ick", "cl", "tk", "sk", "isk", "tak",
		"kl", "hs", "ss", "ks", "lk", "dk", "gk", "ka", "ska", "la", "pk",
		"wk", "ak", "ik", "ip", "ski", "bk", "kb", "ta", "is", "it", "li", "di",
		"ds", "ya", "sck", "crk", "hs", "ws", "mk", "aaa", "skraa", "skee", "hss",
		"raa", "klk", "tk", "stk", "clk"
	)
	icon_state = "calcic"
	default_priority = 90

	secret = TRUE

/datum/language/buzzwords
	name = "Buzzwords"
	desc = "A common language to all insects, made by the rhythmic beating of wings."
	key = "z"
	space_chance = 0
	syllables = list(
		"bzz","zzz","z","bz","bzzz","zzzz", "bzzzz", "b", "zz", "zzzzz"
	)
	icon_state = "buzz"
	default_priority = 90

	secret = TRUE

/datum/language/beachbum
	name = "Beachtongue"
	desc = "An ancient language from the distant Beach Planet. People magically learn to speak it under the influence of space drugs."
	key = "u"
	space_chance = 85
	default_priority = 90
	syllables = list(
		"cowabunga", "rad", "radical", "dudes", "bogus", "weeed", "every",
		"dee", "dah", "woah", "surf", "blazed", "high", "heinous", "day",
		"brah", "bro", "blown", "catch", "body", "beach", "oooo", "twenty",
		"shiz", "phiz", "wizz", "pop", "chill", "awesome", "dude", "it",
		"wax", "stoked", "yes", "ding", "way", "no", "wicked", "aaaa",
		"cool", "hoo", "wah", "wee", "man", "maaaaaan", "mate", "wick",
		"oh", "ocean", "up", "out", "rip", "slide", "big", "stomp",
		"weed", "pot", "smoke", "four-twenty", "shove", "wacky", "hah",
		"sick", "slash", "spit", "stoked", "shallow", "gun", "party",
		"heavy", "stellar", "excellent", "triumphant", "babe", "four",
		"tail", "trim", "tube", "wobble", "roll", "gnarly", "epic",
	)

	icon_state = "beach"

	secret = TRUE

/datum/language/ashtongue
	name = "Ashtongue"
	desc = "A language derived from Draconic, altered and morphed into a strange tongue by the enigmatic will of the Necropolis, a half-successful attempt at patterning its own alien communication methods onto mundane races. It's become nigh-incomprehensible to speakers of the original language."
	key = "l"
	flags = TONGUELESS_SPEECH
	space_chance = 70
	syllables = list(
		"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
		"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh", "hs", "sh",
		"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
		"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
		"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
		"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
		"er", "sint", "en", "et", "nor", "bahr", "sint", "un", "ku", "lakor", "eri",
		"noj", "dashilu", "as", "ot", "lih", "morh", "ghinu", "kin", "sha", "marik", "jibu",
		"sudas", "fut", "kol", "bivi", "pohim", "devohr", "ru", "huirf", "neiris", "sut",
		"viepn","bag","docu","kar","xlaqf","raa","qwos","nen","ty","von","kytaf","xin",
		"devehr", "iru", "gher", "gan", "ujil", "lacor", "bahris", "ghar", "alnef", "wah",
		"khurdhar", "bar", "et", "ilu", "dash", "diru", "noj", "de", "damjulan", "luvahr",
		"telshahr", "tifur", "enhi", "am", "bahr", "nei", "neibahri", "n'chow", "n'wah",
		"baak","hlaf","pyk","znu","agr","ith","na'ar","uah","plhu","six","fhler","bjel","scee",
		"lleri","dttm","aggr","uujl","hjjifr","wuth","aav","inya","sod","bli","min","fril","bli","'ddn","tun'da",
		"'ad","iir","krei","tii'","ruuk","nei","zirua","surai","lieket","miruk","ettirup","mireez","cqiek",
		"brut","vaahk","nah'za","diierk","piut","vuurk","cs'eer","jeirk","qiruvk",
	)
	icon_state = "ashtongue"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 90
	secret = TRUE

/datum/language/aphasia
	name = "Gibbering"
	desc = "It is theorized that any sufficiently brain-damaged person can speak this language."
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	key = "i"
	syllables = list("m","n","gh","h","l","s","r","a","e","i","o","u")
	space_chance = 20
	default_priority = 10
	icon_state = "aphasia"

	secret = TRUE

/datum/language/nekomimetic
	name = "Nekomimetic"
	desc = "To the casual observer, this langauge is an incomprehensible mess of broken Japanese. To the felinids, it's somehow comprehensible."
	key = "f"
	space_chance = 70
	syllables = list(
		"neko", "nyan", "mimi", "moe", "mofu", "fuwa", "kyaa", "kawaii", "poka", "munya",
		"puni", "munyu", "ufufu", "uhuhu", "icha", "doki", "kyun", "kusu", "nya", "nyaa",
		"desu", "kis", "ama", "chuu", "baka", "hewo", "boop", "gatto", "kit", "sune", "yori", //NOVA EDIT gatto
		"sou", "baka", "chan", "san", "kun", "mahou", "yatta", "suki", "usagi", "domo", "ori",
		"uwa", "zaazaa", "shiku", "puru", "ira", "heto", "etto"
	)
	icon_state = "neko"
	default_priority = 90

	secret = TRUE

/datum/language/spacer
	name = "Spacer"
	desc = "A rough, informal tongue used as a last resort when attempts to establish dialogue in more proper languages fail and no automatic translators are available. It relies heavily on tone, body language, signing, and a multitude of creole loanwords. While its use has fallen severely over the years, it's still practiced by a quantity of Frontier crews and favored by the Free Trade Union."
	key = "j"
	flags = TONGUELESS_SPEECH
	syllables = list(
		"ada", "zir", "bian", "ach", "usk", "ado", "ich", "cuan", "iga", "qing", "le", "que", "ki", "qaf", "dei", "eta"
	)
	icon_state = "spacer"
	icon = 'modular_nova/master_files/icons/misc/language.dmi'
	default_priority = 50

	secret = TRUE

/datum/language/voltaic
	name = "Voltaic"
	desc = "A sparky language made by manipulating electrical discharge."
	key = "v"
	space_chance = 20
	syllables = list(
		"bzzt", "skrrt", "zzp", "mmm", "hzz", "tk", "shz", "k", "z",
		"bzt", "zzt", "skzt", "skzz", "hmmt", "zrrt", "hzzt", "hz",
		"vzt", "zt", "vz", "zip", "tzp", "lzzt", "dzzt", "zdt", "kzt",
		"zzzz", "mzz"
	)
	icon_state = "volt"
	default_priority = 90

	secret = TRUE

/datum/language/uncommon
	name = "Galactic Uncommon"
	desc = "The second-most spoken Human language."
	key = "!"
	flags = TONGUELESS_SPEECH
	space_chance = 50
	syllables = list(
		"ba", "be", "bo", "ca", "ce", "co", "da", "de", "do",
		"fa", "fe", "fo", "ga", "ge", "go", "ha", "he", "ho",
		"ja", "je", "jo", "ka", "ke", "ko", "la", "le", "lo",
		"ma", "me", "mo", "na", "ne", "no", "ra", "re", "ro",
		"sa", "se", "so", "ta", "te", "to", "va", "ve", "vo",
		"xa", "xe", "xo", "ya", "ye", "yo", "za", "ze", "zo"
	)
	icon_state = "galuncom"
	default_priority = 90

	secret = TRUE

/datum/language/sylvan
	name = "Sylvan"
	desc = "A complicated, ancient language spoken by sentient plants."
	key = "h"
	space_chance = 20
	syllables = list(
		"fii", "sii", "rii", "rel", "maa", "ala", "san", "tol", "tok", "dia", "eres",
		"fal", "tis", "bis", "qel", "aras", "losk", "rasa", "eob", "hil", "tanl", "aere",
		"fer", "bal", "pii", "dala", "ban", "foe", "doa", "cii", "uis", "mel", "wex",
		"incas", "int", "elc", "ent", "aws", "qip", "nas", "vil", "jens", "dila", "fa",
		"la", "re", "do", "ji", "ae", "so", "qe", "ce", "na", "mo", "ha", "yu"
	)
	icon_state = "plant"
	default_priority = 90

	secret = TRUE

/datum/language/slime
	name = "Slime"
	desc = "A melodic and complex language spoken by slimes. Some of the notes are inaudible to humans."
	key = "k"
	syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix","*","!")
	default_priority = 70

	icon_state = "slime"

	secret = TRUE

/datum/language/draconic
	name = "Draconic"
	desc = "The common language of lizard-people, composed of sibilant hisses and rattles."
	key = "o"
	flags = TONGUELESS_SPEECH
	space_chance = 40
	syllables = list(
		"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
		"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh", "hs", "sh",
		"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
		"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
		"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
		"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
		"a",  "a",  "e",  "e",  "i",  "i",  "o",  "o",  "u",  "u",  "s",  "s"
	)
	icon_state = "lizard"
	default_priority = 90

	secret = TRUE

/datum/language/machine
	name = "Encoded Audio Language"
	desc = "An efficient language of encoded tones developed by synthetics and cyborgs."
	spans = list(SPAN_ROBOT)
	key = "6"
	flags = NO_STUTTER
	syllables = list(
		"beep", "beep", "beep", "beep", "beep", "boop", "boop", "boop",
		"bop", "bop", "dee", "dee", "doo", "doo", "hiss", "hss", "buzz",
		"buzz", "bzz", "ksssh", "keey", "wurr", "wahh", "tzzz",
	)
	space_chance = 10
	default_priority = 90

	icon_state = "eal"

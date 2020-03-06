	const_def 2 ; object constants
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd gymstatue2

FalknerIntroText:
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "As both a #MON"
	line "trainer and a"
	cont "practitioner of"
	cont "martial arts, I"
	cont "have realized the"
	cont "pertinence of"
	cont "covering more"
	cont "than a single base"
	cont "of offense and"
	cont "defense."
	
	para "Now show me…"
	
	para "How will you"
	line "handle an attack"
	cont "that comes"
	cont "from both above"
	cont "and below!"
	done

FalknerWinLossText:
	text "It seems the"
	line "answer to my"
	cont "earlier question"
	cont "is 'quite well'!"

	para "You're more than"
	line "deserving of this!"
	
	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

FalknerZephyrBadgeText:
	text "People used to"
	line "think that"
	cont "gaining badges"
	cont "raised the stats"
	cont "of #MON but"
	cont "the truth is"
	cont "that #MON grow"
	cont "stronger by the"
	cont "dedication of"
	cont "us trainers."

	para "My ZEPHYRBADGE"
	line "will however"
	cont "enable a"
	cont "#MON to use"
	cont "FLASH, if they"
	cont "have it, anytime."

	para "Here--take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "By using a TM, a"
	line "#MON will"
	cont "instantly learn a"
	cont "new move."

	para "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"
	cont "while it causes"
	cont "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done

FalknerFightDoneText:
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "Trainers of the"
	line "new JOHTO LEAGUE"
	cont "are working very"
	cont "hard to establish"
	cont "themselves."
	
	para "Good luck!"
	done

BirdKeeperRodSeenText:
	text "The keyword is"
	line "guts!"

	para "Clip our wings"
	line "and we'll respond"
	cont "with our fists!"

	para "Come on!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "FALKNER's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

BirdKeeperAbeSeenText:
	text "Let me see if you"
	line "are good enough to"
	cont "face FALKNER!"
	done

BirdKeeperAbeBeatenText:
	text "Beaten by a total"
	line "rookie?!"
	done

BirdKeeperAbeAfterBattleText:
	text "If you make it"
	line "past FALKNER then"
	cont "I'll have no"
	cont "right to call you"
	cont "a rookie!"
	done

VioletGymGuyText:
	text "Oi, punk!"
	
	para "Listen to me and"
	line "you'll be in"
	cont "the big leagues"
	cont "in no time, eh!"
	
	para "Look… FALKNER"
	line "and his gym buds"
	cont "use FLYING and"
	cont "FIGHTING types!"
	
	para "GRASS and BUG are"
	line "weak to FLYING!"
	
	para "NORMAL is weak to"
	line "FIGHTING!"
	
	para "Keep that in"
	line "mind, kid!"
	done

VioletGymGuyWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"
	cont "be the CHAMP in no"
	cont "time at all!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1

	const_def 2 ; object constants
	const DESERT_POKEFAN_M1
	const DESERT_SUPER_NERD
	const DESERT_POKEFAN_M2
	const DESERT_FISHER1
	const DESERT_FISHER2
	const DESERT_POKE_BALL1
	const DESERT_POKE_BALL2
	const DESERT_POKE_BALL3
	const DESERT_POKE_BALL4

RuinsOfAlphOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

DesertGreatBall:
	itemball GREAT_BALL

DesertXAttack:
	itemball X_ATTACK

DesertPotion:
	itemball POTION

DesertAwakening:
	itemball AWAKENING

RuinsOfAlphResearchCenterSign:
; unused
	jumptext DesertUnusedSignText

HikerRussellSeenText:
	text "I've got sand"
	line "in my expensive"
	cont "hiking boots!"
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

HikerRussellAfterBattleText:
	text "All right, then!"
	line "I've decided."

	para "I'm not leaving"
	line "until I break in"
	cont "these boots!"
	done

PokemaniacLarrySeenText:
	text "I roam far and"
	line "wide in search of"
	cont "#MON."

	para "Are you looking"
	line "for #MON too?"

	para "Then you're my"
	line "collecting rival!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. My poor #-"
	line "MON…"
	done

PokemaniacLarryAfterBattleText:
	text "There's several"
	line "rare #MON"
	cont "in different parts"
	cont "of this desert."
	
	para "…Or so I've heard."
	done

HikerDanielSeenText:
	text "There aint much"
	line "to see out here."
	
	para "Keep me entertained"
	line "with a battle!"
	done

HikerDanielBeatenText:
	text "Whoa! I'm beaten"
	line "big time!"
	done

HikerDanielAfterBattleText:
	text "I got to see the"
	line "ruins once as a"
	cont "boy! One of the"
	cont "wall symbols"
	cont "winked at me!"
	done

FirebreatherBillSeenText:
	text "NATU's CONFUSION"
	line "keeps confusing"
	cont "my #MON."

	para "I'm seriously"
	line "upset about that!"
	done

FirebreatherBillBeatenText:
	text "I flamed out!"
	done

FirebreatherBillAfterBattleText:
	text "Did you know that"
	line "SMEARGLE paint is"
	cont "highly flammable?"
	done

FirebreatherRaySeenText:
	text "This heat is just"
	line "perfect for my"
	cont "lovely FIRE types!"
	done

FirebreatherRayBeatenText:
	text "Scorched!"
	done

FirebreatherRayAfterBattleText:
	text "My #MON's fire"
	line "is hotter than"
	cont "the desert sun!"
	done

DesertUnusedSignText:
	text "EXCAVATION TEAM"
	done

ResearchCenterScientistScript:
	jumptextfaceplayer ScientistRCText
	
ScientistRCText:
	text "Thousands of"
	line "years of regional"
	cont "history, gone in"
	cont "an instant…"
	
	para "It's been 3 years"
	line "and I'm still in"
	cont "complete shock"
	cont "and awe."
	done
	

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  3, RUINS_OF_ALPH_RESEARCH_CENTER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  3, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	db 10 ; object events
	object_event  9, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  3, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event  7,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 15, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event  8, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event  3, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event 10, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 17, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertAwakening, EVENT_UNION_CAVE_1F_AWAKENING
	object_event 13,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ResearchCenterScientistScript, -1
	
	const_def 2 ; object constants
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end


RuinsOfAlphResearchCenterScientist3Script:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist3Text

RuinsOfAlphResearchCenterScientist1Script:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text

RuinsOfAlphResearchCenterScientist2Script:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist2Text


RuinsOfAlphResearchCenterComputer:
	jumptext RuinsOfAlphResearchCenterComputerText


RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText



RuinsOfAlphResearchCenterScientist3Text:
	text "Right around when"
	line "the METEOR fell,"
	cont "the RUINS OF ALPH"
	cont "also suddenly"
	cont "exploded from"
	cont "deep under the"
	cont "ground."
	
	para "Nobody knows why"
	line "but we've theor-"
	cont "ized that it was"
	cont "a result of the"
	cont "earthquake after"
	cont "the intial impact."
	
	para "Still…"
	
	para "The way in which"
	line "the ruins exploded"
	cont "seemed too precise"
	cont "for natural means."
	
	para "I suppose we may"
	line "never truly know."
	done


RuinsOfAlphResearchCenterScientist1Text:
	text "The RUINS were"
	line "about 1500 years"
	cont "old."

	para "But now it seems"
	line "like it'll take"
	cont "another 1500 just"
	cont "to dig them back"
	cont "out! Gah!"
	done


RuinsOfAlphResearchCenterScientist2Text:
	text "The RUINS that"
	line "were here were"
	cont "marked by odd"
	cont "symbols rumored"
	cont "to be connected"
	cont "with a rare"
	cont "PSYCHIC #MON"
	
	para "Could those"
	line "#MON have"
	cont "sank the RUINS"
	cont "on purpose to"
	cont "protect themse-"
	cont "lves from some-"
	cont "thing?"
	done


RuinsOfAlphResearchCenterComputerText:
	text "RUINS OF ALPH"
	line "excavation plan"
	
	para "The scheduled"
	line "completion date"
	cont "is years away!"
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This printer's"
	line "not being used"
	cont "for anything at"
	cont "the moment."
	
	para "Maybe you can"
	line "use this to"
	cont "print something"
	cont "else someday."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "MISSINGNO may be"
	line "printed out."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	db 3 ; object events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, -1

	const_def 2 ; object constants
	const GUIDEGENTSHOUSE_GRAMPS

GuideGentsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText

GuideGentsHouseBookshelf:
	jumpstd magazinebookshelf

GuideGentsHouseGuideGentText:
	text "Here's a word of"
	line "advice: Catch lots"
	cont "of #MON!"

	para "Treat them all"
	line "with kindness!"
	
	para "You may not look"
	line "like it, but I"
	cont "sense very high"
	cont "potential in you!"
	done

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GuideGentsHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE

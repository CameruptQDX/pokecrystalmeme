	const_def 2 ; object constants
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .IsForestRestless

.IsForestRestless:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	return

.Normal:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	return

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, MovementData_0x62d97
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, MovementData_0x62d9a
.skip:
	end

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route34IlexForestGateTeacherText
	buttonsound
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

.ForestIsRestless:
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	buttonsound
	closetext
	end

Route34IlexForestGateButterfreeScript:
	opentext
	writetext Route34IlexForestGateButterfreeText
	cry VENOMOTH ; replaced butterfree because it got culled
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

MovementData_0x62d97:
	step UP
	step UP
	step_resume

MovementData_0x62d9a:
	step DOWN
	step RIGHT
	step_resume

Route34IlexForestGateTeacherText:
	text "Oh, honey. You're"
	line "making a #DEX?"

	para "More #MON live"
	line "in the wild than"
	cont "most people know."
	
	para "If you want to"
	line "find them all"
	cont "this might make"
	cont "it a bit easier."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "It's SWEET SCENT."

	para "Use it wherever"
	line "#MON appear,"
	cont "and they'll come"
	cont "running straight"
	cont "into your"
	cont "# BALLs!"
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Something's wrong"
	line "in ILEX JUNGLE…"

	para "You should stay"
	line "away right now."
	done

Route34IlexForestGateButterfreeText:
	text "VENOMOTH: Voool!"
	done

Route34IlexForestGateLassText:
	text "Did you see the"
	line "shrine honoring"
	cont "the protector?"

	para "It watches over"
	line "the FOREST from"
	cont "across time."

	para "I wonder what"
	line "would happen to"
	cont "the forest if"
	cont "someone actually"
	cont "caught it?"
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	db 1 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, Route34IlexForestGateCelebiEvent

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	object_event  5,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY

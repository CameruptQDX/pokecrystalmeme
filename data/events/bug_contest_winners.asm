BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon: ; NEED TO COME BACK AND REPLACE ALL THE JIGGLYPUFF
	db BUG_CATCHER, DON
	dbw JIGGLYPUFF,     300
	dbw JIGGLYPUFF,    285
	dbw EXEGGCUTE,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw CHANSEY, 286
	dbw CHANSEY, 251
	dbw EXEGGCUTE,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw PINSIR,    357
	dbw CHANSEY, 349
	dbw SCYTHER,     368

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw SCYTHER,     332
	dbw CHANSEY, 324
	dbw RHYHORN,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw CHANSEY, 318
	dbw PARAS,     295
	dbw EXEGGCUTE,   285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw SCYTHER,     366
	dbw RHYHORN,    329
	dbw JIGGLYPUFF,     314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw CHANSEY, 341
	dbw JIGGLYPUFF,    301
	dbw EXEGGCUTE,   264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw PINSIR,    326
	dbw CHANSEY, 292
	dbw JIGGLYPUFF,    282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw PARAS,     270
	dbw SCYTHER,     282
	dbw EXEGGCUTE,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw RHYHORN,    267
	dbw PIKACHU,      254
	dbw JIGGLYPUFF,     259

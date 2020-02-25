; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems: ; this whole table dummied out for build fix on replaced item constants
	db BERRY, BERRY  ; time capsule won't even be accessable in AU
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db BERRY, BERRY 
	db -1,      BERRY
	db 0 ; end

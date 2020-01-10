	db DOOMSDAY ; 252

	db 110, 154, 90, 90, 130, 106
	;   hp  atk  def  spd  sat  sdf

	db GHOST, DARK ; type
	db 3 ; catch rate
	db 220 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/doomsday/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, MEAN_LOOK, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, SWAGGER, SLEEP_TALK, DEFENSE_CURL, DREAM_EATER, DETECT, REST, THIEF, FURY_CUTTER, NIGHTMARE, FLASH, THUNDERBOLT
	; end

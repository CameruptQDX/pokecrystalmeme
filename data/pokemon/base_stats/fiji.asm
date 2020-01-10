	db FIJI ; replaces zapdos

	db 89, 92, 88, 96, 80, 80
	;   hp  atk  def  spd  sat  sdf

	db FLYING, GRASS ; type
	db 3 ; catch rate
	db 230 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/fiji/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, MEAN_LOOK, SOLARBEAM, DRAGONBREATH, RETURN, SHADOW_BALL, SWAGGER, SLUDGE_BOMB, SWIFT, DEFENSE_CURL, REST, FLY
	; end

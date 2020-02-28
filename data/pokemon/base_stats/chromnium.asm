	db CHROMNIUM ; replaces farfetch'd

	db 100, 110, 115, 45, 40, 70 ; superdex official PF stats
	;   hp  atk  def  spd  sat  sdf

	db STEEL, WATER ; type
	db 45 ; catch rate
	db 150 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 26 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/chromnium/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, MEAN_LOOK, IRON_TAIL, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, STEEL_WING, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end

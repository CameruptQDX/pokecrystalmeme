	db MOCKEREY ; replaces nidorina

	db 150, 105, 50,  50,  80, 105
	;   hp  atk  def  spd  sat  sdf

	db DARK, PSYCHIC ; type
	db 30 ; catch rate
	db 1 ; base exp
	db BITTER_BERRY, BITTER_BERRY ; items
	db GENDER_F0 ; gender ratio
	db 100 ; unknown 1
	db 40 ; step cycles to hatch
	db 6 ; unknown 2
	INCBIN "gfx/pokemon/mockerey/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, MEAN_LOOK, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, STRENGTH, FLASH
	; end

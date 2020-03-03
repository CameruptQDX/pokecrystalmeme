YehawLogo:
	xor a
	ldh [hBGMapMode], a ; disable hBGMapMode
	
	
	;pfero's tile display bit
	call DisableLCD

	ld b, SCGB_GAMEFREAK_LOGO ; temporary before we make real palettes for these
    call GetSGBLayout
    call SetPalettes
	
	ld hl, YehawSplashLZ
    ld de, vTiles2
    ld a, BANK(YehawSplashLZ) ; calling the bank it's in
    call FarDecompress ; splash/heggie is in a different bank
    ld hl, YehawTilemap
    ld de, vBGMap0
    ld a, BANK(YehawTilemap)
    call FarDecompress

	ld a, 1
	ldh [rVBK], a ; switch to vram 1 to set attributes
	xor a
	ld hl, vBGMap2
	ld bc, vBGMap3 - vBGMap2
	call ByteFill
	ldh [rVBK], a ; a is still 0 here

	ld c, 100
	call DelayFrames
	
	
	call EnableLCD
	ret
	
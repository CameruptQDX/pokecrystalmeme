YehawLogo:
	call DisableLCD
	
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout

	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld a, BANK(YehawPals)
	ld hl, YehawPals
	ld de, wBGPals2
	ld bc, 1 palettes
	call FarCopyBytes
	ld a, 1
	ldh [hCGBPalUpdate], a
	ldh [rSVBK], a

	ld a, BANK(YehawSplashLZ) ; calling the bank it's in
	ld hl, YehawSplashLZ
	ld de, vTiles1
	call FarDecompress ; splash/heggie is in a different bank
	ld a, BANK(YehawTilemap)
	ld hl, YehawTilemap
	ld de, wTileMap
	call FarDecompress

	;cute jingle
	ld de, SFX_GET_EGG_FROM_DAY_CARE_MAN
	call PlaySFX
	
	call EnableLCD
	call CopyTilemapAtOnce
	ld c, 180
	call DelayFrames
	ret

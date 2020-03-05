YehawLogo:
	call DisableLCD

	ld a, [wSaveFileExists]
	and a
	jr z, .do_yehaw

	ld a, BANK(sYehawFlagBackup)
	call GetSRAMBank
	ld a, [sYehawFlagBackup]
	call CloseSRAM
	and a
	jr z, .do_yehaw
	call .LoadHeggie
	jr .finish
.do_yehaw
	call .LoadYehaw
.finish

	;cute jingle
	ld de, SFX_GET_EGG_FROM_DAY_CARE_MAN
	call PlaySFX

	call EnableLCD
	call CopyTilemapAtOnce
	ld c, 180
	call DelayFrames
	ret

.LoadYehaw:
	ld hl, YehawSplashLZ
	ld de, vTiles1
	call Decompress
	ld hl, YehawTilemap
	ld de, wTileMap
	call Decompress

	xor a
	ld hl, wAttrMap
	ld bc, wAttrMapEnd - wAttrMap
	call ByteFill

	ld hl, YehawPals
	ld de, wBGPals2
	ld bc, 1 palettes
	ld a, BANK(wGBCPalettes)
	call FarCopyWRAM
	ld a, 1
	ldh [hCGBPalUpdate], a
	ret

.LoadHeggie:
	ld hl, Ourheggie2LZ
	ld de, vTiles1
	call Decompress
	ld a, BANK(vTiles4)
	ldh [rVBK], a
	ld hl, Ourheggie1LZ
	ld de, vTiles4
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, OurheggieTilemap
	ld de, wTileMap
	call Decompress
	ld hl, OurheggieAttrmap
	ld de, wAttrMap
	call Decompress

	ld hl, OurheggiePals
	ld de, wBGPals2
	ld bc, 1 palettes
	ld a, BANK(wGBCPalettes)
	call FarCopyWRAM
	ld a, 1
	ldh [hCGBPalUpdate], a
	ret

SetYehawFlag:
	ld b, 1
	jr _SetYehawFlag

DeleteYehawFlag:
	ld b, 0

_SetYehawFlag:
	ld a, BANK(sYehawFlag)
	call GetSRAMBank
	ld a, b
	ld [sYehawFlag], a
	jp CloseSRAM

BackupYehawFlag:
	ld a, BANK(sYehawFlag)
	call GetSRAMBank
	ld hl, sYehawFlag
	ld a, [hli]
	ld [hl], a
	jp CloseSRAM

RestoreYehawFlag:
	ld a, BANK(sYehawFlag)
	call GetSRAMBank
	ld hl, sYehawFlagBackup
	ld a, [hld]
	ld [hl], a
	jp CloseSRAM

YehawSplashLZ:
INCBIN "gfx/yehaw_splashes/yehaw_splash.2bpp.lz"
YehawTilemap:
INCBIN "gfx/yehaw_splashes/yehaw_splash.tilemap.lz"
YehawPals:
INCBIN "gfx/yehaw_splashes/yehaw_splash.gbcpal"

Ourheggie1LZ:
INCBIN "gfx/yehaw_splashes/ourheggie_p1.2bpp.lz"
Ourheggie2LZ:
INCBIN "gfx/yehaw_splashes/ourheggie_p2.2bpp.lz"
OurheggieTilemap:
INCBIN "gfx/yehaw_splashes/ourheggie.tilemap.lz"
OurheggieAttrmap:
INCBIN "gfx/yehaw_splashes/ourheggie.attrmap.lz"
OurheggiePals:
INCBIN "gfx/yehaw_splashes/ourheggie.gbcpal"

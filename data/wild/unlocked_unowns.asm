unown_set: MACRO
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to wUnlockedUnowns bits
	dw .conkDenis; ENGINE_UNLOCKED_UNOWNS_A_TO_K
.End

.conkDenis: ; denis genis fenis menis benis
	unown_set A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z

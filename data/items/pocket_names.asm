ItemPocketNames:
; entries correspond to item type constants
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	dw .Berry
	dw .Gear

.Item: db "ITEM POCKET@"
.Key:  db "KEY POCKET@"
.Ball: db "BALL POCKET@"
.TM:   db "TM POCKET@"
.Berry: db "BERRY POCKET@"
.Gear: db "GEAR POCKET@"

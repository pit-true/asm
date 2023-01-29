.thumb
.align 2

.equ event_0x800d, 0x02037004

main:
	push {r4, lr}

	ldrh	r0, =0x0001		/*ポケモンコード　フシギダネ*/
	mov	r1, #0x1		/*モード：捕獲フラグ読み込み*/
	mov	r2, #0x0

	ldr	r4, =0x0810586C + 0x1	/*遭遇フラグ捕獲フラグ読み書きの関数*/
	bl	linker

	ldr	r4, =event_0x800d
	strb	r0, [r4]		/*イベント変数800dに捕獲結果を代入*/

end:
	pop {r4, pc}

linker:
bx	r4

.thumb
.align 2

main:
	push {lr}

	mov r2, #0x6	/*手持ち6匹分*/
	mov r3, #0x1	/*今何匹目かのカウンタ*/

	ldr r0, =0x020241E4 + 0x56	/*手持ち1匹目の現在HPのアドレスをr0にロード*/

func_dmgHP:
	ldrh r1, [r0]			/*現在HPをr1に格納*/
	cmp r1, #0x3			/*現在HPと0x3を比較*/
	ble check_count_stop		/*現在HPが0x3以下であれば次の判定へ*/

	sub r1, #0x3			/*r1から0x3引く*/
	strh r1, [r0]			/*r1をr0の中身へ書き込む*/

check_count_stop:
	cmp r2, r3			/*手持ちカウンタが6匹目まで到達したか調べる*/
	beq end				/*一致しているなら終了*/

	add r3, #0x1			/*カウンタ更新*/
	add r0, #0x64			/*手持ちのポケモンデータは100(0x64)byteずつなのでr0(現在HPのアドレス)に足し算すればOK*/
	b func_dmgHP

end:
	pop {pc}

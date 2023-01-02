.thumb
.align 2

main:
	push {lr}

func_dmgHP_1:
	ldr r0, =0x020241E4 + 0x56	/*手持ち1匹目の現在HPのアドレスをr0にロード*/
	ldrh r1, [r0]			/*現在HPアドレスの中身2byteをr1にロード(現在HPがr1に格納される)*/
	cmp r1, #0x3			/*r1と0x3を比較*/
	ble func_dmgHP_2			/*r1が0x3以下であれば次の判定へ*/

	/*ジャンプしていないということは0x4以上であるので、このまま下記に減算処理を書いていく*/

	sub r1, #0x3			/*r1から0x3引く*/
	strh r1, [r0]			/*r1をr0の中身へ書き込む*/

func_dmgHP_2:
	ldr r0, =0x02024248 + 0x56	/*手持ち2匹目の現在HPのアドレスをr0にロード*/
	ldrh r1, [r0]			/*現在HPアドレスの中身2byteをr1にロード(現在HPがr1に格納される)*/
	cmp r1, #0x3			/*r1と0x3を比較*/
	ble end			/*r1が0x3以下であればendへ*/

	sub r1, #0x3			/*r1から0x3引く*/
	strh r1, [r0]			/*r1をr0の中身へ書き込む*/

end:
	pop {pc}

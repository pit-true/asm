.thumb
.align 2

main:
	push {lr}

func_dmgHP_1:
	ldr r0, =0x020241E4 + 0x56	/*�莝��1�C�ڂ̌���HP�̃A�h���X��r0�Ƀ��[�h*/
	ldrh r1, [r0]			/*����HP�A�h���X�̒��g2byte��r1�Ƀ��[�h(����HP��r1�Ɋi�[�����)*/
	cmp r1, #0x3			/*r1��0x3���r*/
	ble checkHP_2			/*r1��0x3�ȉ��ł���Ύ��̔����*/

	/*�W�����v���Ă��Ȃ��Ƃ������Ƃ�0x4�ȏ�ł���̂ŁA���̂܂܉��L�Ɍ��Z�����������Ă���*/

	sub r1, #0x3			/*r1����0x3����*/
	strh r1, [r0]			/*r1��r0�̒��g�֏�������*/

func_dmgHP_2:
	ldr r0, =0x02024248 + 0x56	/*�莝��2�C�ڂ̌���HP�̃A�h���X��r0�Ƀ��[�h*/
	ldrh r1, [r0]			/*����HP�A�h���X�̒��g2byte��r1�Ƀ��[�h(����HP��r1�Ɋi�[�����)*/
	cmp r1, #0x3			/*r1��0x3���r*/
	ble end			/*r1��0x3�ȉ��ł����end��*/

	sub r1, #0x3			/*r1����0x3����*/
	strh r1, [r0]			/*r1��r0�̒��g�֏�������*/

end:
	pop {pc}

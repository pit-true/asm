.thumb
.align 2

main:
	push {lr}

	mov r2, #0x6	/*�莝��6�C��*/
	mov r3, #0x1	/*�����C�ڂ��̃J�E���^*/

	ldr r0, =0x020241E4 + 0x56	/*�莝��1�C�ڂ̌���HP�̃A�h���X��r0�Ƀ��[�h*/

func_dmgHP:
	ldrh r1, [r0]			/*����HP��r1�Ɋi�[*/
	cmp r1, #0x3			/*����HP��0x3���r*/
	ble check_count_stop		/*����HP��0x3�ȉ��ł���Ύ��̔����*/

	sub r1, #0x3			/*r1����0x3����*/
	strh r1, [r0]			/*r1��r0�̒��g�֏�������*/

check_count_stop:
	cmp r2, r3			/*�莝���J�E���^��6�C�ڂ܂œ��B���������ׂ�*/
	beq end				/*��v���Ă���Ȃ�I��*/

	add r3, #0x1			/*�J�E���^�X�V*/
	add r0, #0x64			/*�莝���̃|�P�����f�[�^��100(0x64)byte���Ȃ̂�r0(����HP�̃A�h���X)�ɑ����Z�����OK*/
	b func_dmgHP

end:
	pop {pc}

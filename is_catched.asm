.thumb
.align 2

.equ event_0x800d, 0x02037004

main:
	push {r4, lr}

	ldrh	r0, =0x0001		/*�|�P�����R�[�h�@�t�V�M�_�l*/
	mov	r1, #0x1		/*���[�h�F�ߊl�t���O�ǂݍ���*/
	mov	r2, #0x0

	ldr	r4, =0x0810586C + 0x1	/*�����t���O�ߊl�t���O�ǂݏ����̊֐�*/
	bl	linker

	ldr	r4, =event_0x800d
	strb	r0, [r4]		/*�C�x���g�ϐ�800d�ɕߊl���ʂ���*/

end:
	pop {r4, pc}

linker:
bx	r4

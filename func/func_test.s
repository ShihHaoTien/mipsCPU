
func_test.elf:     file format elf32-tradlittlemips
func_test.elf


Disassembly of section .text:

00000000 <__start>:
   0:	8c080000 	lw	t0,0(zero)
   4:	00084880 	sll	t1,t0,0x2
   8:	212a0003 	addi	t2,t1,3
   c:	00000000 	nop
  10:	ac0a000c 	sw	t2,12(zero)
  14:	340a0000 	li	t2,0x0
  18:	00004824 	and	t1,zero,zero
  1c:	3c080000 	lui	t0,0x0
	...
  28:	08000000 	j	0 <__start>
  2c:	00000000 	nop

Disassembly of section .reginfo:

00000030 <.reginfo>:
  30:	00000700 	sll	zero,zero,0x1c
	...

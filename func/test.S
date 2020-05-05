.global __start
.set noreorder
.text
.org 0x0
__start:
   lw   $t0, 0x0($zero)
   sll  $t1, $t0, 2         # load hazard
   addi $t2, $t1, 3         # id-ex hazard
   nop
   sw   $t2, 0xC($zero)     # id-men hazard
   ori  $t2, $zero, 0
   and  $t1, $zero, $zero 
   lui  $t0, 0x0
   nop
   nop
   j    __start
   nop
   
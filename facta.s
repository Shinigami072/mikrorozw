.text
	.type facta, @function
	.globl facta

facta:	mov $1, %rax

next:	cmp $1, %rdi
	jbe f_e
	mul %rdi
	dec %rdi
	jmp next

f_e:	ret


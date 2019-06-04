.equ write_64, 1
.equ exit_64,60
.equ stdout,1


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


    .type binary_op, @function
    .globl binary_op
 binary_op:
    mov $0,%rax
    mov $0,%rbx
    mov $0,%r8
a:
    mov (%rdx,%r8),%al
    cmp $0,%al
    je retur
    mov (%rsi,%r8),%bl
    sub $'0',%al
    sub $'0',%bl

    cmp $1,%rcx
    je ar1
    cmp $2,%rcx
    je ar2

    ar0:

    and %bl,%al

    jmp end
    ar1:
    or %bl,%al
    jmp end

    ar2:
    xor %bl,%al
    jmp end


end:
    add $'0',%al
    mov %al,(%rdi,%r8)
    inc %r8
    jmp a

  retur:  mov %rdi, %rax
    ret

                    #%rdi       Rsi   rdx     rcx      r8
#long int sum_ascii(char* str,int a,int b,int charset,int*count);
    .type sum_ascii, @function
    .globl sum_ascii
sum_ascii:
    mov $0,%rbx
    mov $0,%rax
    mov $0,%r9
loop:
    cmp %rsi,%rdx
    jb endl
    mov (%rdi,%rsi),%al
    cmp $0,%al
    je endl

    inc %r9
    add %rax,%rbx
    inc %rsi
    jmp loop

endl:
    mov %r9,(%r8)
    mov %rbx,%rax
    ret

#%rdi       Rsi   rdx     rcx      r8
#char *encode(char *str, int charset, int case );
  .type encode, @function
    .globl encode
encode:
    mov %rdi,%rax
    inc %rdx
    cmp $0,%rdx
    je c1
    cmp $1,%rdx
    je c2
    jmp c3

c1:mov $1,%rax
ret

c2:mov $2,%rax
ret
c3:mov $3,%rax
ret

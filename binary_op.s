#%r9 strin
#%r9 strlen-out
.type strlen, @function
strlen:
   #przygotuj rejesrry
  push %rcx
  push %rax
  mov $0,%rcx
  mov $0,%rax

  #licz długość stringa
  str_count:
    mov (%r9,%rcx),%al #pobierz char
    cmp $0,%al #sprawdz czy null
    je str_count_end
    inc %rcx #zwiększ licznik
    jmp str_count

  str_count_end:
  mov %rcx,%r9 #save count
  #reset registers
  pop %rax
  pop %rcx
  ret
                #%rdi       Rsi   rdx     rcx      r8
#char *binary_op(char* res, char arg1[7], char arg2[7], int oper);
# 0 = add
# 1=  and
# 2 = or
# 3 = xor
 .type binary_op, @function
    .globl binary_op
 binary_op:

    #%r8 #zapisywany index

    #count stlen
    #r10 - %rsi len
    mov %rsi,%r9
    call  strlen
    mov %r9,%r10
    #r9 - %rxd len
    mov %rdx,%r9
    call strlen


    #get larger index into r8
    cmp %r9,%r10
    jb below
    mov %r10,%r8
    jmp clear
below: mov %r9,%r8

clear: movb $0,(%rdi,%r8)
 #czyszzenie rjeestrów
    mov $0,%rax #obecny znak1
    mov $0,%rbx #obecny znak2
    mov $0,%r15 #carry out

loop:
     char1:
    dec %r9 # w tajemniczych okolicznościach cmp i jb nie chciały mi działać
    js zero1
        mov (%rdx,%r9),%al#pobranie znaku 1
        sub $'0',%al
        jmp char2
    zero1:
        mov $0,%al
        jmp char2

    char2:
    dec %r10
    js zero2
        mov (%rsi,%r10),%bl#pobranie znaku 1
        sub $'0',%bl
        jmp op
    zero2:mov $0,%bl
        jmp op


    #wybranie operacji
    op:
    cmp $1,%rcx
    je ar1
    cmp $2,%rcx
    je ar2
    cmp $3,%rcx
    je ar3

    #ADD

    add %bl,%al
    add %r15b,%al #adding a+b + carry
    cmp $1,%al # if a>1
    jg carry

    mov $0,%r15b #reset carry
    jmp nextchar

    carry:
    sub $2,%al #subtract carry
    mov $1,%r15b #set carry
    jmp nextchar

    ar3:#XOR
    xor %bl,%al
    jmp nextchar

    ar1:#AND
    and %bl,%al
    jmp nextchar

    ar2:#OR
    or %bl,%al
    jmp nextchar




nextchar:
    add $'0',%al
    dec %r8
    mov %al,(%rdi,%r8)#zapisanie znaku na wyjściu
    cmp $0,%r8#sprawdzenie czy to ostatni znak
    jz retur

    jmp loop

  retur:  mov %rdi, %rax
    ret
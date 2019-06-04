                  #%rdi       Rsi   rdx     rcx      r8
#long int sum_ascii(char* str,int a,int b,int charset,int*count);
    .type sum_ascii, @function
    .globl sum_ascii
sum_ascii:
    mov $0,%rbx #czyszczenie rejestrów
    mov $0,%rax
    mov $0,%r9
loop:
    cmp %rsi,%rdx #sprawdzenie czy a<b
    jb endl
    mov (%rdi,%rsi),%al#wczytanie znaku
    cmp $0,%al#sprawdzenie czy to koniec stringa
    je endl

#wybór charsetu
    cmp $0,%rcx
    je charset0
    cmp $1,%rcx
    je charset1
    cmp $2,%rcx
    je charset2
    cmp $3,%rcx
    je charset3
    cmp $4,%rcx
    je charset4

charset1:#numbers_only
    cmp $'0',%al
    jl loop_e
    cmp $'9',%al
    jg loop_e
    jmp charset0

charset2:#lower_case
    cmp $'a',%al
    jl loop_e
    cmp $'z',%al
    jg loop_e
    jmp charset0

charset3:#upper_case
    cmp $'A',%al
    jl loop_e
    cmp $'Z',%al
    jg loop_e
    jmp charset0

charset4:#upper+lower_case
     cmp $'a',%al
     jl charset3
     cmp $'z',%al
     jg loop_e
     jmp charset0

charset0:#any

    inc %r9
    add %rax,%rbx
loop_e:  inc %rsi
    jmp loop

endl:
    mov %r9,(%r8) #wpisanie wyniku do *count
    mov %rbx,%rax #przepisanie wyniku do rax
    ret
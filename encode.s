#%rdi       Rsi   rdx     rcx      r8
#char *encode(char *str, int charset, int case );
#---------------------------------------------------------------
# funkcja szyfruje tekst zamieniając znaki w łańcuchu będącym parametrem#
# Parametry:
#    str     - łańcuch wejściowy/wynikowy
#    charset - zbiór znaków do zamiany
#               0 = tylko litery ('A'->'Z',...,'Z'->'A','a'->'z',...'z'->'a')
#               1 = tylko cyfry ('0'->'9',...','9'->'0')
#               2 = litery i cyfry
#    case    - flaga decydująca o zamianie wielkości liter
#               0 = brak zamiany (pozostaje oryginalna wielkość litery)
#               1 = małe litery są zamieniane na wielkie
#               2 = wielkie litery są zamieniane na małe

  .type encode, @function
  .globl encode
encode:
    mov $0,%r9
loop:
    #pobierz znak
    mov (%rdi,%r9),%al
    cmp $0,%al
    je end

    #do jakiego zakresu należy
    cmp $'0',%al
    jl do_nothing
    cmp $'9',%al
    jle do_numbers
    cmp $'A',%al
    jl do_nothing
    cmp $'Z',%al
    jle do_upper_case
    cmp $'a',%al
    jl do_nothing
    cmp $'z',%al
    jle do_lower_case
    jmp do_nothing

do_upper_case:#sprawdzczy trzeba zmienić
    cmp $0,%rsi
    je do_nothing
do_U:#dokonaj zamiany
    sub $'A',%al
    neg %al
    cmp $2,%rdx
    je to_L
to_U: add $'Z',%al
    mov %al,(%rdi,%r9)
    jmp do_nothing

    #analogicznie
do_lower_case:
    cmp $0,%rsi
    je do_nothing
do_L:
    sub $'a',%al
    neg %al
    cmp $1,%rdx
    je to_U
to_L:add $'z',%al
    mov %al,(%rdi,%r9)
    jmp do_nothing

    #analogicznie
do_numbers:
    cmp $1,%rsi
    je do_nothing
do_N:
    sub $'0',%al
    neg %al
    add $'9',%al
    mov %al,(%rdi,%r9)
    jmp do_nothing

do_nothing:
    inc %r9
    jmp loop

end:
    mov %rdi,%rax
    ret

#wybór charsetu

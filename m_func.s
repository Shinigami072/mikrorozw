.data
string:
.ascii "TestThisShit\0"
.text
.type m_func @function
.globl m_func
m_func:
    lea string(%rip), %rdi
    mov $0, %rax
    call *printf@GOTPCREL(%rip)

    ret

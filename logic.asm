

;;extern process_results

; section .text

; do_highload:
;     mov eax,[esp+4];int x
;     mov edi, [esp+8];callback cb

;     ;do the staff
;     mov ebx, eax
;     mul ebx

;     ;pass result to callback
;     push eax
;     call edi
;     add esp, 4;ЧТОБЫ ВЫРОВНЯТЬ СТЕК

;     cmp eax, 0
;     je .ret
;         mov eax, 1

; .ret:
;     ret


section .text
global _lab
_lab:

    xor ecx, ecx
    mov cl, [esp+8]
    cmp cl, 0
    jne next1
    mov eax, 1
    jmp exit
    next1:
    cmp cl, 1
    jne next2
    mov eax,[esp+4]
    jmp exit
    next2:
    dec cx
    mov bx, 0
    xor eax, eax
    mov al, [esp + 4]

    mov dx,ax
    mov di, 0
    addiction:
        add bx, ax
        jo error
        inc di
        cmp dx, di
        jne addiction
        mov ax, bx
        mov bx, 0
        mov di, 0
    loop addiction
    exit:
        mov edi, [esp + 12]
        push eax
        call edi    ;вызывает функцию process_result
        add esp, 4 ; выравниваем стек
        mov eax, 0
        cmp eax, 0 
        je _ex
        mov eax, 1

    _ex:
        mov eax, 1
        int 0x80

    ;esp - stack pointer -> 
    ; printres:
    ;    mov eax, 4
    ;     mov ebx, 1
    ;     mov ecx, msgprint
    ;     mov edx, lenprint
    ;     int 0x80
         
    ;     xor edx, edx
    ;     xor eax, eax
    ;     mov bx, 10
    ;     mov edi, 0
    ;     mov ax,[res]
    ;     division:
    ;         cmp ax, 10
    ;         jl prt
    ;         div bx
    ;         push dx
    ;         xor dx, dx
    ;         inc edi
    ;         jmp division
    ;         prt:
    ;         div bx
    ;         push dx
    ;         inc edi
    ;         print:
    ;             xor ecx,ecx
    ;             pop cx
    ;             mov [rank], cx
    ;             add byte[rank],'0'
               
    ;             mov eax, 4
    ;             mov ebx, 1
    ;             mov ecx, rank
    ;             mov edx, 1
    ;             int 0x80

    ;             dec edi
    ;             cmp edi, 0
    ;             jne print

    ;         jmp exit

    ; printk1:
    ;     mov eax, 4
    ;     mov ebx, 1
    ;     mov ecx, msgprint
    ;     mov edx, lenprint
    ;     int 0x80

    ;     mov eax, 4
    ;     mov ebx, 1
    ;     mov ecx, a
    ;     mov edx, len
    ;     int 0x80
    ;     jmp exit
        
    ; printk0:
    ;     mov eax, 4
    ;     mov ebx, 1
    ;     mov ecx, msgprint
    ;     mov edx, lenprint
    ;     int 0x80

    ;     mov edi,'1'
    ;     mov [zero],edi
    ;     mov eax, 4
    ;     mov ebx, 1
    ;     mov ecx, zero
    ;     mov edx, len
    ;     int 0x80
    ;     jmp exit

error:
    mov edi, [esp + 16]
    call edi ; вызывает функцию error (произошло переполнение)
    add esp, 4 ; выравниваем стек
    mov eax, 1
    int 0x80
    





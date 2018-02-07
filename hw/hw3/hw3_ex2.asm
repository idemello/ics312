%include "asm_io.inc"

segment .data	

        msg1    db  "Enter a string with 3 lower case letters: ",0
        msg2    db  "Enter a string wtih 4 characters: ", 0
        msg3    db  "Output: aXXaXXaXXa", 0

segment .bss
        var1     resw    1   ; i have no idea

segment .text
	global asm_main
asm_main:
	enter	0,0             ; setup
	pusha	                ; setup

        mov     eax, msg1       ; move the first message into eax
        call    print_string    ; print the first message
        call    read_char       ; read the character into eax
        mov     [var1], eax     ; save that character into var1 
        mov     ebx, msg3       ; save the address of message3 into edx
        add     ebx, 9          ; move to the 10th byte
        mov     dl, [var1]      ; save the variable to dl
        sub     dl, 32          ; capatalize s1[0]
        mov     [ebx], dl       ; put the s1[0] in 10th byte
        inc     ebx             ; move to the 11th byte
        mov     [ebx], dl       ; put s1[0] in 11th byte

        call    read_char       ; read a char
        mov     [var1], eax     ; save it
        add     ebx, 2          ; move up by 2
        mov     dl, [var1]      ; move the char into dl
        sub     dl, 32          ; make it a capital
        mov     [ebx], dl       ; put the letter into ebx
        inc     ebx             ; move the pointer of ebx up by one
        mov     [ebx], dl       ; move the letter into ebx
 
        call    read_char       ; same as above
        mov     [var1], eax
        add     ebx, 2
        mov     dl, [var1]
        sub     dl, 32
        mov     [ebx], dl
        inc     ebx
        mov     [ebx], dl 
        
        call    read_char       ; dump the CR (catridge return)
        
        mov     eax, msg2       ; move message to registrar
        call    print_string    ; print message
        call    read_char       ; read user input
        mov     [var1], eax     ; save input to var1
        inc     ebx             ; move pointer up by one

        mov     dl, [var1]      ; move variable to dl
        mov     [ebx], dl       ; move the variable in dl to content of bx
 
        call    read_char       ; get input
        mov     [var1], eax     ; 
        sub     ebx, 3
        mov     dl, [var1]
        mov     [ebx], dl

        call    read_char       ; read a character
        mov     [var1], eax     ;
        sub     ebx, 3
        mov     dl, [var1]
        mov     [ebx], dl

        call    read_char       ; read a character
        mov     [var1], eax     ;
        sub     ebx, 3
        mov     dl, [var1]
        mov     [ebx], dl



        mov     eax, msg3
        call    print_string
        call    print_nl        
        
        popa                    ; clean up
	mov	eax, 0          ; clean up
	leave                   ; clean up
	ret                     ; clean up


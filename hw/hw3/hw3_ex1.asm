%include "asm_io.inc"

segment .data	
	prompt		db    "Enter an integer: ",0
        response1       db    "ASCII code ",0
        response2       db    " corresponds to character 'x'",0
    
segment .bss
        num     resw    1      ; integer user gives

segment .text
	global asm_main
asm_main:
	enter	0,0             ; setup
	pusha	                ; setup

        mov     eax, prompt     ; move user prompt to eax
        call    print_string    ; print prompt
        call    read_int        ; get the user input
        mov     [num] , eax     ; save the int into memory
        mov     eax, response1  ; move the response to be printed
        call    print_string    ; print the response
        mov     eax, [num]      ; put the number in the buffer
        call    print_int       ; print the number

        mov     ebx, response2  ; save the address of response2 into ebx
        add     ebx, 27         ; point to the 27th byte of response 
        mov     dl, [num]       ; save the number into dl
        mov     [ebx], dl       ; move the number from dl into the 
                                ; contents of ebx
        mov     eax, response2  ; move the full response into the buffer
        call    print_string    ; print it
        call    print_nl        ; new line for formatting
        
        popa                    ; cleanup
	mov	eax, 0          ; cleanup
	leave                   ; cleanup
	ret                     ; cleanup


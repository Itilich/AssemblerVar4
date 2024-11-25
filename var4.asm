org 7C00h

jmp start

name: db 'Egorov AA NMT-323901',0

start:

mov ah, 00h
mov al, 13h
int 10h

mov si, name
mov dl, 14
mov dh, 10
loop1:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next1
mov bl, 1
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop1
next1:

mov si, coordinates
loop3:

mov ah, 0ch
mov bh, 0
mov cx, [cs:si]
cmp cx, 0
je next3
add cx, 1
add si, 2
mov dx, [cs:si]
add dx, 80
mov al, 1
int 10h
add si, 2
jmp loop3
next3:


jmp exit

coordinates:
dw 6, 1
dw 5, 2
dw 7, 2
dw 5, 3
dw 7, 3
dw 4, 4
dw 8, 4
dw 4, 5
dw 8, 5
dw 3, 6
dw 9, 6
dw 3, 7
dw 9, 7
dw 2, 8
dw 10, 8
dw 1, 9
dw 10, 9

dw 1, 10
dw 2, 10
dw 3, 10
dw 4, 10
dw 5, 10
dw 6, 10
dw 7, 10
dw 8, 10
dw 9, 10
dw 10, 10
dw 11, 10

dw 0

exit:

db 510-($-$$) dup 0
dw 0AA55h
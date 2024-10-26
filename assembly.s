; Aida Tadlaoui 

; specify equivalent symbols
.equ SREG,  0x3f    
.equ DDRD,  0x0A    
.equ PORTD, 0x0B   
.equ DDRB,  0x04    
.equ PORTB, 0x05  

.org 0  ; .org specifies the start address                  
        
          ; reset system status
main:     ldi r16, 0      ; set register r16 to zero
          out SREG,r16    ; copy register 16 to SREG, essentially set SREG to zero

          ; set lower 4 bits of port B bits to output mode 
          ldi r16, 0x0F   ; set r16 to 0x0F
          out DDRB,r16    ; copy the value to DDRB
          
          ; set upper 4 bits of port D bits to output mode
          ldi r16, 0xF0   ; set r16 to 0xF0
          out DDRD,r16    ; copy the value to DDRB
          
 	  ldi r21, 0x00    ; set r21 to 0 for the 50 loops
	  ldi r22, 0x00    ; set r22 to 0 for the checkmodulo part
          ldi r26, 0x33   ; set r26 to 51 to compare for the 50 loops

mainloop: ; each part of the coursework is in a different loop
	  
loop1:	  ; display numbers 
          ; this will produce a 0x02 value on the LEDs
          ldi r20, 0x02   
          out PORTB, r20  
          out PORTD, r20

          call sec        ; delay 1 second

          ; this will produce a 0x03 value on the LEDs
          ldi r20, 0x03
          out PORTB, r20
          out PORTD, r20

          call sec        ; delay 1 second
          
          ; this will produce a 0x00 value on the LEDs
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20

          call sec        ; delay 1 second
          
          ; this will produce a 0x09 value on the LEDs
          ldi r20, 0x09
          out PORTB, r20
          out PORTD, r20

          call sec        ; delay 1 second
          
          ; this will produce a 0x00 value on the LEDs
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20

          call sec        ; delay 1 second
         
          ; this will produce a 0x01 value on the LEDs
          ldi r20, 0x01
          out PORTB, r20
          out PORTD, r20

          call sec        ; delay 1 second
          
          ; this will produce a 0x03 value on the LEDs
          ldi r20, 0x03
          out PORTB, r20
          out PORTD, r20

          call sec        ; delay 1 second
          
          ; this will produce a 0x00 value on the LEDs
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec        ; delay 1 second
          
loop2:    ; display my initials AT
          ; this will produce a 0x01 value on the LEDs
          ldi r20, 0x01    
          out PORTB, r20
          out PORTD, r20
          
          call sec        ; delay 1 second
          
          ; this will produce a 0x1B value on the LEDs
          ldi r20, 0x1B
          out PORTB, r20
          out PORTD, r20
          
          call sec        ; delay 1 second
          
          ; this will produce a 0x14 value on the LEDs
          ldi r20, 0x14
          out PORTB, r20
          out PORTD, r20
          
          call sec        ; delay 1 second

loop3:   ; display the first 3 letters of my first name in morse code
         inc r21           ; increase r21   
         inc r22           ; increase r22 for the modulo part
         cp r21, r26       ; compare r21 with r26 to check the 50 loops
         breq stoploop3    ; if it is equal jump to pingpong address
         brne checkoddeven ; if it is not equal jump to checkoddeven address
         
stoploop3:     rjmp pingpong 

checkoddeven:  ; check if the iteration is an even or odd number 
               ; in binary it is the 0th bit that determines whether the number is even or odd
               sbrs r21, 0x00   ; skip the next instruction if bit 0 of r21 is 1
               rjmp even        ; jump to even address if bit 0 of r21 is 0
               rjmp odd         ; jump to odd address 
                  
odd:      ; display the first 3 letters of my first name in morse code in their normal order AID
          ; display the letter A in morse code
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20 
          
          call sec6       ; delay 600 milliseconds

          ; display the letter I in morse code
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ; display the letter D in morse code
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds

          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call checkmodulo ; call the modulo function 
          
even:     ; display the first 3 letters of my first name in morse code in reverse order DIA
          ; display the letter D in morse code
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds

          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ; display the letter I in morse code
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds

          ; display the letter A in morse code
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call sec2       ; delay 200 milliseconds
          
          ldi r20, 0xFF    
          out PORTB, r20
          out PORTD, r20
          
          call sec6       ; delay 600 milliseconds
          
          ldi r20, 0x00
          out PORTB, r20
          out PORTD, r20
          
          call checkmodulo ; call the modulo function

checkmodulo:   ; check the iterations that are less than 5
               ; iterations that are divisible by 5
               
               ldi r25, 0x05
               ldi r27, 0x00
               ldi r28, 0x01
               ldi r29, 0x02
               ldi r30, 0x03
               ldi r31, 0x04
               
               cp r22, r25      ; compare r22 with 5
               breq modulo      ; branch if it is equal
              
               cp r22, r27      ; compare r22 with 0
               breq modulo      ; branch if it is equal

               ; iterations that are not divisible by 5
               cp r22, r28      ; compare r22 with 1
               breq stopmodulo  ; branch if it is equal

               cp r22, r29      ; compare r22 with 2
               breq stopmodulo  ; branch if it is equal

               cp r22, r30      ; compare r22 with 3
               breq stopmodulo  ; branch if it is equal

               cp r22, r31      ; compare r22 with 4
               breq stopmodulo  ; branch if it is equal
               
               ; iterations that are still greater than 5
               rjmp chekmodulo2  ; jump to checkmodulo2 address
              
; for this subroutine I used generative AI to subtract 5 from r22 without impacting subsequent iterations 
chekmodulo2:   ; subtract 5 for the iterations that are greater than 5  
               mov r23,r22       ; copy r22 to r23
               sub r23, 0x05     ; subtract 5 from r23
               mov r22,r23       ; copy r23 to r22
               rjmp checkmodulo  ; jump back to checkmodulo address

modulo:        ; display 5 in binary after iterations that are divisible by 5
               call sec2       ; delay 200 milliseconds
               
               ldi r20, 0x05    
               out PORTB, r20
               out PORTD, r20
               
               call sec          ; delay 1 second
               
               ldi r20, 0x00   
               out PORTB, r20
               out PORTD, r20
               
               rjmp stopmodulo   ; jump to endmodulo address

stopmodulo:    ; after checking if the iterations are divisible by 5 or not jump back to loop3
               mov r23, r22      ; copy r22 to r23
               call sec14        ; delay 1400 milliseconds
               rjmp loop3        ; jump back to loop3 address
               
pingpong:   ; initialise r24 to start the pingpong loop
            ldi r24, 0b00001000
            out PORTB, r24
            out PORTD, r24
            call sec1            ; delay 80 milliseconds 
            rjmp moveright       ; jump to move right address
            
moveright:  lsr r24              ; shift the binary value in register r24 one position to the right
            out PORTB, r24
            out PORTD, r24
            call sec1           ; delay 80 milliseconds
            sbrs r24, 0x00       ; skip the next instruction if bit 0 of r24 is 1
            rjmp moveright       ; jump to move right address if bit 0 of r24 is 0
            rjmp moveleft        ; jump to move left address
            
moveleft:   lsl r24              ; shift the binary value in register r31 one position to the left
            out PORTB, r24
            out PORTD, r24
            call sec1            ; delay 80 milliseconds
            sbrs r24, 0x03       ; skip the next instruction if bit 3 of r24 is 1
            rjmp moveleft        ; jump back to move left address if bit 3 of r24 is 0
            rjmp moveright       ; jump back to move right address

; sec delay subroutine - delays for 1000 ms (1 second)
sec:  ldi r19, 100 ; 100*10ms = 1000 ms
      call delay
      ret

; sec1 delay subroutine - delays for 100 ms (0.1 seconds)
sec1:  ldi r19, 10 ; 10*10ms = 100 ms
       call delay
       ret

; sec2 delay subroutine - delays for 200 ms (0.2 seconds)
sec2: ldi r19, 20 ; 20*10ms = 200ms
      call delay
      ret

; sec6 delay subroutine - delays for 600 ms (0.6 seconds)
sec6: ldi r19, 60 ; 60*10ms = 600ms
      call delay
      ret

; sec14 delay subroutine - delays for 1400 ms (1.4 seconds)
sec14: ldi r19, 140 ; 140*10ms = 1400ms
       call delay
       ret

; code from the external source shift_bits.s in the CS1's Keats page
; delay subroutine - delays for r19 at 10 milliseconds steps
;                  - load r19 with number of 10 ms intervals
delay:    ldi r17, 255 ; 255
          ldi r18, 126 ; initialise loop for 1 ms
          ; inner loop is 5 cycles so 1 outer loop iteration is - 
          ; 5 cycles * r17 * r18 = 
          ; 5 cycles * 255 *  126 = 160650 cycles
          ; 160650 cycles / 16,000,000 = 0.010040625 seconds (~10 ms) 
        
loop0:    nop        ; 1 cycle
          dec r17    ; 1 cycle
          cpi r17, 0 ; 1 cycle
          brne loop0 ; 2 cycles
          ldi r17, 255 ; reset inner loop
          dec r18
          cpi r18, 0
          brne loop0
          ldi r18, 126 ; reset first outer loop
          dec r19
          cpi r19, 0
          brne loop0
          ret
          

.global start
.global darkF

.equ DARKsensor_PIN, 3
.equ LED_PIN, 4

.equ DDRD, 0x0A   ; Data Direction Register for Port D
.equ PORTD, 0x0B  ; Port D Data Register
.equ PIND, 0x09   ; Port D Input Pins Address

start:

    sbi PORTD, DARKsensor_PIN   ; Set DARKsensor_PIN as an input 
    sbi DDRD, LED_PIN    ; Set LED_PIN as output
darkF:    
    sbis PIND, DARKsensor_PIN   ; Skip next instruction if darksensor_pin is high
    rjmp DARKsensor_PIN_low_df  ; Jump if darksensor_pin is low
    sbi PORTD, LED_PIN   ; Set pin LED_PIN high
    ret 

DARKsensor_PIN_low_df:
    cbi PORTD, LED_PIN   ; Set pin LED_PIN low
    ret

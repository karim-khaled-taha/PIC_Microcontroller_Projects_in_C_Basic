char i;

void main() {
    TRISC = 0B00000000;  // Set all pins on PORTC as outputs
    LATC = 0B00000001;  // Initialize PORTC to 0b00000001

    while (1) {

        while (i < 8) {
            LATC = 1 << i; // shift 1
            delay_ms(1000);
            i++;
        }

        // Reset the loop
        i = 0;
        LATC = 0B00000001;
    }
}
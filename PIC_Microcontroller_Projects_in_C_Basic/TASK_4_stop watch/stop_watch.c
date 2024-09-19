void main() {
    char state = 0;           // Variable to keep track of the stopwatch state (start/stop/reset)
    char mask;                // Not used in the code, can be removed if not needed
    char sec2;                // Variable to store the second's unit place (0-9)
    char sec1 = 0;            // Variable to store the second's tens place (0-5)
    char min = 0;             // Variable to store the minute's unit place (0-9)

    // Arrays holding the 7-segment display codes for numbers 0-9
    char seg_sec2[11] = {63, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111};  // 0, 1, 2, ..., 9
    char seg_sec1[] = {63, 6, 91, 79, 102, 109, 63};                      // 0, 1, 2, ..., 5
    char seg_min[10] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};       // 0, 1, 2, ..., 9

    // Setting the data direction registers (TRIS) for ports B, C, D, and A
    trisd = 0;           // Port D as output
    trisb = 0;           // Port B as output
    trisc = 0;           // Port C as output
    TRISc.RC7 = 1;       // RC7 as input (for pause button)
    TRISB.RB7 = 1;       // RB7 as input (for start button)
    TRISD.RD7 = 1;       // RD7 as input (for reset button)
    trisa.RA0 = 0;       // RA0 as output (possibly unused in this code)

    while (1) {
        // Check if the stopwatch is in reset state and reset button is pressed
        if (state && PORTD.RD7) {
            sec1 = 0;    // Reset seconds tens place to 0
            sec2 = 0;    // Reset seconds unit place to 0
            min = 0;     // Reset minutes to 0
            LATB = seg_sec1[sec1];  // Display 0 on seconds tens place
            LATC = seg_sec2[sec2];  // Display 0 on seconds unit place
            LATD = seg_min[min];    // Display 0 on minutes place
        }

        // Check if the start button is pressed
        if (PORTB.RB7 == 1) {
            // Loop to increment seconds and minutes
            while (sec2 <= 10) {
                sec2++;  // Increment the seconds unit place
                LATD = seg_sec2[sec2];  // Update the display for seconds unit place
                delay_ms(200);  // Delay for 200 milliseconds

                // If seconds unit place reaches 10, reset to 0 and increment tens place
                if (sec2 == 10) {
                    sec2 = 0;  // Reset seconds unit place to 0
                    sec1++;    // Increment seconds tens place
                    LATB = seg_sec1[sec1];  // Update the display for seconds tens place
                }

                // If seconds tens place reaches 6 (i.e., 60 seconds), reset and increment minutes
                if (sec1 == 6 && sec2 == 0) {
                    sec1 = 0;  // Reset seconds tens place to 0
                    min++;     // Increment minutes
                    LATC = seg_min[min];  // Update the display for minutes
                }

                // If minutes reach 10, reset to 0
                if (min == 10) {
                    min = 0;  // Reset minutes to 0
                }

                // Check if the pause button is pressed
                if (PORTC.RC7 == 1) {
                    state = 1;  // Set state to paused
                    break;      // Exit the loop
                }
            }
        }

        // Update the display with the current time values
        LATB = seg_sec1[sec1];
        LATD = seg_sec2[sec2];
        LATC = seg_min[min];
    }
}

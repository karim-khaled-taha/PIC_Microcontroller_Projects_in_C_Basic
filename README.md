# Microcontroller Projects - Course Completion

## Course Overview

This repository showcases the projects completed during the Microcontroller course as part of my college curriculum. The course focused on understanding the fundamentals of microcontrollers, programming, and interfacing with peripheral devices. Throughout the course, we explored a variety of hands-on projects to apply key concepts such as control logic, input/output handling, and timing.

## Projects

### 1. **LED Loop**
In this project, we implemented a simple LED loop using a PIC microcontroller. The project involved turning on each LED one after another in a continuous loop. The program shifts a binary `1` across a set of LEDs connected to the output pins of the microcontroller, giving a visual effect of moving light. The delay between each shift was set to 1 second, and the loop would reset after completing a full cycle.

- [Project Code](PIC_Microcontroller_Projects_in_C_Basic/TASK_1_LED) | [Demo Video](https://github.com/user-attachments/assets/f842702c-94a9-4db1-b448-cf40fb70a462)

### 2. **Random Number Generator with Push Button**
This project focused on generating a random number using a microcontroller. A push button was used as input to trigger the random number generation. The random number was displayed on LEDs in binary form. The use of timers and pseudorandom number generation techniques was explored.

- [Project Code](PIC_Microcontroller_Projects_in_C_Basic/TASK_2_Random_nubmer) | [Demo Video](https://github.com/user-attachments/assets/10c6450b-b267-4594-9c1b-ac8d35ee9e5f)

### 3. **LED Sequence Checker with Buzzer**
In this project, we built a system that checks a predefined LED sequence. The system turns on LEDs in a specific order, and if the sequence is completed successfully, a buzzer sound is triggered.

- [Project Code](PIC_Microcontroller_Projects_in_C_Basic/TASK_3_check_list_for_led_push_buttom) | [Demo Video](https://github.com/user-attachments/assets/53ce9a76-c85a-45fe-be1c-e55730a5345d)

### 4. **Stopwatch Using 7-Segment Display (Multiplexing)**
This project involved creating a stopwatch using multiple 3 7-segment displays controlled by the microcontroller. We used multiplexing to manage the display of digits on the 7-segment display and implemented timing logic to start, stop, and reset the stopwatch. Push buttons were used to control the stopwatch functions.

- [Project Code](PIC_Microcontroller_Projects_in_C_Basic/TASK_4_stop_watch_MUX) | [Demo Video](https://github.com/user-attachments/assets/52859488-8030-457f-b97f-72540ea0003d)

### 5. **Final Project**

### Overview
This project integrates multiple components and functionalities to create a versatile system with different modes of operation. It utilizes various hardware components and programming techniques to achieve its objectives, such as mode switching, password protection, calculations, light monitoring, and more.

## Project Objectives
- **Mode Switching**: Operates in multiple modes, including:
  - Calculator Mode
  - Server Alarm Mode
  - LDR (Light Dependent Resistor) Mode
- **Password Protection**: A secure system with password protection and validation.
- **Real-time Calculations**: A basic calculator functionality.
- **LDR Monitoring**: Monitors light levels using an LDR sensor.
- **System Lock**: Lock mechanism after incorrect password attempts.

## Hardware Components
- **Microcontroller**: Controls inputs and outputs.
- **LCD Display**: For displaying data and feedback.
- **Keypad**: Used for entering passwords and numbers in calculator mode.
- **UART Module**: For communication with external devices.
- **LDR (Light Dependent Resistor)**: Measures light intensity.
- **7-Segment Displays**: Displays numerical values.
- **LEDs and Buzzer**: Indicate system status and alarms.

## System Modes
### Mode 1: Calculator
- Perform basic arithmetic operations (addition, subtraction, multiplication, division).
- Input numbers and operator using the keypad.
- Results are displayed on the LCD screen.

### Mode 2: Server Alarm
- Alarm system triggers based on specific conditions.
- Sends data via UART to external systems indicating alarm status.

### Mode 3: LDR Monitoring
- Uses an LDR to monitor light levels.
- Displays light intensity on the LCD.
- Controls outputs based on the detected light levels (e.g., turns LEDs on/off).

## Password Protection
- **Setting Password**: Users can set a new password using the keypad.
- **Password Validation**: Compares the entered password with the stored one.
- **Lock Mechanism**: The system locks after multiple incorrect password attempts, displaying a lock message and sending a UART alert.

## System Lock and Security
- **Temporary Lock**: After a few incorrect password attempts, the system locks for a specified period.
- **Permanent Lock**: Locks indefinitely after exceeding a threshold of incorrect attempts.

## LCD Display Usage
- **Mode Indication**: Shows the current operating mode.
- **Password Entry/Setting**: Guides users through password processes.
- **Calculation Results**: Displays the result of arithmetic operations.
- **LDR Readings**: Shows the light intensity and relevant control messages.

## Communication
- **UART Communication**: Sends data to external systems, especially for server alarm functionality.

## Error Handling
- **Invalid Input**: Displays feedback for incorrect inputs in password and calculator modes.
- **Division by Zero**: Displays an error message if division by zero is attempted.

## Future Enhancements
- **Improved Security**: Additional security layers for password protection.
- **Additional Modes**: Integration of new functionalities or modes.
- **User Interface Enhancements**: Improving the LCD interface for better usability.


- [Project Code](PIC_Microcontroller_Projects_in_C_Basic/Final_project) | [Demo Video](https://github.com/user-attachments/assets/bbb1cebd-91ad-4f43-a636-cd2fb9422ee9)


---

## Conclusion

Completing these projects provided hands-on experience with microcontroller programming and hardware interfacing. Through these projects, I gained a deeper understanding of embedded systems, which will serve as a strong foundation for future projects in this field.



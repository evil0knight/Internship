# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Internship project repository for **南京长城医疗器械有限公司** (Nanjing Great Wall Medical Device Co., Ltd.) containing two embedded systems projects for medical device applications.

### Project 1: CAT1PRO - 433MHz Water Valve Control System

**Location**: [CAT1PRO/CAT1PRO/](CAT1PRO/CAT1PRO/)
**MCU**: FT61FC4X (8-bit, 4K×14 PROM, 0.5KB RAM, 128B EEPROM)
**Application**: Battery-powered wireless receiver for intelligent water valve control with energy harvesting

**Key Features**:
- 433MHz RF communication (CAT1 module)
- Water flow energy harvesting (up to 100V input, 60V storage capacitor)
- Wireless device pairing system (对码 - duima)
- Ultra-low-power sleep/wake capability
- UART communication at 9600 baud

### Project 2: Nixie Tube - Multi-digit Display Controller

**Location**: [nixie_tube/HT32F50020/](nixie_tube/HT32F50020/)
**MCU**: Holtek HT32F50020 (ARM Cortex-M0+, 32KB Flash, 4KB RAM)
**Application**: Medical device display interface for power and temperature monitoring

**Key Features**:
- 11-digit TM1640 nixie tube driver (7-segment display)
- Software I2C implementation
- UART communication at 115200 baud
- 100ms timer-based main loop
- Multi-data display (Power, Time, Temperature)

See [nixie_tube/HT32F50020/CLAUDE.md](nixie_tube/HT32F50020/CLAUDE.md) for detailed development guide.

## Build Systems

### CAT1PRO Project

**IDE**: FMDprogrammer / FMDIDE (custom Holtek environment)
**Compiler**: GCC
**Project File**: [CAT1PRO/CAT1PRO/CAT1PRO.prj](CAT1PRO/CAT1PRO/CAT1PRO.prj)

**Building**:
1. Open `CAT1PRO.prj` in FMDprogrammer IDE
2. Build using IDE GUI
3. Flash `.hex` file to FT61FC4X microcontroller

**Build Outputs**:
- `.hex` - Intel HEX format for programming
- `.bin` - Binary firmware image (8192 bytes)
- `.asm` - Assembly listing
- `.map` - Memory layout
- `.cof` - COFF object format

### Nixie Tube Project

**IDE**: Keil MDK-ARM v5
**Compiler**: ARM GCC (armcc5)
**Project File**: [nixie_tube/HT32F50020/project/MDK_ARMv5/project.uvprojx](nixie_tube/HT32F50020/project/MDK_ARMv5/project.uvprojx)

**Building**:
```bash
# Command line (from project/MDK_ARMv5/ directory)
UV4 -b project.uvprojx  # Build
UV4 -r project.uvprojx  # Build and debug

# Or use Keil IDE GUI: Project → Build Target (F7)
```

See [nixie_tube/HT32F50020/CLAUDE.md](nixie_tube/HT32F50020/CLAUDE.md) for comprehensive build instructions.

## Code Architecture

### CAT1PRO Architecture

**Type**: Barebones 8-bit superloop with interrupts

```c
main() {
    POWER_INITIAL();      // GPIO, clock config (16MHz)
    UART_INITIAL();       // UART at 9600 baud
    CAT1_Init();          // 433MHz module AT commands
    Duima_Init();         // Pairing module (optional)

    while(1) {
        // Main application loop
        // Interrupt-driven UART RX
        // Timer-based events
    }
}
```

**Key Components**:
- **Main Application**: [CAT1PRO/CAT1PRO/CAT1PRO.C](CAT1PRO/CAT1PRO/CAT1PRO.C) - UART init, 433 module config, main loop
- **Pairing Module**: [CAT1PRO/CAT1PRO/duima.c](CAT1PRO/CAT1PRO/duima.c), [duima.h](CAT1PRO/CAT1PRO/duima.h) - Device pairing, sleep/wake, ID verification

**Hardware Connections**:
| Function | Pin | Configuration |
|----------|-----|---------------|
| UART TX | PA6 | Output |
| UART RX | PA7 | Input |
| 433 Wake Signal | PA4 | Input + Pull-up (EINT1) |
| 433 Sleep Control | PC1 | Output (0=wake, 1=sleep) |
| Pairing Button | PB7 | Input + Pull-up (active low) |
| LED Status | PA1 | Output |
| Valve Control | PB0-2, PA0 | Output (OPENP, CLOSEP, OPENS, CLOSES) |

**Communication Protocol**:
```
Pairing Request:  [0x5A][0xA5][0x06][0xFF][接收方DeviceID 4-bytes]
Pairing Response: [0x5A][0xA5][0x0A][0xFE][接收方DeviceID 4-bytes][发送方DeviceID 4-bytes]
                  或简化: [0x5A][0xA5][0x06][0xFE][接收方DeviceID 4-bytes]
Normal Command:   [0x5A][0xA5][Length][SenderID 4-bytes][Command][Data...]
```

**Pairing Workflow**:
1. Receiver sends pairing request with its own Device ID
2. Sender responds with receiver's ID (for verification) + sender's ID
3. Receiver verifies the ID matches its own, then saves sender's ID
4. Pairing complete - receiver only accepts commands from paired sender

**EEPROM Layout** (128 bytes total):
- 0x00-0x03: Device ID (4 bytes)
- 0x04-0x07: Paired Sender ID (4 bytes)
- 0x08: Pairing Flag (0x5A = paired)

### Nixie Tube Architecture

**Type**: ARM Cortex-M0+ with HAL abstraction (superloop + interrupts)

```c
main() {
    GPIO_Configuration();    // Pin config
    BFTM0_Configuration();   // 100ms timer
    UART0_Configuration();   // 115200 baud serial
    Key_Configuration();     // Button debouncing
    TM1640_Init();          // Display driver

    while(1) {
        UART0_ParseProtocol();  // Process serial data
        if(bftm0_ct >= 100) {   // Every 100ms
            TM1640_DisplayMultiData(...);
            bftm0_ct = 0;
        }
    }
}
```

**Key Modules**:
- [GPIO.c/.h](nixie_tube/HT32F50020/project/GPIO.c) - PB7/PB8 soft I2C pins
- [UART0.c/.h](nixie_tube/HT32F50020/project/UART0.c) - 256-byte ring buffer
- [BFTM0.c/.h](nixie_tube/HT32F50020/project/BFTM0.c) - 100ms timer interrupt
- [Soft_I2C.c/.h](nixie_tube/HT32F50020/project/MDK_ARMv5/Soft_I2C.c) - Software I2C + TM1640 driver
- [Key.c/.h](nixie_tube/HT32F50020/project/Key.c) - Button input with debouncing

## Important Development Notes

### CAT1PRO Development

1. **433MHz Module Initialization**: Use AT commands via `SendATCommand()` function
   ```c
   SendATCommand("AT+PWR=20");      // Power setting (max 29dBm)
   SendATCommand("AT+FEQ=434000000"); // Frequency 434MHz
   SendATCommand("AT+SF=7");         // Spreading factor
   SendATCommand("ATW");             // Save settings
   ```

2. **Pairing Module Integration**: See [CAT1PRO/CAT1PRO/DUIMA_INTEGRATION.md](CAT1PRO/CAT1PRO/DUIMA_INTEGRATION.md) and [DUIMA_WORKFLOW.md](CAT1PRO/CAT1PRO/DUIMA_WORKFLOW.md)
   - Pairing button: Hold PB7 for 2 seconds during first 5 seconds after power-on
   - Device enters listening mode after pairing or 5-second timeout
   - Automatic sleep/wake cycle controlled by PA4 interrupt

3. **EEPROM Usage**: Avoid frequent writes (typical endurance: 100,000 cycles)
   - Use `Duima_SaveConfig()` only when pairing completes
   - Default device ID: 0x12345678 (configurable)

4. **433MHz Module Periodic Sleep Mode** (433模块周期休眠模式):

   **Hardware Connections**:
   - **PA4**: LED pin - goes LOW when correct preamble code is received (MCU wake-up signal)
   - **PC1**: 433 module SLEEP pin - HIGH=sleep mode, LOW=working/wake mode

   **System Workflow**:
   ```
   ┌─────────────────────────────────────────────┐
   │  Periodic Sleep Mode (PC1=1, 433 sleeping)  │
   │  - MCU in SLEEP, ultra-low power            │
   │  - 433 module periodic scan for RX          │
   │  - Waiting for PA4 external interrupt       │
   └─────────────────────────────────────────────┘
                        ↓
         [Correct preamble code received]
         PA4 pulled LOW (LED toggles)
                        ↓
   ┌─────────────────────────────────────────────┐
   │  MCU wakes up from PA4 interrupt            │
   │  PC1 pulled LOW (WAKE_UP)                   │
   │  433 module continuous operation            │
   │  Enter 5-second working mode                │
   └─────────────────────────────────────────────┘
                        ↓
   ┌─────────────────────────────────────────────┐
   │  5-Second Detection Window:                 │
   │  1. Receive and process 433 module data     │
   │  2. Monitor PB7 button for pairing:         │
   │     - Hold 2 seconds → Pairing mode         │
   │     - Send address preamble code            │
   │     - Wait for pairing response             │
   │     - Complete pairing sequence             │
   │  3. Complete all tasks within 5 seconds     │
   └─────────────────────────────────────────────┘
                        ↓
   ┌─────────────────────────────────────────────┐
   │  After 5-second timeout:                    │
   │  PC1 pulled HIGH (SLEEP_DN)                 │
   │  MCU enters SLEEP mode                      │
   │  Return to periodic sleep cycling           │
   └─────────────────────────────────────────────┘
   ```

   **Power-On Initialization Sequence**:
   1. `POWER_INITIAL()` - GPIO, clock, interrupt setup
   2. `UART_INITIAL()` - UART at 9600 baud
   3. `CAT1_Init()` - 433 module AT command configuration
   4. Enter main loop
   5. Execute first 5-second detection (no sleep on power-up)
   6. After 5 seconds: PC1 goes HIGH, enter periodic sleep
   7. Continue periodic sleep/wake cycling thereafter

   **Button Pairing Mode** (PB7 long press):
   - Pin: PB7 (active LOW, pull-up enabled)
   - Trigger: 2-second hold (requires debouncing)
   - Pairing Sequence:
     ① Send address preamble code to air
     ② Wait for pairing response
     ③ Verify response validity
     ④ Save paired ID to EEPROM
     ⑤ Return to normal reception mode

   **Power Consumption Strategy**:
   - Maximize sleep time: PC1=1 puts both MCU and 433 module in sleep
   - Minimize work window: Only 5-second reception window per cycle
   - Wake only on valid signal: PA4 interrupt ensures MCU wakes only for correct preamble

   **PA4 External Interrupt Initialization** (PA4外部中断初始化例程):
   ```c
   /*-------------------------------------------------
   * Function: IO_INT_INITIAL
   * Purpose:  PA4 External Interrupt Initialization (433 Wakeup Signal)
   * Input:    None
   * Output:   None
    --------------------------------------------------*/
   void IO_INT_INITIAL(void)
   {
       EPS0 = 0B00000100; 	    // Select PA4 interrupt (EINT0), bit2=PA4
       EPS1 = 0B00000000;

       ITYPE0 = 0B00001100;    // PA4 dual edge trigger (上升沿和下降沿都触发)
       ITYPE1 = 0B00000000;

       EPIE0  = 0B00000001;    // Enable EINT0 (PA4)

       INTCON = 0B11000000;    // GIE, PEIE enable
   }
   ```

   **PA4 Interrupt Registration Detail**:
   - EPS0[2:0] = 0B100 → Select PA4 as EINT0 (External Interrupt 0)
   - ITYPE0[3:2] = 0B11 → Dual-edge trigger (rising and falling edges both trigger)
   - EPIE0[0] = 1 → Enable EINT0 external interrupt
   - INTCON[7] = 1 → GIE (Global Interrupt Enable)
   - INTCON[6] = 1 → PEIE (Peripheral Interrupt Enable)

   **Main Loop Workflow** (参考FT61FC4X_IO_INTERRUPT.prj):
   ```c
   void main(void)
   {
       POWER_INITIAL();        // System initialization

       while(1)
       {
           // ===== Work Phase =====
           // Output work signal (e.g., 100 frames of 50Hz square wave on PB3)
           for(FCount=0; FCount<100; FCount++)
           {
               DemoPortOut = 1;
               DelayMs(10);    // 10ms delay
               DemoPortOut = 0;
               DelayMs(10);
           }

           // ===== Prepare Sleep =====
           IO_INT_INITIAL();       // Initialize external interrupt
           GIE = 0;                // Disable global interrupt before SLEEP
           NOP();
           NOP();

           // ===== Sleep =====
           SLEEP();                // MCU enters low-power sleep mode
           NOP();
           NOP();

           // ===== Wake up from interrupt =====
           EPIF0 = 0x02;           // Clear interrupt flag (write 1 to clear)
           PEIE = 0;               // Disable peripheral interrupt
           // Loop back to work phase
       }
   }
   ```

   **Interrupt Flag Clearing**:
   - For PA4 (EINT0): Write 1 to EPIF0[0] to clear the flag
   - For PC1 (EINT1): Write 1 to EPIF0[1] to clear the flag
   - Always clear after wakeup from SLEEP instruction

5. **EEPROM Access** (FT61FC4X EEPROM 读写例程):

   **EEPROM Specifications**:
   - Size: 128 bytes (0x00-0x7F)
   - Endurance: ~100,000 write cycles
   - Registers: EEADRL (address), EEDATL (data), EECON1/EECON2 (control)

   **EEPROM Read Function**:
   ```c
   unsigned char EEPROMread(unsigned char EEAddr)
   {
       unsigned char ReEEPROMread;
       while(GIE) {                // Wait for GIE=0
           GIE = 0;                // Disable interrupts during read
           NOP();
           NOP();
       }
       EEADRL = EEAddr;            // Set address
       CFGS = 0;                   // Access EEPROM memory
       EEPGD = 0;
       RD = 1;                     // Start read operation
       NOP();
       NOP();
       NOP();
       NOP();
       ReEEPROMread = EEDATL;      // Read data
       return ReEEPROMread;
   }
   ```

   **EEPROM Write Function**:
   ```c
   void Unlock_Flash()
   {
   #asm
       MOVLW   0x03
       MOVWF   _BSREG
       MOVLW   0x55
       MOVWF   _EECON2 & 0x7F
       MOVLW   0xAA
       MOVWF   _EECON2 & 0x7F
       BSF     _EECON1 & 0x7F, 1   // WR=1
       NOP
       NOP
   #endasm
   }

   void EEPROMwrite(unsigned char EEAddr, unsigned char Data)
   {
       while(GIE) {                // Wait for GIE=0
           GIE = 0;                // Disable interrupts during write
           NOP();
           NOP();
       }
       EEADRL = EEAddr;            // EEPROM address
       EEDATL = Data;              // Data to write

       CFGS = 0;                   // Access EEPROM memory
       EEPGD = 0;
       EEIF = 0;
       WREN = 1;                   // Write enable

       Unlock_Flash();             // Unlock sequence (must not be modified)
       NOP();
       NOP();
       NOP();
       NOP();

       while(WR);                  // Wait for write completion
       WREN = 0;
       GIE = 1;
   }
   ```

   **Important Notes**:
   - Always disable interrupts (GIE=0) before EEPROM operations
   - Use EEADRL/EEDATL registers (not EADR/EDAT)
   - Use direct bit access: WR, WREN, RD, CFGS, EEPGD (not EECONbits.xxx)
   - Unlock sequence must be in assembly to prevent compiler optimization
   - Wait for WR bit to clear before proceeding

6. **TIM4 Timer** (FT61FC4X TIM4 定时器例程):

   **TIM4 Specifications**:
   - 8-bit counter with 8-bit auto-reload
   - 3-bit prescaler (divides by 2^PSCR[2:0])
   - Registers: TIM4CNTR (counter), TIM4ARR (auto-reload, 8-bit), TIM4PSCR (prescaler)
   - Control: TIM4CR1, TIM4IER, TIM4SR, TIM4EGR

   **TIM4 Initialization Example** (4kHz square wave on PB3):
   ```c
   void Time4Initial(void)
   {
       PCKEN |= 0B00001000;        // Enable TIM4 module clock (bit3)

       TIM4CR1 = 0B00000101;
       // Bit7: Auto-reload preload enable (0=direct write, 1=buffered)
       // Bit[5:4]: Clock source (00=system clock, 01=HIRC, 10=LP, 11=XT)
       // Bit3: One-pulse mode (0=continuous, 1=stop on update)
       // Bit2: Update request source
       // Bit1: Update disable
       // Bit0: Counter enable (1=enabled)

       TIM4IER = 0B00000001;       // Enable update interrupt
       TIM4SR  = 0B00000000;       // Clear status register
       TIM4EGR = 0B00000000;       // Event generation register

       TIM4CNTR = 0;               // Clear counter
       TIM4PSCR = 0B00000100;      // Prescaler = 2^4 = 16
       TIM4ARR  = 124;             // Auto-reload value (8-bit only!)

       INTCON |= 0B11000000;       // Enable GIE and PEIE
   }
   ```

   **TIM4 Interrupt Service Routine**:
   ```c
   void interrupt ISR(void)
   {
       if(T4UIE && T4UIF) {        // Check TIM4 update interrupt
           T4UIF = 1;              // Write 1 to clear flag
           // Your periodic code here
       }
   }
   ```

   **Timing Calculation**:
   - Formula: `f_interrupt = f_clock / (2^PSCR) / (ARR+1)`
   - Example: 16MHz / 2^4 / (124+1) = 16MHz / 16 / 125 = 8kHz
   - For 4kHz square wave: toggle pin at 8kHz (2 toggles per cycle)

   **1ms Timer Configuration** (for g_timer_ms counter):
   ```c
   // Target: 1ms interrupt (1000Hz)
   // 16MHz / 2^6 / (249+1) = 16MHz / 64 / 250 = 1000Hz ✓
   TIM4PSCR = 6;                   // Prescaler = 2^6 = 64
   TIM4ARR  = 249;                 // Auto-reload = 250
   ```

   **Important Notes**:
   - TIM4ARR is 8-bit only (0-255), not 16-bit
   - Use TIM4PSCR (not TIM4PSC)
   - PCKEN bit3 enables TIM4 (0B00001000)
   - Prescaler divides by 2^PSCR[2:0], not (PSCR+1)

7. **Power Optimization**:
   - Use `SLEEP` instruction to enter low-power mode
   - Control 433 module sleep via PC1 pin
   - PA4 external interrupt wakes both MCU and 433 module

### Nixie Tube Development

1. **Code Generation**: DO NOT manually edit files marked "Generated by HT32CodeConfig"
   - Use HT32CodeConfig V1.1.5 GUI to modify [cfg.ht32](nixie_tube/HT32F50020/cfg.ht32)
   - Application code goes in designated sections of [main.c](nixie_tube/HT32F50020/project/main.c)

2. **Library Configuration**: Enable/disable HAL drivers in [ht32f5xxxx_conf.h](nixie_tube/HT32F50020/project/ht32f5xxxx_conf.h)
   ```c
   #define ENABLE_UART 1           // Enable UART module
   #define HTCFG_PRINTF_RETARGET   // printf → UART0
   ```

3. **Timing**: All periodic tasks use 100ms BFTM0 timer
   - ISR increments `bftm0_ct` counter
   - Main loop checks `if(bftm0_ct >= 100)` for 100ms tasks

4. **Memory Constraints**: HT32F50020 has 32KB Flash, 4KB RAM
   - Current usage: ~8-10KB Flash, stack monitoring available
   - Enable stack analysis: `HTCFG_STACK_USAGE_ANALYSIS` in conf.h

### General Conventions

1. **File Naming**:
   - CAT1PRO: Uppercase for main files (CAT1PRO.C, .prj)
   - Nixie Tube: Lowercase with underscores (main.c, ht32f5xxxx_conf.h)

2. **Comments**: Mix of English and Chinese (中文)
   - Hardware comments often in Chinese
   - Code logic typically in English

3. **Documentation**:
   - Integration guides in project directories (e.g., DUIMA_INTEGRATION.md)
   - Development log in [README.md](README.md) (Chinese)

## Project Documentation

- [README.md](README.md) - Internship work log with daily entries
- [CAT1PRO/CAT1PRO/DUIMA_INTEGRATION.md](CAT1PRO/CAT1PRO/DUIMA_INTEGRATION.md) - Pairing module integration guide (278 lines)
- [CAT1PRO/CAT1PRO/DUIMA_WORKFLOW.md](CAT1PRO/CAT1PRO/DUIMA_WORKFLOW.md) - Pairing workflow details (298 lines)
- [nixie_tube/HT32F50020/CLAUDE.md](nixie_tube/HT32F50020/CLAUDE.md) - Detailed nixie tube development guide
- [nixie_tube/HT32F50020/project/按键使用说明.md](nixie_tube/HT32F50020/project/按键使用说明.md) - Button usage guide (Chinese)

## Technology Stack Comparison

| Aspect | CAT1PRO | Nixie Tube |
|--------|---------|------------|
| MCU | FT61FC4X (8-bit) | HT32F50020 (ARM Cortex-M0+) |
| Flash | 4K × 14-bit | 32 KB |
| RAM | 0.5 KB | 4 KB |
| IDE | FMDprogrammer | Keil MDK-ARM v5 |
| Compiler | GCC | ARM GCC (armcc5) |
| UART | 9600 baud | 115200 baud |
| Key Peripheral | 433MHz wireless | TM1640 display driver |
| Library | Minimal HAL | HT32 Firmware Lib v1.15.4 |
| Architecture | Barebones | Framework-based |

## Recent Work

Based on git commits:
- **2026-01-24**: CAT1PRO 433MHz communication enhancement
- **2026-01-23**: FT61FC4X pairing module integration (宁波双马水控项目)
- **2026-01-12**: Nixie tube button input implementation
- **2025-12-31**: Initial repository setup

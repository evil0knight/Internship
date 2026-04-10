# Boilerplate Templates

All templates use these placeholders — replace before use:
- `xxx` → peripheral/module name (e.g. `spi`, `uart`, `sensor`)
- `Xxx` → PascalCase version of the above (e.g. `Spi`, `Uart`, `Sensor`)
- `EVENT_A/B/C` → actual business events
- `<project_name>` → project root name
- `<Author Name>` → YA眼膏
- `<YYYY-M-D>` → creation date

---

## File Header Block (reuse in every file)

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file <filename>
 *
 * @author YA眼膏
 *
 * @brief <Brief description>
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
```

---

## config/sys_config.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file sys_config.h
 *
 * @author YA眼膏
 *
 * @brief System-wide compile-time configuration parameters.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef SYS_CONFIG_H
#define SYS_CONFIG_H

/** System tick rate in Hz **/
#define SYS_TICK_RATE_HZ    1000U

/** Firmware version **/
#define APP_VERSION_MAJOR   1U
#define APP_VERSION_MINOR   0U
#define APP_VERSION_PATCH   0U

/** Set to 1 to enable debug output, 0 to disable **/
#define DEBUG_ENABLE        1U

#endif /* SYS_CONFIG_H */
```

---

## 4_HAL/pin_config.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file pin_config.h
 *
 * @author YA眼膏
 *
 * @brief Pin-to-register mapping. This is the ONLY file allowed to contain
 *        MCU-specific pin assignments. Replace macros with actual values.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef PIN_CONFIG_H
#define PIN_CONFIG_H

/** xxx peripheral pin mapping — replace with actual port/pin values **/
#define PIN_XXX_PORT    /* e.g. GPIOA */
#define PIN_XXX_PIN     /* e.g. GPIO_PIN_5 */

#endif /* PIN_CONFIG_H */
```

---

## 4_HAL/hal_xxx.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file hal_xxx.h
 *
 * @author YA眼膏
 *
 * @brief HAL interface for the xxx peripheral. Provides atomic hardware
 *        operations and ISR entry point. No business logic here.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef HAL_XXX_H
#define HAL_XXX_H

#include <stdint.h>
#include "pin_config.h"
#include "../config/sys_config.h"

/**
 * @brief Initialize the xxx peripheral hardware.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
void hal_xxx_init(void);

/**
 * @brief Write one byte to the xxx peripheral.
 * @param[in] data: byte to transmit
 * @param[Out] :None
 * @return None
 */
void hal_xxx_write(uint8_t data);

/**
 * @brief Read one byte from the xxx peripheral.
 * @param[in] :None
 * @param[Out] pData: pointer to store received byte
 * @return None
 */
void hal_xxx_read(uint8_t *pData);

/**
 * @brief ISR entry point for the xxx peripheral interrupt.
 *        Call this from the MCU vector table handler.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
void hal_xxx_isr_handler(void);

#endif /* HAL_XXX_H */
```

---

## 4_HAL/hal_xxx.c

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file hal_xxx.c
 *
 * @author YA眼膏
 *
 * @brief HAL implementation for the xxx peripheral.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#include "hal_xxx.h"

/** Receive buffer for xxx peripheral DMA/interrupt transfers **/
static uint8_t g_xxxRxBuf[64];

/** Flag set by ISR, cleared by driver layer **/
static volatile uint8_t g_xxxRxReady = 0U;

/**
 * @brief Initialize the xxx peripheral hardware.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
void hal_xxx_init(void)
{
    /** Configure GPIO and peripheral clock — fill in MCU-specific code **/
    /* TODO: clock enable, GPIO mode, peripheral register config */
}

/**
 * @brief Write one byte to the xxx peripheral.
 * @param[in] data: byte to transmit
 * @param[Out] :None
 * @return None
 */
void hal_xxx_write(uint8_t data)
{
    /** Block until transmit register is empty, then write **/
    /* TODO: poll TX-ready flag, write data register */
    (void)data;
}

/**
 * @brief Read one byte from the xxx peripheral.
 * @param[in] :None
 * @param[Out] pData: pointer to store received byte
 * @return None
 */
void hal_xxx_read(uint8_t *pData)
{
    if (pData == NULL) {
        return;
    }

    /** Copy from receive buffer if data is ready **/
    if (g_xxxRxReady != 0U) {
        *pData = g_xxxRxBuf[0];
        g_xxxRxReady = 0U;
    }
}

/**
 * @brief ISR entry point for the xxx peripheral interrupt.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
void hal_xxx_isr_handler(void)
{
    /** Store received byte and set ready flag **/
    /* TODO: read data register into g_xxxRxBuf, set g_xxxRxReady */
    g_xxxRxReady = 1U;
}
```

---

## 3_Driver/drv_xxx.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file drv_xxx.h
 *
 * @author YA眼膏
 *
 * @brief Driver interface for the xxx peripheral. Encapsulates functional
 *        logic above HAL. No direct register access.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef DRV_XXX_H
#define DRV_XXX_H

#include <stdint.h>
#include "../4_HAL/hal_xxx.h"

/** Configuration parameters for the xxx driver **/
typedef struct {
    uint32_t baudRate;   /* Communication baud rate */
    uint8_t  mode;       /* Operating mode (device-specific) */
} DrvXxxConfig;

/** Runtime handle for one xxx driver instance **/
typedef struct {
    DrvXxxConfig config;
    uint8_t      isInitialized;
} DrvXxxHandle;

/**
 * @brief Initialize the xxx driver with the given configuration.
 * @param[in] pHandle: pointer to driver handle
 * @param[in] pConfig: pointer to configuration struct
 * @param[Out] :None
 * @return 0 on success, -1 on invalid argument
 */
int drv_xxx_init(DrvXxxHandle *pHandle, const DrvXxxConfig *pConfig);

/**
 * @brief Send a data buffer through the xxx peripheral.
 * @param[in] pHandle: pointer to initialized driver handle
 * @param[in] pData: pointer to data buffer
 * @param[in] len: number of bytes to send
 * @param[Out] :None
 * @return 0 on success, -1 on error
 */
int drv_xxx_send(DrvXxxHandle *pHandle, const uint8_t *pData, uint16_t len);

/**
 * @brief Receive data from the xxx peripheral into a buffer.
 * @param[in] pHandle: pointer to initialized driver handle
 * @param[in] len: maximum bytes to receive
 * @param[Out] pBuf: pointer to destination buffer
 * @return number of bytes received, -1 on error
 */
int drv_xxx_receive(DrvXxxHandle *pHandle, uint8_t *pBuf, uint16_t len);

#endif /* DRV_XXX_H */
```

---

## 3_Driver/drv_xxx.c

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file drv_xxx.c
 *
 * @author YA眼膏
 *
 * @brief Driver implementation for the xxx peripheral.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#include "drv_xxx.h"

/**
 * @brief Initialize the xxx driver with the given configuration.
 * @param[in] pHandle: pointer to driver handle
 * @param[in] pConfig: pointer to configuration struct
 * @param[Out] :None
 * @return 0 on success, -1 on invalid argument
 */
int drv_xxx_init(DrvXxxHandle *pHandle, const DrvXxxConfig *pConfig)
{
    if ((pHandle == NULL) || (pConfig == NULL)) {
        return -1;
    }

    /** Copy config and delegate hardware setup to HAL **/
    pHandle->config = *pConfig;
    hal_xxx_init();
    pHandle->isInitialized = 1U;

    return 0;
}

/**
 * @brief Send a data buffer through the xxx peripheral.
 * @param[in] pHandle: pointer to initialized driver handle
 * @param[in] pData: pointer to data buffer
 * @param[in] len: number of bytes to send
 * @param[Out] :None
 * @return 0 on success, -1 on error
 */
int drv_xxx_send(DrvXxxHandle *pHandle, const uint8_t *pData, uint16_t len)
{
    if ((pHandle == NULL) || (pData == NULL) || (pHandle->isInitialized == 0U)) {
        return -1;
    }

    /** Transmit each byte sequentially via HAL **/
    for (uint16_t i = 0; i < len; i++) {
        hal_xxx_write(pData[i]);
    }

    return 0;
}

/**
 * @brief Receive data from the xxx peripheral into a buffer.
 * @param[in] pHandle: pointer to initialized driver handle
 * @param[in] len: maximum bytes to receive
 * @param[Out] pBuf: pointer to destination buffer
 * @return number of bytes received, -1 on error
 */
int drv_xxx_receive(DrvXxxHandle *pHandle, uint8_t *pBuf, uint16_t len)
{
    if ((pHandle == NULL) || (pBuf == NULL) || (pHandle->isInitialized == 0U)) {
        return -1;
    }

    /** Read one byte from HAL receive buffer **/
    hal_xxx_read(pBuf);

    return (int)len;
}
```

---

## 2_Middleware/protocol_xxx.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file protocol_xxx.h
 *
 * @author YA眼膏
 *
 * @brief Hardware-independent protocol encode/decode for the xxx frame format.
 *        No HAL or driver dependencies — suitable for unit testing on PC.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef PROTOCOL_XXX_H
#define PROTOCOL_XXX_H

#include <stdint.h>
#include <stddef.h>

/** Parsed frame structure for the xxx protocol **/
typedef struct {
    uint8_t  header;
    uint8_t *pPayload;
    uint16_t payloadLen;
    uint8_t  checksum;
} ProtocolXxxFrame;

/**
 * @brief Encode raw data into a ProtocolXxxFrame.
 * @param[in] pData: raw input buffer
 * @param[in] len: length of input buffer
 * @param[Out] pFrame: pointer to frame struct to populate
 * @return 0 on success, -1 on invalid argument
 */
int protocol_xxx_encode(const uint8_t *pData, uint16_t len, ProtocolXxxFrame *pFrame);

/**
 * @brief Decode a ProtocolXxxFrame into a raw buffer after checksum validation.
 * @param[in] pFrame: pointer to frame to decode
 * @param[in] len: size of destination buffer
 * @param[Out] pBuf: destination buffer for payload
 * @param[Out] pOutLen: actual number of bytes written
 * @return 0 on success, -1 on checksum error or invalid argument
 */
int protocol_xxx_decode(const ProtocolXxxFrame *pFrame, uint8_t *pBuf,
                        uint16_t len, uint16_t *pOutLen);

/**
 * @brief Calculate XOR checksum over a byte buffer.
 * @param[in] pData: input buffer
 * @param[in] len: buffer length
 * @param[Out] :None
 * @return computed checksum byte
 */
uint8_t protocol_xxx_calc_checksum(const uint8_t *pData, uint16_t len);

#endif /* PROTOCOL_XXX_H */
```

---

## 2_Middleware/protocol_xxx.c

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file protocol_xxx.c
 *
 * @author YA眼膏
 *
 * @brief Hardware-independent protocol encode/decode implementation.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#include "protocol_xxx.h"
#include <string.h>

/** Protocol frame header magic byte **/
#define PROTOCOL_XXX_HEADER  0xAAU

/**
 * @brief Calculate XOR checksum over a byte buffer.
 * @param[in] pData: input buffer
 * @param[in] len: buffer length
 * @param[Out] :None
 * @return computed checksum byte
 */
uint8_t protocol_xxx_calc_checksum(const uint8_t *pData, uint16_t len)
{
    uint8_t checksum = 0U;

    /** XOR all bytes to produce a simple integrity check value **/
    for (uint16_t i = 0; i < len; i++) {
        checksum ^= pData[i];
    }

    return checksum;
}

/**
 * @brief Encode raw data into a ProtocolXxxFrame.
 * @param[in] pData: raw input buffer
 * @param[in] len: length of input buffer
 * @param[Out] pFrame: pointer to frame struct to populate
 * @return 0 on success, -1 on invalid argument
 */
int protocol_xxx_encode(const uint8_t *pData, uint16_t len, ProtocolXxxFrame *pFrame)
{
    if ((pData == NULL) || (pFrame == NULL)) {
        return -1;
    }

    /** Fill frame fields and compute checksum over payload **/
    pFrame->header     = PROTOCOL_XXX_HEADER;
    pFrame->pPayload   = (uint8_t *)pData;
    pFrame->payloadLen = len;
    pFrame->checksum   = protocol_xxx_calc_checksum(pData, len);

    return 0;
}

/**
 * @brief Decode a ProtocolXxxFrame into a raw buffer after checksum validation.
 * @param[in] pFrame: pointer to frame to decode
 * @param[in] len: size of destination buffer
 * @param[Out] pBuf: destination buffer for payload
 * @param[Out] pOutLen: actual number of bytes written
 * @return 0 on success, -1 on checksum error or invalid argument
 */
int protocol_xxx_decode(const ProtocolXxxFrame *pFrame, uint8_t *pBuf,
                        uint16_t len, uint16_t *pOutLen)
{
    if ((pFrame == NULL) || (pBuf == NULL) || (pOutLen == NULL)) {
        return -1;
    }

    /** Reject frame if checksum does not match recomputed value **/
    uint8_t expected = protocol_xxx_calc_checksum(pFrame->pPayload, pFrame->payloadLen);
    if (expected != pFrame->checksum) {
        return -1;
    }

    uint16_t copyLen = (pFrame->payloadLen < len) ? pFrame->payloadLen : len;
    memcpy(pBuf, pFrame->pPayload, copyLen);
    *pOutLen = copyLen;

    return 0;
}
```

---

## 1_App/app_event.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app_event.h
 *
 * @author YA眼膏
 *
 * @brief Application event enumeration and event utility interface.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef APP_EVENT_H
#define APP_EVENT_H

/**
 * Application events. Replace EVENT_A/B/C with actual business event names.
 * Keep EVENT_MAX as the last entry — it is used for table sizing.
 */
typedef enum {
    EVENT_A = 0,  /* Replace: e.g. EVENT_WIFI_OPEN */
    EVENT_B,      /* Replace: e.g. EVENT_WIFI_CLOSE */
    EVENT_C,      /* Replace: e.g. EVENT_FAULT */
    EVENT_MAX
} AppEvent;

/**
 * @brief Convert an AppEvent value to a human-readable string.
 * @param[in] event: event to convert
 * @param[Out] :None
 * @return pointer to constant string, "UNKNOWN" if out of range
 */
const char *app_event_to_str(AppEvent event);

#endif /* APP_EVENT_H */
```

---

## 1_App/app_event.c

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app_event.c
 *
 * @author YA眼膏
 *
 * @brief Application event utility implementation.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#include "app_event.h"

/**
 * @brief Convert an AppEvent value to a human-readable string.
 * @param[in] event: event to convert
 * @param[Out] :None
 * @return pointer to constant string, "UNKNOWN" if out of range
 */
const char *app_event_to_str(AppEvent event)
{
    /** Map each event to its name string for logging and debug **/
    switch (event) {
        case EVENT_A: return "EVENT_A";
        case EVENT_B: return "EVENT_B";
        case EVENT_C: return "EVENT_C";
        default:      return "UNKNOWN";
    }
}
```

---

## 1_App/app_state.h

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app_state.h
 *
 * @author YA眼膏
 *
 * @brief Table-driven application state machine interface.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#ifndef APP_STATE_H
#define APP_STATE_H

#include "app_event.h"

/**
 * Application states. Add new states before STATE_MAX.
 */
typedef enum {
    STATE_IDLE = 0,
    STATE_RUNNING,
    STATE_ERROR,
    STATE_MAX
} AppState;

/** One row in the state transition table **/
typedef struct {
    AppState  currentState;
    AppEvent  event;
    AppState  nextState;
    void    (*action)(void);
} Transition;

/**
 * @brief Initialize the state machine to STATE_IDLE.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
void app_state_init(void);

/**
 * @brief Look up the transition table and execute the matching action.
 * @param[in] event: event to process
 * @param[Out] :None
 * @return None
 */
void app_state_process_event(AppEvent event);

/**
 * @brief Return the current application state.
 * @param[in] :None
 * @param[Out] :None
 * @return current AppState value
 */
AppState app_state_get_current(void);

#endif /* APP_STATE_H */
```

---

## 1_App/app_state.c

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app_state.c
 *
 * @author YA眼膏
 *
 * @brief Table-driven application state machine implementation.
 *        To add a new transition: append one row to g_transitionTable.
 *        To add a new action: declare a static void function and reference it.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#include "app_state.h"

/* ── Forward declarations of action functions ─────────────────────────── */
static void action_on_start(void);
static void action_on_stop(void);
static void action_on_error(void);

/* ── Module state ─────────────────────────────────────────────────────── */

/** Current state of the application state machine **/
static AppState g_currentState = STATE_IDLE;

/* ── Transition table ─────────────────────────────────────────────────── */

/**
 * State transition table. Each row: {currentState, event, nextState, action}.
 * Add new transitions here — no other code needs to change.
 */
static const Transition g_transitionTable[] = {
    /** currentState     event     nextState      action          **/
    { STATE_IDLE,    EVENT_A, STATE_RUNNING, action_on_start },
    { STATE_RUNNING, EVENT_B, STATE_IDLE,    action_on_stop  },
    { STATE_RUNNING, EVENT_C, STATE_ERROR,   action_on_error },
    { STATE_ERROR,   EVENT_B, STATE_IDLE,    action_on_stop  },
};

/* ── Public functions ─────────────────────────────────────────────────── */

/**
 * @brief Initialize the state machine to STATE_IDLE.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
void app_state_init(void)
{
    /** Reset to initial state on every system startup **/
    g_currentState = STATE_IDLE;
}

/**
 * @brief Look up the transition table and execute the matching action.
 * @param[in] event: event to process
 * @param[Out] :None
 * @return None
 */
void app_state_process_event(AppEvent event)
{
    uint32_t tableSize = sizeof(g_transitionTable) / sizeof(g_transitionTable[0]);

    /** Search for a row matching the current state and incoming event **/
    for (uint32_t i = 0; i < tableSize; i++) {
        if ((g_transitionTable[i].currentState == g_currentState) &&
            (g_transitionTable[i].event == event)) {
            g_currentState = g_transitionTable[i].nextState;
            if (g_transitionTable[i].action != NULL) {
                g_transitionTable[i].action();
            }
            return;
        }
    }
    /** No matching transition — event is ignored in this state **/
}

/**
 * @brief Return the current application state.
 * @param[in] :None
 * @param[Out] :None
 * @return current AppState value
 */
AppState app_state_get_current(void)
{
    return g_currentState;
}

/* ── Action function stubs ────────────────────────────────────────────── */

/**
 * @brief Action executed when transitioning from IDLE to RUNNING.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
static void action_on_start(void)
{
    /** TODO: implement start-up logic (e.g. enable peripherals) **/
}

/**
 * @brief Action executed when transitioning back to IDLE.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
static void action_on_stop(void)
{
    /** TODO: implement shutdown logic (e.g. disable peripherals) **/
}

/**
 * @brief Action executed when entering the ERROR state.
 * @param[in] :None
 * @param[Out] :None
 * @return None
 */
static void action_on_error(void)
{
    /** TODO: implement error handling (e.g. log fault, safe-state outputs) **/
}
```

---

## 1_App/main.c

```c
/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file main.c
 *
 * @author YA眼膏
 *
 * @brief System entry point. Initializes all layers and runs the main loop.
 *
 * @version V1.0 <YYYY-M-D>
 *
 *****************************************************************************/
#include "app_state.h"
#include "../3_Driver/drv_xxx.h"
#include "../config/sys_config.h"

/**
 * @brief Application entry point.
 * @param[in] :None
 * @param[Out] :None
 * @return 0 (never reached on bare-metal targets)
 */
int main(void)
{
    /** Initialize driver with default configuration **/
    DrvXxxConfig xxxConfig = {
        .baudRate = 115200U,
        .mode     = 0U,
    };
    DrvXxxHandle xxxHandle = { 0 };
    drv_xxx_init(&xxxHandle, &xxxConfig);

    /** Initialize application state machine **/
    app_state_init();

    /** Main loop: dispatch events from ISR flags, queues, or timers **/
    while (1) {
        /* TODO: read pending events and call app_state_process_event() */
    }

    return 0;
}
```

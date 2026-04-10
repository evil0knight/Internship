---
name: embedded-project-scaffold
description: "为嵌入式小项目搭建标准4层架构目录与样板代码。触发关键词：新建项目、搭建框架、项目模板、scaffold、小项目、嵌入式项目结构、新建嵌入式工程、初始化项目、项目骨架、4层架构、app层、driver层、hal层、middleware层、表驱状态机、state machine scaffold。当用户需要从零开始创建一个嵌入式C项目时触发本技能。"
---

# 嵌入式小项目脚手架

## 快速导航

```
你需要做什么？
  生成完整项目骨架        第 1 节 (执行步骤)
  了解4层架构含义         第 2 节
  了解状态机模式          第 3 节
  查看完整文件样板        references/boilerplate_templates.md
  编码规范检查            第 4 节
```

---

## 1. 执行步骤

### Step 1: 确认项目名

询问用户项目名（`snake_case`，如 `my_sensor_app`）。若用户已提供则直接使用。
所有生成的文件路径以此为根目录。

### Step 2: 生成目录树

输出以下目录结构（替换 `<project_name>`）：

```
<project_name>/
├── 1_App/
│   ├── app_event.c
│   ├── app_event.h
│   ├── app_state.c
│   ├── app_state.h
│   └── main.c
├── 2_Middleware/
│   ├── protocol_xxx.c
│   └── protocol_xxx.h
├── 3_Driver/
│   ├── drv_xxx.c
│   └── drv_xxx.h
├── 4_HAL/
│   ├── hal_xxx.c
│   ├── hal_xxx.h
│   └── pin_config.h
└── config/
    └── sys_config.h
```

> 若用户提供了具体外设名（如 `spi`、`uart`），将 `xxx` 替换为该名称。
> 若用户有多个外设，在对应层复制一份 `drv_xxx` / `hal_xxx` 文件对。

### Step 3: 生成文件内容

加载 `references/boilerplate_templates.md`，按模板逐文件生成内容。
替换规则：
- `xxx` → 用户提供的外设/模块名（无则保留 `xxx`）
- `EVENT_A/B/C` → 用户描述的事件（无则保留）
- `<project_name>` → 实际项目名
- `<Author Name>` → 询问用户，或保留占位符
- `<YYYY-M-D>` → 今日日期

### Step 4: 提示用户

生成完毕后提示：
- 将所有 `xxx` 替换为实际外设名
- 将 `EVENT_A/B/C` 替换为实际业务事件
- `pin_config.h` 中填入实际引脚定义
- `sys_config.h` 中调整系统参数

---

## 2. 层职责速查

| 层 | 目录 | 职责 | 原则 |
|---|---|---|---|
| App | `1_App/` | 业务逻辑、状态机、系统入口 | 不直接访问硬件，可在PC编译验证 |
| Middleware | `2_Middleware/` | 纯算法模块（协议解析等） | 零硬件依赖，可独立单元测试 |
| Driver | `3_Driver/` | 外设功能逻辑，面向对象封装 | 依赖HAL接口，不操作寄存器 |
| HAL | `4_HAL/` | 寄存器操作、ISR入口 | 仅原子硬件操作，无业务逻辑 |
| Config | `config/` | 全局编译期常量 | 唯一允许出现系统级参数的地方 |

依赖方向（单向）：`1_App` → `3_Driver` → `4_HAL`，`2_Middleware` 独立。

---

## 3. 状态机模式摘要

表驱法核心结构（完整样板见 `references/boilerplate_templates.md`）：

```c
/* 状态与事件枚举 */
typedef enum { STATE_IDLE, STATE_RUNNING, STATE_ERROR, STATE_MAX } AppState;
typedef enum { EVENT_A, EVENT_B, EVENT_C, EVENT_MAX } AppEvent;

/* 状态转移表条目 */
typedef struct {
    AppState  currentState;
    AppEvent  event;
    AppState  nextState;
    void    (*action)(void);
} Transition;

/* 查表并派发 */
void app_state_process_event(AppEvent event);
```

状态转移表为 `static const Transition g_transitionTable[]`，新增状态/事件只需在表中加一行。

---

## 4. 编码规范检查清单

生成每个文件前，确认以下规则：

- [ ] 文件头：EternalChip 版权块（见模板）
- [ ] 函数注释：`@brief` / `@param[in]` / `@param[Out]` / `@return`
- [ ] 内部注释：`/** ... **/` 写在代码前一行，每个函数至少一条
- [ ] 命名规则：
  - 文件名/函数名：`snake_case`
  - 局部变量/参数：`lowerCamelCase`
  - 文件级/全局可变状态：`g_` + `lowerCamelCase`
  - 宏/枚举值：`UPPER_SNAKE_CASE`
  - `typedef` 类型名：`PascalCase`
- [ ] K&R 括号：函数左括号独占一行；`if/for/while` 左括号在行末
- [ ] 4空格缩进，禁止 TAB
- [ ] 所有注释使用中文
- [ ] 模板中不出现具体硬件名（LED、MOTOR、BUZZER 等）

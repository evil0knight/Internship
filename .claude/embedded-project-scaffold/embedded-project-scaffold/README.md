# embedded-project-scaffold

搭建标准四层嵌入式 C 项目，包含表驱状态机和 EternalChip 编码规范样板。

## 触发条件

- 新建项目 / 搭建框架 / 项目模板 / 项目骨架
- scaffold / 小项目 / 嵌入式项目结构
- 新建嵌入式工程 / 初始化项目
- 4层架构 / app层 / driver层 / hal层 / middleware层
- 表驱状态机 / state machine scaffold

## Claude 生成内容

给定项目名（如 `my_sensor_app`），Claude 创建：

```
my_sensor_app/
├── 1_App/          app_event、app_state（表驱状态机）、main
├── 2_Middleware/   protocol_xxx（与硬件无关的编解码）
├── 3_Driver/       drv_xxx（面向对象风格，仅依赖 HAL）
├── 4_HAL/          hal_xxx + pin_config（寄存器操作 + 中断入口）
└── config/         sys_config.h（全局编译期常量）
```

将 `xxx` 替换为实际外设名。多个外设则复制 `drv_xxx` / `hal_xxx` 文件对。

## 架构分层

| 层级 | 目录 | 规则 |
|---|---|---|
| 应用层 | `1_App/` | 不直接访问硬件；纯 C 逻辑，可在 PC 编译 |
| 中间件层 | `2_Middleware/` | 零硬件依赖；可独立单元测试 |
| 驱动层 | `3_Driver/` | 只调用 HAL；不访问寄存器 |
| HAL 层 | `4_HAL/` | 寄存器操作 + 中断入口；不含业务逻辑 |
| 配置层 | `config/` | 仅编译期常量 |

依赖方向：`1_App` → `3_Driver` → `4_HAL`。`2_Middleware` 独立。

## 状态机模式（表驱法）

`app_state.c` 维护一个 `static const Transition g_transitionTable[]`。新增跳转 = 新增一行，无需 `if/else` 链。

## 编码规范

所有生成文件遵循 `lixin-c-coding-standard-zh`：
- 每个文件带 EternalChip 文件头
- 每个函数带 `@brief` / `@param[in]` / `@param[Out]` / `@return`
- 非显而易见的代码行前加 `/** ... **/` 注释
- 文件/函数用 `snake_case`，局部变量用 `lowerCamelCase`，全局变量加 `g_` 前缀，宏/枚举用 `UPPER_SNAKE_CASE`，typedef 用 `PascalCase`
- K&R 大括号风格，4 空格缩进，英文注释

## Skill 文件结构

```
embedded-project-scaffold/
└── embedded-project-scaffold/
    ├── SKILL.md                        ← 自动加载
    ├── README.md                       ← 本文件
    └── references/
        └── boilerplate_templates.md    ← 完整文件模板
```

## 使用示例

> 用户：帮我新建一个小项目，有一个 SPI 传感器
>
> Claude：项目名是什么？（如 `spi_sensor_app`）
>
> 用户：spi_sensor_app
>
> Claude：生成 `spi_sensor_app/` 目录树，将 `xxx` 替换为 `spi`，输出所有文件内容。

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
固定7字节协议帧测试脚本
发送预定义的固定帧格式：
  开阀：BB 01 01 01 03 0D 0A
  关阀：BB 01 01 02 04 0D 0A
  停止：BB 01 01 00 02 0D 0A
"""

import serial
import time

# 预定义的3种固定命令帧
CMD_FRAME_OPEN  = bytes([0xBB, 0x01, 0x01, 0x01, 0x03, 0x0D, 0x0A])  # 开阀
CMD_FRAME_CLOSE = bytes([0xBB, 0x01, 0x01, 0x02, 0x04, 0x0D, 0x0A])  # 关阀
CMD_FRAME_STOP  = bytes([0xBB, 0x01, 0x01, 0x00, 0x02, 0x0D, 0x0A])  # 停止

def send_command_frame(ser, frame, name):
    """发送固定命令帧"""
    print(f"发送: {' '.join([f'{b:02X}' for b in frame])} ({name})")
    ser.write(frame)

def test_fixed_frame_commands():
    """测试固定7字节协议帧"""
    PORT = 'COM3'       # 修改为你的串口号
    BAUDRATE = 9600

    print("=" * 60)
    print("CAT1PRO 固定7字节协议帧测试")
    print("=" * 60)
    print(f"串口: {PORT}, 波特率: {BAUDRATE}")
    print("协议格式:")
    print("  开阀：BB 01 01 01 03 0D 0A")
    print("  关阀：BB 01 01 02 04 0D 0A")
    print("  停止：BB 01 01 00 02 0D 0A")
    print()

    try:
        ser = serial.Serial(PORT, BAUDRATE, timeout=1)
        print(f"✓ 串口 {PORT} 已打开\n")

        # ========== 测试1: 开阀 ==========
        print(">>> 测试1: 开阀命令")
        send_command_frame(ser, CMD_FRAME_OPEN, "开阀")
        print("    预期: 电机正转, LED闪烁, 触发OPENP限位后自动停止")
        time.sleep(4)

        # ========== 测试2: 关阀 ==========
        print("\n>>> 测试2: 关阀命令")
        send_command_frame(ser, CMD_FRAME_CLOSE, "关阀")
        print("    预期: 电机反转, LED闪烁, 触发CLOSEP限位后自动停止")
        time.sleep(4)

        # ========== 测试3: 停止 ==========
        print("\n>>> 测试3: 停止命令")
        send_command_frame(ser, CMD_FRAME_STOP, "停止")
        print("    预期: 电机停止, LED闪烁")
        time.sleep(2)

        # ========== 测试4: 错误的帧（应被拒绝）==========
        print("\n>>> 测试4: 发送错误的帧（CRC错误）")
        bad_frame = bytes([0xBB, 0x01, 0x01, 0x01, 0xFF, 0x0D, 0x0A])  # CRC错误
        print(f"发送: {' '.join([f'{b:02X}' for b in bad_frame])} (CRC错误)")
        ser.write(bad_frame)
        print("    预期: 无任何动作（帧不匹配）")
        time.sleep(2)

        # ========== 测试5: 无效帧 ==========
        print("\n>>> 测试5: 发送无效帧")
        invalid_frame = bytes([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
        print(f"发送: {' '.join([f'{b:02X}' for b in invalid_frame])} (无效帧)")
        ser.write(invalid_frame)
        print("    预期: 无任何动作（帧不匹配）")
        time.sleep(1)

        # ========== 测试6: 中途停止 ==========
        print("\n>>> 测试6: 开阀 → 1秒后停止")
        send_command_frame(ser, CMD_FRAME_OPEN, "开阀")
        print("    发送开阀命令...")
        time.sleep(1)
        send_command_frame(ser, CMD_FRAME_STOP, "停止")
        print("    发送停止命令 (中途停止)")
        time.sleep(1)

        # ========== 测试7: 快速连续命令 ==========
        print("\n>>> 测试7: 快速连续命令")
        commands = [
            (CMD_FRAME_OPEN, "开阀"),
            (CMD_FRAME_STOP, "停止"),
            (CMD_FRAME_CLOSE, "关阀"),
            (CMD_FRAME_STOP, "停止")
        ]
        for frame, name in commands:
            print(f"    发送 {name}")
            send_command_frame(ser, frame, name)
            time.sleep(0.8)

        # ========== 测试8: 干扰字节测试 ==========
        print("\n>>> 测试8: 发送干扰字节 + 正确命令")
        noise = bytes([0xAA, 0x55, 0xFF])  # 3字节干扰
        print(f"发送干扰: {' '.join([f'{b:02X}' for b in noise])}")
        ser.write(noise)
        time.sleep(0.1)
        send_command_frame(ser, CMD_FRAME_OPEN, "开阀")
        print("    预期: 干扰被丢弃，开阀命令正常执行")
        time.sleep(2)
        send_command_frame(ser, CMD_FRAME_STOP, "停止")
        time.sleep(1)

        ser.close()
        print(f"\n✓ 串口 {PORT} 已关闭")
        print("\n" + "=" * 60)
        print("测试完成！")
        print("=" * 60)

    except serial.SerialException as e:
        print(f"\n✗ 串口错误: {e}")
        print("\n请检查:")
        print(f"  1. 串口号是否正确 (当前: {PORT})")
        print("  2. 设备是否已连接")
        print("  3. 其他程序是否占用串口")

    except KeyboardInterrupt:
        print("\n\n⚠ 用户中断测试")
        if 'ser' in locals() and ser.is_open:
            ser.close()
            print(f"✓ 串口 {PORT} 已关闭")

if __name__ == "__main__":
    test_fixed_frame_commands()

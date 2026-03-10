#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
电机控制测试脚本
协议格式：[0xBB][Type][Len][Data...][CRC][0x0D][0x0A]
"""

import serial
import time

def calc_crc(data):
    """
    计算校验和（除去帧头和帧尾）
    参数: data - 从Type到Data的所有字节（不包括帧头0xBB）
    返回: CRC值（低8位）
    """
    return sum(data) & 0xFF

def send_motor_cmd(ser, cmd):
    """
    发送电机控制指令
    参数:
        ser - 串口对象
        cmd - 控制命令（0x00停止, 0x01开阀, 0x02关阀）
    """
    frame = [0xBB, 0x01, 0x01, cmd]  # 帧头 + Type + Len + Data
    crc = calc_crc(frame[1:])        # 计算CRC (从Type开始)
    frame += [crc, 0x0D, 0x0A]       # 添加CRC和帧尾

    cmd_names = {0x00: "停止", 0x01: "开阀(正转)", 0x02: "关阀(反转)"}
    cmd_name = cmd_names.get(cmd, f"未知(0x{cmd:02X})")

    print(f"发送命令: {cmd_name}")
    print(f"数据帧: {' '.join([f'{b:02X}' for b in frame])}")
    ser.write(bytes(frame))
    print()

def main():
    # 配置串口（根据你的实际情况修改）
    PORT = 'COM3'        # Windows: 'COM3', Linux: '/dev/ttyUSB0'
    BAUDRATE = 9600

    print("=" * 60)
    print("CAT1PRO 电机控制测试程序")
    print("=" * 60)
    print(f"串口配置: {PORT}, {BAUDRATE} baud")
    print()

    try:
        # 打开串口
        ser = serial.Serial(PORT, BAUDRATE, timeout=1)
        print(f"串口 {PORT} 已打开\n")

        # 测试序列
        print(">>> 测试1: 开阀（正转）")
        send_motor_cmd(ser, 0x01)  # CMD_OPEN
        time.sleep(5)  # 等待电机到位（或收到限位信号）

        print(">>> 测试2: 关阀（反转）")
        send_motor_cmd(ser, 0x02)  # CMD_CLOSE
        time.sleep(5)  # 等待电机到位

        print(">>> 测试3: 停止")
        send_motor_cmd(ser, 0x00)  # CMD_STOP
        time.sleep(2)

        print(">>> 测试4: 开阀 → 立即停止（测试中途停止）")
        send_motor_cmd(ser, 0x01)  # CMD_OPEN
        time.sleep(1)  # 等待1秒
        send_motor_cmd(ser, 0x00)  # CMD_STOP
        time.sleep(2)

        # 关闭串口
        ser.close()
        print(f"\n串口 {PORT} 已关闭")
        print("测试完成！")

    except serial.SerialException as e:
        print(f"串口错误: {e}")
        print(f"请检查:\n1. 串口号是否正确 ({PORT})\n2. 设备是否已连接\n3. 其他程序是否占用串口")
    except KeyboardInterrupt:
        print("\n\n用户中断测试")
        if 'ser' in locals() and ser.is_open:
            ser.close()
            print(f"串口 {PORT} 已关闭")

if __name__ == "__main__":
    main()

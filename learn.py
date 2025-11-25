# auto_task_every_5s.py
import schedule
import time
from datetime import datetime

def my_task():
    """你的任务内容"""
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{current_time}] ✅ 任务正在执行...")

# 设置每 5 秒执行一次
schedule.every(5).seconds.do(my_task)

print("⏱️  定时任务已启动，每 5 秒执行一次...")
print("（按 Ctrl+C 可停止）")

# 持续运行调度器
while True:
    schedule.run_pending()
    time.sleep(1)  # 每秒检查一次，避免 CPU 占用过高


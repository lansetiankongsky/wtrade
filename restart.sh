#!/bin/bash
# 文件名：restart.sh   （放在项目根目录）

echo "========== 开始部署 =========="

# 1. 杀掉旧进程
echo "停止旧进程..."
pkill -f webapp.py || echo "无旧进程"

# 2. 切换目录
cd /home/wtrade/w-trade

# 3. 激活虚拟环境（没有就自动创建）
[ ! -d "venv" ] && python3 -m venv venv
source venv/bin/activate


"""
# 4. 升级 pip + 安装依赖（优先用本地缓存，超快）
echo "安装 Python 依赖..."
pip install --upgrade pip

# 优先用本地 wheel 缓存安装（最快）
if [ -d "wheelhouse" ]; then
    pip install --no-index --find-links=wheelhouse -r requirements.txt
else
    # 缓存不存在就走国内镜像
    pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
fi

# 5. 启动程序（推荐用 gunicorn 或 uvicorn 代替直接 python）
echo "启动应用..."
# 示例：如果你是 FastAPI
# nohup uvicorn main:app --host 0.0.0.0 --port 8000 > app.log 2>&1 &

# 示例：如果你是 Flask
# nohup gunicorn -w 4 -b 0.0.0.0:8000 app:app > app.log 2>&1 &
"""


# 简单项目还是直接 python
nohup python3 webapp.py > app.log 2>&1 &

echo "部署完成！时间：$(date)"
echo "查看日志：tail -f app.log"
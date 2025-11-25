from flask import Flask

# 创建 Flask 应用实例
app = Flask(__name__)

# 定义一个“路由”：当用户访问 / 时，执行下面函数
@app.route('/')
def home():
    return "nihao,chenyuqing"

# 再定义一个 API 接口
@app.route('/time')
def get_time():
    from datetime import datetime
    return {"current_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S")}

# 启动应用11c 2233add
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False) 
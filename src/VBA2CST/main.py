# 该程序用于对CST内的对象操作相关的VBA代码进行翻译

# 开始定义全局对象列表
BigObject = [
                'DeleteResults',
                'StoreDoubleParameter',
                'ResetAll'
            ]
# 完成全局对象列表定义

# 载入文件，写文件准备
with open('code.bas', 'r') as f:
    dates = f.readlines()

fo = open('res.m', 'w')
# 完成文件载入

# 按行解析文件
for line in dates:

# 完成文件解析

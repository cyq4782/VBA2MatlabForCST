# 该程序用于对CST内的对象操作相关的VBA代码进行翻译

import with_translate
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
ReadyToWrite = []
# 完成文件载入
with_translate.translate_with('  .x "12580"')
# 按行解析文件
With_flag = False  # 将with块解析标志初始置为False，表示未开始With块解析模式
for line in dates:
    line_ele = line.split()
    if ('With' in line_ele) & ~('End' in line_ele):
        # 对With进行解析并翻译该行
        BigObjName = line_ele[1]
        With_flag = True
        temp_str = '{ObjectName_mat} = invoke(mws, \'{ObjectName_VBA}\');'.format(ObjectName_mat=BigObjName,
                                                                                  ObjectName_VBA=BigObjName)
        ReadyToWrite.append(BigObjName)
#   if With_flag:
#   从左起第一个空格开始进行分割
# 完成文件解析

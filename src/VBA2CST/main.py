# 该程序用于对CST内的对象操作相关的VBA代码进行翻译
import translate
# 开始定义全局对象列表
BigObject = [
                'DeleteResults',
                'StoreDoubleParameter',
                'ResetAll'
            ]
# 完成全局对象列表定义

# 载入文件，写文件准备
with open('code3.txt', 'r') as f:
    dates = f.readlines()
fo = open('res.m', 'w')
ReadyToWrite = []
BigObjName = ''
# 完成文件载入
# 按行解析文件
With_flag = False  # 将with块解析标志初始置为False，表示未开始With块解析模式
for line in dates:
    line_ele = line.split()
    if ('With' in line_ele) & ~('End' in line_ele):
        # 对With进行解析并翻译该行
        BigObjName = line_ele[1]
        With_flag = True
        temp_str = '{ObjectName_mat} = invoke(mws, \'{ObjectName_VBA}\');\n'.format(ObjectName_mat=BigObjName,
                                                                                    ObjectName_VBA=BigObjName)
        ReadyToWrite.append(temp_str)
    if (With_flag == True) & (translate.is_annotation(line) == False) & ~('With' in line_ele):
        # 在with块内且该行不为注释或空行，需要解析
        line_ele = translate.translate_with(line)
        if line_ele[0] == 'NoThing':
            # 符合with块的一般语法，则按照方法进行解析
            # temp_str = 'invoke({FatherObjectName_mat}, \'{ActionName_mat}\', \'{par1}\');\n'\
            #    .format(FatherObjectName_mat=BigObjName, ActionName_mat=line_ele[1], par1=line_ele[2])
            temp_str = 'invoke({FatherObjectName_mat}, \'{ActionName_mat}\'' .format(FatherObjectName_mat=BigObjName,
                                                                                     ActionName_mat=line_ele[1])
            for i in range(2, len(line_ele)):
                temp_str = temp_str + ',\'{par}\''.format(par=line_ele[i])
            temp_str = temp_str + ');\n'
            ReadyToWrite.append(temp_str)
    if (With_flag == True) & ('End' in line_ele) & ('With' in line_ele):
        # 解析到End With语句行，跳过不解析
        With_flag = False
    if ~('With' in line_ele) & (With_flag == False) & (translate.is_annotation(line) == False):
        # 不在with块内的语句，按照普通方法进行解析
        line_ele = translate.translate_with(line)
        if line_ele[0] == 'NoThing':
            temp_str = 'invoke({FatherObjectName_mat}, \'{ActionName_mat}\''.format(FatherObjectName_mat='mws',
                                                                                    ActionName_mat=line_ele[1])
            for i in range(2, len(line_ele)):
                temp_str = temp_str + ',\'{par}\''.format(par=line_ele[i])
            temp_str = temp_str + ');\n'
            ReadyToWrite.append(temp_str)
        else:
            temp_str = '{ObjectName_mat} = invoke(mws, \'{ObjectName_VBA}\');\n'.format(ObjectName_mat=line_ele[0],
                                                                                        ObjectName_VBA=line_ele[0])
            ReadyToWrite.append(temp_str)
            temp_str = 'invoke({FatherObjectName_mat}, \'{ActionName_mat}\''.format(FatherObjectName_mat=line_ele[0],
                                                                                    ActionName_mat=line_ele[1])
            for i in range(2, len(line_ele)):
                temp_str = temp_str + ',\'{par}\''.format(par=line_ele[i])
            temp_str = temp_str + ');\n'
            ReadyToWrite.append(temp_str)
    if translate.is_annotation(line):
        # 将注释保留并转成Matlab的格式
        temp_str = line
        temp_str = temp_str.replace('\'', '% ')
        ReadyToWrite.append(temp_str)
fo.writelines(ReadyToWrite)
# 完成文件解析

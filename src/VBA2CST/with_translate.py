# 本文件是with语句块解析模块
def translate_with(line):
    # 本函数用于对With语句块内的语句进行解析，不包含With与End With
    res = ['NoThing']
    line = line.strip()
    point = line.find('.')
    if point != 0:
        res[0] = line[0:point-1]
    blank_space = line.find(' ')
    res.append(line[point+1:blank_space])
    line = line[blank_space+1:]
    middle_res = line.split('"')
    for ele in middle_res:
        if len(ele.strip()) != 0:
            res.append('"' + ele + '"')
    return res

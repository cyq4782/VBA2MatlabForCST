# 本文件是语句解析模块
def translate_with(line:str):
    # 本函数用于对With语句块内的语句进行解析，不包含With与End With
    res = ['NoThing']
    line = line.strip()
    point = line.find('.')
    if (line.find('"') >= 0) | (line.find(' ') >= 0):
        # 对含参方法进行解析
        if point != 0:
            res[0] = line[0:point]
        blank_space = line.find(' ')
        res.append(line[point+1:blank_space])
        line = line[blank_space+1:]
        middle_res = line.split('"')
        if line.find('""') >= 0:
            res.append('')
        for ele in middle_res:
            if (len(ele.strip()) != 0) & (ele.strip() != ','):
                res.append(ele)
    else:
        # 对无参方法进行解析
        res.append(line[point+1:])
    return res


def is_annotation(line:str):
    # 本函数用于判断传入语句是否为注释或空语句
    if ((line.strip()).startswith("'")) | (len(line.strip()) == 0):
        return True
    else:
        return False

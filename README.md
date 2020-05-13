# VBA2MatlabForCST
此程序用于将CST内的VBA代码转化为Matlab代码  
仅能转化CST的对象操作部分，其他部分无法转化  

基本思路：  
按行解析可以被解析的部分，余下行用%进行注释  

算法：  
1.遇到with块直接进行解析  
2.遇到全局方法直接进行解析  
with块的基本解析方法：  
boundary = invoke(mws, 'Boundary');  
invoke(boundary, 'Xmin', 'electric');%常用的值：”electric””magnetic””open””expanded open””periodic”"conducting wall"等  
invoke(boundary, 'Xmax', 'electric');  
invoke(boundary, 'Ymin', 'electric');  
invoke(boundary, 'Ymax', 'electric');  
invoke(boundary, 'Zmin', 'electric');  
invoke(boundary, 'Zmax', 'expanded open');  
invoke(boundary, 'Xsymmetry', 'none');%可以是”electric””magnetic””none”  
invoke(boundary, 'Ysymmetry', 'none');  
invoke(boundary, 'Zsymmetry', 'none');  
invoke(boundary, 'ApplyInAllDirections', 'True');  
release(boundary);  
----------------------------------------  
With Boundary  
     .Xmin "expanded open"  
     .Xmax "expanded open"  
     .Ymin "expanded open"  
     .Ymax "expanded open"  
     .Zmin "expanded open"  
     .Zmax "expanded open"  
     .Xsymmetry "none"  
     .Ysymmetry "none"  
     .Zsymmetry "none"  
End With  
--------------------------------------  

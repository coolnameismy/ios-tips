## IOS预编译pch文件的使用

意义：可以加快项目编译速度，常用的很少修改的方法和头文件放在里面比较好

加入方法：添加新文件-其他-PCH文件

配置预编译：

````
Bulid settings -- Apple LLVM 6.0 - Language 
1：Percompile Prefix Header 设置为YES
2: Prefix Header 设置为: $(SRCROOT)/{路径名}/{文件名}.pch

$(SRCROOT)/{PlantAssistant}/PrefixHeader.pch

````
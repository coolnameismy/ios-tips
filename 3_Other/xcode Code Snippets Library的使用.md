>	Code Snippets Library可以帮你保存常用的代码段或自动完成的代码段


## 新建和使用

以属性代码段为例：

-	1:写代码 ```` @property (nonatomic, copy) NSString *<#name#>; ````
-	2:代码拖到左下侧的Code Snippets中，并设置Snippets信息
-	3：输入步骤2中设置的completion shortcut，回车便可自动完成步骤1写的代码

<#name#>：可以输入参数的地方

## 新建snippets的属性说明

````
1.Title：Code Snippets的标题；
2.Summary：Code Snippets的描述文字；
3.Platform：可以使用Code Snippets的平台，有IOS/OS X/All三个选项
4.Language：可以在哪些语言中使用该Code Snippets
5.Completion Shortcut：出现代码的短字母
6.Completion Scopes:可以在哪些文件中使用当前Code Snippets，比如全部位置，头文件中等，当然可以添加多个支持的位置。
7.最后的一个大得空白区域是对Code Snippets的效果预览
````

##  snippets的备份

备份位置： ```` ~/Library/Developer/Xcode/UserData/CodeSnippets ````


##  常用的snippets

我常用的snippets

````
代码: __weak __typeof(self) weakSelf = self;
名称:weakify
快捷键:weakify
类型:code expression

代码:__strong __typeof(weakSelf) strongSelf = weakSelf;
名称:weakify
快捷键:weakify
类型:code expression

````

更多xcode snippets 请看别人整理好的仓库，推荐一个最全的 [https://github.com/Xcode-Snippets/Objective-C](https://github.com/Xcode-Snippets/Objective-C)



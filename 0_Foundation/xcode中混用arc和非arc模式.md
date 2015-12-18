## xcode中混用arc和非arc模式
>  Xcode 项目中我们可以使用 ARC 和非 ARC 的混合模式。

如果你的项目使用的非 ARC 模式，则为 ARC 模式的代码文件加入 -fobjc-arc 标签。

如果你的项目使用的是 ARC 模式，则为非 ARC 模式的代码文件加入 -fno-objc-arc 标签。

## 添加标签的位置

打开：你的target -> Build Phases -> Compile Sources.

双击对应的 *.m 文件

在弹出窗口中输入上面提到的标签 -fobjc-arc / -fno-objc-arc

点击 done 保存
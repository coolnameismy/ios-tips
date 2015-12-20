

## 为什么顶部会留言一段空白，如何处理
 self.automaticallyAdjustsScrollViewInsets = NO;


## 去除点击样式

````objc

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{

//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

//    [cell setSelectionStyle:	]; （这种是没有点击后的阴影效果)

}

````

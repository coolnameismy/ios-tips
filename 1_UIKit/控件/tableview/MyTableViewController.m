
//
//  MyTableViewController.m
//  LearningTableView
//
//  Created by 刘彦玮 on 15/2/8.
//  Copyright (c) 2015年 刘彦玮. All rights reserved.
//

#import "MyTableViewController.h"
#import "TableViewCell1.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[NSArray alloc] initWithObjects:@"hehe",@"asda",@"cvd",@"wqew",@"ggfd",@"bgjw",@"adsad",nil];
    self.view.frame = CGRectMake(0, 20, 320, 516);
    self.flilterData = [NSArray arrayWithArray:self.data];
    
     self.tableView.contentOffset = CGPointMake(0, -50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.flilterData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *tableCellIdentifier = @"name";
    TableViewCell1 *cell = (TableViewCell1 *)[tableView dequeueReusableCellWithIdentifier:tableCellIdentifier];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TableViewCell1" owner:self options:nil];
        for(id oneObject in nib){
            if([oneObject isKindOfClass:[TableViewCell1 class]]){
                cell = (TableViewCell1 *)oneObject;
            }
        }
    }
    cell.lable1.text = [self.flilterData objectAtIndex:indexPath.row];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark 搜索查询
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
   // NSLog(@"%@",searchBar.text);
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
      NSLog(@"%@",searchBar.text);
    [self filterContentForSearchbar:searchText];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{

      NSLog(@"cancel");
    
}

-(void)filterContentForSearchbar:(NSString *)searchText{
    if([searchText length]==0){
        //查询所有
        self.flilterData = [NSArray arrayWithArray:self.data];
    }
    else{
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",searchText];
        self.flilterData = [self.flilterData filteredArrayUsingPredicate:predicate];
                                  
        
    }
}

#pragma mark 索引列表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //set color
    tableView.sectionIndexColor = [UIColor redColor];
    tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    
    NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
    for(char c = 'A';c<='Z';c++)
        
        [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
    
    return toBeReturned;
    
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //    [tableView setContentOffset:CGPointMake(0,41*(count-1)-20) animated:YES];
    return 5;
    
}
@end

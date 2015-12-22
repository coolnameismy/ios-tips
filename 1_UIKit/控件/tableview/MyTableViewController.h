//
//  MyTableViewController.h
//  LearningTableView
//
//  Created by 刘彦玮 on 15/2/8.
//  Copyright (c) 2015年 刘彦玮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController<UISearchDisplayDelegate,UISearchBarDelegate>

@property NSArray *data ;
@property NSArray *flilterData ;
@property UITableViewCell *cell;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

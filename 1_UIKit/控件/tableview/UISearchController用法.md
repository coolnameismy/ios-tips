## UISearchController用法

>    UISearchController和UISearchBar的区别，一个是全屏搜索，一个是搜索框搜索。


### 在含有UITableView的controller中使用UISearchController

````objc

   -   .h文件声明：
   		@property (strong, nonatomic) IBOutlet UITableView *tableView;
		@property (nonatomic, strong) UISearchController *searchController;
		使用委托UISearchResultsUpdating
		页面中添加UITableView

````

````objc

   -   .m文件

   		- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view.
	    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
	    self.searchController.searchResultsUpdater = self;
	    [self.searchController.searchBar sizeToFit];
	    self.tableView.tableHeaderView = self.searchController.searchBar;
	    self.definesPresentationContext = YES;
	    
		}

		实现UISearchResultsUpdating 委托方法
		#pragma mark - UISearchResultsUpdating
		- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
		    NSLog(@"Entering:%@",searchController.searchBar.text);
		}

````

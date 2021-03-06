//
//  QSSearchDemo6.m
//  QSSearchDemo
//
//  Created by Qson on 2018/7/13.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchDemo6.h"

@interface QSSearchDemo6 () <QSSearchBarDelegate>
@property (nonatomic, weak) QSSearchBar *searchBar;
@end

@implementation QSSearchDemo6


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNav];
    [self searchBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.width, self.view.height);
}

- (void)setupNav
{
    self.navigationController.navigationBar.barTintColor = QSColor(239, 239, 239, 1.0);
}

#pragma mark - QSSearchBarDelegate
- (void)searchBar:(QSSearchBar *)searchBar beginSearchWord:(NSString *)word
{
    QSLog(@"%s -- 关键字:%@",__func__,word);
    
    self.dataArray = @[@{@"title":@"SearchDemo结果1"},
                       @{@"title":@"SearchDemo结果2"}];
}

- (void)clearSearch:(QSSearchBar *)searchBar
{
    QSLog(@"%s",__func__);
    self.dataArray = @[];
}

#pragma mark - 事件
- (void)popViewController
{
    [self.searchBar endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didClickSearchBar
{
    QSLog(@"%s",__func__);
}

#pragma mark - 懒加载
- (QSSearchBar *)searchBar
{
    if (_searchBar == nil) {

        CGRect frame = CGRectMake(0, kNavigationBarHeight, screenWidth, kSearchBarH);
        QSSearchBar *customSearchBar = [[QSSearchBar alloc] initWithFrame:frame];
        customSearchBar.topMargin = 0;
        customSearchBar.delegate = self;
        
        customSearchBar.searchBarItem = ({
            QSSearchBarSearchItem *item = [QSSearchBarSearchItem defaultSearchBarSearchItem];
            item.target = self;
            item.action = @selector(didClickSearchBar);
            item;
        });
        
        [self.view addSubview:customSearchBar];
        _searchBar = customSearchBar;
    }
    return _searchBar;
}

@end

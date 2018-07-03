//
//  QSSearchDemo1.m
//  QSSearchDemo
//
//  Created by Qson on 2018/5/24.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchDemo1.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface QSSearchDemo1 () <QSSearchBarDelegate>
@property (nonatomic, weak) QSSearchBar *searchBar;
@end

@implementation QSSearchDemo1

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.searchBar becomeFirstResponder];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), self.view.width, self.view.height);
}

- (void)setupNav
{
    self.fd_prefersNavigationBarHidden = YES;
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

#pragma mark - 懒加载
- (QSSearchBar *)searchBar
{
    if (_searchBar == nil) {
        QSSearchBar *customSearchBar = [QSSearchBar defaultSearchBar];
        customSearchBar.delegate = self;
        [self.view addSubview:customSearchBar];
        _searchBar = customSearchBar;
    }
    return _searchBar;
}

@end

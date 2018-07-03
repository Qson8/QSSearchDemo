//
//  QSSearchDemo4.m
//  QSSearchDemo
//
//  Created by Qson on 2018/7/3.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchDemo4.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface QSSearchDemo4 ()<QSSearchBarDelegate>
@property (nonatomic, weak) QSSearchBar *searchBar;
@end

@implementation QSSearchDemo4


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
        
        UIImage *image = [UIImage imageWithImageName:@"goback_search"];
        id target = self;
        SEL action = @selector(popViewController);
        UIEdgeInsets marginEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        UIEdgeInsets contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        customSearchBar.leftButtonItem = ({
            QSSearchBarButtonItem *item = [QSSearchBarButtonItem defaultSearchBarButtonItem];
            item.image = image;
            item.target = target;
            item.action = action;
            item.marginEdge = marginEdgeInsets;
            item.contentEdge = contentEdgeInsets;
            item;
        });

        [self.view addSubview:customSearchBar];
        _searchBar = customSearchBar;
    }
    return _searchBar;
}
@end

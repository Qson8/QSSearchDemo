//
//  QSSearchDemo2.m
//  QSSearchDemo
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchDemo2.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface QSSearchDemo2 () <QSSearchBarDelegate>
@property (nonatomic, weak) QSSearchBar *searchBar;
@end

@implementation QSSearchDemo2

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
        
        NSString *title = @"取消";
        id target = self;
        SEL action = @selector(popViewController);
        UIColor *color = QSColor(51, 51, 51, 1.0);
        UIFont *font = [UIFont systemFontOfSize:16];
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        customSearchBar.rightButtonItem = ({
            QSSearchBarButtonItem *item = [QSSearchBarButtonItem defaultSearchBarButtonItem];
            item.title = title;
            item.target = target;
            item.action = action;
            item.titleColor = color;
            item.titlerFont = font;
            item.marginEdge = edgeInsets;
            item;
        });
        
        [self.view addSubview:customSearchBar];
        _searchBar = customSearchBar;
    }
    return _searchBar;
}
@end

//
//  QSSearchDemo7.m
//  QSSearchDemo
//
//  Created by Qson on 2018/8/8.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchDemo7.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface QSSearchDemo7 ()
@property (nonatomic, weak) QSSearchBar *searchBar;
@end

@implementation QSSearchDemo7

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNav];
    [self searchBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
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

#pragma mark - 事件

- (void)didClickSearchBar
{
    QSLog(@"%s",__func__);
}

- (void)didClickLeftBtn
{
    QSLog(@"%s",__func__);
}

- (void)didClickRightBtn
{
    QSLog(@"%s",__func__);
}

#pragma mark - 懒加载
- (QSSearchBar *)searchBar
{
    if(_searchBar == nil) {
        QSSearchBar *searchBar = [QSSearchBar defaultSearchBar];
        searchBar.backgroundColor = [UIColor redColor];
        
        searchBar.searchBarItem = ({
            QSSearchBarSearchItem *item = [QSSearchBarSearchItem defaultSearchBarSearchItem];
            item.placeholder = @"疫苗危机";
            item.placeholderColor = [UIColor whiteColor];
            item.backgroundColor = QSColor(255, 255, 255, 0.3);
            item.cornerRadius = 34 * 0.5;
            item.searchContentHeight = 34;
            item.searchBarMarginEdge = UIEdgeInsetsMake(3, 0, 7, 0);
            item.target = self;
            item.action = @selector(didClickSearchBar);
            
            item;
        });
        
        UIEdgeInsets edge = UIEdgeInsetsMake(0, 15, 0, 16);
        searchBar.rightButtonItem = ({
            QSSearchBarButtonItem *item = [QSSearchBarButtonItem defaultSearchBarButtonItem];
            item.image = [UIImage imageWithImageName:@"mirror_search"];
            item.focusImage = [UIImage imageWithImageName:@"mirror_search"];
//            item.title = @"发布";
//            item.titlerFont = [UIFont systemFontOfSize:10];
//            item.titleColor = [UIColor whiteColor];
            item.contentEdge = edge;
            item.target = self;
            item.action = @selector(didClickRightBtn);
            
            item.style = QSButtonEdgeInsetsStyleTop;
            item;
        });
        
        edge = UIEdgeInsetsMake(0, 19, 0, 18);
        searchBar.leftButtonItem = ({
            QSSearchBarButtonItem *item = [QSSearchBarButtonItem defaultSearchBarButtonItem];
            item.image = [UIImage imageWithImageName:@"mirror_search"];
            item.focusImage = [UIImage imageWithImageName:@"mirror_search"];
            item.title = @"未登录";
            item.titlerFont = [UIFont systemFontOfSize:10];
            item.titleColor = [UIColor whiteColor];
            item.contentEdge = edge;
            item.target = self;
            item.action = @selector(didClickLeftBtn);
            
            item.style = QSButtonEdgeInsetsStyleDefault;
            item;
        });
        
        [self.view addSubview:searchBar];
        _searchBar = searchBar;
    }
    return _searchBar;
}

@end

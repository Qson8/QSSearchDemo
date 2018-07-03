//
//  QSBaseViewController.m
//  QSSearchDemo
//
//  Created by Qson on 2018/5/24.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSBaseViewController.h"

@interface QSBaseViewController () <UITableViewDelegate,UITableViewDataSource>
@end

@implementation QSBaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tableView.frame = self.view.bounds;
}

#pragma mark - 初始化
- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"SearchDemo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        cell.textLabel.text = self.dataArray[indexPath.row][@"title"];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if(_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] init];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

@end

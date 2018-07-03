//
//  QSBaseViewController.h
//  QSSearchDemo
//
//  Created by Qson on 2018/5/24.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSMacro.h"

@interface QSBaseViewController : UIViewController
@property (nonatomic, assign,null_resettable) UITableView *tableView;
@property (nonatomic, strong) NSArray * _Nullable dataArray;
@end

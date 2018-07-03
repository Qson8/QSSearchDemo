//
//  QSSearchBar.h
//  SydneyToday
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reser
//

#import <UIKit/UIKit.h>
@class QSSearchBar,QSSearchBarButtonItem,QSSearchBarSearchItem;

@protocol QSSearchBarDelegate <NSObject>
@optional
/// 开始搜索
- (void)searchBar:(QSSearchBar *_Nonnull)searchBar beginSearchWord:(NSString *_Nonnull)word;
/// 清空搜索内容
- (void)clearSearch:(QSSearchBar *_Nullable)searchBar;
@end

@interface QSSearchBar : UIView

@property (nonatomic, weak) id <QSSearchBarDelegate> delegate;
/// 搜索框模型
@property(nullable, nonatomic,strong) QSSearchBarSearchItem *searchBarItem;       // default is nil
/// 左边(返回)按钮模型
@property(nullable, nonatomic,strong) QSSearchBarButtonItem *leftButtonItem;       // default is nil
/// 右边(取消)按钮模型
@property(nullable, nonatomic,strong) QSSearchBarButtonItem *rightButtonItem;       // default is nil
/// 分割线颜色
@property (nonatomic, strong) UIColor *lineColor;
/// 顶部间距
@property (nonatomic, assign) CGFloat topMargin;

+ (instancetype _Nullable )defaultSearchBar;
- (void)becomeFirstResponder;
@end

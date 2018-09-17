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
- (void)searchBar:(QSSearchBar *_Nonnull)searchBar beginSearchWord:(NSString * _Nullable)word;
/// 清空搜索内容
- (void)clearSearch:(QSSearchBar *_Nonnull)searchBar;
/// 搜索框文字发生变化时调用
- (void)searchBar:( QSSearchBar * _Nonnull )searchBar textDidChange:(NSString * _Nullable)searchText;
@end

@interface QSSearchBar : UIView

@property (nonatomic, weak, nullable) id <QSSearchBarDelegate> delegate;
/// 搜索框模型
@property(nullable, nonatomic,strong) QSSearchBarSearchItem *searchBarItem;       // default is nil
/// 左边(返回)按钮模型
@property(nullable, nonatomic,strong) QSSearchBarButtonItem *leftButtonItem;       // default is nil
/// 右边(取消)按钮模型
@property(nullable, nonatomic,strong) QSSearchBarButtonItem *rightButtonItem;       // default is nil

/// 分割线颜色
@property (nonatomic, strong, nullable) UIColor *lineColor;
/// 顶部间距
@property (nonatomic, assign) CGFloat topMargin;

+ (instancetype _Nullable )defaultSearchBar;

/**
 传入、更新搜索框内的关键字
 @warning 内部会给模型模型，以及设置界面显示，只能外界调用，切忌不可在textFieldDidChange或UITextField代理方法内调用它，否则会出现输入字符错乱问题
 @param searchWord 关键字
 */
- (void)setSearchWord:(NSString * _Nullable)searchWord;
- (void)becomeFirstResponder;
@end

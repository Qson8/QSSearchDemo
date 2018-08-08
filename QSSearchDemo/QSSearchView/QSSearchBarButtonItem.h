//
//  QSSearchBarButtonItem.h
//  QSSearchDemo
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"

@interface QSSearchBarButtonItem : NSObject
@property (nonatomic,copy)      NSString *title;       // default is nil
@property (nonatomic, strong)   UIColor *titleColor;
@property (nonatomic, strong)   UIFont *titlerFont;
@property (nonatomic, strong)   UIColor *backgroundColor;
@property (nonatomic, assign)   CGFloat cornerRadius;
@property (nonatomic, copy)     UIImage *image;         // default is nil
@property (nonatomic,strong)    UIView  *customView;    // default is nil
@property (nonatomic)           SEL     action;         // default is NULL
@property (nonatomic,weak)      id      target;         // default is nil

/// 图片标题布局属性
@property (nonatomic, assign) QSButtonEdgeInsetsStyle style; // 图片布局样式
@property (nonatomic, assign) CGFloat imageTitleSpace; // 图片和标题间距

@property (nonatomic, assign) UIEdgeInsets contentEdge;  // 内部间距 （设置左右生效，上下不生效）
@property (nonatomic, assign) UIEdgeInsets marginEdge;  // 外部间距 （设置左右生效，上下不生效）
@end

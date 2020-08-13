//
//  QSSearchBarButtonItem.h
//  QSSearchDemo
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Layout.h"

@interface QSSearchBarButtonItem : NSObject
@property (nonatomic,strong, nullable)    UIView  *customView;    // default is nil (有值，其他属性失效)

@property (nonatomic,copy,nullable)      NSString *title;       // default is nil
@property (nonatomic, strong,nullable)   UIColor *titleColor;
@property (nonatomic, strong,nullable)   UIFont *titlerFont;
@property (nonatomic, strong,nullable)   UIColor *backgroundColor;
@property (nonatomic, assign)   CGFloat cornerRadius;
@property (nonatomic, copy,nullable)     UIImage *image;         // default is nil， UIControlStateNormal状态下的图片
@property (nonatomic, copy,nullable)     UIImage *focusImage;    // default is nil， UIControlStateHighlighted状态下的图片
@property (nonatomic,nullable)           SEL     action;         // default is NULL
@property (nonatomic,weak,nullable)      id      target;         // default is nil

/// 图片标题布局属性
@property (nonatomic, assign) QSButtonEdgeInsetsStyle style; // 图片布局样式
@property (nonatomic, assign) CGFloat imageTitleSpace; // 图片和标题间距

@property (nonatomic, assign) UIEdgeInsets contentEdge;  // 内部间距 （设置左右生效，上下不生效）
@property (nonatomic, assign) UIEdgeInsets marginEdge;  // 外部间距 （设置左右生效，上下不生效）
@end

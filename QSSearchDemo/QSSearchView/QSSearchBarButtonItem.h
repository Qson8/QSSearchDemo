//
//  QSSearchBarButtonItem.h
//  QSSearchDemo
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSSearchBarButtonItem : NSObject
@property(nullable, nonatomic,copy)     NSString *title;       // default is nil
@property (nonatomic, strong)           UIColor *titleColor;
@property (nonatomic, strong)           UIFont *titlerFont;
@property(nullable, nonatomic,copy)     UIImage *image;       // default is nil
@property(nullable, nonatomic,strong)  __kindof UIView     *customView;       // default is nil
@property(nullable, nonatomic)         SEL                  action;           // default is NULL
@property(nullable, nonatomic,weak)    id                   target;           // default is nil
@property (nonatomic, assign) UIEdgeInsets contentEdge;
@end

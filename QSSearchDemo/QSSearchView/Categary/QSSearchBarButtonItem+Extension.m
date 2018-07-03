//
//  QSSearchBarButtonItem+Extension.m
//  QSSearchDemo
//
//  Created by Qson on 2018/7/3.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchBarButtonItem+Extension.h"
#import "QSMacro.h"

@implementation QSSearchBarButtonItem (Extension)

+ (instancetype)defaultSearchBarButtonItem
{
    id target = nil;
    SEL action = nil;
    UIColor *color = QSColor(51, 51, 51, 1.0);
    UIFont *font = [UIFont systemFontOfSize:16];
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    return ({
        QSSearchBarButtonItem *item = [[self alloc] init];
        item.target = target;
        item.action = action;
        item.titleColor = color;
        item.titlerFont = font;
        item.marginEdge = edgeInsets;
        item;
    });
}

@end

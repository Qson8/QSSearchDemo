//
//  QSSearchBarSearchItem+Extension.m
//  QSSearchDemo
//
//  Created by Qson on 2018/7/3.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSearchBarSearchItem+Extension.h"
#import "QSMacro.h"

@implementation QSSearchBarSearchItem (Extension)

+ (instancetype)defaultSearchBarSearchItem
{
    NSString *title = @"";
    NSString *placeholder = @"请输入关键词...";
    NSInteger lengthMax = 0;
    UIImage *image = [UIImage imageWithImageName:@"mirror_search"];
    UIColor *color = QSColor(51, 51, 51,1);
    UIColor *placeholderColor = QSColor(153, 153, 153,1.0);
    UIFont *font = [UIFont systemFontOfSize:14];
    UIFont *placeholderFont = [UIFont systemFontOfSize:14];
    CGFloat cornerRadius = 5.0;
    UIColor *backgroundColor = QSColor(239, 239, 239, 1.0);
    UIEdgeInsets leftImageViewEdge = UIEdgeInsetsMake(0, 7, 0, 5);
    UIEdgeInsets searchBarMarginEdge = UIEdgeInsetsMake((kSearchBarH - kSearchBarTextH) * 0.5, 10, (kSearchBarH - kSearchBarTextH) * 0.5, 10);
    CGFloat searchContentHeight = kSearchBarTextH;
    
    return  ({
        QSSearchBarSearchItem *item = [[QSSearchBarSearchItem alloc] init];
        item.title = title;
        item.titleColor = color;
        item.titlerFont = font;
        item.placeholder = placeholder;
        item.placeholderColor = placeholderColor;
        item.placeholderFont = placeholderFont;
        item.lengthMax = lengthMax;
        item.leftImage = image;
        item.cornerRadius = cornerRadius;
        item.backgroundColor = backgroundColor;
        item.leftImageViewEdge = leftImageViewEdge;
        item.searchBarMarginEdge = searchBarMarginEdge;
        item.searchContentHeight = searchContentHeight;
        item.enablesReturnKeyAutomatically = YES;
        item;
    });
}

@end

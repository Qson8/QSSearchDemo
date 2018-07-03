//
//  NSString+AttributedString.h
//  QSSearchDemo
//
//  Created by Qson on 2018/5/23.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (AttributedString)


- (void)sizeWithMaxSize:(CGSize)maxSize
                   font:(UIFont *)font
                  color:(UIColor *)color
             lineSpaced:(CGFloat)lineSpaced
          lineBreakMode:(NSLineBreakMode)lineBreakMode
              completed:(void(^)(NSAttributedString *attString,CGSize size))completed;
@end

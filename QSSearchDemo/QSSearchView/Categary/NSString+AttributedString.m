//
//  NSString+AttributedString.m
//  QSSearchDemo
//
//  Created by Qson on 2018/5/23.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)

- (void)sizeWithMaxSize:(CGSize)maxSize
                  font:(UIFont *)font
                 color:(UIColor *)color
            lineSpaced:(CGFloat)lineSpaced
        lineBreakMode:(NSLineBreakMode)lineBreakMode
            completed:(void(^)(NSAttributedString *attString,CGSize size))completed
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpaced];
    paragraphStyle.hyphenationFactor = 0.9;
    paragraphStyle.lineBreakMode = lineBreakMode;
    
    NSString *string = self ?:@"";
    NSMutableAttributedString *contentString = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSMutableDictionary *attribDicts = [NSMutableDictionary dictionary];
    attribDicts[NSFontAttributeName] = font;
    attribDicts[NSForegroundColorAttributeName] = color;
    attribDicts[NSBaselineOffsetAttributeName] = @0;
    attribDicts[NSParagraphStyleAttributeName] = paragraphStyle;

    [contentString addAttributes:attribDicts range:NSMakeRange(0, [self length])];
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:attribDicts context:nil].size;
    
    if (completed) {
        completed(contentString,size);
    }
}
@end

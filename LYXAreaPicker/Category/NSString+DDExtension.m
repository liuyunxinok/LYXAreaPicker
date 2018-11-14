//
//  NSString+DDExtension.m
//  ddykh
//
//  Created by 聚海微蓝-刘运新 on 2018/10/29.
//  Copyright © 2018年 liuyunxin. All rights reserved.
//

#import "NSString+DDExtension.h"

@implementation NSString (DDExtension)

//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}
//根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(UIFont *)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return rect.size.width;
}


@end

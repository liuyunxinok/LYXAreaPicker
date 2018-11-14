//
//  NSString+DDExtension.h
//  ddykh
//
//  Created by 聚海微蓝-刘运新 on 2018/10/29.
//  Copyright © 2018年 liuyunxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (DDExtension)

+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(UIFont *)font;

@end

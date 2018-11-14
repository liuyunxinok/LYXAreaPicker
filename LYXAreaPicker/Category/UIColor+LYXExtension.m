//
//  UIColor+LYXExtension.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "UIColor+LYXExtension.h"

#define HexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#define HexColorAlpha(RGBValue, alphaValue) [UIColor colorWithRed:((float)((RGBValue & 0xFF0000) >> 16))/255.0 green:((float)((RGBValue & 0x00FF00) >> 8))/255.0 blue:((float)(RGBValue & 0x0000FF))/255.0 alpha:alphaValue]

@implementation UIColor (LYXExtension)

+ (UIColor *)f7e4ebPinkColor{
    return HexColor(0xf7e4eb);
}

+ (UIColor *)text333333Color{
    return HexColor(0x333333);
}

+ (UIColor *)text666666Color{
    return HexColor(0x666666);
}

+ (UIColor *)text999999Color{
    return HexColor(0x999999);
}

+ (UIColor *)ffffffWhiteColor{
    return HexColor(0xffffff);
}

+ (UIColor *)ff3991PinkColor{
    return HexColor(0xff3991);
}

+ (UIColor *)ff5898Color{
    return HexColor(0xff5898);
}

+ (UIColor *)ff1f82Color{
    return HexColor(0xff1f82);
}

+ (UIColor *)lineColor{
    return HexColor(0xd3d3d3);
}

+ (UIColor *)f3f3f3GrayColor{
    return HexColor(0xf3f3f3);
}

+ (UIColor *)ff0000RedColor{
    return HexColor(0xff0000);
}

+ (UIColor *)blackCover3a3a3aColor{
    return HexColor(0x3a3a3a);
}

+ (UIColor *)fff7f7Color{
    return HexColor(0xfff7f7);
}

+ (UIColor *)black000000Color{
    return HexColor(0x000000);
}

@end

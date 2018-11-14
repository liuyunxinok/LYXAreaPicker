//
//  UIView+DDExtension.h
//  ddykh
//
//  Created by 聚海微蓝-刘运新 on 2018/10/22.
//  Copyright © 2018年 liuyunxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDExtension)

@property (nonatomic, assign) CGFloat dd_x;
@property (nonatomic, assign) CGFloat dd_y;
@property (nonatomic, assign) CGFloat dd_width;
@property (nonatomic, assign) CGFloat dd_height;

@property (nonatomic, assign) CGFloat dd_left;
@property (nonatomic, assign, readonly) CGFloat dd_right;
@property (nonatomic, assign) CGFloat dd_top;
@property (nonatomic, assign) CGFloat dd_bottom;
@property (nonatomic, assign) CGFloat dd_centerX;
@property (nonatomic, assign) CGFloat dd_centerY;




/**
 加圆角

 @param radius 圆角半径
 */
- (void)addCornerRadiusWith:(CGFloat)radius;



/**
 加圆角和阴影

 @param radius 圆角半径
 @param shadowColor 阴影颜色
 */
- (void)addShadowAndCornerRadiusWith:(CGFloat)radius shadowColor:(UIColor *)shadowColor;



@end

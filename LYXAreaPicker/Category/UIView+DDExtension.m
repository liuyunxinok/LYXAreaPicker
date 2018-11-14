//
//  UIView+DDExtension.m
//  ddykh
//
//  Created by 聚海微蓝-刘运新 on 2018/10/22.
//  Copyright © 2018年 liuyunxin. All rights reserved.
//

#import "UIView+DDExtension.h"

@implementation UIView (DDExtension)

- (void)setDd_x:(CGFloat)dd_x{
    CGRect frame = self.frame;
    frame.origin.x = dd_x;
    self.frame = frame;
}

- (CGFloat)dd_x{
    return self.frame.origin.x;
}


- (void)setDd_y:(CGFloat)dd_y{
    CGRect frame = self.frame;
    frame.origin.y = dd_y;
    self.frame = frame;
}

- (CGFloat)dd_y{
    return self.frame.origin.y;
}


- (void)setDd_width:(CGFloat)dd_width{
    CGRect frame = self.frame;
    frame.size.width = dd_width;
    self.frame = frame;
}


- (CGFloat)dd_width{
    return self.frame.size.width;
}

- (void)setDd_height:(CGFloat)dd_height{
    CGRect frame = self.frame;
    frame.size.height = dd_height;
    self.frame = frame;
}

- (CGFloat)dd_height{
    return self.frame.size.height;
}


- (CGFloat)dd_top{
    return self.frame.origin.y;
}

- (void)setDd_top:(CGFloat)dd_top{
    CGRect frame = self.frame;
    frame.origin.y = dd_top;
    self.frame = frame;
}

- (void)setDd_left:(CGFloat)dd_left{
    CGRect frame = self.frame;
    frame.origin.x = dd_left;
    self.frame = frame;
}

- (CGFloat)dd_left{
    return self.frame.origin.x;
}

- (CGFloat)dd_right{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)dd_bottom{
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDd_bottom:(CGFloat)dd_bottom{
    
    CGRect frame = self.frame;
    frame.origin.y = dd_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)dd_centerX{
    
    return self.center.x;
}

- (CGFloat)dd_centerY{
    
    return self.center.y;
}

- (void)setDd_centerX:(CGFloat)dd_centerX{
    
    CGPoint center = self.center;
    center.x = dd_centerX;
    self.center = center;
}

- (void)setDd_centerY:(CGFloat)dd_centerY{
    
    CGPoint center = self.center;
    center.y = dd_centerY;
    self.center = center;
}



- (void)addCornerRadiusWith:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)addShadowAndCornerRadiusWith:(CGFloat)radius shadowColor:(UIColor *)shadowColor{
    
    self.layer.cornerRadius = radius;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 1;
    self.layer.shadowOpacity = 0.8;
}


@end

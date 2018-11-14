//
//  config.h
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#ifndef config_h
#define config_h

#import "UIColor+LYXExtension.h"
#import "UIView+DDExtension.h"
#import "NSString+DDExtension.h"

#import <Masonry.h>

//适配
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define WIDTHSCALE(awidth) ([UIScreen mainScreen].bounds.size.width / 375 * awidth)
#define HEIGHTSCALE(aheight) ([[UIScreen mainScreen] bounds].size.height / 667 * aheight)


static inline BOOL IsEmpty(id thing) { return thing == nil || [thing isEqual:[NSNull null]] || [thing isEqual:@""] || ([thing respondsToSelector:@selector(length)] && [thing length] == 0) || ([thing respondsToSelector:@selector(count)] && [(NSArray *)thing count] == 0);
}

#endif /* config_h */

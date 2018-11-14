//
//  LYXAreaPickerView.h
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYXAreaPickerView : UIView


/**
 选择地址完成回调
 */
@property (nonatomic, copy) void(^selectComplete)(NSString *);


/**
 显示视图

 @param view 显示在目标视图上
 */
- (void)showInView:(UIView *)view;

/**
 隐藏视图
 */
- (void)dismiss;


@end

NS_ASSUME_NONNULL_END

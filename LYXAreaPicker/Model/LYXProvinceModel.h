//
//  LYXProvinceModel.h
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYXProvinceModel : NSObject


//本地json

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *name;

//附加字段
@property (nonatomic, assign, getter=isSelected) BOOL selected;


/**
 本地获取省
 
 @return provinces
 */
+ (NSArray <LYXProvinceModel *> *)provinceDataArray;


@end

NS_ASSUME_NONNULL_END

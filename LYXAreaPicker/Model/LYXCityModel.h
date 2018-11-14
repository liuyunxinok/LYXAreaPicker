//
//  LYXCityModel.h
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYXCityModel : NSObject


//本地json

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *provinceCode;


//附加字段

@property (nonatomic, assign, getter=isSelected) BOOL selected;



/**
 本地获取城市数据
 
 @param provinceCode 省code
 @return citys
 */
+ (NSArray <LYXCityModel *> *)cityDataArrayWith:(NSString *)provinceCode;



@end

NS_ASSUME_NONNULL_END

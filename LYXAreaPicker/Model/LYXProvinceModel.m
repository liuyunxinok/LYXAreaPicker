//
//  LYXProvinceModel.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "LYXProvinceModel.h"

@implementation LYXProvinceModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+ (NSArray<LYXProvinceModel *> *)provinceDataArray{
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"province" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回数组形式
    NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    NSMutableArray *temArray = [NSMutableArray array];
    for (NSDictionary *dic in dictArray) {
        LYXProvinceModel *model = [[LYXProvinceModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [temArray addObject:model];
    }
    return  temArray.copy;
}


@end

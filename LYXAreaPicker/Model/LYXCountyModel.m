//
//  LYXCountyModel.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "LYXCountyModel.h"

@implementation LYXCountyModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (NSArray<LYXCountyModel *> *)countyDataArrayWith:(NSString *)cityCode{
    
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"county" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回数组形式
    NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dictArray) {
        if ([[dic objectForKey:@"cityCode"] isEqualToString:cityCode]) {
            LYXCountyModel *model = [[LYXCountyModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [tmpArray addObject:model];
        }
    }
    return tmpArray.copy;
}

@end

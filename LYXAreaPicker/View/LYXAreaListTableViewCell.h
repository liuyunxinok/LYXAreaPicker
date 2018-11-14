//
//  LYXAreaListTableViewCell.h
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LYXProvinceModel, LYXCityModel, LYXCountyModel;
@interface LYXAreaListTableViewCell : UITableViewCell

@property (nonatomic, strong) LYXProvinceModel *provinceModel;

@property (nonatomic, strong) LYXCityModel *cityModel;

@property (nonatomic, strong) LYXCountyModel *countyModel;

@end

NS_ASSUME_NONNULL_END

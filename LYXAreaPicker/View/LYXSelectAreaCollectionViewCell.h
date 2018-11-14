//
//  LYXSelectAreaCollectionViewCell.h
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LYXSelectAddressType) {
    LYXSelectAddressTypeProvice,
    LYXSelectAddressTypeCity,
    LYXSelectAddressTypeCounty
};

@class LYXProvinceModel, LYXCityModel, LYXCountyModel, LYXSelectAreaCollectionViewCell;

@protocol LYXSelectAreaCollectionViewCellDelegate<NSObject>

- (void)selectAddressCollectionViewCell:(LYXSelectAreaCollectionViewCell *)cell type:(LYXSelectAddressType)type model:(id)model;

@end

@interface LYXSelectAreaCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<LYXSelectAreaCollectionViewCellDelegate> delegate;

@property (nonatomic, strong) NSArray <LYXProvinceModel *> *provinceDataArray;

@property (nonatomic, strong) NSArray <LYXCityModel *> *cityDataArray;

@property (nonatomic, strong) NSArray <LYXCountyModel *> *countyDataArray;

@property (nonatomic, assign) LYXSelectAddressType type;

@end

NS_ASSUME_NONNULL_END

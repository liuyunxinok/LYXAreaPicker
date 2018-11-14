//
//  LYXSelectAreaCollectionViewCell.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "LYXSelectAreaCollectionViewCell.h"
#import "LYXAreaListTableViewCell.h"

#import "LYXProvinceModel.h"
#import "LYXCityModel.h"
#import "LYXCountyModel.h"

#import "config.h"

@interface LYXSelectAreaCollectionViewCell()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LYXSelectAreaCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}


#pragma mark - data

- (void)setProvinceDataArray:(NSArray<LYXProvinceModel *> *)provinceDataArray{
    if (!provinceDataArray) {
        return;
    }
    _provinceDataArray = provinceDataArray;
    [self.tableView reloadData];
    
    for (NSInteger i = 0 ; i < provinceDataArray.count; i++) {
        LYXProvinceModel *model = provinceDataArray[i];
        if (model.isSelected) {
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
            break;
        }
    }
    
}

- (void)setCityDataArray:(NSArray<LYXCityModel *> *)cityDataArray{
    if (!cityDataArray) {
        return;
    }
    _cityDataArray = cityDataArray;
    [self.tableView reloadData];
    
    for (NSInteger i = 0 ; i < cityDataArray.count; i++) {
        LYXCityModel *model = cityDataArray[i];
        if (model.isSelected) {
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
            break;
        }
    }
}

- (void)setCountyDataArray:(NSArray<LYXCountyModel *> *)countyDataArray{
    if (!countyDataArray) {
        return;
    }
    _countyDataArray = countyDataArray;
    [self.tableView reloadData];
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (self.type) {
        case LYXSelectAddressTypeProvice:
            return self.provinceDataArray.count;
            break;
        case LYXSelectAddressTypeCity:
            return self.cityDataArray.count;
            break;
        case LYXSelectAddressTypeCounty:
            return self.countyDataArray.count;
            break;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYXAreaListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LYXAreaListTableViewCell class]) forIndexPath:indexPath];
    switch (self.type) {
        case LYXSelectAddressTypeProvice:
            cell.provinceModel = self.provinceDataArray[indexPath.row];
            break;
        case LYXSelectAddressTypeCity:
            cell.cityModel = self.cityDataArray[indexPath.row];
            break;
        case LYXSelectAddressTypeCounty:
            cell.countyModel = self.countyDataArray[indexPath.row];
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.type) {
        case LYXSelectAddressTypeProvice:
        {
            LYXProvinceModel *provinceModel = self.provinceDataArray[indexPath.row];
            provinceModel.selected = YES;
            if ([self.delegate respondsToSelector:@selector(selectAddressCollectionViewCell:type:model:)]) {
                [self.delegate selectAddressCollectionViewCell:self type:self.type model:provinceModel];
            }
        }
            break;
        case LYXSelectAddressTypeCity:
        {
            LYXCityModel *cityModel = self.cityDataArray[indexPath.row];
            cityModel.selected = YES;
            if ([self.delegate respondsToSelector:@selector(selectAddressCollectionViewCell:type:model:)]) {
                [self.delegate selectAddressCollectionViewCell:self type:self.type model:cityModel];
            }
            
        }
            break;
        case LYXSelectAddressTypeCounty:
        {
            LYXCountyModel *countyModel = self.countyDataArray[indexPath.row];
            countyModel.selected = YES;
            if ([self.delegate respondsToSelector:@selector(selectAddressCollectionViewCell:type:model:)]) {
                [self.delegate selectAddressCollectionViewCell:self type:self.type model:countyModel];
            }
        }
            break;
        default:
            break;
    }
}


#pragma mark - UI

- (void)createUI{
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[LYXAreaListTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LYXAreaListTableViewCell class])];
        tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        tableView.rowHeight = WIDTHSCALE(40);
        [self.contentView addSubview:tableView];
        tableView;
    });
    
}


@end

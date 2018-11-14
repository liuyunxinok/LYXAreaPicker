//
//  LYXAreaListTableViewCell.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "LYXAreaListTableViewCell.h"

#import "LYXProvinceModel.h"
#import "LYXCityModel.h"
#import "LYXCountyModel.h"

#import "config.h"

@interface LYXAreaListTableViewCell()

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *selectImageView;

@end

@implementation LYXAreaListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}


- (void)setProvinceModel:(LYXProvinceModel *)provinceModel{
    if (IsEmpty(provinceModel)) {
        return;
    }
    _provinceModel = provinceModel;
    self.contentLabel.text = provinceModel.name;
    if (provinceModel.isSelected) {
        self.contentLabel.textColor = [UIColor ff1f82Color];
        self.selectImageView.hidden = NO;
    }else{
        self.contentLabel.textColor = [UIColor text333333Color];
        self.selectImageView.hidden = YES;
    }
}


- (void)setCityModel:(LYXCityModel *)cityModel{
    if (IsEmpty(cityModel)) {
        return;
    }
    _cityModel = cityModel;
    self.contentLabel.text = cityModel.name;
    if (cityModel.isSelected) {
        self.contentLabel.textColor = [UIColor ff1f82Color];
        self.selectImageView.hidden = NO;
    }else{
        self.contentLabel.textColor = [UIColor text333333Color];
        self.selectImageView.hidden = YES;
    }
}


- (void)setCountyModel:(LYXCountyModel *)countyModel{
    if (IsEmpty(countyModel)) {
        return;
    }
    self.contentLabel.text = countyModel.name;
    if (countyModel.isSelected) {
        self.contentLabel.textColor = [UIColor ff1f82Color];
        self.selectImageView.hidden = NO;
    }else{
        self.contentLabel.textColor = [UIColor text333333Color];
        self.selectImageView.hidden = YES;
    }
}


#pragma mark - UI

- (void)createUI{
    
    self.contentLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor text333333Color];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(WIDTHSCALE(20));
            make.centerY.equalTo(self.contentView);
        }];
        label;
    });
    
    self.selectImageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"area_select"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentLabel.mas_right).offset(WIDTHSCALE(10));
            make.centerY.equalTo(self.contentLabel);
            make.size.mas_equalTo(CGSizeMake(WIDTHSCALE(19), WIDTHSCALE(13)));
        }];
        imageView;
    });
    
    
}

@end

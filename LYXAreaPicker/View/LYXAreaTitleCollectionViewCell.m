//
//  LYXAreaTitleCollectionViewCell.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "LYXAreaTitleCollectionViewCell.h"

#import "config.h"

@interface LYXAreaTitleCollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LYXAreaTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)setTitleString:(NSString *)titleString{
    _titleString = titleString;
    self.titleLabel.text = titleString;
    if ([titleString isEqualToString:@"请选择"]) {
        self.titleLabel.textColor = [UIColor ff1f82Color];
    }else{
        self.titleLabel.textColor = [UIColor text333333Color];
    }
}


#pragma mark - UI

- (void)createUI{
    
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor ff1f82Color];
        label.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
        }];
        label;
    });
    
}

@end

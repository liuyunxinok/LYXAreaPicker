//
//  LYXAreaPickerView.m
//  LYXAreaPicker-demo
//
//  Created by 聚海微蓝-刘运新 on 2018/11/14.
//  Copyright © 2018年 聚海微蓝-刘运新. All rights reserved.
//

#import "LYXAreaPickerView.h"

#import "LYXSelectAreaCollectionViewCell.h"
#import "LYXAreaTitleCollectionViewCell.h"

#import "LYXProvinceModel.h"
#import "LYXCityModel.h"
#import "LYXCountyModel.h"

#import "config.h"

@interface LYXAreaPickerView()<UICollectionViewDelegate, UICollectionViewDataSource, LYXSelectAreaCollectionViewCellDelegate>

@property (nonatomic, strong) UIButton *blackCoverButton;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UICollectionView *titleCollectionView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *redLineView;
@property (nonatomic, strong) UICollectionView *addressCollectionView;

//data
@property (nonatomic, strong) NSMutableArray *titleDataArray;
@property (nonatomic, strong) NSMutableArray <NSArray *> *addressDataArray;
@property (nonatomic, strong) LYXProvinceModel *currentProvinceModel;
@property (nonatomic, strong) LYXCityModel *currentCityModel;
@property (nonatomic, strong) LYXCountyModel *currentCountyModel;

@end

@implementation LYXAreaPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, WIDTHSCALE(527));
        self.backgroundColor = [UIColor ffffffWhiteColor];
        [self createUI];
        [self initData];
    }
    return self;
}


#pragma mark - data

- (void)initData{
    self.titleDataArray = [NSMutableArray arrayWithObjects:@"请选择", nil];
    [self.titleCollectionView reloadData];
    self.addressDataArray = [NSMutableArray arrayWithObjects:[LYXProvinceModel provinceDataArray], nil];
    [self.addressCollectionView reloadData];
}


#pragma mark - action

- (void)showInView:(UIView *)view{
    [view addSubview:self.blackCoverButton];
    [view addSubview:self];
    self.alpha = 0;
    self.blackCoverButton.alpha = 0;
    CGFloat bottom = SCREEN_HEIGHT;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
        self.blackCoverButton.alpha = 0.6;
        self.dd_bottom = bottom;
    }];
}

- (void)dismiss{
    self.blackCoverButton.alpha = 0.6;
    [UIView animateWithDuration:0.5 animations:^{
        self.blackCoverButton.alpha = 0;
        self.dd_y = SCREEN_HEIGHT;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            [self.blackCoverButton removeFromSuperview];
        }
    }];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.titleCollectionView) {
        return self.titleDataArray.count;
    }
    return self.addressDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.titleCollectionView) {
        LYXAreaTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LYXAreaTitleCollectionViewCell class]) forIndexPath:indexPath];
        cell.titleString = self.titleDataArray[indexPath.item];
        return cell;
    }else{
        LYXSelectAreaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LYXSelectAreaCollectionViewCell class]) forIndexPath:indexPath];
        switch (indexPath.item) {
            case 0:
                cell.type = LYXSelectAddressTypeProvice;
                cell.provinceDataArray = self.addressDataArray[indexPath.item];
                break;
            case 1:
                cell.type = LYXSelectAddressTypeCity;
                cell.cityDataArray = self.addressDataArray[indexPath.item];
                break;
            case 2:
                cell.type = LYXSelectAddressTypeCounty;
                cell.countyDataArray = self.addressDataArray[indexPath.item];
                break;
            default:
                break;
        }
        cell.delegate = self;
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.titleCollectionView) {
        NSString *titleString = self.titleDataArray[indexPath.row];
        CGFloat width = [NSString getWidthWithText:titleString height:MAXFLOAT font:[UIFont systemFontOfSize:13]];
        return CGSizeMake(width, WIDTHSCALE(30));
    }else{
        return CGSizeMake(SCREEN_WIDTH, WIDTHSCALE(451));
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.titleCollectionView) {
        switch (indexPath.row) {
            case 0:
                [self.addressCollectionView setContentOffset:CGPointMake(0, 0) animated:YES];
                break;
            case 1:
                [self.addressCollectionView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
                break;
            case 2:
                [self.addressCollectionView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];
                break;
            default:
                break;
        }
    }
}



#pragma mark - LYXSelectAreaCollectionViewCellDelegate

- (void)selectAddressCollectionViewCell:(LYXSelectAreaCollectionViewCell *)cell type:(LYXSelectAddressType)type model:(id)model{
    switch (type) {
        case LYXSelectAddressTypeProvice:
        {
            LYXProvinceModel *provinceModel = (LYXProvinceModel *)model;
            if (!IsEmpty(self.currentProvinceModel) && ![self.currentProvinceModel.code isEqualToString:provinceModel.code]) {
                self.currentProvinceModel.selected = NO;
                self.addressDataArray = [NSMutableArray arrayWithObjects:self.addressDataArray.firstObject, nil];
            }
            self.titleDataArray = [NSMutableArray arrayWithObjects:@"请选择", nil];
            self.currentProvinceModel = provinceModel;
            [self.addressDataArray addObject:[LYXCityModel cityDataArrayWith:provinceModel.code]];
            [self.addressCollectionView reloadData];
            [self.addressCollectionView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
            
            
            [self.titleDataArray insertObject:provinceModel.name atIndex:0];
            [self.titleCollectionView reloadData];
        }
            break;
        case LYXSelectAddressTypeCity:
        {
            LYXCityModel *cityModel = (LYXCityModel *)model;
            if (!IsEmpty(self.currentCityModel) && ![self.currentCityModel.code isEqualToString:cityModel.code]) {
                self.currentCityModel.selected = NO;
                if (self.addressDataArray.count == 3) {
                    [self.addressDataArray removeLastObject];
                }
                if (self.titleDataArray.count == 3) {
                    [self.titleDataArray replaceObjectAtIndex:2 withObject:@"请选择"];
                    [self.titleDataArray removeObjectAtIndex:1];
                }
            }
            self.currentCityModel = cityModel;
            [self.titleDataArray insertObject:cityModel.name atIndex:1];
            NSArray *countys = [LYXCountyModel countyDataArrayWith:cityModel.code];
            if (!IsEmpty(countys)) {
                [self.addressDataArray addObject:countys];
                [self.addressCollectionView reloadData];
                [self.addressCollectionView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];
            }else{
                [self.titleDataArray removeLastObject];
                NSString *address = [NSString stringWithFormat:@"%@%@",self.currentProvinceModel.name,self.currentCityModel.name];
                [self.addressCollectionView reloadData];
                self.selectComplete ? self.selectComplete(address) : nil;
                [self dismiss];
            }
            [self.titleCollectionView reloadData];
        }
            break;
        case LYXSelectAddressTypeCounty:
        {
            LYXCountyModel *countyModel = (LYXCountyModel *)model;
            if (!IsEmpty(self.currentCountyModel) && ![self.currentCountyModel.code isEqualToString:countyModel.code]) {
                self.currentCountyModel.selected = NO;
            }
            self.currentCountyModel = countyModel;
            [self.titleDataArray replaceObjectAtIndex:2 withObject:countyModel.name];
            [self.titleCollectionView reloadData];
            [self.addressCollectionView reloadData];
            [self.addressCollectionView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];
            NSString *address = [NSString stringWithFormat:@"%@%@%@",self.currentProvinceModel.name,self.currentCityModel.name, self.currentCountyModel.name];
            self.selectComplete ? self.selectComplete(address) : nil;
            [self dismiss];
        }
            break;
        default:
            break;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == self.addressCollectionView) {
        //page
        NSInteger page = scrollView.contentOffset.x / SCREEN_WIDTH;
        LYXAreaTitleCollectionViewCell *cell = (LYXAreaTitleCollectionViewCell *)[self.titleCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:page inSection:0]];//获取cell
        //获取cell坐标
        CGRect rect = [self.titleCollectionView convertRect:cell.frame toView:self];
        [UIView animateWithDuration:0.25 animations:^{
            self.redLineView.dd_width = rect.size.width;
            self.redLineView.dd_x = rect.origin.x;
            //            [self.redLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            //                make.width.mas_equalTo(rect.size.width);
            //                make.left.equalTo(self.lineView).offset(rect.origin.x);
            //            }];
        }];
    }
}



#pragma mark - UI

- (void)createUI{
    
    self.blackCoverButton = ({
        UIButton *button = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
        button.backgroundColor = [UIColor black000000Color];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    self.tipLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:18];
        label.textColor = [UIColor text333333Color];
        label.text = @"配送至";
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(WIDTHSCALE(16));
        }];
        label;
    });
    
    self.closeButton = ({
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"person_alert_close"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventAllEvents];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-WIDTHSCALE(16));
            make.top.equalTo(self).offset(WIDTHSCALE(16));
            make.size.mas_equalTo(CGSizeMake(WIDTHSCALE(18), WIDTHSCALE(18)));
        }];
        button;
    });
    
    self.titleCollectionView = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        //        layout.estimatedItemSize = CGSizeMake(WIDTHSCALE(50), WIDTHSCALE(30));
        layout.minimumLineSpacing = WIDTHSCALE(WIDTHSCALE(5));
        layout.minimumInteritemSpacing = WIDTHSCALE(WIDTHSCALE(5));
        layout.sectionInset = UIEdgeInsetsMake(WIDTHSCALE(0), WIDTHSCALE(16), 0, WIDTHSCALE(0));
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WIDTHSCALE(31)) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor ffffffWhiteColor];
        [collectionView registerClass:[LYXAreaTitleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([LYXAreaTitleCollectionViewCell class])];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tipLabel.mas_bottom).offset(WIDTHSCALE(12));
            make.left.right.equalTo(self);
            make.height.mas_equalTo(WIDTHSCALE(30));
        }];
        collectionView;
    });
    
    self.lineView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor lineColor];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.titleCollectionView.mas_bottom);
            make.height.mas_equalTo(WIDTHSCALE(0.5));
        }];
        view;
    });
    
    self.redLineView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(WIDTHSCALE(16), 0, WIDTHSCALE(40), WIDTHSCALE(0.5))];
        view.backgroundColor = [UIColor ff1f82Color];
        [self.lineView addSubview:view];
        //        [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(self.lineView).offset(WIDTHSCALE(16));
        //            make.width.mas_equalTo(WIDTHSCALE(40));
        //            make.bottom.equalTo(self.lineView);
        //            make.height.mas_equalTo(WIDTHSCALE(0.5));
        //        }];
        view;
    });
    
    self.addressCollectionView = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, WIDTHSCALE(451));
        layout.minimumLineSpacing = WIDTHSCALE(0);
        layout.minimumInteritemSpacing = WIDTHSCALE(0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //        layout.sectionInset = UIEdgeInsetsMake(WIDTHSCALE(0), WIDTHSCALE(12), 0, WIDTHSCALE(12));
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WIDTHSCALE(451)) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor ffffffWhiteColor];
        [collectionView registerClass:[LYXSelectAreaCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([LYXSelectAreaCollectionViewCell class])];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled = YES;
        [self addSubview:collectionView];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.mas_bottom);
            make.left.right.equalTo(self);
            make.height.mas_equalTo(WIDTHSCALE(451));
        }];
        collectionView;
        
    });
}


@end

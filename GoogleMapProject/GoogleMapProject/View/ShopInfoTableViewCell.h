//
//  ShopInfoTableViewCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopInfoModel.h"
@import GoogleMaps;

@interface ShopInfoTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *topickNumLab;

@property (nonatomic,strong)UILabel *speciesLab;

@property (nonatomic,strong)UILabel *juliLab;

@property (nonatomic,strong)UILabel *AddressLab;

@property (nonatomic,strong)UILabel *infoLab;

@property (nonatomic,strong)GMSMapView *mapV ;


@property (nonatomic,strong)UIButton *backBut;

@property (nonatomic,strong)UILabel *num;

@property (nonatomic,strong)UILabel *telNum;

//图片张数
@property (nonatomic,strong)UILabel *pictureNumLab;

@property (nonatomic,weak)UIViewController *VC;

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)ShopInfoModel *model;

@end

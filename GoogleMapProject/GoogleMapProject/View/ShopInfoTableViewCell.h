//
//  ShopInfoTableViewCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
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



@end

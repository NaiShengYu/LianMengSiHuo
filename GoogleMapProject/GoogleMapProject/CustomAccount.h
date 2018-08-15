//
//  CustomAccount.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAccount : NSObject

@property (nonatomic,assign)NSInteger loginType;

//选择的城市
@property (nonatomic,copy)NSString *cityName;
@property (nonatomic,copy)NSString *cityEnName;

//当前位置城市
@property (nonatomic,copy)NSString *currentCityName;

//选择的是哪一类（酒店，景点，餐厅，购物）
@property (nonatomic,copy)NSString *className;

@property (nonatomic,copy)NSString *city_id;


@property (nonatomic,copy)NSString *classtype;


@property (nonatomic,assign)BOOL isSearch;



@property (nonatomic,assign)CLLocationCoordinate2D curCoordinate2D;

@property (nonatomic,assign)CLLocationCoordinate2D cityLocation;

+ (CustomAccount *)sharedCustomAccount;
@end

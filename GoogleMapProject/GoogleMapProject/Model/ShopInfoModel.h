//
//  ShopInfoModel.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/12.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopInfoModel : NSObject
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *is_collection;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *img_num;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *distance;
@property (nonatomic,copy)NSString *num;
@property (nonatomic,copy)NSString *red;
@property (nonatomic,copy)NSString *blue;
@property (nonatomic,copy)NSString *details_lng;
@property (nonatomic,copy)NSString *details_lat;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *info;
@property (nonatomic,copy)NSString *tel;

@property (nonatomic,strong)NSMutableArray *img_arr;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

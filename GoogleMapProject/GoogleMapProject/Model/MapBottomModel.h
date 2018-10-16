//
//  MapBottomModel.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/9.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapBottomModel : NSObject

@property (nonatomic,copy)NSString *number;
@property (nonatomic,copy)NSString *No;
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *num;
@property (nonatomic,copy)NSString *red;
@property (nonatomic,copy)NSString *blue;
@property (nonatomic,copy)NSString *lng;
@property (nonatomic,copy)NSString *lat;
@property (nonatomic,copy)NSString *distance;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

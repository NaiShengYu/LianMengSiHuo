//
//  MapBottomModel.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/9.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "MapBottomModel.h"

@implementation MapBottomModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _Id = dic[@"Id"];
        _number = dic[@"number"];
        _type = dic[@"type"];
        _img = dic[@"img"];
        _name = dic[@"name"];
        _star = dic[@"star"];
        _num = dic[@"num"];
        _red = dic[@"red"];
        _blue = dic[@"blue"];
        _lng = dic[@"lng"];
        _lat = dic[@"lat"];
        _distance = dic[@"distance"];
       
    }
    
    return self;
    
}
@end

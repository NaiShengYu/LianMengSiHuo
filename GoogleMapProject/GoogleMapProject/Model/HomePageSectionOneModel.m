
//
//  HomePageSectionOneModel.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/8.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionOneModel.h"

@implementation HomePageSectionOneModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _Id = dic[@"Id"];
        _type = dic[@"type"];
        _img = dic[@"img"];
        _name = dic[@"name"];
        _star = dic[@"star"];
        _distance = dic[@"distance"];
        _red = dic[@"red"];
        _num= dic[@"num"];
    }
    
    return self;
    
}

@end

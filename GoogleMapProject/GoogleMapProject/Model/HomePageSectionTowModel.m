//
//  HomePageSectionTowModel.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/8.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionTowModel.h"

@implementation HomePageSectionTowModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _Id = dic[@"Id"];
        _name_e = dic[@"name_e"];
        _img = dic[@"img"];
        _name = dic[@"name"];
    }
    
    return self;
    
}

@end

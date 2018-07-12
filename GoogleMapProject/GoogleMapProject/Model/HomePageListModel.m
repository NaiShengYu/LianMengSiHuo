

//
//  HomePageListModel.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/12.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageListModel.h"

@implementation HomePageListModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _No = dic[@"No"];
        _type = dic[@"type"];
        _Id = dic[@"Id"];
        _img = dic[@"img"];
        _name = dic[@"name"];
        _star = dic[@"star"];
        _distance = dic[@"distance"];
        _num = dic[@"num"];
        _red = dic[@"red"];
        _blue = dic[@"blue"];

    }
    
    return self;
    
}

@end

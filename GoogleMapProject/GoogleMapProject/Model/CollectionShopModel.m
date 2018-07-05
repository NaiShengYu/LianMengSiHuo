//
//  CollectionShopModel.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/5.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CollectionShopModel.h"

@implementation CollectionShopModel


- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _Id = dic[@"Id"];
        _collect_id = dic[@"collect_id"];
        _type = dic[@"type"];
        _img = dic[@"img"];
        _name = dic[@"name"];
        _star = dic[@"star"];
        _distance = dic[@"distance"];
        _red = dic[@"red"];
        _blue = dic[@"blue"];
        _num= dic[@"num"];
        _isSelect = NO;
    }
    
    return self;
 
}

@end

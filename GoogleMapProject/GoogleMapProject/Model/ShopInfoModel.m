//
//  ShopInfoModel.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/12.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoModel.h"

@implementation ShopInfoModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        _type = dic[@"type"];
        _Id = dic[@"Id"];
        _is_collection = dic[@"is_collection"];
        _img = dic[@"img"];
        _img_num = dic[@"img_num"];
        _name = dic[@"name"];
        _star = dic[@"star"];
        _distance = dic[@"distance"];
        _num = dic[@"num"];
        _red = dic[@"red"];
        _blue = dic[@"blue"];
        _details_lng = dic[@"details_lng"];
        _details_lat = dic[@"details_lat"];
        _address = dic[@"address"];
        _info = dic[@"info"];
        _tel = dic[@"tel"];
        @try {
            _img_arr = [[NSMutableArray alloc]initWithArray:dic[@"img_arr"]];
        } @catch (NSException *exception) {
            _img_arr = [[NSMutableArray alloc]init];
        } @finally {
        }
        
    }
    return self;
    
}
@end

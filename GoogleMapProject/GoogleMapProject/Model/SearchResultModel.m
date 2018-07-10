//
//  SearchResultModel.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchResultModel.h"

@implementation SearchResultModel


- (instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        _type = dic[@"type"];
        _Id = dic[@"Id"];
        _img = dic[@"img"];
        _name = dic[@"name"];
        _name_e = dic[@"name_e"];
        _star = dic[@"star"];
        _blue = dic[@"blue"];

        
    }
    return self;
    
}
@end

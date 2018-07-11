//
//  FilterItem.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FilterItem.h"

@implementation FilterItem

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        _isSelect = NO;
        _title = dic[@"name"];
        _num = dic[@"num"];
        _Id = dic[@"Id"];
        _type = dic[@"type"];
        _titleAndNum = [NSString stringWithFormat:@"%@ %@",_title,_num];
    }
    
    return self;
    
}
@end

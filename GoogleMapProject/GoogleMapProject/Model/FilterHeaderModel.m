//
//  FilterHeaderModel.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FilterHeaderModel.h"

@implementation FilterHeaderModel
- (instancetype)init{
    
    self =[super init];
    if (self) {
        _itemsArray = [[NSMutableArray alloc]init];
    }
    return self;
    
}
@end

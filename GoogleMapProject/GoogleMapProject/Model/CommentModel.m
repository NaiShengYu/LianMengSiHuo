//
//  CommentModel.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/5.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _star = dic[@"star"];
        _comment = dic[@"comment"];
        _time = dic[@"time"];
        _type = dic[@"type"];
        _Id = dic[@"id"];
        _img = dic[@"img"];
        _name = dic[@"name"];
        _red = dic[@"red"];
        _blue = dic[@"blue"];
    }
    
    return self;
    
}
@end

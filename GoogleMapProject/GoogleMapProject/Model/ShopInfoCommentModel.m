
//
//  ShopInfoCommentModel.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/12.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoCommentModel.h"

@implementation ShopInfoCommentModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        _user_img = dic[@"user_img"];
        _username = dic[@"username"];
        _star = dic[@"star"];
        _comment = dic[@"comment"];
        _comment_img =[[NSMutableArray alloc]initWithArray:dic[@"comment_img"]];
        @try {
            NSString *img =_comment_img[0];
            if (img.length==0 ||img ==nil) {
                [_comment_img removeAllObjects];
            }
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        
    }
    return self;
    
}
@end

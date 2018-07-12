//
//  ShopInfoCommentModel.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/12.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopInfoCommentModel : NSObject
@property (nonatomic,copy)NSString *user_img;
@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *comment;
@property (nonatomic,strong)NSMutableArray *comment_img;


- (instancetype)initWithDic:(NSDictionary *)dic;

@end

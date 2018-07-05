//
//  CommentModel.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/5.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *comment;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *red;
@property (nonatomic,copy)NSString *blue;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

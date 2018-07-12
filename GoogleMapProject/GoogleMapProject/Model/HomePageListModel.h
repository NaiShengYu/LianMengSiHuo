//
//  HomePageListModel.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/12.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageListModel : NSObject
@property (nonatomic,copy)NSString *No;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *distance;
@property (nonatomic,copy)NSString *num;
@property (nonatomic,copy)NSString *red;
@property (nonatomic,copy)NSString *blue;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

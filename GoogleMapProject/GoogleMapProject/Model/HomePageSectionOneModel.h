//
//  HomePageSectionOneModel.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/8.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageSectionOneModel : NSObject
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *num;
@property (nonatomic,copy)NSString *red;
@property (nonatomic,copy)NSString *distance;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

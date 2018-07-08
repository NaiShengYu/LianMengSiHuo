//
//  HomePageSectionTowModel.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/8.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageSectionTowModel : NSObject
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *name_e;
@property (nonatomic,copy)NSString *img;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

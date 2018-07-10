//
//  SearchResultModel.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResultModel : NSObject
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *name_e;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *blue;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

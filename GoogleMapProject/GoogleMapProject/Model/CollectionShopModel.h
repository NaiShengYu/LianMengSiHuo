//
//  CollectionShopModel.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/5.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionShopModel : NSObject
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *collect_id;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *star;
@property (nonatomic,copy)NSString *distance;
@property (nonatomic,copy)NSString *red;
@property (nonatomic,copy)NSString *blue;
@property (nonatomic,copy)NSString *num;

@property (nonatomic,assign)BOOL isSelect;


- (instancetype)initWithDic:(NSDictionary *)dic;
@end

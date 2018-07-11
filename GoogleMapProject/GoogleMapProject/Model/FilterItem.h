//
//  FilterItem.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterItem : NSObject

@property (nonatomic,assign)BOOL isSelect;

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *type;

@property (nonatomic,copy)NSString *num;

@property (nonatomic,copy)NSString *Id;

@property (nonatomic,copy)NSString *titleAndNum;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

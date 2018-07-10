//
//  CustomAccount.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAccount : NSObject

@property (nonatomic,assign)NSInteger loginType;

@property (nonatomic,copy)NSString *cityName;

//选择的是哪一类（酒店，景点，餐厅，购物）
@property (nonatomic,copy)NSString *className;

@property (nonatomic,copy)NSString *classtype;



@property (nonatomic,assign)CLLocationCoordinate2D curCoordinate2D;

+ (CustomAccount *)sharedCustomAccount;
@end

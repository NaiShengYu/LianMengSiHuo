//
//  FilterHeaderModel.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterHeaderModel : NSObject

@property (nonatomic,assign)BOOL isSelect;

@property (nonatomic,copy)NSString *title;

@property (nonatomic,strong)NSMutableArray *itemsArray;
@end

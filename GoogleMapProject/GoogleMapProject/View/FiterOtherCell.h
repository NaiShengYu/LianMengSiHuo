//
//  FiterOtherCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterItem.h"

@interface FiterOtherCell : UITableViewCell
@property (nonatomic)NSMutableArray *AllTabPagArray;
//@property (nonatomic, copy) void(^cellHeightBlock)(CGFloat Y);
@property (nonatomic, copy) void(^selectBlock)();

@end

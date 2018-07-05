//
//  FilterView.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterItem.h"

@interface FilterView : UIView

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,copy)void (^selectChangeBLock)(FilterItem *selectItem);

@end

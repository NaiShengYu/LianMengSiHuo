//
//  FilterCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBut.h"
#import "FilterItem.h"
@interface FilterCell : UITableViewCell

@property (nonatomic,strong)CustomBut *backBut;
@property (nonatomic,strong)FilterItem *item;

@property (nonatomic,copy)void (^changeItemSelect)(BOOL isselect);

@end

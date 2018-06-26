//
//  FilterHeader.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterHeaderModel.h"
#import "FilterItem.h"
@interface FilterHeader : UITableViewHeaderFooterView

@property (nonatomic,strong)UIButton *backBut;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UIImageView *img;

@property (nonatomic,strong)FilterHeaderModel *headerModel;

@property (nonatomic,copy)void (^changeHeaderState)(BOOL isselect);
@end

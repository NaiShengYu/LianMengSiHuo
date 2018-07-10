//
//  SearchResultSectionZeroCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/28.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultModel.h"

@interface SearchResultSectionZeroCell : UITableViewCell

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)SearchResultModel *model;


@end

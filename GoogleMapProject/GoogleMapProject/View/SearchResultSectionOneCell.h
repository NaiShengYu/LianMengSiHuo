//
//  SearchResultSectionOneCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/28.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SearchResultModel.h"
@interface SearchResultSectionOneCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *speciesLab;

@property (nonatomic,copy)NSString *searchKey;

@property (nonatomic,strong)SearchResultModel *model;
@end

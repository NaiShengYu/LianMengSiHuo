//
//  CollectionShopEditCell.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionShopModel.h"

@interface CollectionShopEditCell : UITableViewCell


@property (nonatomic,strong)UIButton *deleteBut;

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *topickNumLab;

@property (nonatomic,strong)UILabel *speciesLab;

@property (nonatomic,strong)UILabel *juliLab;

@property (nonatomic,strong)CollectionShopModel *collecitonModel;

@end

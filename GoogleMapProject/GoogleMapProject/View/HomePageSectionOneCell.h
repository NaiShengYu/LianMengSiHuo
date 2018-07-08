//
//  HomePageSectionOneCell.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageSectionOneModel.h"
@interface HomePageSectionOneCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *headerImage;
@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *redLab;


@property (nonatomic,strong)UILabel *talkLab;

@property (nonatomic,strong)UILabel *juliLab;

@property (nonatomic,strong)HomePageSectionOneModel *model;

@end

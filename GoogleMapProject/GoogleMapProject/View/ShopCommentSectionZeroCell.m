//
//  ShopCommentSectionZeroCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopCommentSectionZeroCell.h"
@interface ShopCommentSectionZeroCell()<CWStarRateViewDelegate>
@end
@implementation ShopCommentSectionZeroCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _leftLab =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 60)];
        _leftLab.text = @"我的评分";
        [self.contentView addSubview:_leftLab];
        
        _starRateView = [[CWStarRateView alloc] initWithFrame:CGRectMake(90,10, screenWigth-140, 60) numberOfStars:5];
        _starRateView.scorePercent = 0;
        _starRateView.hasAnimation = YES;
        _starRateView.delegate =self;
        [self.contentView addSubview:_starRateView];
        
    }
    
    return self;
}


@end

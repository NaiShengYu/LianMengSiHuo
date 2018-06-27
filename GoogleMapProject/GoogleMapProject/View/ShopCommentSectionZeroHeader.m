//
//  ShopCommentSectionZeroHeader.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopCommentSectionZeroHeader.h"

@implementation ShopCommentSectionZeroHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        _centerLab =[UILabel new];
        [self addSubview:_centerLab];
        [_centerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.centerX.offset =0;
            
        }];
        _centerLab.font =FontSize(20);
        _centerLab.textAlignment =NSTextAlignmentCenter;
        _centerLab.text =@"百年老店";
        
        
    }
    return self;
}

@end

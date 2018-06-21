//
//  HomePageSectionTowheader.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionTowheader.h"

@implementation HomePageSectionTowheader
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        UILabel *titleLab =[UILabel new];
        [self addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.centerX.offset =0;
        }];
        titleLab.text =@"附近城市";
        titleLab.font =FontSize(15);
    }
    return self;
    
    
}
@end

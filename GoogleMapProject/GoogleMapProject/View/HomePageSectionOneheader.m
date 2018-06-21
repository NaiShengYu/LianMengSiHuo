//
//  HomePageSectionOneheader.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionOneheader.h"

@implementation HomePageSectionOneheader
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        UILabel *titleLab =[UILabel new];
        [self addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.centerX.offset =0;
        }];
        titleLab.text =@"推荐TOPChoice";
        titleLab.font =FontSize(15);
        
        UIView *leftView =[UIView new];
        [self addSubview:leftView];
        [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset =70;
            make.right.equalTo(titleLab.mas_left).offset =-10;
            make.centerY.equalTo(titleLab.mas_centerY).offset =0;
            make.height.offset =1;
        }];
        leftView.backgroundColor =[UIColor grayColor];
        
        UIView *rightView =[UIView new];
        [self addSubview:rightView];
        [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset =70;
            make.left.equalTo(titleLab.mas_right).offset =15;
            make.centerY.equalTo(titleLab.mas_centerY).offset =0;
            make.height.offset =1;
        }];
        rightView.backgroundColor =[UIColor grayColor];
        
    }
    return self;
    
}
@end

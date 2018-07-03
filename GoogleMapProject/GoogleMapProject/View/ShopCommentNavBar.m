//
//  ShopCommentNavBar.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopCommentNavBar.h"

@implementation ShopCommentNavBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =RGBA(167, 38, 30, 1);
        _backBaut =[[UIButton alloc]initWithFrame:CGRectMake(0, MaxY-44, 44, 44)];
        [self addSubview:_backBaut];
        [_backBaut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _rightBut =[UIButton new];
        [self addSubview:_rightBut];
        [_rightBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset =-5;
            make.height.offset =30;
            make.right.offset =-10;
            make.width.offset =60;
        }];
        [_rightBut setTitle:@"发表" forState:UIControlStateNormal];
        _rightBut.titleLabel.font =FontSize(14);
        _rightBut.backgroundColor =RGBA(133, 31, 24, 1);
        _rightBut.layer.cornerRadius =2;
        _rightBut.layer.masksToBounds =YES;
        
        
        _centerLab =[UILabel new];
        [self addSubview:_centerLab];
        [_centerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.rightBut.mas_centerY).offset =0;
            make.centerX.offset =0;
            
        }];
        _centerLab.textColor =[UIColor whiteColor];
        _centerLab.backgroundColor =[UIColor clearColor];
        _centerLab.font =FontSize(18);
        
    }
    return self;
    
    
}

@end

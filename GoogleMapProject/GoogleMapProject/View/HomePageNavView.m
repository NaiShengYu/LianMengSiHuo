//
//  HomePageNavView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageNavView.h"

@implementation HomePageNavView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =RGBA(167, 38, 30, 1);
        _backBut =[[UIButton alloc]initWithFrame:CGRectMake(0, MaxY-44, 44, 44)];
        [self addSubview:_backBut];
        [_backBut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _rightBut =[[UIButton alloc]initWithFrame:CGRectMake(screenWigth-52, MaxY-44, 44, 44)];
        NSLog(@"%f",MaxY);
        [self addSubview:_rightBut];
        [_rightBut setImage:[UIImage imageNamed:@"09"] forState:UIControlStateNormal];
        
        UIImageView *img =[UIImageView new];
        [self addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.rightBut.mas_centerY).offset =0;
            make.left.equalTo(blockSelf.backBut.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img.image =[UIImage imageNamed:@"03"];
        img.backgroundColor=[UIColor clearColor];
        
        _searchBar =[UITextField new];
        [self addSubview:_searchBar];
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.rightBut.mas_centerY).offset =0;
            make.left.equalTo(img.mas_right).offset =7;
            make.right.equalTo(blockSelf.rightBut.mas_left).offset =-45;
            make.height.offset =35;
        }];
        _searchBar.placeholder =@"你想去的地方";
        _searchBar.backgroundColor=[UIColor clearColor];
        
        UIView *lineView =[UIView new];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.backBut.mas_right).offset =10;
            make.bottom.offset =-5;
            make.right.equalTo(blockSelf.rightBut.mas_left).offset =-10;
            make.height.offset =1;
            
        }];
        lineView.backgroundColor =[UIColor whiteColor];
        
        _cancelBut =[UIButton new];
        [self addSubview:_cancelBut];
        [_cancelBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(blockSelf.rightBut.mas_left).offset =-10;
            make.centerY.equalTo(blockSelf.rightBut.mas_centerY).offset =0;
            make.width.offset =30;
            make.height.offset =30;
            
        }];
        [_cancelBut setImage:[UIImage imageNamed:@"登录_11"] forState:UIControlStateNormal];
        
        
    }
    
    return self;
}


@end

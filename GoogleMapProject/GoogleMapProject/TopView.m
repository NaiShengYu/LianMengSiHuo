//
//  TopView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =RGBA(167, 38, 30, 1);
        _backBut =[[UIButton alloc]initWithFrame:CGRectMake(0, MaxY-49, 44, 44)];
        [self addSubview:_backBut];
        [_backBut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _chooseBut =[UIButton new];
        [self addSubview:_chooseBut];
        [_chooseBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.backBut).offset =3;
            make.bottom.offset =-8;
            make.width.offset =70;
            make.left.equalTo(blockSelf.backBut.mas_right).offset =5;
        }];
        [_chooseBut setImage:[UIImage imageNamed:@"12"] forState:UIControlStateNormal];
        [_chooseBut setTitle:@"筛选" forState:UIControlStateNormal];
        _chooseBut.titleLabel.font =FontSize(14);
        _chooseBut.backgroundColor =RGBA(156, 37, 29, 1);
        
        _rightBut =[[UIButton alloc]initWithFrame:CGRectMake(screenWigth-52, MaxY-44, 44, 44)];
        NSLog(@"%f",MaxY);
        
        [self addSubview:_rightBut];
        [_rightBut setImage:[UIImage imageNamed:@"09"] forState:UIControlStateNormal];
        
        UIImageView *img =[UIImageView new];
        [self addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.chooseBut.mas_centerY).offset =0;
            make.left.equalTo(blockSelf.chooseBut.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img.image =[UIImage imageNamed:@"03"];
        img.backgroundColor=[UIColor clearColor];
        
        _searchBar =[UITextField new];
        [self addSubview:_searchBar];
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.chooseBut.mas_centerY).offset =0;
            make.left.equalTo(img.mas_right).offset =7;
            make.right.equalTo(blockSelf.rightBut.mas_left).offset =-10;
            make.height.offset =35;
        }];
        _searchBar.placeholder =@"你想去的地方";
        _searchBar.backgroundColor=[UIColor clearColor];
      
        UIView *lineView =[UIView new];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.chooseBut.mas_right).offset =10;
            make.bottom.offset =-11;
            make.right.equalTo(blockSelf.rightBut.mas_left).offset =-10;
            make.height.offset =1;
            
        }];
        lineView.backgroundColor =[UIColor whiteColor];
        
    }
    
    return self;
}

@end

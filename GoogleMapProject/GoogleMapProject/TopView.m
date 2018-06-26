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
        _backBut =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, MaxY)];
        [self addSubview:_backBut];
        [_backBut setImageEdgeInsets:UIEdgeInsetsMake(15, 0, 0, 0)];

        [_backBut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _chooseBut =[UIButton new];
        [self addSubview:_chooseBut];
        [_chooseBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset =35;
            make.bottom.offset =-5;
            make.width.offset =70;
            make.left.equalTo(blockSelf.backBut.mas_right).offset =5;
        }];
        [_chooseBut setImage:[UIImage imageNamed:@"12"] forState:UIControlStateNormal];
        [_chooseBut setTitle:@" 取消" forState:UIControlStateSelected];
        [_chooseBut setTitle:@" 筛选" forState:UIControlStateNormal];
        _chooseBut.titleLabel.font =FontSize(14);
        //        _chooseBut.backgroundColor =RGBA(156, 37, 29, 1);//浅一点
        _chooseBut.backgroundColor =RGBA(133, 31, 24, 1);
        _chooseBut.layer.cornerRadius =2;
        _chooseBut.layer.masksToBounds =YES;
        
        
        _rightBut =[UIButton new];
        [self addSubview:_rightBut];
        [_rightBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset =-5;
            make.height.offset =35;
            make.right.offset =-10;
            make.width.offset =50;
        }];
        
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

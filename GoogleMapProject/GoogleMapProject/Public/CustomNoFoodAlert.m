//
//  CustomNoFoodAlert.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/14.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CustomNoFoodAlert.h"

@implementation CustomNoFoodAlert

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _backBut =[[UIButton alloc]init];
        [self addSubview:_backBut];
        [_backBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
        _backBut.backgroundColor =[UIColor blackColor];
        _backBut.alpha =0.4;
        [_backBut addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        
        WS(blockSelf);
        UIView *backView = [UIView new];
        [self addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.centerY.offset =10;
            make.width.offset =260;
            make.height.offset =260.0*520.0/800.0-40;
        }];
        backView.layer.cornerRadius =10;
        backView.layer.masksToBounds =YES;//有阴影不需要这句话
        
        backView.backgroundColor =[UIColor whiteColor];
        
        UIImageView *img =[ UIImageView new];
        [backView addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.left.offset =25;
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        img.image =[UIImage imageNamed:@"dog"];
        
        _messageLab =[UILabel new];
        [backView addSubview:_messageLab];
        [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.right.offset =-25;
            make.left.equalTo(img.mas_right).offset =10;
        }];
        _messageLab.textAlignment = NSTextAlignmentCenter;
        //        _messageLab.font = FontSize(16);
        _messageLab.numberOfLines =2;
        _messageLab.adjustsFontSizeToFitWidth = YES;
        _messageLab.text = @"附近暂时没有餐厅\n换个地方试试";
      
        
    }
    return self;
}


- (void)cancel{
    [self removeFromSuperview];
}

@end

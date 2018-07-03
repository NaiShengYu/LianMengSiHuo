//
//  TopView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "TopView.h"
#import "SearchKeyViewController.h"
#import "ViewController.h"

#import "HomePageListViewController.h"

@interface TopView ()<UITextFieldDelegate>
@end
@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =RGBA(167, 38, 30, 1);
        _backBut =[[UIButton alloc]initWithFrame:CGRectMake(0, MaxY-44, 44, 44)];
        [self addSubview:_backBut];
        [_backBut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _chooseBut =[UIButton new];
        [self addSubview:_chooseBut];
        [_chooseBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset =28;
            make.bottom.offset =-5-3.5;
            make.width.offset =60;
            make.left.equalTo(blockSelf.backBut.mas_right).offset =5;
        }];
        [_chooseBut setImage:[UIImage imageNamed:@"12"] forState:UIControlStateNormal];
        [_chooseBut setTitle:@" 关闭" forState:UIControlStateSelected];
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
        [_rightBut addTarget:self action:@selector(goMap) forControlEvents:UIControlEventTouchUpInside];
        
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
        _searchBar.delegate =self;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.vc.navigationController pushViewController:[SearchKeyViewController new] animated:NO];
}


- (void)goMap{
    if ([self.vc isKindOfClass:[HomePageListViewController class]]) {
        ViewController *vc =[[ViewController alloc]init];
        [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [self.vc.navigationController pushViewController:vc animated:NO];
        } completion:^(BOOL finished) {
        }];
    }else{
        HomePageListViewController *vc =[[HomePageListViewController alloc]init];
        [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [self.vc.navigationController pushViewController:vc animated:NO];
        } completion:^(BOOL finished) {
        }];        
    }
    
    
}


@end

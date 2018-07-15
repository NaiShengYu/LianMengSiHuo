//
//  CustomNetAlertView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/14.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CustomNetAlertView.h"

@implementation CustomNetAlertView


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
            make.height.offset =260.0*520.0/800.0-20;
        }];
        backView.layer.cornerRadius =10;
        backView.layer.masksToBounds =YES;//有阴影不需要这句话
      
        backView.backgroundColor =[UIColor whiteColor];
        
        
        _messageLab =[UILabel new];
        [backView addSubview:_messageLab];
        [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =45;
            make.right.offset =-15;
            make.left.offset =15;
            
        }];
        _messageLab.textAlignment = NSTextAlignmentCenter;
//        _messageLab.font = FontSize(16);
        _messageLab.numberOfLines =2;
        _messageLab.adjustsFontSizeToFitWidth = YES;
        
        _cancelBut = [UIButton new];
        [backView addSubview:_cancelBut];
        [_cancelBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset =-15;
            make.right.offset =-15;
            make.height.offset =35;
            make.width.offset = (260-40)/2;
        }];
        [_cancelBut addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        _cancelBut.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [_cancelBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBut.layer.cornerRadius =5;
        _cancelBut.layer.masksToBounds = YES;
        [_cancelBut setTitle:@"取消" forState:UIControlStateNormal];
        
        _setBut =[[UIButton alloc]init];
        [backView addSubview:_setBut];
        [_setBut mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.bottom.offset =-15;
            make.left.offset =15;
            make.height.offset =35;
            make.width.offset = (260-40)/2;
        }];
        _setBut.backgroundColor =zhuse;
        _setBut.layer.cornerRadius =5;
        _setBut.layer.masksToBounds = YES;
        [_setBut addTarget:self action:@selector(updata) forControlEvents:UIControlEventTouchUpInside];
        _setBut.backgroundColor =zhuse;
        
    }
    return self;
}



- (void)updata{
    if ([_setBut.titleLabel.text isEqualToString:@"设置网络"]){
    NSString * urlString = @"App-Prefs:root=WIFI";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
        
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
            
        } else {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }
        
    }
    }else{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}

- (void)cancel{
    [self removeFromSuperview];
}
@end

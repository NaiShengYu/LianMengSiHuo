//
//  VersionInformationViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "VersionInformationViewController.h"

@interface VersionInformationViewController ()

@property(nonatomic,strong)UIButton *upBut;
@end

@implementation VersionInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"版本信息";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    [self creatView];
}

- (void)creatView{
    
    UIImageView *img =[UIImageView new];
    [self.view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.offset =80;
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    img.image =[UIImage imageNamed:@"个人中心_07"];
    
    UILabel *versonLab =[UILabel new];
    [self.view addSubview:versonLab];
    [versonLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.equalTo(img.mas_bottom).offset =30;
        
    }];
    versonLab.text = @"当前版本：V1.0\n(最新版本)";
    versonLab.numberOfLines =2;
    
    _upBut =[[UIButton alloc]init];
    [self.view addSubview:_upBut];
    [_upBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.equalTo(versonLab.mas_bottom).offset =30;
        make.width.offset =200;
        make.height.offset =40;
    }];
    [_upBut setTitle:@"更新到v2.0.1" forState:UIControlStateNormal];
    _upBut.backgroundColor =zhuse;
    _upBut.layer.cornerRadius =5;
    _upBut.layer.masksToBounds = YES;
    
    UILabel *bottomLab = [UILabel new];
    [self.view addSubview:bottomLab];
    [bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.bottom.offset =-30;
        make.width.offset =screenWigth-80;
        make.height.offset =50;
    }];
    bottomLab.text =@"Copyright 2013-2015©联盟旅游网™ All rignts reserved\n京ICP备13016541号-2";
    bottomLab.textColor =[UIColor lightGrayColor];
    bottomLab.font =FontSize(14);
    bottomLab.textAlignment =NSTextAlignmentCenter;
    
    
    
}

#pragma mark --自定义导航栏
- (void)ziDingYiDaoHangLan{
    self.navigationController.navigationBar.translucent =NO;
    self.navigationController.navigationBar.barTintColor =zhuse;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                      NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    UIButton *img =[[UIButton alloc]init];
    [img sizeToFit];
    [img addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [img setImage:[UIImage imageNamed:@"turn_back"]
         forState:UIControlStateNormal];
    [img setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    UIBarButtonItem *left =[[UIBarButtonItem alloc]initWithCustomView:img];
    left.tintColor =[UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem =left;
    
    
    
}
- (void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end

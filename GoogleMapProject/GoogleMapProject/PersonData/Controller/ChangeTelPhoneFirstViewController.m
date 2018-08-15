//
//  ChangeTelPhoneFirstViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/8/15.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ChangeTelPhoneFirstViewController.h"
#import "BindingPhoneViewController.h"
@interface ChangeTelPhoneFirstViewController ()
@property (nonatomic,strong)UITextField *phoneTF;

@end

@implementation ChangeTelPhoneFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatView];
    [self ziDingYiDaoHangLan];
}

- (void)creatView{
    WS(blockSelf);
    UIView *backView =[UIView new];
    [self.view addSubview:backView];
    backView.backgroundColor =[UIColor whiteColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset =0;
        make.height.offset =150;
        make.top.offset =0;
    }];
    
    UIView *backV1 =[UIView new];
    [backView addSubview:backV1];
    [backV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset =15;
        make.right.offset =-5;
        make.height.offset =50;
    }];
    
    UILabel *phoneLab =[UILabel new];
    [backV1 addSubview:phoneLab];
    [phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =0;
        make.bottom.offset =0;
        make.left.offset =5;
        make.width.offset =70;
    }];
    phoneLab.text =@"手机号";
    
    UIView *lineV1 =[UIView new];
    [backV1 addSubview:lineV1];
    [lineV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLab.mas_right).offset =0;
        make.bottom.offset =-1;
        make.height.offset =1;
        make.right.offset =-5;
    }];
    lineV1.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    UIButton *but =[UIButton new];
    [backV1 addSubview:but];
    [but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneLab.mas_centerY).offset =0;
        make.height.offset =40;
        make.width.offset =40;
        make.left.equalTo(phoneLab.mas_right).offset =10;
    }];
    [but setTitle:@"+86" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
   
    _phoneTF =[UITextField new];
    [backV1 addSubview:_phoneTF];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(but.mas_right).offset =10;
        make.right.offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(phoneLab.mas_centerY).offset =0;
    }];
    _phoneTF.placeholder =[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:PHONE]];
    _phoneTF.enabled = NO;
    


    
    UIButton* updataBut =[UIButton new];
    [backView addSubview:updataBut];
    [updataBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.bottom.offset =-20;
        make.height.offset =40;
        make.width.offset =200;
    }];
    updataBut.backgroundColor =zhuse;
    [updataBut setTitle:@"修改手机号" forState:UIControlStateNormal];
    updataBut.layer.cornerRadius =5;
    updataBut.layer.masksToBounds =YES;
    [updataBut addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)update{
    [self.navigationController pushViewController:[BindingPhoneViewController new] animated:NO];
}


#pragma mark --自定义导航栏
- (void)ziDingYiDaoHangLan{
    
    self.title = @"修改手机";
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

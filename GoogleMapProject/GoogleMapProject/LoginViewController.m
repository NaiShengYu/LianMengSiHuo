//
//  LoginViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/19.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "LoginViewController.h"
#import "FogotViewController.h"
#import "RegistViewController.h"
#import "ThirdPartyLandedView.h"
#import "HomePageViewController.h"
@interface LoginViewController ()
@property (nonatomic,strong)ThirdPartyLandedView *thirdLandedView;
@property (nonatomic,strong)UIButton *thirdLandedBackBut;
@property (nonatomic,strong)UIButton *moreBut;


@property (nonatomic,strong)UITextField *nameTF;
@property (nonatomic,strong)UITextField *passTF;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =zhuse;

    

    [self creatView];
    [self CreatThirdPartyLanded];
}

- (void)creatView{
    WS(blockSelf);
    UIScrollView *scr =[[UIScrollView alloc]init];
    [self.view addSubview:scr];
    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(blockSelf.view);
    }];
    
    UIView *containerView =[UIView new];
    [scr addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scr);
        make.width.equalTo(scr); // 需要设置宽度和scrollview宽度一样
    }];
    
    
    UIButton *rightBut =[UIButton new];
    [containerView addSubview:rightBut];
    [rightBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =MaxY-44;
        make.right.offset =-10;
        make.width.offset =44;
        make.height.offset =44;
    }];
    rightBut.backgroundColor =[UIColor whiteColor];
    
    UIImageView *imgV =[UIImageView new];
    [containerView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.equalTo(rightBut.mas_bottom).offset =40;
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    imgV.backgroundColor =[UIColor whiteColor];
    
    UIView *V1 =[UIView new];
    [containerView addSubview:V1];
    [V1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgV.mas_bottom).offset =30;
        make.left.offset =20;
        make.right.offset =-20;
        make.height.offset =50;
    }];
    V1.backgroundColor =[UIColor clearColor];
    
    UIView *backV1 =[UIView new];
    [V1 addSubview:backV1];
    [backV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.offset =0;
    }];
    backV1.backgroundColor =RGBA(255, 255, 255, 0.4);
    
    _nameTF =[[UITextField alloc]init];
    [V1 addSubview:_nameTF];
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset =10;
        make.top.bottom.offset =0;
        make.right.offset =-60;
    }];
    _nameTF.backgroundColor =[UIColor clearColor];
    _nameTF.placeholder = @"用户名 USerName";
    [_nameTF addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *cancelBut =[UIButton new];
    [V1 addSubview:cancelBut];
    [cancelBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset =0;
        make.width.offset =50;
    }];
    cancelBut.backgroundColor =[UIColor orangeColor];
    [cancelBut addTarget:self action:@selector(clearNameTF) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *V2 =[UIView new];
    [containerView addSubview:V2];
    [V2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(V1.mas_bottom).offset =20;
        make.left.offset =20;
        make.right.offset =-20;
        make.height.offset =50;
    }];
    V2.backgroundColor =[UIColor clearColor];
    
    UIView *backV2 =[UIView new];
    [V2 addSubview:backV2];
    [backV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.offset =0;
    }];
    backV2.backgroundColor =RGBA(255, 255, 255, 0.4);
    
    _passTF =[[UITextField alloc]init];
    [V2 addSubview:_passTF];
    [_passTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset =10;
        make.top.bottom.offset =0;
        make.right.offset =-60;
    }];
    _passTF.backgroundColor =[UIColor clearColor];
    _passTF.placeholder = @"密 码 Password";
    [_passTF addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];

    UIButton *showBut =[UIButton new];
    [V2 addSubview:showBut];
    [showBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset =0;
        make.width.offset =50;
    }];
    showBut.backgroundColor =[UIColor orangeColor];
    [showBut addTarget:self action:@selector(changePassword:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loginBut =[UIButton new];
    [containerView addSubview:loginBut];
    [loginBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(V2.mas_bottom).offset =20;
        make.left.offset =20;
        make.right.offset =-20;
        make.height.offset =50;
    }];
    loginBut.backgroundColor =RGBA(239, 181, 64, 1);
    [loginBut setTitle:@"登陆 Login" forState:UIControlStateNormal];
    [loginBut addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *fogotBut =[UIButton new];
    [containerView addSubview:fogotBut];
    [fogotBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBut.mas_bottom).offset =20;
        make.left.offset =20;
        make.width.offset =screenWigth/2-40;
        make.height.offset =40;
    }];
    fogotBut.titleLabel.adjustsFontSizeToFitWidth =YES;
    [fogotBut setTitle:@"忘记密码 \nForgot Password？" forState:UIControlStateNormal];
    fogotBut.titleLabel.numberOfLines =2;
    [fogotBut addTarget:self action:@selector(fogotBut) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rgistBut =[UIButton new];
    [containerView addSubview:rgistBut];
    [rgistBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(fogotBut.mas_centerY).offset =0;
        make.right.offset =-20;
        make.width.offset =100;
        make.height.offset =30;
    }];
    rgistBut.titleLabel.font =FontSize(15);
    rgistBut.titleLabel.adjustsFontSizeToFitWidth =YES;
    rgistBut.backgroundColor =RGBA(166, 38, 30, 1);
    rgistBut.layer.cornerRadius=4;
    rightBut.layer.masksToBounds =YES;
    [rgistBut setTitle:@"注册 Register" forState:UIControlStateNormal];
    [rgistBut addTarget:self action:@selector(registBut) forControlEvents:UIControlEventTouchUpInside];

    UILabel *lab =[UILabel new];
    [containerView addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.equalTo(fogotBut.mas_bottom).offset =40;
    }];
    lab.text =@"第三方登陆 Or Log In With";
    lab.textColor =[UIColor whiteColor];
    
    UIView *leftView =[UIView new];
    [containerView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset =30;
        make.right.equalTo(lab.mas_left).offset =-15;
        make.centerY.equalTo(lab.mas_centerY).offset =0;
        make.height.offset =1;
    }];
    leftView.backgroundColor =[UIColor whiteColor];
    
    UIView *rightView =[UIView new];
    [containerView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset =30;
        make.left.equalTo(lab.mas_right).offset =15;
        make.centerY.equalTo(lab.mas_centerY).offset =0;
        make.height.offset =1;
    }];
    rightView.backgroundColor =[UIColor whiteColor];
    
    UIButton *weiXin =[UIButton new];
    [containerView addSubview:weiXin];
    [weiXin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset =30;
        make.right.equalTo(containerView.mas_centerX).offset =-10;
        make.width.offset =60;
        make.height.offset =60;
    }];
    [weiXin setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    weiXin.backgroundColor =[UIColor orangeColor];
    
    UIButton *QQ =[UIButton new];
    [containerView addSubview:QQ];
    [QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset =30;
        make.left.equalTo(containerView.mas_centerX).offset =10;
        make.width.offset =60;
        make.height.offset =60;
    }];
    [QQ setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    QQ.backgroundColor =[UIColor orangeColor];
   
    _moreBut =[UIButton new];
    [containerView addSubview:_moreBut];
    [_moreBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(QQ.mas_bottom).offset =30;
        make.centerX.equalTo(containerView.mas_centerX).offset =0;
        make.height.offset =60;
    }];
    [_moreBut setTitle:@"更多登陆方式>>" forState:UIControlStateNormal];
    _moreBut.titleLabel.font =FontSize(15);
    [_moreBut addTarget:self action:@selector(thirdLanded:) forControlEvents:UIControlEventTouchUpInside];

    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(blockSelf.moreBut.mas_bottom).offset(30);// 这里放最后一个view的底部
    }];
    
}

- (void)CreatThirdPartyLanded{
    
    _thirdLandedBackBut =[[UIButton alloc]initWithFrame:self.view.bounds];
    _thirdLandedBackBut.hidden =YES;
    _thirdLandedBackBut.backgroundColor =[UIColor blackColor];
    _thirdLandedBackBut.alpha =0.2;
    [_thirdLandedBackBut addTarget:self action:@selector(thirdLanded:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_thirdLandedBackBut];
    _thirdLandedView =[[ThirdPartyLandedView alloc]initWithFrame:CGRectMake(0, screenHeight, screenHeight, 170)];
    [self.view addSubview:_thirdLandedView];
}
- (void)thirdLanded:(UIButton *)but{
    WS(blockSelf);
    but.selected =!but.selected;
    _thirdLandedBackBut.selected =but.selected;
    _moreBut.selected =but.selected;
    if (but.selected ==YES) {
        _thirdLandedBackBut.hidden =NO;
        [UIView animateWithDuration:0.5 animations:^{
            blockSelf.thirdLandedView.frame=CGRectMake(0, screenHeight-170, screenHeight, 170);
        }];
    }else{
        _thirdLandedBackBut.hidden =YES;
        [UIView animateWithDuration:0.5 animations:^{
            blockSelf.thirdLandedView.frame=CGRectMake(0, screenHeight, screenHeight, 170);
        }];
        
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
}


#pragma mark --清空输入框
- (void)clearNameTF{
    _nameTF.text =@"";
}
#pragma mark --输入框内容改变
- (void)textChange:(UITextField *)text{
    
    
}
#pragma mark --改变密码是否可见
- (void)changePassword:(UIButton *)but{
    
    but.selected =!but.selected;
    if (but.selected ==YES) {
        _passTF.secureTextEntry =YES;
    }else{
      _passTF.secureTextEntry =NO;
    }
}
#pragma mark -- 登陆
- (void)login{
    UIWindow *window =[[UIApplication sharedApplication].delegate window];
    window.rootViewController =[[HomePageViewController alloc]init];
}

#pragma mark --进入忘记密码界面
- (void)fogotBut{
    
    [self.navigationController pushViewController:[FogotViewController new] animated:YES];
    
}
#pragma mark --进入注册界面
- (void)registBut{
    
    [self.navigationController pushViewController:[RegistViewController new] animated:YES];

    
}
@end

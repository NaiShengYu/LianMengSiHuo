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
#import "RegistSecondViewController.h"
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

    UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登录背景"]];
    imgV.frame =self.view.bounds;
    [self.view addSubview:imgV];

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
    [rightBut setImage:[UIImage imageNamed:@"登录_03"] forState:UIControlStateNormal];
    [rightBut addTarget:self action:@selector(gohomePage) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imgV =[UIImageView new];
    [containerView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.equalTo(rightBut.mas_bottom).offset =40;
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    imgV.image =[UIImage imageNamed:@"登录_07"];
    
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
    [cancelBut setImage:[UIImage imageNamed:@"登录_11"] forState:UIControlStateNormal];
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
    _passTF.secureTextEntry =YES;
    [_passTF addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];

    UIButton *showBut =[UIButton new];
    [V2 addSubview:showBut];
    [showBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset =0;
        make.width.offset =50;
    }];
    [showBut setImage:[UIImage imageNamed:@"登录_23"] forState:UIControlStateNormal];
    [showBut setImage:[UIImage imageNamed:@"登录_19"] forState:UIControlStateHighlighted];
    [showBut setImage:[UIImage imageNamed:@"登录_19"] forState:UIControlStateSelected];
    showBut.selected = YES;

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
//    [loginBut setTitle:@"登陆 Login" forState:UIControlStateNormal];
    [loginBut addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginBut setBackgroundImage:[UIImage imageNamed:@"登录_27"] forState:UIControlStateNormal];
    
    
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
        make.top.equalTo(fogotBut.mas_bottom).offset =60;
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
        make.left.offset =30;
        
        make.width.offset =60;
        make.height.offset =60;
    }];
    [weiXin setImage:[UIImage imageNamed:@"登录_42"] forState:UIControlStateNormal];
    weiXin.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [weiXin addTarget:self action:@selector(weiXinLogin) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *QQ =[UIButton new];
    [containerView addSubview:QQ];
    [QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset =30;
        make.left.equalTo(weiXin.mas_right).offset =30;
        make.width.offset =60;
        make.height.offset =60;
    }];
    QQ.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [QQ setImage:[UIImage imageNamed:@"登录_39"] forState:UIControlStateNormal];
    [QQ addTarget:self action:@selector(QQLogin) forControlEvents:UIControlEventTouchUpInside];
    
   
    _moreBut =[UIButton new];
    [containerView addSubview:_moreBut];
    [_moreBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset =30;
        make.left.equalTo(QQ.mas_right).offset =30;
        make.right.offset =-20;
        make.height.offset =60;
    }];
    [_moreBut setTitle:@"更多登陆方式>>" forState:UIControlStateNormal];
    _moreBut.titleLabel.font =FontSize(15);
    [_moreBut addTarget:self action:@selector(thirdLanded:) forControlEvents:UIControlEventTouchUpInside];

    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(blockSelf.moreBut.mas_bottom).offset(20);// 这里放最后一个view的底部
    }];
    
}

#pragma --mark -- 创建更多登录方式界面
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

#pragma mark --显示更多登陆方式
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
//    UIWindow *window =[[UIApplication sharedApplication].delegate window];
//    window.rootViewController =[[HomePageViewController alloc]init];
//
    [PubulicObj ShowSVWhitMessage];
    if (_nameTF.text.length ==0 ||_nameTF.text ==nil) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    
    if (_passTF.text.length ==0 ||_passTF.text ==nil) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"login" forKey:@"app"];
    [param setObject:_nameTF.text forKey:@"username"];
    [param setObject:_passTF.text forKey:@"password"];
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            NSDictionary *dic = responseObject[@"data"][0];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:dic[@"userid"] forKey:USERID];
            [user setObject:dic[@"username"] forKey:USERNAME];
            [user setObject:dic[@"nickname"] forKey:NICKNAME];
            [user setObject:dic[@"user_state"] forKey:USERSTATE];
            [user setObject:dic[@"headpic"] forKey:USERHEADPIC];
            [user setObject:dic[@"phone"] forKey:PHONE];
            [user setObject:dic[@"sex"] forKey:SEX];
            [user setObject:dic[@"email"] forKey:EMAIL];
            [user synchronize];
            
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"登陆成功"];
            [CustomAccount sharedCustomAccount].loginType =1;
            
            [blockSelf performSelector:@selector(gohomePage) withObject:nil afterDelay:1.0];
            
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"用户名密码不正确，请重新输入！"];
        }
        
        
    } failure:^(NSError *error) {
        
    } isShowHUD:YES];
    
}

#pragma mark -- 微信登录
- (void)weiXinLogin{
    
    //例如QQ的登录
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             NSLog(@"原始数据：%@",user.rawData);
             NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
             DLog(@"url==%@",url);
             NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
             [param setObject:@"user_wechat" forKey:@"app"];
             [param setObject:user.nickname forKey:@"nickname"];
             [param setObject:user.icon forKey:@"headpic"];
             [param setObject:user.rawData[@"sex"] forKey:@"sex"];
             [param setObject:user.rawData[@"country"] forKey:@"country"];
             [param setObject:user.rawData[@"province"] forKey:@"province"];
             [param setObject:user.rawData[@"city"] forKey:@"city"];
             [param setObject:user.uid forKey:@"wx_openid"];
             WS(blockSelf);
             [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
                 if ([responseObject[@"code"] integerValue] ==1) {
                     NSDictionary *dic = responseObject[@"data"][0];
                     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                     [user setObject:dic[@"userid"] forKey:USERID];
                     [user setObject:dic[@"username"] forKey:USERNAME];
                     [user setObject:dic[@"nickname"] forKey:NICKNAME];
                     [user setObject:dic[@"user_state"] forKey:USERSTATE];
                     [user setObject:dic[@"headpic"] forKey:USERHEADPIC];
                     [user setObject:dic[@"phone"] forKey:PHONE];
                     [user setObject:dic[@"sex"] forKey:SEX];
                     [user setObject:dic[@"email"] forKey:EMAIL];
                     [user synchronize];

                     [PubulicObj ShowSVWhitMessage];
                     [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"登陆成功"];
                     [CustomAccount sharedCustomAccount].loginType =1;

                     [blockSelf performSelector:@selector(gohomePage) withObject:nil afterDelay:1.0];

                 }else{
                     [PubulicObj ShowSVWhitMessage];
                     [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"登录失败"];
                 }


             } failure:^(NSError *error) {

             } isShowHUD:YES];
             
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
    
    
}

#pragma mark --QQ登录
- (void)QQLogin{
    
    
    //例如QQ的登录
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
             DLog(@"url==%@",url);
             NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
             [param setObject:@"user_qq" forKey:@"app"];
             [param setObject:user.nickname forKey:@"nickname"];
             [param setObject:user.icon forKey:@"headpic"];
             [param setObject:user.uid forKey:@"qq_openid"];
             WS(blockSelf);
             [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
                 if ([responseObject[@"code"] integerValue] ==1) {
                     NSDictionary *dic = responseObject[@"data"][0];
                     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                     [user setObject:dic[@"userid"] forKey:USERID];
                     [user setObject:dic[@"username"] forKey:USERNAME];
                     [user setObject:dic[@"nickname"] forKey:NICKNAME];
                     [user setObject:dic[@"user_state"] forKey:USERSTATE];
                     [user setObject:dic[@"headpic"] forKey:USERHEADPIC];
                     [user setObject:dic[@"phone"] forKey:PHONE];
                     [user setObject:dic[@"sex"] forKey:SEX];
                     [user setObject:dic[@"email"] forKey:EMAIL];
                     [user synchronize];
                     NSInteger isFirst = [dic[@"first"] integerValue];
//                     isFirst = 1;
                     if (isFirst ==1) {
                         RegistSecondViewController *secondVC =[[RegistSecondViewController alloc]init];
                         secondVC.userType = 2;
                         [self.navigationController pushViewController:secondVC animated:YES];
                         
                     }else{
                         [PubulicObj ShowSVWhitMessage];
                         [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"登陆成功"];
                         [CustomAccount sharedCustomAccount].loginType =1;
                         [blockSelf performSelector:@selector(gohomePage) withObject:nil afterDelay:1.0];
                     }
                   
                     
                 }else{
                     [PubulicObj ShowSVWhitMessage];
                     [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"登录失败"];
                 }
                 
                 
             } failure:^(NSError *error) {
                 
             } isShowHUD:YES];
 
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
}


#pragma mark --进入忘记密码界面
- (void)fogotBut{
    
    [self.navigationController pushViewController:[FogotViewController new] animated:YES];
    
}
#pragma mark --进入注册界面
- (void)registBut{
    [self.navigationController pushViewController:[RegistViewController new] animated:YES];
}

- (void)gohomePage{
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

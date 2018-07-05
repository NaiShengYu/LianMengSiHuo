//
//  FogotViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/19.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FogotViewController.h"
#import "FogotSecondViewController.h"
@interface FogotViewController ()
{
    NSInteger time;
}
@property (nonatomic,strong)UIButton *timerBut;
@property (nonatomic,strong)UITextField *phoneTF;
@property (nonatomic,strong)UITextField *codeTF;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,copy)NSString *code;

@end

@implementation FogotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    time =60;
    self.title =@"忘记密码";
    [self ziDingYiDaoHangLan];
    [self creatView];
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self startGetCode];
}
- (void)creatView{
    WS(blockSelf);
    UIView *backView =[UIView new];
    [self.view addSubview:backView];
    backView.backgroundColor =[UIColor whiteColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset =0;
        make.height.offset =190;
        make.top.offset =0;
    }];
    
    UIView *backV1 =[UIView new];
    [backView addSubview:backV1];
    [backV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset =5;
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
    
    _timerBut =[UIButton new];
    [backV1 addSubview:_timerBut];
    [_timerBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneLab.mas_centerY).offset =0;
        make.right.offset =-5;
        make.height.offset =28;
        make.width.offset =70;
    }];
    [_timerBut setTitle:@"获取验证码" forState:UIControlStateNormal];
    _timerBut.titleLabel.font =FontSize(13);
    [_timerBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _timerBut.layer.cornerRadius =4;
    _timerBut.layer.borderColor =[UIColor grayColor].CGColor;
    _timerBut.layer.borderWidth =1;
    _timerBut.layer.masksToBounds = YES;
    [_timerBut addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
    
    
    _phoneTF =[UITextField new];
    [backV1 addSubview:_phoneTF];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(but.mas_right).offset =10;
        make.right.equalTo(blockSelf.timerBut.mas_left).offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(phoneLab.mas_centerY).offset =0;
    }];
    _phoneTF.placeholder =@"请输入手机号";
    
    UIView *backV2 =[UIView new];
    [backView addSubview:backV2];
    [backV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backV1.mas_bottom).offset =5;
        make.left.offset =5;
        make.right.offset =-5;
        make.height.offset =50;
    }];
    
    UILabel *codeLab =[UILabel new];
    [backV2 addSubview:codeLab];
    [codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =0;
        make.bottom.offset =0;
        make.left.offset =5;
        make.width.offset =70;
    }];
    codeLab.text =@"验证码";
    
    UIView *lineV2 =[UIView new];
    [backV2 addSubview:lineV2];
    [lineV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeLab.mas_right).offset =0;
        make.bottom.offset =-1;
        make.height.offset =1;
        make.right.offset =-5;
    }];
    lineV2.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    _codeTF =[UITextField new];
    [backV2 addSubview:_codeTF];
    [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineV2).offset =10;
        make.right.offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(codeLab.mas_centerY).offset =0;
        
    }];
    
    UIButton* updataBut =[UIButton new];
    [backView addSubview:updataBut];
    [updataBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.bottom.offset =-20;
        make.height.offset =40;
        make.width.offset =200;
    }];
    updataBut.backgroundColor =zhuse;
    [updataBut setTitle:@"提交" forState:UIControlStateNormal];
    updataBut.layer.cornerRadius =5;
    updataBut.layer.masksToBounds =YES;
    [updataBut addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)update{
    
    WS(blockSelf);
    if (_phoneTF.text.length ==0 ||_phoneTF.text ==nil) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入电话号码"];
        return;
    }
    if (![[PubulicObj valiMobile:_phoneTF.text] isEqualToString:@"是"]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请填写正确手机号！"];
        return;
    }
    if (_codeTF.text.length ==0 ||_codeTF.text ==nil) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入验证码"];
        return;
    }
    if (![_codeTF.text isEqualToString:self.code]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"验证码不正确"];
        return;
    }
    
    [self.navigationController pushViewController:[FogotSecondViewController new] animated:YES];
    
}
#pragma  mark --获取验证码
- (void)getCode{
    WS(blockSelf);
    if (_phoneTF.text.length ==0 ||_phoneTF.text ==nil) {
        [SVProgressHUD showErrorWithStatus:@"请输入电话号码"];
        return;
    }
    if (![[PubulicObj valiMobile:_phoneTF.text] isEqualToString:@"是"]) {
        [SVProgressHUD showErrorWithStatus:@"请正确手机号"];
        return;
    }
    _timerBut.enabled =NO;
    _timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    [_timer fire];
    
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_forget_phone" forKey:@"app"];
    [param setObject:_phoneTF.text forKey:@"phone"];
    
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            self.code = [NSString stringWithFormat:@"%@",responseObject[@"data"]];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"验证码已发送至手机！"];
        }else{
            [blockSelf startGetCode];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [blockSelf startGetCode];
    } isShowHUD:YES];
    
    
}
- (void)changeTime{
    if (time >0) {
        time -=1;
        NSString *str;
        if (time >9) {
            str = [NSString stringWithFormat:@"%ld",(long)time];
        }else{
            str = [NSString stringWithFormat:@"0%ld",(long)time];
        }
        [_timerBut setTitle:[NSString stringWithFormat:@"%@s",str] forState:UIControlStateNormal];
        _timerBut.backgroundColor =[UIColor groupTableViewBackgroundColor];
    }else{
        [self startGetCode];
        
    }
}
//可以重新获取验证码
- (void)startGetCode{
    [_timer invalidate];
    _timer =nil;
    time =60;
    [_timerBut setTitle:@"获取验证码" forState:UIControlStateNormal];
    _timerBut.enabled =YES;
    _timerBut.backgroundColor =[UIColor whiteColor];
    
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
}@end

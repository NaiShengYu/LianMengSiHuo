//
//  RegistViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/19.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FogotViewController.h"
#import "FogotSecondViewController.h"
@interface FogotViewController ()
{
    
}
@property (nonatomic,strong)UIButton *timerBut;
@property (nonatomic,strong)UITextField *phoneTF;
@property (nonatomic,strong)UITextField *codeTF;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UILabel *phoneLab;
@property (nonatomic,strong)UIButton *but;
@property (nonatomic,strong)UILabel *codeLab;


@property (nonatomic,strong)UIView *lineView;
@property (nonatomic,strong)UIButton *telBut;
@property (nonatomic,strong)UIButton *mailBut;
@property (nonatomic,strong)UIButton *lastBut;

@property (nonatomic,assign) NSInteger time;

@property (nonatomic,copy) NSString *code;

@end

@implementation FogotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _time =60;
    _code = @"";
    self.title =@"忘记密码";
    [self ziDingYiDaoHangLan];
    [self functionBar];
    [self creatView];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_timer invalidate];
    _timer =nil;
    _time =60;
    _phoneTF.text = @"";
    _codeTF.text = @"";
    _code = @"";
    [_timerBut setTitle:@"获取验证码" forState:UIControlStateNormal];
    _timerBut.enabled =YES;

}

- (void)functionBar{
    UIView *backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 55)];;
    [self.view addSubview:backView];
    backView.backgroundColor =[UIColor lightGrayColor];
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWigth/2, 50)];
    [backView addSubview:lab1];
    lab1.textAlignment =NSTextAlignmentCenter;
    lab1.font = FontSize(13);
    lab1.textColor = [UIColor grayColor];
    NSMutableAttributedString *mut1 = [[NSMutableAttributedString alloc]initWithString:@"手机号\nCell-phone number"];
    [mut1 addAttribute:NSFontAttributeName value:FontSize(19) range:NSMakeRange(0, 3)];
    lab1.attributedText = mut1;
    lab1.numberOfLines =2;
    lab1.backgroundColor =[UIColor whiteColor];
    
    _telBut =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, screenWigth/2, 50)];
    [backView addSubview:_telBut];
    [_telBut addTarget:self action:@selector(selectChange:) forControlEvents:UIControlEventTouchUpInside];
    _telBut.backgroundColor =[UIColor clearColor];
    _lastBut =_telBut;
    
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(screenWigth/2, 0, screenWigth/2, 50)];
    [backView addSubview:lab2];
    lab2.textAlignment =NSTextAlignmentCenter;
    lab2.font = FontSize(13);
    lab2.textColor = [UIColor grayColor];
    NSMutableAttributedString *mut2 = [[NSMutableAttributedString alloc]initWithString:@"邮箱注册\nE-mail register"];
    [mut2 addAttribute:NSFontAttributeName value:FontSize(19) range:NSMakeRange(0, 2)];
    lab2.attributedText = mut2;
    lab2.numberOfLines =2;
    lab2.backgroundColor =[UIColor whiteColor];
    
    _mailBut =[[UIButton alloc]initWithFrame:CGRectMake(screenWigth/2, 0, screenWigth/2, 50)];
    [backView addSubview:_mailBut];
    [_mailBut addTarget:self action:@selector(selectChange:) forControlEvents:UIControlEventTouchUpInside];
    
    _lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 50, screenWigth/2, 5)];
    _lineView.backgroundColor = zhuse;
    [backView addSubview:_lineView];
    
}

- (void)selectChange:(UIButton *)but{
    
    if(_time!=60){
        return;
    }
    
    if (_lastBut ==but) {
        return;
    }
    WS(blockSelf);
    
    [_timer invalidate];
    _timer =nil;
    _time =60;
    
    if (but ==_telBut) {
        _phoneLab.text =@"手机号";
        _phoneTF.placeholder =@"请输入手机号";
        _but.hidden =NO;
        [UIView animateWithDuration:0.25 animations:^{
            blockSelf.lineView.frame =CGRectMake(0, 50, screenWigth/2, 5);
        }];
        
        [_but mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.phoneLab.mas_centerY).offset =0;
            make.height.offset =40;
            make.width.offset =40;
            make.left.equalTo(blockSelf.phoneLab.mas_right).offset =5;
        }];
    }else{
        _phoneLab.text =@"邮箱";
        _phoneTF.placeholder =@"请输入邮箱";
        _but.hidden =YES;
        [UIView animateWithDuration:0.25 animations:^{
            blockSelf.lineView.frame =CGRectMake(screenWigth/2, 50, screenWigth/2, 5);
        }];
        [_but mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.phoneLab.mas_centerY).offset =0;
            make.height.offset =0;
            make.width.offset =0;
            make.left.equalTo(blockSelf.phoneLab.mas_right).offset =5;
        }];
    }
    _lastBut = but;
    
}




- (void)creatView{
    WS(blockSelf);
    UIView *backView =[UIView new];
    [self.view addSubview:backView];
    backView.backgroundColor =[UIColor whiteColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset =0;
        make.height.offset =190;
        make.top.offset =55;
    }];
    
    UIView *backV1 =[UIView new];
    [backView addSubview:backV1];
    [backV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset =5;
        make.right.offset =-5;
        make.height.offset =50;
    }];
    
    _phoneLab =[UILabel new];
    [backV1 addSubview:_phoneLab];
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =0;
        make.bottom.offset =0;
        make.left.offset =5;
        make.width.offset =60;
    }];
    _phoneLab.text =@"手机号";
    _phoneLab.textAlignment =NSTextAlignmentRight;
    
    UIView *lineV1 =[UIView new];
    [backV1 addSubview:lineV1];
    [lineV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blockSelf.phoneLab.mas_right).offset =0;
        make.bottom.offset =-1;
        make.height.offset =1;
        make.right.offset =-5;
    }];
    lineV1.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    _but =[UIButton new];
    [backV1 addSubview:_but];
    [_but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(blockSelf.phoneLab.mas_centerY).offset =0;
        make.height.offset =40;
        make.width.offset =40;
        make.left.equalTo(blockSelf.phoneLab.mas_right).offset =5;
    }];
    [_but setTitle:@"+86" forState:UIControlStateNormal];
    [_but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _timerBut =[UIButton new];
    [backV1 addSubview:_timerBut];
    [_timerBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(blockSelf.phoneLab.mas_centerY).offset =0;
        make.right.offset =-5;
        make.height.offset =28;
        make.width.offset =70;
    }];
    [_timerBut setTitle:@"获取验证码" forState:UIControlStateNormal];
    _timerBut.titleLabel.font =FontSize(12);
    [_timerBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _timerBut.layer.cornerRadius =4;
    _timerBut.layer.borderColor =[UIColor grayColor].CGColor;
    _timerBut.layer.borderWidth =1;
    _timerBut.layer.masksToBounds = YES;
    [_timerBut addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
    
    
    _phoneTF =[UITextField new];
    [backV1 addSubview:_phoneTF];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blockSelf.but.mas_right).offset =10;
        make.right.equalTo(blockSelf.timerBut.mas_left).offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(blockSelf.phoneLab.mas_centerY).offset =0;
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
    
    _codeLab =[UILabel new];
    [backV2 addSubview:_codeLab];
    [_codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =0;
        make.bottom.offset =0;
        make.left.offset =5;
        make.width.offset =60;
    }];
    _codeLab.text =@"验证码";
    
    UIView *lineV2 =[UIView new];
    [backV2 addSubview:lineV2];
    [lineV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blockSelf.codeLab.mas_right).offset =0;
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
        make.centerY.equalTo(blockSelf.codeLab.mas_centerY).offset =0;
        
    }];
    
    UIButton* updataBut =[UIButton new];
    [backView addSubview:updataBut];
    [updataBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.bottom.offset =-20;
        make.height.offset =30;
        make.width.offset =200;
    }];
    updataBut.backgroundColor =zhuse;
    [updataBut setTitle:@"提交" forState:UIControlStateNormal];
    updataBut.layer.cornerRadius =5;
    updataBut.layer.masksToBounds =YES;
    [updataBut addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)update{
    WS(blockSelf)
    [PubulicObj ShowSVWhitMessage];
    if (_phoneTF.text.length ==0 ||_phoneTF.text ==nil) {
        if ([_phoneLab.text  isEqual: @"手机号"]) {
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入电话号码"];
        }else{
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入邮箱!"];
        }
        return;
    }
    if ([_phoneLab.text  isEqual: @"手机号"]) {
        if (![[PubulicObj valiMobile:_phoneTF.text] isEqualToString:@"是"]) {
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请填写正确手机号！"];
            return;
        }
    }
    else{
        if ([PubulicObj valiEmail:_phoneTF.text] ==NO) {
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请填写正确邮箱！"];
            return;
        }
        
        
    }
    
    if (_codeTF.text.length ==0 ||_codeTF.text ==nil) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入验证码"];
        return;
    }
    
    if (![self.code isEqualToString:_codeTF.text]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"验证码不正确"];
        return;
    }
    
    
    
    FogotSecondViewController *secondVC =[[FogotSecondViewController alloc]init];
    secondVC.phone = _phoneTF.text;
    if ([_phoneLab.text  isEqual: @"手机号"]) {
        secondVC.type =1;
    }else{
        secondVC.type =2;
    }
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
    
}
#pragma  mark --获取验证码
- (void)getCode{
    WS(blockSelf);
    [PubulicObj ShowSVWhitMessage];
    if (_phoneTF.text.length ==0 ||_phoneTF.text ==nil) {
        if ([_phoneLab.text  isEqual: @"手机号"]) {
            [SVProgressHUD showErrorWithStatus:@"请输入电话号码"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"请输入邮箱"];
        }
        return;
    }
    if ([_phoneLab.text  isEqual: @"手机号"]) {
        if (![[PubulicObj valiMobile:_phoneTF.text] isEqualToString:@"是"]) {
            [SVProgressHUD showErrorWithStatus:@"请填写正确手机号！"];
            return;
        }
    }
    else{
        if ([PubulicObj valiEmail:_phoneTF.text] ==NO) {
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请填写正确邮箱！"];
            return;
        }
        
        
    }
    _timerBut.enabled =NO;
    _timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    [_timer fire];
    
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    if ([_phoneLab.text  isEqual: @"手机号"]) {
        [param setObject:@"user_forget_phone" forKey:@"app"];
        [param setObject:_phoneTF.text forKey:@"phone"];
    }else{
        [param setObject:@"user_forget_email" forKey:@"app"];
        [param setObject:_phoneTF.text forKey:@"email"];
    }
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        [PubulicObj ShowSVWhitMessage];
        if ([responseObject[@"code"] integerValue] ==1) {
            self.code = [NSString stringWithFormat:@"%@",responseObject[@"data"]];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"验证码已发送"];
        }else{
            [blockSelf startGetCode];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [blockSelf startGetCode];
    } isShowHUD:NO];
}
- (void)changeTime{
    if (_time >0) {
        _time -=1;
        NSString *str;
        if (_time >9) {
            str = [NSString stringWithFormat:@"%ld",(long)_time];
        }else{
            str = [NSString stringWithFormat:@"0%ld",(long)_time];
        }
        [_timerBut setTitle:[NSString stringWithFormat:@"%@s",str] forState:UIControlStateNormal];
        _timerBut.backgroundColor =[UIColor groupTableViewBackgroundColor];
    }else{
        [self startGetCode];
        
    }
    
    
}

- (void)startGetCode{
    
    [_timer invalidate];
    _timer =nil;
    _time =60;
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
}
@end

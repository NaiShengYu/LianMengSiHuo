//
//  ChangePasswordViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/25.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()
@property (nonatomic,strong)UITextField *oldPasswordTF;
@property (nonatomic,strong)UITextField *PasswordTF;
@property (nonatomic,strong)UITextField *secondPasswordTF;

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"修改密码";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    [self creatView];
}

- (void)creatView{
    WS(blockSelf);
    UIView *backView =[UIView new];
    [self.view addSubview:backView];
    backView.backgroundColor =[UIColor whiteColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset =0;
        make.height.offset =320;
        make.top.offset =0;
    }];
    
    UIView *backV0 =[UIView new];
    [backView addSubview:backV0];
    [backV0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =10;
        make.left.offset =5;
        make.right.offset =-5;
        make.height.offset =50;
    }];
    
    UILabel *ordCode =[UILabel new];
    [backV0 addSubview:ordCode];
    [ordCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =0;
        make.bottom.offset =0;
        make.left.offset =5;
        make.width.offset =70;
    }];
    ordCode.text =@"当前密码";
    ordCode.textAlignment =NSTextAlignmentRight;
    
    UIView *lineV0 =[UIView new];
    [backV0 addSubview:lineV0];
    [lineV0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ordCode.mas_right).offset =10;
        make.bottom.offset =-5;
        make.height.offset =1;
        make.right.offset =-5;
    }];
    lineV0.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    
    _oldPasswordTF =[UITextField new];
    [backV0 addSubview:_oldPasswordTF];
    [_oldPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineV0).offset =10;
        make.right.offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(ordCode.mas_centerY).offset =0;
    }];
    
    UIView *backV1 =[UIView new];
    [backView addSubview:backV1];
    [backV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backV0.mas_bottom).offset =5;
        make.left.offset =5;
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
    phoneLab.text =@"新密码";
    phoneLab.textAlignment =NSTextAlignmentRight;
    
    UIView *lineV1 =[UIView new];
    [backV1 addSubview:lineV1];
    [lineV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLab.mas_right).offset =10;
        make.bottom.offset =-5;
        make.height.offset =1;
        make.right.offset =-5;
    }];
    lineV1.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    
    _PasswordTF =[UITextField new];
    [backV1 addSubview:_PasswordTF];
    [_PasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineV1).offset =10;
        make.right.offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(phoneLab.mas_centerY).offset =0;
    }];
    
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
    codeLab.text =@"再次输入";
    codeLab.textAlignment =NSTextAlignmentRight;
    
    UIView *lineV2 =[UIView new];
    [backV2 addSubview:lineV2];
    [lineV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeLab.mas_right).offset =10;
        make.bottom.offset =-5;
        make.height.offset =1;
        make.right.offset =-5;
    }];
    lineV2.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    _secondPasswordTF =[UITextField new];
    [backV2 addSubview:_secondPasswordTF];
    [_secondPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineV2).offset =10;
        make.right.offset =-10;
        make.height.offset =40;
        make.centerY.equalTo(codeLab.mas_centerY).offset =0;
        
    }];
    
    UILabel *alertLab =[UILabel new];
    [backView addSubview:alertLab];
    [alertLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset =10;
        make.top.equalTo(backV2.mas_bottom).offset =15;
        make.right.offset =-10;
    }];
    
    alertLab.numberOfLines =2;
    alertLab.adjustsFontSizeToFitWidth =YES;
    alertLab.text =@"提示：密码长度在8位以上，包含数字、大小写字母、特殊字符中的两种或两种以上";
    alertLab.textColor =zhuse;
    alertLab.font =FontSize(15);
    
    
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
    
    //
    
}

- (void)update{
    [PubulicObj ShowSVWhitMessage];
    if (_oldPasswordTF.text.length==0 ||_oldPasswordTF.text ==nil) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入旧密码"];
        return;
    }
    if (_PasswordTF.text.length==0 ||_PasswordTF.text ==nil) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入新密码"];
        return;
    }
    if (![_secondPasswordTF.text isEqualToString:_PasswordTF.text]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"两次密码不一致"];
        return;
    }
    if (![_oldPasswordTF.text isEqualToString:_PasswordTF.text]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请更换新的密码"];
        return;
    }
    
    if ([PubulicObj IsPassWordWithString:_PasswordTF.text] ==NO) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"密码格式不正确"];
        return;
    }
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_change_pwd" forKey:@"app"];
    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
    [param setObject:_oldPasswordTF.text forKey:@"old_pwd"];
    [param setObject:_PasswordTF.text forKey:@"new_pwd"];

    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showSuccessWithStatus:@"修改密码成功"];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        
    } isShowHUD:YES];
    
    
    
    
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

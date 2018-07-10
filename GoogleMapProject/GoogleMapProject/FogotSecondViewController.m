//
//  FogotSecondViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/19.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FogotSecondViewController.h"

@interface FogotSecondViewController ()
@property (nonatomic,strong)UITextField *PasswordTF;
@property (nonatomic,strong)UITextField *secondPasswordTF;

@end

@implementation FogotSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
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
        make.height.offset =280;
        make.top.offset =0;
    }];
    
    UILabel *titleLab =[UILabel new];
    [backView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.top.offset =15;
        make.height.offset =30;
    }];
    titleLab.text =@"请重新设定您的密码";
    titleLab.textColor = zhuse;
    titleLab.textAlignment =NSTextAlignmentCenter;
    
    UIView *backV1 =[UIView new];
    [backView addSubview:backV1];
    [backV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset =10;
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
    alertLab.font =FontSize(15);


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
    [updataBut addTarget:self action:@selector(upData) forControlEvents:UIControlEventTouchUpInside];
    updataBut.layer.masksToBounds =YES;

//
    
}
- (void)upData{
    
    WS(blockSelf);
    if (_PasswordTF.text.length ==0 ||_PasswordTF.text ==nil) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"请输入新密码"];
        return;
    }
   
    if (![_PasswordTF.text isEqualToString:_secondPasswordTF.text]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"两次密码不一致"];
        return;
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_forget_pwd" forKey:@"app"];
    [param setObject:self.phoneNum forKey:@"phone"];
    [param setObject:_secondPasswordTF.text forKey:@"new_pwd"];

    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
        
            [SVProgressHUD showSuccessWithStatus:@"修改密码成功"];
            [blockSelf.navigationController popToRootViewControllerAnimated:YES];
            
        }else{
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

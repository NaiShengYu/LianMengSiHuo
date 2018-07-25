//
//  ChangeTelNumSecondViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/24.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ChangeTelNumSecondViewController.h"

@interface ChangeTelNumSecondViewController ()

@end

@implementation ChangeTelNumSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
        make.height.offset =120;
        make.top.offset =0;
    }];
    
   
    
    UILabel *phoneLab =[UILabel new];
    [backView addSubview:phoneLab];
    [phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =0;
        make.height.offset =50;
        make.left.offset =15;
        make.width.offset =70;
    }];
    phoneLab.text =@"手机号";
    
    UILabel *rightLab =[UILabel new];
    [backView addSubview:rightLab];
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneLab.mas_centerY).offset =0;
        make.right.offset = -10;
        make.height.offset =50;
    }];
    rightLab.font =FontSize(15);
    rightLab.textColor = [UIColor grayColor];
    NSString * phone=[self.phone substringWithRange:NSMakeRange(3, 4)];
    phone = [self.phone stringByReplacingOccurrencesOfString:phone withString:@"****"];
    rightLab.text = phone;

    UIButton* updataBut =[UIButton new];
    [backView addSubview:updataBut];
    [updataBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.bottom.offset =-15;
        make.height.offset =35;
        make.width.offset =200;
    }];
    updataBut.backgroundColor =zhuse;
    [updataBut setTitle:@"修改手机号" forState:UIControlStateNormal];
    updataBut.layer.cornerRadius =5;
    updataBut.layer.masksToBounds =YES;
    [updataBut addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
}


- (void)update{
    
    WS(blockSelf);
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_change_phone" forKey:@"app"];
    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
    [param setObject:self.phone forKey:@"phone"];
    
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            [user setObject:blockSelf.phone forKey:PHONE];
            [user synchronize];
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showSuccessWithStatus:@"修改手机号成功"];
            NSArray *arr = blockSelf.navigationController.viewControllers;
            [self.navigationController popToViewController:arr[1] animated:YES];
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        
    } isShowHUD:YES];
    
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
}@end

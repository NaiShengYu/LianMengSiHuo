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

@property (nonatomic,strong)UITextView *textV;
@property (nonatomic,strong)UILabel *versonLab;

@end

@implementation VersionInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"版本信息";
    self.view.backgroundColor =RGBA(244, 245, 246, 1);
    [self ziDingYiDaoHangLan];
    
    [self showUpdata];
}

- (void)creatView{
       WS(blockSelf);
    UIImageView *img =[UIImageView new];
    [self.view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        if (screenWigth ==320.0) {
            make.top.offset =20;
        }else{
            make.top.offset =60;
        }
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    img.image =[UIImage imageNamed:@"个人中心_07"];
    
    _versonLab =[UILabel new];
    [self.view addSubview:_versonLab];
    [_versonLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        if (screenWigth ==320.0) {
            make.top.equalTo(img.mas_bottom).offset =10;
        }else{
            make.top.equalTo(img.mas_bottom).offset =30;
        }
        
    }];
    _versonLab.text = @"当前版本：V1.0";
    _versonLab.numberOfLines =2;
    _versonLab.textAlignment =NSTextAlignmentCenter;
    
    _upBut =[[UIButton alloc]init];
    [self.view addSubview:_upBut];
    [_upBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        if (screenWigth ==320.0) {
            make.top.equalTo(blockSelf.versonLab.mas_bottom).offset =10;
        }else{
            make.top.equalTo(blockSelf.versonLab.mas_bottom).offset =30;
        }
        make.width.offset =200;
        make.height.offset =40;
    }];
    [_upBut setTitle:@"更新到v2.0" forState:UIControlStateNormal];
    _upBut.backgroundColor =zhuse;
    _upBut.layer.cornerRadius =5;
    _upBut.layer.masksToBounds = YES;
    [_upBut addTarget:self action:@selector(updata) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *bottomLab = [UILabel new];
    [self.view addSubview:bottomLab];
    [bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        if (screenWigth ==320.0) {
            make.bottom.offset =-20;
        }else{
            make.bottom.offset =-30;
        }
        make.width.offset =screenWigth-80;
        make.height.offset =50;
    }];
    bottomLab.text =@"Copyright 2013-2015©联盟旅游网™ All rignts reserved\n京ICP备13016541号-2";
    bottomLab.adjustsFontSizeToFitWidth =YES;
    bottomLab.textColor =[UIColor lightGrayColor];
    bottomLab.font =FontSize(14);
    bottomLab.textAlignment =NSTextAlignmentCenter;
    bottomLab.numberOfLines =2;
 
    _textV =[UITextView new];
    [self.view addSubview:_textV];
    [_textV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blockSelf.upBut.mas_bottom).offset =20;
        make.centerX.offset =0;
        make.width.offset =screenWigth-80;
        if (screenWigth ==320.0) {
            make.bottom.equalTo(bottomLab.mas_top).offset =-20;
        }else{
            make.bottom.equalTo(bottomLab.mas_top).offset =-50;
        }
    }];
    _textV.textContainerInset =UIEdgeInsetsMake(20, 10, 20, 10);
    _textV.editable =NO;
    _textV.textColor =[UIColor grayColor];
    _textV.font =FontSize(17);
    _textV.layer.cornerRadius =10;
    _textV.layer.masksToBounds =YES;
    _textV.layer.borderWidth =1;
    _textV.layer.borderColor =[UIColor grayColor].CGColor;
    
}

- (void)showUpdata{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"get_app_version" forKey:@"app"];
    [param setObject:@"1" forKey:@"os"];
    
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            NSDictionary *dic =responseObject[@"data"][0];
            [blockSelf creatView];
            if ([app_Version isEqualToString:dic[@"versionCode"]]) {
                blockSelf.versonLab.text  =[NSString stringWithFormat:@"当前版本：%@\n(最新版本)",app_Version];
                blockSelf.upBut.hidden =YES;
                blockSelf.textV.hidden =YES;
            }else{
                [blockSelf.upBut setTitle:[NSString stringWithFormat:@"更新到v%@",dic[@"versionName"]] forState:UIControlStateNormal];
                NSString *content = [NSString stringWithFormat:@"%@",dic[@"content"]];
                content = [content stringByReplacingOccurrencesOfString:instailString withString:@"\n"];
                blockSelf.textV.text = content;
            }
        }else{
        }
    } failure:^(NSError *error) {
        
    } isShowHUD:NO];
}


- (void)updata{
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"itms-apps://"]]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/id1144816653?mt=8"] options:@{} completionHandler:^(BOOL success) {
                NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
                NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            
        }];
        
    }
 
}

#pragma mark --自定义导航栏
- (void)ziDingYiDaoHangLan{
    self.navigationController.navigationBar.translucent =NO;
    self.navigationController.navigationBar.barTintColor =zhuse;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                      NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
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

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
    [self creatView];
   
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
    _textV.text =@"先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗德，恢弘志士之气，不宜妄自菲薄，引喻失义，以塞忠谏之路也。\n宫中府中，俱为一体，陟罚臧否，不宜异同。若有作奸犯科及为忠善者，宜付有司论其刑赏，以昭陛下平明之理，不宜偏私，使内外异法也。\n侍中、侍郎郭攸之、费祎、董允等，此皆良实，志虑忠纯，是以先帝简拔以遗陛下。愚以为宫中之事，事无大小，悉以咨之，然后施行，必能裨补阙漏，有所广益。";
    _textV.layer.cornerRadius =10;
    _textV.layer.masksToBounds =YES;
    _textV.layer.borderWidth =1;
    _textV.layer.borderColor =[UIColor grayColor].CGColor;
    
}


- (void)updata{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    _versonLab.text  =[NSString stringWithFormat:@"当前版本：%@\n(最新版本)",app_Version];
    _upBut.hidden =YES;
    _textV.hidden =YES;
    
    
    
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

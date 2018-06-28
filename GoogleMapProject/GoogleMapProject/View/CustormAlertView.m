//
//  CustormAlertView.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/28.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CustormAlertView.h"

@implementation CustormAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _backBut =[[UIButton alloc]init];
        [self addSubview:_backBut];
        [_backBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
        _backBut.backgroundColor =[UIColor blackColor];
        _backBut.alpha =0.4;
        [_backBut addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        
        WS(blockSelf);
        UIView *backView = [UIView new];
        [self addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.centerY.offset =10;
            make.width.offset =screenWigth-80;
            if (screenHeight ==568) {
                make.height.offset =320;
            }
           else if (screenHeight ==480) {
                make.height.offset =290;
           }else{
               make.height.offset =400;
           }
        }];
        backView.layer.cornerRadius =8;
        backView.layer.masksToBounds =YES;
        backView.layer.shadowColor =[UIColor blackColor].CGColor;
        backView.layer.shadowRadius =8;
        backView.layer.shadowOpacity =0.8;
        backView.backgroundColor =[UIColor whiteColor];
        
        UIImageView *imgV =[UIImageView new];
        [backView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset =0;
            make.height.offset =90;
        }];
        imgV.backgroundColor =zhuse;
        
        _cancelBut = [UIButton new];
        [backView addSubview:_cancelBut];
        [_cancelBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =0;
            make.right.offset =0;
            make.size.mas_equalTo(CGSizeMake(30, 30));
            
        }];
        [_cancelBut addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        _cancelBut.backgroundColor =[UIColor orangeColor];
        [_cancelBut setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        _textV =[UITextView new];
        [backView addSubview:_textV];
        [_textV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgV.mas_bottom).offset =0;
            make.left.right.offset =0;
            make.bottom.offset=-60;
        }];
        _textV.textContainerInset =UIEdgeInsetsMake(10, 10, 3, 10);
        _textV.editable =NO;
        _textV.textColor =[UIColor grayColor];
        _textV.font =FontSize(17);
        _textV.text =@"先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗德，恢弘志士之气，不宜妄自菲薄，引喻失义，以塞忠谏之路也。\n宫中府中，俱为一体，陟罚臧否，不宜异同。若有作奸犯科及为忠善者，宜付有司论其刑赏，以昭陛下平明之理，不宜偏私，使内外异法也。\n侍中、侍郎郭攸之、费祎、董允等，此皆良实，志虑忠纯，是以先帝简拔以遗陛下。愚以为宫中之事，事无大小，悉以咨之，然后施行，必能裨补阙漏，有所广益。";
   
        _upBut =[[UIButton alloc]init];
        [backView addSubview:_upBut];
        [_upBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.bottom.offset =-10;

            if (screenWigth ==320.0) {
            }else{
            }
            make.width.offset =180;
            make.height.offset =35;
        }];
        [_upBut setTitle:@"更新到v2.0" forState:UIControlStateNormal];
        _upBut.backgroundColor =zhuse;
        _upBut.layer.cornerRadius =5;
        _upBut.layer.masksToBounds = YES;
        [_upBut addTarget:self action:@selector(updata) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)updata{
    WS(blockSelf);
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"itms-apps://"]]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/id1144816653?mt=8"] options:@{} completionHandler:^(BOOL success) {
            [blockSelf cancel];
        }];
        
    }
    
}

- (void)cancel{
    
    [self removeFromSuperview];
}
@end

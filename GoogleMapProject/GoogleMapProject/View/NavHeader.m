//
//  NavHeader.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "NavHeader.h"

@implementation NavHeader

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =RGBA(167, 38, 30, 1);
        _backBaut =[[UIButton alloc]initWithFrame:CGRectMake(0, MaxY-44, 44, 44)];
        [self addSubview:_backBaut];
        [_backBaut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _rightBut =[UIButton new];
        [self addSubview:_rightBut];
        [_rightBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset =-5-2.5;
            make.height.offset =28;
            make.right.offset =-10;
            make.width.offset =60;
        }];
        [_rightBut setImage:[UIImage imageNamed:@"列表地图_09"] forState:UIControlStateNormal];
        [_rightBut setTitle:@" 编辑" forState:UIControlStateNormal];
        [_rightBut setTitle:@" 取消" forState:UIControlStateSelected];
        _rightBut.titleLabel.font =FontSize(14);
        _rightBut.backgroundColor =RGBA(133, 31, 24, 1);
        _rightBut.layer.cornerRadius =2;
        _rightBut.layer.masksToBounds =YES;
        
        
        _chooseBut =[UIButton new];
        [self addSubview:_chooseBut];
        [_chooseBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset =28;
            make.bottom.offset =-5-2.5;
            make.width.offset =60;
            make.left.equalTo(blockSelf.backBaut.mas_right).offset =5;
        }];
        [_chooseBut setImage:[UIImage imageNamed:@"12"] forState:UIControlStateNormal];
        [_chooseBut setTitle:@" 关闭" forState:UIControlStateSelected];
        [_chooseBut setTitle:@" 筛选" forState:UIControlStateNormal];
        _chooseBut.titleLabel.font =FontSize(14);
//        _chooseBut.backgroundColor =RGBA(156, 37, 29, 1);//浅一点
        _chooseBut.backgroundColor =RGBA(133, 31, 24, 1);
        _chooseBut.layer.cornerRadius =2;
        _chooseBut.layer.masksToBounds =YES;
        
        
     
        _centerLab =[UILabel new];
        [self addSubview:_centerLab];
        [_centerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blockSelf.chooseBut.mas_centerY).offset =0;
            make.centerX.offset =0;
            
        }];
        _centerLab.textColor =[UIColor whiteColor];
        _centerLab.backgroundColor =[UIColor clearColor];
        _centerLab.font =FontSize(18);
        
    }
    return self;
    
    
}
@end

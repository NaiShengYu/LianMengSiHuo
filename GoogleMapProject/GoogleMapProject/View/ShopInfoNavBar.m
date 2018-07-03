//
//  ShopInfoNavBar.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoNavBar.h"

@implementation ShopInfoNavBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =RGBA(167, 38, 30, 1);
        _backBaut =[[UIButton alloc]initWithFrame:CGRectMake(0, MaxY-44, 44, 44)];
        [self addSubview:_backBaut];
        [_backBaut setImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
        
        _shareBut =[UIButton new];
        [self addSubview:_shareBut];
        [_shareBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset =-5;
            make.height.offset =35;
            make.right.offset =-10;
            make.width.offset =40;
        }];
        [_shareBut setImage:[UIImage imageNamed:@"详情_03"] forState:UIControlStateNormal];
       
        
        _collectionBut =[UIButton new];
        [self addSubview:_collectionBut];
        [_collectionBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset =-5;
            make.height.offset =35;
            make.right.equalTo(blockSelf.shareBut.mas_left).offset =-5;
            make.width.offset =40;
        }];
        [_collectionBut setImage:[UIImage imageNamed:@"详情_06"] forState:UIControlStateNormal];
 
        
    }
    return self;
    
    
}
@end

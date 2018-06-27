//
//  LeftViewHeader.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "LeftViewHeader.h"

@implementation LeftViewHeader
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        _headerImgV =[UIImageView new];
        [self.contentView addSubview:_headerImgV];
        [_headerImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.centerY.offset =0;
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        _headerImgV.image =[UIImage imageNamed:@"timg-2"];
        _headerImgV.layer.cornerRadius =35;
        _headerImgV.layer.masksToBounds =YES;
        
        self.contentView.backgroundColor =zhuse;
        _imgBut =[UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_imgBut];
        [_imgBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.centerY.offset =0;
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        _imgBut.backgroundColor =[UIColor clearColor];
        
        WS(blockSelf);
        _titleBut =[UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_titleBut];
        [_titleBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.top.equalTo(blockSelf.imgBut.mas_bottom).offset =5;
        }];
        [_titleBut setTitle:@"未登录" forState:UIControlStateNormal];
        [_titleBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       
        
        
    }
    
    return self;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  SearchNoResultHeader.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/23.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchNoResultHeader.h"

@implementation SearchNoResultHeader

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        WS(blockSelf)
        _titleLab =[UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.left.offset =20;
            make.right.offset = -20;
        }];
        _titleLab.textAlignment =NSTextAlignmentCenter;

        UILabel *lab =[UILabel new];
        [self.contentView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.offset =20;
            make.right.offset = -20;
        }];
        lab.text = @"Not searching for relevant content!";
        lab.textColor = [UIColor grayColor];
        lab.textAlignment =NSTextAlignmentCenter;
        
        
    }
    
    return self;
    
}
@end

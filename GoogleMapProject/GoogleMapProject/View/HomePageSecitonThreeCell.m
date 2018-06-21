//
//  HomePageSecitonThreeCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSecitonThreeCell.h"

@implementation HomePageSecitonThreeCell

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        _headerImage =[UIImageView new];
        [self.contentView addSubview:_headerImage];
        [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset =0;
            make.height.offset =(screenWigth-40)/3/8*5;
        }];
        _headerImage.image =[UIImage imageNamed:@"aaa"];
        WS(blockSelf);
        _titleLab =[UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =10;
            make.right.offset =-10;
            make.top.equalTo(blockSelf.headerImage.mas_bottom).offset=8;
        }];
        _titleLab.font =FontSize(13);
        _titleLab.text =@"尼斯\nNice";
        _titleLab.numberOfLines =2;
        _titleLab.textAlignment =NSTextAlignmentCenter;
    }
    return self;
}
@end

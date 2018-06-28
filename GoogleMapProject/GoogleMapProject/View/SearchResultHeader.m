//
//  SearchResultHeader.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/28.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchResultHeader.h"

@implementation SearchResultHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor =[UIColor whiteColor];
        _titleLab = [UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets =UIEdgeInsetsMake(0, 10, 0, 10);
        }];
        _titleLab.font =FontSize(19);
        _titleLab.textColor =HEXCOLOR(0x7A7A7A);
    }
    return self;
    
}

@end

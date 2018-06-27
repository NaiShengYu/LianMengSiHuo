//
//  FilterHeader.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FilterHeader.h"

@implementation FilterHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor =[UIColor whiteColor];
        _titleLab =[UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 15, 0, 60);
        }];
        _titleLab.text =@"类别";
        _titleLab.font =FontSize(18);
        _img = [UIImageView new];
        [self.contentView addSubview:_img];
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.right.offset =-15;
            make.size.mas_equalTo(CGSizeMake(18, 10));
        }];
        _img.image =[UIImage imageNamed:@"用户_13"];
        
        _backBut =[UIButton new];
        [self.contentView addSubview:_backBut];
        [_backBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
        [_backBut addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setHeaderModel:(FilterHeaderModel *)headerModel{
    
    _headerModel = headerModel;
    NSString *sss =_headerModel.title;
    int i =0;
    
    for (FilterItem *item in _headerModel.itemsArray) {
        if (item.isSelect ==YES) {
            if (i ==0) {
                sss =[NSString stringWithFormat:@"%@  %@",sss,item.title];
                i =1;
            }else{
                sss =[NSString stringWithFormat:@"%@，%@",sss,item.title];
            }
        }
    }
    _titleLab.text =sss;
    if (_headerModel.isSelect ==YES) {
        _img.transform = CGAffineTransformMakeRotation(0);

    }else{
        _img.transform = CGAffineTransformMakeRotation(M_PI);

    }
    _backBut.selected =_headerModel.isSelect;
    
}

- (void)change:(UIButton *)but{
    but.selected = !but.selected;
    if (but.selected ==YES) {
        _img.transform = CGAffineTransformMakeRotation(M_PI);
    }else{
        _img.transform = CGAffineTransformMakeRotation(0);
    }
    if (self.changeHeaderState) {
        self.changeHeaderState(but.selected);
    }
 
}
@end

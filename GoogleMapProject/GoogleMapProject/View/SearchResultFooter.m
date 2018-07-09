
//
//  SearchResultFooter.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/9.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchResultFooter.h"

@implementation SearchResultFooter

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor=[UIColor whiteColor];
        
       _addMoreBut =[UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_addMoreBut];
        [_addMoreBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
      
        UILabel *lab =[UILabel new];
        [self.addMoreBut addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =-5;
            make.centerY.offset =0;
        }];
        lab.font =FontSize(15);
        lab.text = @"加载更多";
        lab.textColor =[UIColor grayColor];
        
        UIImageView *imgV =[UIImageView new];
        [self.addMoreBut addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset =0;
            make.left.equalTo(lab.mas_right).offset =5;
            make.size.mas_equalTo(CGSizeMake(10, 5));
        }];
        imgV.image =[UIImage imageNamed:@"用户_13"];
        
        UIView *view =[UIView new];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.offset =0;
            make.height.offset =1.5;
        }];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
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

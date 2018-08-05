//
//  HomePageSectionOneheader.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionOneheader.h"

@implementation HomePageSectionOneheader
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {    
        UIImageView *titleImg =[UIImageView new];
        [self addSubview:titleImg];
        [titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset =0;
            make.width.offset =30*1010/80;
            make.top.offset =0;
            make.bottom.offset =-5;
        }];
        titleImg.image = [UIImage imageNamed:@"首页-搜索_03"];
        
    }
    return self;
    
}
@end

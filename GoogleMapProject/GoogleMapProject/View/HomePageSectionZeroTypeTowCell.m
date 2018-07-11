//
//  HomePageSectionZeroTypeTowCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/11.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionZeroTypeTowCell.h"

@implementation HomePageSectionZeroTypeTowCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
      UIImageView *imgV = [UIImageView new];
        [self.contentView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
        imgV.image = [UIImage imageNamed:@"首页2_02"];
    }
    
    return self;

}
@end

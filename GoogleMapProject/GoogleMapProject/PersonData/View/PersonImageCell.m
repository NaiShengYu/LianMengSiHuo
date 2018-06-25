//
//  PersonImageCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/25.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "PersonImageCell.h"

@implementation PersonImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        
        _imageV =[[UIImageView alloc]init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset =10;
            make.bottom.offset =-10;
            make.width.offset =50;
        }];
        _imageV.image =[UIImage imageNamed:@"个人中心_07"];
        _imageV.layer.cornerRadius =25;
        _imageV.layer.masksToBounds = YES;
        
        
    }
    return self;
}



@end

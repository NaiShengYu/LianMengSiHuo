//
//  SearchResultSectionZeroCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/28.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchResultSectionZeroCell.h"

@implementation SearchResultSectionZeroCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        WS(blockSelf);
        _imageV =[UIImageView new];
        [self addSubview:_imageV];
        _imageV.image =[UIImage imageNamed:@"aaa"];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (screenWigth >320) {
                make.top.left.offset =20;
                make.bottom.offset =-20;
            }else{
                make.left.offset =20;
                make.top.offset =30;
                make.bottom.offset =-30;
            } make.width.equalTo(blockSelf.imageV.mas_height).multipliedBy(1.65);
        }];
        
        _titleLab =[UILabel new];
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =20;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset =-10;
            make.height.mas_lessThanOrEqualTo(@50);
        }];
        _titleLab.numberOfLines =2;
        _titleLab.minimumFontSize =12;
        _titleLab.text =@"Le cafe to you";
        
   
        
        
    }
    
    return self;
    
}

@end

//
//  PersonDataCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/25.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "PersonDataCell.h"

@implementation PersonDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        WS(blockSelf);
        self.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        
        _titleLab =[UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =10;
            make.left.offset =15;
            make.bottom.offset =-10;
            make.width.offset =60;
        }];
        _titleLab.font =FontSize(18);
        
        _otherLab =[UILabel new];
        [self.contentView addSubview:_otherLab];
        [_otherLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =10;
            make.bottom.offset =-10;
            make.right.offset =-5;
            make.width.offset =70;
        }];
        _otherLab.textColor =HEXCOLOR(0x4cabfc);
        _otherLab.text =@"修改";
        _otherLab.textAlignment = NSTextAlignmentRight;
        
        _nameLab =[UILabel new];
        [self.contentView addSubview:_nameLab];
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =10;
            make.bottom.offset =-10;
            make.left.equalTo(blockSelf.titleLab.mas_right).offset =10;
            make.right.equalTo(blockSelf.otherLab.mas_left).offset =-10;
        }];
        _nameLab.textColor =[UIColor grayColor];
     
        
        

    }
    
    return self;
    
}

@end

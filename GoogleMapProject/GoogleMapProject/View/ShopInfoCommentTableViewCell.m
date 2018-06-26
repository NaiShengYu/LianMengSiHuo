//
//  ShopInfoCommentTableViewCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoCommentTableViewCell.h"

@interface ShopInfoCommentTableViewCell()


@end
@implementation ShopInfoCommentTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        WS(blockSelf);
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        _headerImg =[UIImageView new];
        [self.contentView addSubview:_headerImg];
        [_headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =15;
            make.left.offset= 15;
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        _headerImg.image =[UIImage imageNamed:@"timg-2"];
        _headerImg.layer.cornerRadius =20;
        _headerImg.layer.masksToBounds =YES;
        
        _nameLab =[UILabel new];
        [self.contentView addSubview:_nameLab];
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =10;
            make.left.equalTo(blockSelf.headerImg.mas_right).offset= 10;
            make.right.offset = -15;
        }];
        _nameLab.text =@"道无为";
        
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.headerImg.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        _contentLab =[UILabel new];
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img5.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.headerImg.mas_right).offset= 10;
            make.right.offset = -15;
            make.bottom.offset =3;

        }];
        _contentLab.numberOfLines =0;
        
        
        
        
        
        
    }
    
    
    return self;
    
    
}
@end

//
//  CollectionShopUneditCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2016.1/6/16.1.
//  Copyright © 2016.1年 俞乃胜. All rights reserved.
//

#import "CollectionShopUneditCell.h"

@implementation CollectionShopUneditCell

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
        
        _imgV =[UIImageView new];
        [_imageV addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =0;
            make.left.offset =18;
            make.width.offset =25;
            make.height.offset =45;
        }];
        _imgV.image =[UIImage imageNamed:@"列表_07"];
        
        _numLab = [UILabel new];
        [_imgV addSubview:_numLab];
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =6;
            make.left.offset =5;
            make.right.offset =-5;
        }];
        _numLab.adjustsFontSizeToFitWidth =YES;
        _numLab.numberOfLines =2;
        _numLab.font =FontSize(10);
        _numLab.textColor = [UIColor whiteColor];
        _numLab.textAlignment =NSTextAlignmentCenter;
        
                
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
        
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"32"];
        [self addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [self addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [self addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [self addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        _juliLab =[UILabel new];
        [self addSubview:_juliLab];
        _juliLab.backgroundColor =RGBA(245, 245, 245, 1);
        [_juliLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(img5.mas_centerY).offset =0;
            make.right.offset =-15;
            make.width.lessThanOrEqualTo(@70);
            
        }];
        _juliLab.adjustsFontSizeToFitWidth =YES;
        
        _juliLab.text =@"200m";
        _juliLab.font =FontSize(10);
        _juliLab.textAlignment =NSTextAlignmentCenter;
        
      
        UIView *V1 =[UIView new];
        [self.contentView addSubview:V1];
        [V1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.juliLab).offset =-5;
            make.top.equalTo(blockSelf.juliLab).offset =-3;
            make.right.equalTo(blockSelf.juliLab).offset =5;
            make.bottom.equalTo(blockSelf.juliLab).offset =3;
        }];
        V1.backgroundColor =RGBA(245, 245, 245, 1);
        V1.layer.cornerRadius =10;
        V1.layer.borderColor =RGBA(231, 231, 231, 1).CGColor;
        V1.layer.borderWidth =1;
        V1.layer.masksToBounds =YES;
        
        _topickNumLab =[UILabel new];
        [self addSubview:_topickNumLab];
        _topickNumLab.text =@"12432条评论";
        [_topickNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img5.mas_bottom).offset =3;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            
        }];
        _topickNumLab.font =FontSize(11);
        _topickNumLab.textColor =RGBA(204, 204, 204, 1);
        
        _speciesLab =[UILabel new];
        [self.contentView addSubview:_speciesLab];
        [_speciesLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.topickNumLab.mas_bottom).offset =3;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset =-10;
        }];
        _speciesLab.numberOfLines =2;
        _speciesLab.font =FontSize(11);
        _speciesLab.textColor =[UIColor grayColor];
        _speciesLab.minimumFontSize =10;
        _speciesLab.text =@"当地热门菜品，法餐，意大利菜";
     
        
        
    }
    
    
    return self;
    
    
}
@end

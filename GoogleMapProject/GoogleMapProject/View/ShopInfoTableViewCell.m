//
//  ShopInfoTableViewCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoTableViewCell.h"

@implementation ShopInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userInteractionEnabled =NO;
        UIView *backView =[UIView new];
        [self.contentView addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.offset =0;
            make.height.offset =130;
        }];
        backView.backgroundColor =[UIColor whiteColor];
        
        WS(blockSelf);
        _imageV =[UIImageView new];
        [backView addSubview:_imageV];
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
        [backView addSubview:_titleLab];
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
        [backView addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [backView addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        
        _juliLab =[UILabel new];
        [backView addSubview:_juliLab];
        _juliLab.backgroundColor =RGBA(245, 245, 245, 1);
        [_juliLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(img5.mas_centerY).offset =0;
            make.right.offset =-15;
            make.width.offset =50;
            make.height.offset =25;
        }];
        _juliLab.adjustsFontSizeToFitWidth =YES;
        _juliLab.layer.cornerRadius =10;
        _juliLab.layer.masksToBounds =YES;
        _juliLab.text =@"200m";
        _juliLab.font =FontSize(14);
        _juliLab.textAlignment =NSTextAlignmentCenter;
        
        _topickNumLab =[UILabel new];
        [backView addSubview:_topickNumLab];
        _topickNumLab.text =@"12432条评论";
        [_topickNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img5.mas_bottom).offset =3;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            
        }];
        _topickNumLab.font =FontSize(15);
        _topickNumLab.textColor =RGBA(204, 204, 204, 1);
        
        _speciesLab =[UILabel new];
        [backView addSubview:_speciesLab];
        [_speciesLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.topickNumLab.mas_bottom).offset =3;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset =-10;
        }];
        _speciesLab.numberOfLines =2;
        _speciesLab.font =FontSize(15);
        _speciesLab.textColor =[UIColor grayColor];
        _speciesLab.minimumFontSize =13;
        _speciesLab.text =@"当地热门菜品，法餐，意大利菜";
        
        _mapV =[[GMSMapView alloc]init];
        [self.contentView addSubview:_mapV];
        [_mapV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backView.mas_bottom).offset =0;
            make.left.right.offset =0;
            make.height.offset =80;
        }];
        
        UIView *mapBackV =[UIView new];
        [_mapV addSubview:mapBackV];
        [mapBackV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets =UIEdgeInsetsMake(10, 20, 10, 20);
        }];
        mapBackV.backgroundColor =RGBA(250, 250, 250, 0.4);
        
        UIImageView *img =[UIImageView new];
        [self.contentView addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.mapV.mas_bottom).offset =15;
            make.left.offset =20;
            make.size.mas_equalTo(CGSizeMake(18, 18*58/43));
            
        }];
        img.image =[UIImage imageNamed:@"详情_11"];
        
        _AddressLab =[UILabel new];
        [self.contentView addSubview:_AddressLab];
        [_AddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(img.mas_right).offset =10;
            make.centerY.equalTo(img.mas_centerY).offset =0;
            make.right.offset =-15;
            make.height.offset =40;
        }];
        _AddressLab.numberOfLines =2;
        _AddressLab.font =FontSize(16);
        _AddressLab.text = @"江苏省南通市南通县南通真南通村250号";
        
        _infoLab =[UILabel new];
        [self.contentView addSubview:_infoLab];
        [_infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.AddressLab.mas_bottom).offset =10;
            make.left.equalTo(img.mas_right).offset =10;
            make.right.offset =-15;
            make.bottom.offset =-121;
        }];
        _infoLab.numberOfLines =0;
        _infoLab.font =FontSize(16);
        
        UIView *heline =[UIView new];
        [self.contentView addSubview:heline];
        [heline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.infoLab.mas_bottom).offset =20;
            make.left.right.offset =0;
            make.height.offset =10;
        }];
        heline.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        _backBut =[UIButton new];
        [self.contentView addSubview:_backBut];
        [_backBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset =0;
            make.height.offset =45;
            make.top.equalTo(heline.mas_bottom).offset =0;
        }];
        _backBut.backgroundColor =[UIColor whiteColor];
        
        UIImageView *img11 =[UIImageView new];
        [_backBut addSubview:img11];
        [img11 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =20;
            make.centerY.offset =0;
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        img11.image =[UIImage imageNamed:@"详情_15"];
        
        _telNum =[UILabel new];
        [_backBut addSubview:_telNum];
        [_telNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(img11.mas_right).offset =10;
            make.centerY.offset =0;
            make.right.offset =-15;
        }];
        _telNum.text =@"13312345678";
        
        UIView *lineV =[UIView new];
        [self.contentView addSubview:lineV];
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.backBut.mas_bottom).offset =0;
            make.left.right.offset =0;
            make.height.offset =1;
        }];
        lineV.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        UIView *backV =[UIView new];
        [self.contentView addSubview:backV];
        [backV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset =0;
            make.height.offset =45;
            make.top.equalTo(lineV.mas_bottom).offset =0;
        }];
        backV.backgroundColor =[UIColor whiteColor];
        
        UIImageView *img22 =[UIImageView new];
        [backV addSubview:img22];
        [img22 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =20;
            make.centerY.offset =0;
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        img22.image =[UIImage imageNamed:@"详情_19"];
        
        _num =[UILabel new];
        [backV addSubview:_num];
        [_num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(img22.mas_right).offset =10;
            make.centerY.offset =0;
            make.right.offset =-15;
        }];
        _num.text =@"12894个人评论";
        
        
    }
    return self;

}

@end

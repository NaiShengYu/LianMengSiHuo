//
//  CollectionShopEditCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CollectionShopEditCell.h"

@implementation CollectionShopEditCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        WS(blockSelf);
        
        _deleteBut =[UIButton new];
        [self.contentView addSubview:_deleteBut];
        [_deleteBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.offset =0;
            make.width.offset =40;
        }];
        [_deleteBut setImage:[UIImage imageNamed:@"62"] forState:UIControlStateNormal];
        [_deleteBut setImage:[UIImage imageNamed:@"61"] forState:UIControlStateSelected];
        [_deleteBut addTarget:self action:@selector(changeSelect:) forControlEvents:UIControlEventTouchUpInside];
        
        _imageV =[UIImageView new];
        [self.contentView addSubview:_imageV];
        _imageV.image =[UIImage imageNamed:@"aaa"];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (screenWigth >320) {
                make.top.offset =20;
                make.bottom.offset =-20;
            }else{
                make.top.offset =30;
                make.bottom.offset =-30;
            }
            make.left.equalTo(blockSelf.deleteBut.mas_right).offset =0;
            make.width.equalTo(blockSelf.imageV.mas_height).multipliedBy(1.65);
        }];
        
        _titleLab =[UILabel new];
        [self.contentView addSubview:_titleLab];
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
        img1.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img1.tag =1001;
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img2.tag =1002;
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img3.tag =1003;
        
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img4.tag =1004;
        
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img5.tag =1005;

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
        [self.contentView addSubview:_topickNumLab];
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
- (void)changeSelect:(UIButton *)but{
    but.selected =!but.selected;
    _collecitonModel.isSelect =but.selected;
}

- (void)setCollecitonModel:(CollectionShopModel *)collecitonModel{
    
    _collecitonModel = collecitonModel;
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,collecitonModel.img]]];
    _titleLab.text =[NSString stringWithFormat:@"%@",collecitonModel.name];
    
    CGFloat jl = [collecitonModel.distance floatValue];
    NSString *jlstr = @"";
    if (jl <10) {
        jlstr = [NSString stringWithFormat:@"%.fm",jl*1000];
        
    }else{
        jlstr = [NSString stringWithFormat:@"%.fkm",jl];
    }
    _juliLab.text =[CustomAccount sharedCustomAccount].isSearch == YES ?[NSString stringWithFormat:@"距市中心%@",jlstr]:[NSString stringWithFormat:@"距我%@",jlstr];

    //类型是餐厅和购物的时候显示人均
    if ([collecitonModel.type integerValue] ==1 ||[collecitonModel.type integerValue] ==3 ) {
        _topickNumLab.text =[NSString stringWithFormat:@"%@  %@",collecitonModel.red,collecitonModel.num];
    }else {
        _topickNumLab.text =[NSString stringWithFormat:@"%@",collecitonModel.num];
    }
    _speciesLab.text = [NSString stringWithFormat:@"%@",collecitonModel.blue];
    
    for(int i =0; i <5;i ++){
        UIImageView *img = [self.contentView viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"34"];
    }
    
    for(int i =0; i <[collecitonModel.star integerValue];i ++){
        UIImageView *img = [self.contentView viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"32"];
    }
    
    _deleteBut.selected = collecitonModel.isSelect;
    
}


@end

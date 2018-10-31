//
//  HomePageSectionOneCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionOneCell.h"

@implementation HomePageSectionOneCell

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor =[UIColor whiteColor];
        self.contentView.layer.cornerRadius =8;
        self.contentView.layer.masksToBounds =YES;
        _headerImage =[UIImageView new];
        [self.contentView addSubview:_headerImage];
        [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset =0;
            make.height.offset =120;
        }];
        _headerImage.image =[UIImage imageNamed:@"aaa"];
        WS(blockSelf);
        _titleLab =[UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =10;
            make.right.offset =-100;
            make.top.equalTo(blockSelf.headerImage.mas_bottom).offset=8;
        }];
        _titleLab.text =@"cafe tour 百年老店";
        _titleLab.adjustsFontSizeToFitWidth =YES;
        _titleLab.minimumFontSize =12;
        
        _redLab =[UILabel new];
        [self.contentView addSubview:_redLab];
        [_redLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.titleLab.mas_right).offset =10;
            make.right.offset =-10;
            make.centerY.equalTo(blockSelf.titleLab.mas_centerY).offset = 0;
        }];
        _redLab.adjustsFontSizeToFitWidth =YES;
        _redLab.minimumFontSize =12;
        _redLab.textAlignment =NSTextAlignmentRight;
        _redLab.font =FontSize(14);
        
        
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"32"];
        [self addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =8;
            make.left.offset =10;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img1.tag =1001;

        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [self addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =8;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img1.tag =1002;

        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [self addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =8;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img1.tag =1003;

        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [self addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =8;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img1.tag =1004;

        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =8;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        img1.tag =1005;

        _juliLab =[UILabel new];
        [self addSubview:_juliLab];
        _juliLab.backgroundColor =RGBA(245, 245, 245, 1);
        [_juliLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(img5.mas_centerY).offset =0;
            make.right.offset =-10;
            make.width.lessThanOrEqualTo(@70);
            
        }];
        _juliLab.adjustsFontSizeToFitWidth =YES;
      
        _juliLab.text =@"2000m";
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
        
        _talkLab =[UILabel new];
        [self addSubview:_talkLab];
        _talkLab.text =@"25个人评价过此景点";
        [_talkLab mas_makeConstraints:^(MASConstraintMaker *make) {

            make.centerY.equalTo(img5.mas_centerY).offset =0;
            make.left.equalTo(img5.mas_right).offset =10;
            make.right.offset =-90;
        }];
        _talkLab.font =FontSize(15);
        _talkLab.adjustsFontSizeToFitWidth =YES;
        _talkLab.textColor =RGBA(204, 204, 204, 1);
        
        
        
    }
    return self;

}

- (void)setModel:(HomePageSectionOneModel *)model{
    
    
    _model = model;
    
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,model.img]]];

    CGFloat jl =[CustomAccount sharedCustomAccount].isSearch == YES ?[model.city_distance floatValue]:[model.distance floatValue];
    NSString *jlstr = @"";
    if (jl <1) {
        jlstr = [NSString stringWithFormat:@"%.fm",jl*1000];
        
    }else{
        jlstr = [NSString stringWithFormat:@"%.fkm",jl];
    }
    _juliLab.text =[CustomAccount sharedCustomAccount].isSearch == YES ?[NSString stringWithFormat:@"距市中心%@",jlstr]:[NSString stringWithFormat:@"距我%@",jlstr];


    
    _talkLab.text =[NSString stringWithFormat:@"%@",model.num];
    //类型是餐厅和购物的时候显示人均
    if ([model.type integerValue] ==1 ||[model.type integerValue] ==3 ) {
        _redLab.text =[NSString stringWithFormat:@"%@",model.red];
    }else {
        _redLab.text =@"";
    }
    _titleLab.text =[NSString stringWithFormat:@"%@",model.name];

    for(int i =0; i <5;i ++){
        UIImageView *img = [self.contentView viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"34"];
    }
    
    for(int i =0; i <[model.star integerValue];i ++){
        UIImageView *img = [self.contentView viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"32"];
    }
    
}

@end

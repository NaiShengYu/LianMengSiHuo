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
        img1.tag =1001;
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img2.tag =1002;

        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img3.tag =1003;

        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [self.contentView addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img4.tag =1004;

        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img5.tag =1005;

        _contentLab =[UILabel new];
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img5.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.headerImg.mas_right).offset= 10;
            make.right.offset = -15;
            make.bottom.offset =-3;

        }];
        _contentLab.numberOfLines =0;
        _contentLab.font =FontSize(15);
  
    }
    
    
    return self;
    
    
}

- (void)setModel:(ShopInfoCommentModel *)model{
    _model = model;
    NSString *imgurl = [NSString stringWithFormat:@"%@",model.user_img];
    if ([imgurl hasPrefix:@"http://"] || [imgurl hasPrefix:@"https://"]) {
        [_headerImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.user_img]] placeholderImage:[UIImage imageNamed:@"个人中心_07"]];

    }else{
        [_headerImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,model.user_img]] placeholderImage:[UIImage imageNamed:@"个人中心_07"]];

    }
    _nameLab.text =[NSString stringWithFormat:@"%@",model.username];
  
    NSString *info = model.comment;
    info = [info stringByReplacingOccurrencesOfString:instailString withString:@"\n"];
    _contentLab.text = [NSString stringWithFormat:@"%@",info];
    
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

//
//  CommentCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        WS(blockSelf);
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =15;
            make.left.offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img1.tag =1001;
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =15;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img2.tag =1002;
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =15;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img3.tag =1003;
        
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =15;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img4.tag =1004;
        
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self.contentView addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =15;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img5.tag =1005;

        _timeLab = [UILabel new];
        [self.contentView addSubview:_timeLab];
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(img5.mas_centerY).offset =0;
            make.right.offset =-10;
            make.height.offset =30;
        }];
        _timeLab.text =@"2018/06/21";
        _timeLab.textColor =[UIColor grayColor];
        
        _contentLab = [UILabel new];
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =45;
            make.right.offset =-10;
            make.left.offset =10;
        }];
        _contentLab.font =FontSize(15);
        _contentLab.text =@"一举手，前後左右要有定向.起动举动未能由己，要悉心体认，随人所动，随曲就伸，不丢不顶. 勿自伸缩.彼有力，我亦有力，我力在先.彼无力，我亦无力，我意仍在先.要刻刻留心.挨何处，心要用在何处，须向不丢不顶中讨消息.切记一静无有不静，静须静如山岳.所谓他强由他强，清风拂山冈.一动无有不动，动当动若江河，所谓他横任他横，明月照大江.从此做去，一年半载，便能施於身.此全是用意不是用劲.久之，则人为我制，我不为人制矣.";
        _contentLab.numberOfLines =0;
        
        UIView *backView =[UIView new];
        [self.contentView addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.contentLab.mas_bottom).offset =15;
            make.left.offset =10;
            make.right.offset =-10;
            make.height.offset =100;
            make.bottom.offset =-15;
        }];
        backView.backgroundColor =[UIColor groupTableViewBackgroundColor];

        _imageV =[UIImageView new];
        [backView addSubview:_imageV];
        _imageV.image =[UIImage imageNamed:@"aaa"];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset =15;
            make.bottom.offset =-15; make.width.equalTo(blockSelf.imageV.mas_height).multipliedBy(1.65);
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

        _speciesLab =[UILabel new];
        [backView addSubview:_speciesLab];
        [_speciesLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =8;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset =-10;
        }];
        _speciesLab.numberOfLines =2;
        _speciesLab.font =FontSize(12);
        _speciesLab.textColor =[UIColor grayColor];
        _speciesLab.minimumFontSize =10;
        _speciesLab.text =@"当地热门菜品，法餐，意大利菜";

        
        
    }
    
    return self;
}

- (void)setModel:(CommentModel *)model{
    
    _model = model;
    
    NSString *comment = [NSString stringWithFormat:@"%@",model.comment];
    comment =[comment stringByReplacingOccurrencesOfString:instailString withString:@"\r"];
    _contentLab.text = comment;
    _timeLab.text =[NSString stringWithFormat:@"%@",model.time];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,model.img]]];
    _titleLab.text =[NSString stringWithFormat:@"%@",model.name];
    _speciesLab.text =[NSString stringWithFormat:@"%@",model.blue];
  
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

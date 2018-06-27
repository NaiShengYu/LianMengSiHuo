//
//  ShopCommentSectionOneCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopCommentSectionOneCell.h"
@interface ShopCommentSectionOneCell ()<UITextViewDelegate>
@end
@implementation ShopCommentSectionOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        WS(blockSelf);
        _textV =[UITextView new];
        [self.contentView addSubview:_textV];
        [_textV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(blockSelf.contentView).insets(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        _textV.font =[UIFont systemFontOfSize:14];
        _textV.delegate =self;
        
        _plachodlLab =[UILabel new];
        [self.contentView addSubview:self.plachodlLab];
        [_plachodlLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.textV).offset =0;
            make.left.equalTo(blockSelf.contentView).offset =14;
            make.right.equalTo(blockSelf.contentView).offset =-5;
            make.height.offset =32;
        }];
        _plachodlLab.enabled =NO;
        _plachodlLab.font =[UIFont systemFontOfSize:14];
        
        
        
    }
    return self;
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length >0 ) {
        self.plachodlLab.text =@"";
    }else{
        self.plachodlLab.text =self.descriptionstr;
    }
    if (self.textChangeBlock) {
        self.textChangeBlock(textView.text);
    }
}

- (void)setDescriptionstr:(NSString *)descriptionstr{
    _descriptionstr =descriptionstr;
    if (self.textV.text.length >0 ) {
        self.plachodlLab.text =@"";
    }else{
        self.plachodlLab.text =self.descriptionstr;
    }
}

@end

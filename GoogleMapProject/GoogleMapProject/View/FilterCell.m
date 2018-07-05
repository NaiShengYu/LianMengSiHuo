//
//  FilterCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FilterCell.h"

@implementation FilterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _backBut =[CustomBut new];
        [self.contentView addSubview:_backBut];
        [_backBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
        [_backBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_backBut setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _backBut.backgroundColor =[UIColor whiteColor];
        [_backBut addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
    
}

- (void)setItem:(FilterItem *)item{
    
    _item =item;
    if(item.isSelect ==YES){
        _backBut.backgroundColor =zhuse;
    }else{
        _backBut.backgroundColor =[UIColor whiteColor];
    }
    _backBut.selected = item.isSelect;
    [_backBut setTitle:item.title forState:UIControlStateNormal];
    
}

- (void)change:(UIButton *)but{
    if (self.item.isSelect ==YES) {
        return;
    }
    
    if (self.changeItemSelect) {
        self.changeItemSelect(YES);
    }
  
}

@end

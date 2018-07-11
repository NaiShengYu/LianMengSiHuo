//
//  FiterOtherCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FiterOtherCell.h"

#define H 40

@interface FiterOtherCell()


@property (nonatomic,strong)NSMutableArray *butsArray;


@end

@implementation FiterOtherCell

- (instancetype )initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(NSMutableArray *)butsArray
{
    if (_butsArray.count >0) {
        return _butsArray;
    }
    _butsArray = [[NSMutableArray alloc]init];
    for (int i =0; i <35; i ++) {
        UIButton *but =[[UIButton alloc]init];
        but.tag =800+i;
        but.backgroundColor =[UIColor whiteColor];
        but.layer.cornerRadius =5 ;
        but.layer.masksToBounds =YES;
        but.layer.borderColor =[UIColor groupTableViewBackgroundColor].CGColor;
        but.layer.borderWidth =0.7;
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        but.titleLabel.font =[UIFont systemFontOfSize:13];
        [_butsArray addObject:but];
    }
    return _butsArray;
}

- (void)setAllTabPagArray:(NSMutableArray *)AllTabPagArray{
    
    if (_AllTabPagArray.count >0) {
        return;
    }
    _AllTabPagArray =AllTabPagArray;
    
    
    CGFloat Y =0.0;
    CGFloat X = 0.0 ;
    for (int i=0; i <AllTabPagArray.count; i ++) {
        if (i>=self.butsArray.count) {
            return;
        }
        FilterItem *item =self.AllTabPagArray[i];
        NSString *title =item.titleAndNum;
        NSAttributedString *butedStr =[[NSAttributedString alloc]initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
        CGRect rect =[butedStr boundingRectWithSize:CGSizeMake(screenWigth-20, 30) options:NSStringDrawingUsesFontLeading context:nil];
        UIButton *but =self.butsArray[i];
        CGFloat W =rect.size.width ;
        if (X+W+25 >screenWigth-20) {
            Y +=H;
            X =0;
        }
        but.frame= CGRectMake(10 +X, Y+10,W+20, H-10);
        X +=W+30;
        but.tag =800+i;
        but.selected =item.isSelect;
        if (item.isSelect ==YES) {
            but.backgroundColor =zhuse;
        }else but.backgroundColor =[UIColor whiteColor];
        
        [but addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
        [but setTitle:title forState:UIControlStateNormal];
        [self.contentView addSubview:but];
        
    }
}
- (void)select:(UIButton *)but{
   
    but.selected =!but.selected;
    
    FilterItem *item =self.AllTabPagArray[but.tag-800];
    item.isSelect =! item.isSelect;
    
    if (item.isSelect ==YES) {
        but.backgroundColor =zhuse;
    }else but.backgroundColor =[UIColor whiteColor];
    
    if (self.selectBlock) {
        self.selectBlock();
    }
}
@end

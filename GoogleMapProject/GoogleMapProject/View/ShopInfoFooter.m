//
//  ShopInfoFooter.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoFooter.h"
@interface ShopInfoFooter()

@property (nonatomic,strong)NSMutableArray *butsArray;
@end
@implementation ShopInfoFooter

- (NSMutableArray *)butsArray{
    if (!_butsArray) {
        _butsArray =[[NSMutableArray alloc]init];
        CGFloat W = (screenWigth-65-30-20)/4;
        for (int i =0; i <9; i ++) {
            int a = i/4;
            int b = i%4;
            UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(65 +b*(10+W), 10 +a*(10+W/3*2), W, W/3*2)];
            [but setImage:[UIImage imageNamed:@"timg-2"] forState:UIControlStateNormal];
            but.tag =800+i;
            [_butsArray addObject:but];
            
        }
        
    }
    return _butsArray;
    
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor =[UIColor whiteColor];
        
    }
    return self;
}

- (void)setImgsArray:(NSMutableArray *)imgsArray{
    
    _imgsArray =imgsArray;
    for (UIButton *but in self.butsArray) {
        [but removeFromSuperview];
    }
    
    for (int i =0; i <imgsArray.count; i ++) {
        UIButton *but = self.butsArray[i];
        [self.contentView addSubview:but];
    }
    
    
    
}

@end


//
//  YNSFunctionBar.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/30.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "YNSFunctionBar.h"
@interface YNSFunctionBar()
@property (nonatomic,strong)UIButton *lastbut;
@property (nonatomic,strong)UIView *lineView;
@end
@implementation YNSFunctionBar
- (instancetype)init{
    self =[super init];
    if (self) {
        
        UIView *l =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 1)];
        l.bounds =CGRectMake(0, 0, screenWigth, 5);
        l.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        
        NSArray *arr =@[@"景点",@"餐厅",@"购物",@"酒店"];
        CGFloat w =screenWigth/arr.count;
        
        _lineView =[[UIView alloc]init];
        _lineView.bounds =CGRectMake(0, 0, w, 5);
        _lineView.backgroundColor =zhuse;
        [self addSubview:_lineView];
        
        for (int i =0; i <arr.count; i ++) {
            UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(w *i, 0, w, TabbarHeight-5)];
            [but setTitle:arr[i] forState:UIControlStateNormal];
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [but setTitleColor:zhuse forState:UIControlStateSelected];
            but.tag =900 +i;
            if (i ==0) {
                but.selected =YES;
                _lastbut =but;
                _lineView.center =CGPointMake(but.center.x, TabbarHeight-2.5);
            }
            [but addTarget:self action:@selector(butChange:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:but];
        }
        
        
        
        
    }
    return self;
    
    
}
- (void)butChange:(UIButton *)but{
    if (_lastbut ==but) {
        return;
    }
    WS(blockSelf);
    but.selected =YES;
    [UIView animateWithDuration:0.6 animations:^{
        blockSelf.lineView.center =CGPointMake(but.center.x, TabbarHeight-2.5);
    }];
    _lastbut.selected =NO;
    _lastbut =but;
    if (self.selectBlock) {
        self.selectBlock(but.tag-900);
    }
    NSArray *arr = @[@"list_map_scenic",@"list_map_food",@"list_map_shop",@"list_map_hotel"];
    [CustomAccount sharedCustomAccount].className =arr[but.tag-900];

    
}
@end

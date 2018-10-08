//
//  SearchHistoryView.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/10/8.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchHistoryView.h"
#define H 40
@interface SearchHistoryView()


@end

@implementation SearchHistoryView

- (instancetype)init{
    self= [super init];
    if (self) {
        
        UILabel *lab = [UILabel new];
        [self addSubview:lab];
        lab.text = @"历史记录";
        lab.textColor = [UIColor blackColor];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 10;
            make.top.offset = 5;
            make.height.offset = 30;
            make.right.offset = -10;
        }];
        
        UIButton *clearBut =[UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:clearBut];
        [clearBut setTitle:@"清除" forState:UIControlStateNormal];
        [clearBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset = 5;
            make.right.offset = 0;
            make.height.offset = 30;
            make.width.offset = 60;
        }];
        [clearBut addTarget:self action:@selector(clearHistory) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSArray *array = [user objectForKey:@"SearchHistorys"];
        CGFloat Y =30.0;
        CGFloat X = 0.0 ;
        for (int i=0; i <array.count; i ++) {
            
            NSString *title =array[i];
            NSAttributedString *butedStr =[[NSAttributedString alloc]initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
            CGRect rect =[butedStr boundingRectWithSize:CGSizeMake(screenWigth-20, 30) options:NSStringDrawingUsesFontLeading context:nil];
            UIButton *but =[[UIButton alloc]init];
            but.tag =800+i;
            but.backgroundColor =[UIColor whiteColor];
            but.layer.cornerRadius =5 ;
            but.layer.masksToBounds =YES;
            but.layer.borderColor =[UIColor groupTableViewBackgroundColor].CGColor;
            but.layer.borderWidth =0.7;
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            but.titleLabel.font =[UIFont systemFontOfSize:13];
            CGFloat W =rect.size.width ;
            if (X+W+25 >screenWigth-20) {
                Y +=H;
                X =0;
            }
            but.frame= CGRectMake(10 +X, Y+10,W+20, H-10);
            X +=W+30;
            but.tag =800+i;
           
            [but addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
            [but setTitle:title forState:UIControlStateNormal];
            [self addSubview:but];
        }
        self.frame = CGRectMake(0, 0, screenWigth, Y +50);
    }
    return self;
}

- (void)select:(UIButton *)but{
    
    if (self.selectHistoryKeyBlock) {
        self.selectHistoryKeyBlock(but.titleLabel.text);
    }    
}

- (void)clearHistory{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:[[NSMutableArray alloc]init] forKey:@"SearchHistorys"];
    [user synchronize];
    [self removeFromSuperview];
}


@end

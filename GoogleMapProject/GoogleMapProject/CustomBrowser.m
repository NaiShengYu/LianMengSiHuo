//
//  CustomBrowser.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CustomBrowser.h"

@interface CustomBrowser ()
@property (nonatomic,strong)UILabel *numLab;
@end

@implementation CustomBrowser

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numLab =[[UILabel alloc]initWithFrame:CGRectMake(0, screenHeight-100, screenWigth, 30)];
    [self.view addSubview:self.numLab];
    self.numLab.textColor =[UIColor whiteColor];
    
    self.numLab.textAlignment =NSTextAlignmentCenter;
//    self.numLab.text =[NSString stringWithFormat:@"%@/%@",self.currentIndex,self.];
}

- (void)setImgs:(NSMutableArray *)imgs{
    _imgs = imgs;
    [self.view bringSubviewToFront:self.numLab];
    self.numLab.text =[NSString stringWithFormat:@"%lu/%lu",(unsigned long)self.currentIndex+1,(unsigned long)imgs.count];
}

- (void)setIndex:(NSInteger *)index{
    _index = index;
    self.numLab.text =[NSString stringWithFormat:@"%lu/%lu",(unsigned long)index+1,(unsigned long)self.imgs.count];    
}
@end

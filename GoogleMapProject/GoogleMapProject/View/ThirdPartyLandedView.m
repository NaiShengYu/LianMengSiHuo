//
//  ThirdPartyLandedView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ThirdPartyLandedView.h"

@implementation ThirdPartyLandedView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        NSArray *arr =@[@"登录_39_39",@"登录_41",@"登录_43",@"登录_45",@"登录_48"];
        self.backgroundColor =[UIColor whiteColor];
        CGFloat w = (screenWigth-10*arr.count-20)/arr.count;
        CGFloat Y = (frame.size.height-w)/2;
        for (int i =0; i <arr.count; i ++) {
            UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(15+(w+10)*i, Y, w, w)];
            [but setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
            [but setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
            [self addSubview:but];
        }
        
        
        
    }
    return self;
    
    
    
    
}

@end

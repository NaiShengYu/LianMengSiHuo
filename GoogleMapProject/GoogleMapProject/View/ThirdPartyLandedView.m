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
        self.backgroundColor =[UIColor whiteColor];
        CGFloat w = (screenWigth-70)/5;
        CGFloat Y = (frame.size.height-w)/2;
        for (int i =0; i <5; i ++) {
            UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(15+(w+10)*i, Y, w, w)];
            but.backgroundColor =[UIColor orangeColor];
            [self addSubview:but];
        }
        
        
        
    }
    return self;
    
    
    
    
}

@end

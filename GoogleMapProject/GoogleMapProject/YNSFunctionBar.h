//
//  YNSFunctionBar.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/30.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YNSFunctionBar : UIView

@property (nonatomic,copy)void (^selectBlock)(NSInteger index);
@end

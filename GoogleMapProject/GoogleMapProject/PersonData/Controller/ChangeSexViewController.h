//
//  ChangeSexViewController.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/25.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeSexViewController : UIViewController

@property (nonatomic,copy)NSString *sex;

@property (nonatomic,copy)void (^changeSexBlock)(NSString *sex);
@end

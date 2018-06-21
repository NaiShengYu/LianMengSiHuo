//
//  LeftViewController.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"
@interface LeftViewController : UIViewController
@property (strong, nonatomic) MMDrawerController *drawerController;
@property (strong, nonatomic) HomePageViewController *homePageVC;

@end

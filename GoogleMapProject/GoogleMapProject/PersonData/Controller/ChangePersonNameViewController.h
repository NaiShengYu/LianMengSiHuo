//
//  ChangePersonNameViewController.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/25.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePersonNameViewController : UIViewController

@property (nonatomic,copy)NSString *nickName;

@property (nonatomic,copy)void (^changeSuccussBlock)(NSString *name);
@end

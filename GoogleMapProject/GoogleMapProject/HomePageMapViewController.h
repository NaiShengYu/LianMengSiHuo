//
//  HomePageMapViewController.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/30.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageMapViewController : UIViewController
@property (nonatomic,assign)NSInteger VCType;//0从列表页进入，1从首页进入,2从详情页进入

@property (nonatomic,assign)CLLocationCoordinate2D shopLocation;

@property (nonatomic,copy) NSString *shopId;
@end

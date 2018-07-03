//
//  HomePageNavView.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageNavView : UIView
@property (nonatomic,strong)UIButton *backBut;

@property (nonatomic,strong)UITextField *searchBar;

@property (nonatomic,strong)UIButton *rightBut;

@property (nonatomic,strong)UIButton *cancelBut;

@property (nonatomic,weak)UIViewController *vc;

@end

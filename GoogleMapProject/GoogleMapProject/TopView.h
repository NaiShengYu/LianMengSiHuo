//
//  TopView.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView

@property (nonatomic,strong)UIButton *backBut;

@property (nonatomic,strong)UIButton *chooseBut;

@property (nonatomic,strong)UITextField *searchBar;

@property (nonatomic,strong)UIButton *rightBut;

@property (nonatomic,weak)UIViewController *vc;

@property (nonatomic,strong)NSMutableArray *dataArray;


@end

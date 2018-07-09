//
//  BottomView.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapBottomModel.h"
@interface BottomView : UIView

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UILabel *topickNumLab;

@property (nonatomic,strong)UILabel *juliLab;
@property (nonatomic,strong)UILabel * speciesLab;

@property (nonatomic,weak)UIViewController *vc;

@property (nonatomic,assign)CLLocationCoordinate2D coor;

@property (nonatomic,strong)MapBottomModel *model;

@end

//
//  HomePageSectionZeroCell.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface HomePageSectionZeroCell : UICollectionViewCell
@property (nonatomic,strong)GMSMapView *mapV ;

@property (nonatomic,strong)UIButton *titleBut;

@property (nonatomic,strong)UITableView *tab;

@property (nonatomic,weak)UIViewController *VC;
@end

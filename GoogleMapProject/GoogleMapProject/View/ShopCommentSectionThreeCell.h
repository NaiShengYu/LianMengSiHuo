//
//  ShopCommentSectionThreeCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCommentSectionThreeCell : UITableViewCell

@property (nonatomic,strong)UIButton *addBut;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *imgUrlArray;
@property (nonatomic,weak)UIViewController *controller;

@property (nonatomic,strong)NSURL *videoURL;

@property (nonatomic,assign)NSInteger modeType;

@property (nonatomic,copy) void(^cancelImgsBlock)(NSInteger a);


@end

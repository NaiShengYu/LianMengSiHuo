

//
//  BottomView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "BottomView.h"
#import <MapKit/MapKit.h>
@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        self.backgroundColor =[UIColor whiteColor];
        self.layer.cornerRadius =5;
        self.layer.masksToBounds =YES;
        _imageV =[UIImageView new];
        [self addSubview:_imageV];
        _imageV.image =[UIImage imageNamed:@"aaa"];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset =20;
            make.bottom.offset =-20;
            make.width.equalTo(blockSelf.imageV.mas_height).multipliedBy(1.2);
        }];
        
        UIButton *but =[[UIButton alloc]init];
        [self addSubview:but];
        [but setImage:[UIImage imageNamed:@"29"] forState:UIControlStateNormal];
        [but mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =22;
            make.right.offset =-20;
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [but addTarget:self action:@selector(daohang) forControlEvents:UIControlEventTouchUpInside];
        
        
        _juliLab =[UILabel new];
        [self addSubview:_juliLab];
        _juliLab.backgroundColor =RGBA(245, 245, 245, 1);
        [_juliLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(but.mas_bottom).offset =10;
            make.centerX.equalTo(but.mas_centerX).offset =0;
            make.width.offset =50;
            make.height.offset =25;
        }];
        _juliLab.adjustsFontSizeToFitWidth =YES;
        _juliLab.layer.cornerRadius =10;
        _juliLab.layer.masksToBounds =YES;
        _juliLab.text =@"200m";
        _juliLab.font =FontSize(14);
        _juliLab.textAlignment =NSTextAlignmentCenter;
        
        _titleLab =[UILabel new];
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =20;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.equalTo(but.mas_left).offset =-10;
            make.height.mas_lessThanOrEqualTo(@50);
        }];
        _titleLab.numberOfLines =2;
        _titleLab.minimumFontSize =12;
        _titleLab.text =@"Le cafe to you";
        
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"32"];
        [self addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(21, 21));
        }];
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [self addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(21, 21));
        }];
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [self addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(21, 21));
        }];
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [self addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(21, 21));
        }];
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(21, 21));
        }];
        
        
        UIView *V1 =[UIView new];
        [self addSubview:V1];
        
        UILabel *lab1 =[UILabel new];
        [self addSubview:lab1];
        [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.bottom.offset =-24;
            make.height.equalTo(lab1.mas_height).offset =5;
            make.width.equalTo(lab1.mas_width).offset =10;
        }];
        
        lab1.font =FontSize(12);
        lab1.text =@"当地热门菜品";
        
        [V1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lab1).offset =-5;
            make.top.equalTo(lab1).offset =-3;
            make.right.equalTo(lab1).offset =5;
            make.bottom.equalTo(lab1).offset =3;
        }];
        V1.backgroundColor =RGBA(245, 245, 245, 1);
        V1.layer.cornerRadius =3;
        V1.layer.borderColor =RGBA(231, 231, 231, 1).CGColor;
        V1.layer.borderWidth =1;
        V1.layer.masksToBounds =YES;
       
        UIView *V2 =[UIView new];
        [self addSubview:V2];
        
        UILabel *lab2 =[UILabel new];
        [self addSubview:lab2];
        [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lab1.mas_right).offset =10;
            make.bottom.offset =-24;
            make.height.equalTo(lab2.mas_height).offset =5;
            make.width.equalTo(lab2.mas_width).offset =10;
        }];
        
        lab2.font =FontSize(12);
        lab2.text =@"法餐";
        
        [V2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lab2).offset =-5;
            make.top.equalTo(lab2).offset =-3;
            make.right.equalTo(lab2).offset =5;
            make.bottom.equalTo(lab2).offset =3;
        }];
        V2.backgroundColor =RGBA(245, 245, 245, 1);
        V2.layer.cornerRadius =3;
        V2.layer.borderColor =RGBA(231, 231, 231, 1).CGColor;
        V2.layer.borderWidth =1;
        V2.layer.masksToBounds =YES;
        
        
        _topickNumLab =[UILabel new];
        [self addSubview:_topickNumLab];
        _topickNumLab.text =@"12432条评论";
        [_topickNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(V1.mas_top).offset =-8;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;

        }];
        _topickNumLab.font =FontSize(15);
        _topickNumLab.textColor =RGBA(204, 204, 204, 1);
        
        
    }
    
    
    return self;
    
    
}
- (void)daohang{

    [self.vc.view endEditing:YES];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
        NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",@"联盟",@"lianMeng",self.coor.latitude, self.coor.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

      BOOL aaa=  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        
        NSLog(@"%@",aaa?@"Yes":@"NO");
    }else{
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"您手机没有谷歌地图"];
    }
    
    
    
    return;
    UIAlertController *alertV =[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertV addAction:[UIAlertAction actionWithTitle:@"谷歌地图" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
       
        
    }]] ;
    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]]){
        
        　　UIAlertAction *action = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            　　MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
            　　MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:self.coor addressDictionary:nil]];
            　　[MKMapItem openMapsWithItems:@[currentLocation, toLocation] launchOptions:@{MKLaunchOptionsDirectionsModeKey: 　　　　MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
            
        }];
        
        　　[alertV addAction:action];
    }
    
    [alertV addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [_vc presentViewController:alertV animated:YES completion:nil];
    
    
    
}

@end

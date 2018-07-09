

//
//  BottomView.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/10.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "BottomView.h"
#import <MapKit/MapKit.h>
#import "ShopInfoViewController.h"
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
        _imageV.userInteractionEnabled = YES;

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
        _titleLab.userInteractionEnabled = YES;
        
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"32"];
        [self addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img1.tag =1001;
        
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [self addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
         img2.tag =1002;
        
        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [self addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
         img3.tag =1003;
        
        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [self addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
         img4.tag =1004;
        
        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [self addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
         img5.tag =1005;
        
        UIView *V1 =[UIView new];
        [self addSubview:V1];
        
        _speciesLab =[UILabel new];
        [self addSubview:_speciesLab];
        [_speciesLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.bottom.offset =-24;
            make.right.lessThanOrEqualTo(blockSelf).offset = -10;
            make.top.equalTo(blockSelf.juliLab.mas_bottom).offset = 5;

        }];
        
        _speciesLab.font =FontSize(12);
        _speciesLab.text =@"当地热门菜品";
        _speciesLab.numberOfLines = 2;
        
        [V1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.speciesLab).offset =-5;
            make.top.equalTo(blockSelf.speciesLab).offset =-3;
            make.right.equalTo(blockSelf.speciesLab).offset =5;
            make.bottom.equalTo(blockSelf.speciesLab).offset =3;
        }];
        V1.backgroundColor =RGBA(245, 245, 245, 1);
        V1.layer.cornerRadius =3;
        V1.layer.borderColor =RGBA(231, 231, 231, 1).CGColor;
        V1.layer.borderWidth =1;
        V1.layer.masksToBounds =YES;
       
        UIView *V2 =[UIView new];
        [self addSubview:V2];
    
        
        _topickNumLab =[UILabel new];
        [self addSubview:_topickNumLab];
        _topickNumLab.text =@"12432条评论";
        [_topickNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.greaterThanOrEqualTo(V1.mas_top).offset =-8;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.centerY.equalTo(blockSelf.juliLab.mas_centerY).offset = 0;
            make.right.equalTo(blockSelf.juliLab.mas_left).offset = -8;
        }];
        _topickNumLab.adjustsFontSizeToFitWidth = YES;
        _topickNumLab.minimumFontSize = 10;
        _topickNumLab.font =FontSize(12);
        _topickNumLab.textColor =RGBA(204, 204, 204, 1);
        _topickNumLab.numberOfLines = 2;
        
        
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]init];
        [tap addTarget:self action:@selector(goInfo)];
        [self.titleLab addGestureRecognizer:tap];
        
        UITapGestureRecognizer *tap1 =[[UITapGestureRecognizer alloc]init];
        [tap1 addTarget:self action:@selector(goInfo)];
        [self.imageV addGestureRecognizer:tap1];
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


- (void)goInfo{
    
    ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
    [self.vc.navigationController pushViewController:vc animated:YES];
}


- (void)setModel:(MapBottomModel *)model{
    _model = model;
    
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,model.img]]];
    
    _titleLab.text =[NSString stringWithFormat:@"%@",model.name];
    
    CGFloat jl = [model.distance floatValue];
    if (jl <10) {
        _juliLab.text = [NSString stringWithFormat:@"%.fm",jl];
        
    }else{
        _juliLab.text = [NSString stringWithFormat:@"%.fkm",jl];
    }
    //类型是餐厅和购物的时候显示人均
    if ([model.type integerValue] ==1 ||[model.type integerValue] ==3 ) {
        _topickNumLab.text =[NSString stringWithFormat:@"%@  %@",model.red,model.num];
    }else {
        _topickNumLab.text =[NSString stringWithFormat:@"%@",model.num];
    }
    _speciesLab.text = [NSString stringWithFormat:@"%@",model.blue];
    
    for(int i =0; i <5;i ++){
        UIImageView *img = [self viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"34"];
    }
    
    for(int i =0; i <[model.star integerValue];i ++){
        UIImageView *img = [self viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"32"];
    }
}

@end

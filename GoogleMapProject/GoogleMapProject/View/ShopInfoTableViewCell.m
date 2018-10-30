//
//  ShopInfoTableViewCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoTableViewCell.h"
#import "HomePageMapViewController.h"
//#import "YFScrollView.h"
#import <MWPhotoBrowser.h>
#import <MapKit/MapKit.h>

@interface ShopInfoTableViewCell()<MWPhotoBrowserDelegate>

@end
@implementation ShopInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        UIView *backView =[UIView new];
        [self.contentView addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.offset =0;
            make.height.offset =130;
        }];
        backView.backgroundColor =[UIColor whiteColor];
        
        WS(blockSelf);
        _imageV =[UIImageView new];
        [backView addSubview:_imageV];
        NSString *imgstr =@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530697623164&di=1a7b2682266602bffd5116a3d1a92147&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fa50f4bfbfbedab64ab4731d9f436afc379311ef5.jpg";
//        imgstr = [imgstr stringByAddingPercentEscapesUsingEncoding:imgstr];
        [_imageV sd_setImageWithURL:[NSURL URLWithString:imgstr] placeholderImage:[UIImage imageNamed:@"aaa"]];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (screenWigth >320) {
                make.top.left.offset =20;
                make.bottom.offset =-20;
            }else{
                make.left.offset =20;
                make.top.offset =30;
                make.bottom.offset =-30;
            } make.width.equalTo(blockSelf.imageV.mas_height).multipliedBy(1.65);
        }];
        _imageV.userInteractionEnabled =YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
        [tap addTarget:self action:@selector(BrowsePicture)];
        [_imageV addGestureRecognizer:tap];
        
        
        UIView *picturebackView =[UIView new];
        [_imageV addSubview:picturebackView];
        [picturebackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.offset =0;
            make.height.offset =20;
        }];
        picturebackView.backgroundColor =[UIColor blackColor];
        picturebackView.alpha = 0.4;
        
        _pictureNumLab =[UILabel new];
        [_imageV addSubview:_pictureNumLab];
        [_pictureNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset =15;
            make.left.offset =10;
            make.bottom.offset =-2.5;
            make.right.offset =-10;
            
        }];
        _pictureNumLab.text =@"123张图片";
        _pictureNumLab.textAlignment =NSTextAlignmentCenter;
        _pictureNumLab.adjustsFontSizeToFitWidth =YES;
        _pictureNumLab.textColor = [UIColor whiteColor];
        _pictureNumLab.font =FontSize(12);
        
        _titleLab =[UILabel new];
        [backView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =20;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset =-10;
            make.height.mas_lessThanOrEqualTo(@50);
        }];
        _titleLab.numberOfLines =2;
        _titleLab.minimumFontSize =12;
        _titleLab.text =@"Le cafe to you";
        
        UIImageView *img1 = [UIImageView new];
        img1.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img1];
        [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img1.tag = 1001;
        UIImageView *img2 = [UIImageView new];
        img2.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img2];
        [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img1.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img2.tag = 1002;

        UIImageView *img3 = [UIImageView new];
        img3.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img3];
        [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img2.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img3.tag = 1003;

        UIImageView *img4 = [UIImageView new];
        img4.image =[UIImage imageNamed:@"32"];
        [backView addSubview:img4];
        [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img3.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img4.tag = 1004;

        UIImageView *img5 = [UIImageView new];
        img5.image =[UIImage imageNamed:@"34"];
        [backView addSubview:img5];
        [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleLab.mas_bottom).offset =5;
            make.left.equalTo(img4.mas_right).offset =1;
            make.size.mas_equalTo(CGSizeMake(16.1, 16.1));
        }];
        img5.tag = 1005;

        _juliLab =[UILabel new];
        [self addSubview:_juliLab];
        _juliLab.backgroundColor =RGBA(245, 245, 245, 1);
        [_juliLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(img5.mas_centerY).offset =0;
            make.right.offset =-15;
            make.width.lessThanOrEqualTo(@70);
            
        }];
        _juliLab.adjustsFontSizeToFitWidth =YES;
        
        _juliLab.text =@"200m";
        _juliLab.font =FontSize(10);
        _juliLab.textAlignment =NSTextAlignmentCenter;
        
        
        UIView *V1 =[UIView new];
        [self.contentView addSubview:V1];
        [V1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(blockSelf.juliLab).offset =-5;
            make.top.equalTo(blockSelf.juliLab).offset =-3;
            make.right.equalTo(blockSelf.juliLab).offset =5;
            make.bottom.equalTo(blockSelf.juliLab).offset =3;
        }];
        V1.backgroundColor =RGBA(245, 245, 245, 1);
        V1.layer.cornerRadius =10;
        V1.layer.borderColor =RGBA(231, 231, 231, 1).CGColor;
        V1.layer.borderWidth =1;
        V1.layer.masksToBounds =YES;
        
        
        
        
        _topickNumLab =[UILabel new];
        [backView addSubview:_topickNumLab];
        _topickNumLab.text =@"12432条评论";
        [_topickNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img5.mas_bottom).offset =3;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset = -10;
        }];
        _topickNumLab.font =FontSize(11);
        _topickNumLab.textColor =RGBA(204, 204, 204, 1);
        
        _speciesLab =[UILabel new];
        [backView addSubview:_speciesLab];
        [_speciesLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.topickNumLab.mas_bottom).offset =3;
            make.left.equalTo(blockSelf.imageV.mas_right).offset =10;
            make.right.offset =-10;
        }];
        _speciesLab.numberOfLines =2;
        _speciesLab.font =FontSize(11);
        _speciesLab.textColor =[UIColor grayColor];
        _speciesLab.minimumFontSize =13;
//        _speciesLab.text =@"当地热门菜品，法餐，意大利菜";
        
        _mapV =[[GMSMapView alloc]init];
        [self.contentView addSubview:_mapV];
        [_mapV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backView.mas_bottom).offset =0;
            make.left.right.offset =0;
            make.height.offset =80;
        }];
        UIButton *mapBackV =[UIButton new];
        [_mapV addSubview:mapBackV];
        [mapBackV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets =UIEdgeInsetsMake(10, 20, 10, 20);
        }];
        mapBackV.backgroundColor =RGBA(250, 250, 250, 0.4);
        [mapBackV addTarget:self action:@selector(goMapVC) forControlEvents:UIControlEventTouchUpInside];
//
        UIImageView *img =[UIImageView new];
        [self.contentView addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.mapV.mas_bottom).offset =15;
            make.left.offset =20;
            make.size.mas_equalTo(CGSizeMake(18, 18*58/43));
            
        }];
        img.image =[UIImage imageNamed:@"详情_11"];
        
        _AddressLab =[UILabel new];
        [self.contentView addSubview:_AddressLab];
        [_AddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(img.mas_right).offset =10;
            make.centerY.equalTo(img.mas_centerY).offset =0;
            make.right.offset =-15;
            make.height.offset =40;
        }];
        _AddressLab.numberOfLines =2;
        _AddressLab.font =FontSize(16);
        _AddressLab.text = @"江苏省南通市南通县南通真南通村250号";
        
        UIButton *navBut = [UIButton new];
        [self.contentView addSubview:navBut];
        [navBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.mapV.mas_bottom).offset =15;
            make.left.offset =20;
            make.right.offset =-15;
            make.height.offset =40;
        }];
        [navBut addTarget:self action:@selector(nav) forControlEvents:UIControlEventTouchUpInside];
        
        
        _infoLab =[UILabel new];
        [self.contentView addSubview:_infoLab];
        [_infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.AddressLab.mas_bottom).offset =10;
            make.left.equalTo(img.mas_right).offset =10;
            make.right.offset =-15;
            make.bottom.offset =-121;
        }];
        _infoLab.numberOfLines =0;
        _infoLab.font =FontSize(16);
        
        UIView *heline =[UIView new];
        [self.contentView addSubview:heline];
        [heline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.infoLab.mas_bottom).offset =20;
            make.left.right.offset =0;
            make.height.offset =10;
        }];
        heline.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        _backBut =[UIButton new];
        [self.contentView addSubview:_backBut];
        [_backBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset =0;
            make.height.offset =45;
            make.top.equalTo(heline.mas_bottom).offset =0;
        }];
        _backBut.backgroundColor =[UIColor whiteColor];
        
        UIImageView *img11 =[UIImageView new];
        [_backBut addSubview:img11];
        [img11 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =20;
            make.centerY.offset =0;
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        img11.image =[UIImage imageNamed:@"详情_15"];
        
        _telNum =[UILabel new];
        [_backBut addSubview:_telNum];
        [_telNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(img11.mas_right).offset =10;
            make.centerY.offset =0;
            make.right.offset =-15;
        }];
        _telNum.text =@"13312345678";
        
        UIView *lineV =[UIView new];
        [self.contentView addSubview:lineV];
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.backBut.mas_bottom).offset =0;
            make.left.right.offset =0;
            make.height.offset =1;
        }];
        lineV.backgroundColor =[UIColor groupTableViewBackgroundColor];
        
        UIView *backV =[UIView new];
        [self.contentView addSubview:backV];
        [backV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset =0;
            make.height.offset =45;
            make.top.equalTo(lineV.mas_bottom).offset =0;
        }];
        backV.backgroundColor =[UIColor whiteColor];
        
        UIImageView *img22 =[UIImageView new];
        [backV addSubview:img22];
        [img22 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =20;
            make.centerY.offset =0;
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        img22.image =[UIImage imageNamed:@"详情_19"];
        
        _num =[UILabel new];
        [backV addSubview:_num];
        [_num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(img22.mas_right).offset =10;
            make.centerY.offset =0;
            make.right.offset =-15;
        }];
        _num.text =@"12894个人评论";
        _dataArray =[[NSMutableArray alloc]init];
        
    }
    return self;

}

- (void)BrowsePicture{
    
    MWPhotoBrowser *browser=[[MWPhotoBrowser alloc]initWithDelegate:self];
    browser.displayActionButton =NO;
    browser.alwaysShowControls = YES;
    [self.VC.navigationController pushViewController:browser animated:NO];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.dataArray.count;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return self.dataArray[index];
}

- (void)setModel:(ShopInfoModel *)model{
    _model = model;
    WS(blockSelf);
    [_dataArray removeAllObjects];
    [model.img_arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MWPhoto *p = [[MWPhoto alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,obj]]];
        [blockSelf.dataArray addObject:p];
    }];
    
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,model.img]]];
    _titleLab.text =[NSString stringWithFormat:@"%@",model.name];
    CGFloat jl = [model.distance floatValue];
    NSString *jlstr = @"";
    if (jl <1) {
        jlstr = [NSString stringWithFormat:@"%.fm",jl*1000];
        
    }else{
        jlstr = [NSString stringWithFormat:@"%.fkm",jl];
    }
    _juliLab.text =[CustomAccount sharedCustomAccount].isSearch == YES ?[NSString stringWithFormat:@"距市中心%@",jlstr]:[NSString stringWithFormat:@"距我%@",jlstr];

    //类型是餐厅和购物的时候显示人均
//    if ([model.type integerValue] ==1 ||[model.type integerValue] ==3 ) {
//        _topickNumLab.text =[NSString stringWithFormat:@"%@  %@",model.red,model.num];
//    }else {
        _topickNumLab.text =[NSString stringWithFormat:@"%@",model.num];
//    }
    //不是景点的显示
    if([model.type integerValue] ==2){
        _speciesLab.text = @"";
    }
   else if ([model.type integerValue] ==3) {
        _speciesLab.text = [NSString stringWithFormat:@"%@",model.red];
    }else{
        _speciesLab.text = [NSString stringWithFormat:@"%@",model.blue];
    }
    
    for(int i =0; i <5;i ++){
        UIImageView *img = [self.contentView viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"34"];
    }
    for(int i =0; i <[model.star integerValue];i ++){
        UIImageView *img = [self.contentView viewWithTag:1001+i];
        img.image = [UIImage imageNamed:@"32"];
    }
    
    _AddressLab.text = [NSString stringWithFormat:@"%@",model.address];
    
    NSString *info = model.info;
    info = [info stringByReplacingOccurrencesOfString:instailString withString:@"\n"];
    _infoLab.text = [NSString stringWithFormat:@"%@",info];
    
    _pictureNumLab.text = [NSString stringWithFormat:@"%@张图片",model.img_num];
    
    [_mapV clear];
    [self performSelector:@selector(makeMap) withObject:self afterDelay:1];
    _telNum.text = [NSString stringWithFormat:@"%@",model.tel];
    _num.text = [NSString stringWithFormat:@"%@",model.num];
}

- (void)makeMap{
    GMSCameraPosition *position = [GMSCameraPosition cameraWithLatitude:[_model.details_lat doubleValue] longitude:[_model.details_lng doubleValue] zoom:18];
    [_mapV animateToCameraPosition:position];
    
    GMSMarker* marker =[[GMSMarker alloc]init];
    marker.position =CLLocationCoordinate2DMake([_model.details_lat doubleValue], [_model.details_lng doubleValue]);
    marker.icon =[UIImage imageNamed:@"详情_11"];
    marker.draggable =NO;
    marker.map = _mapV;
}

- (void)nav{
    if (self.model ==nil) {
        return;
    }
        [self.VC.view endEditing:YES];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
            NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%@,%@&directionsmode=driving",@"联盟旅游",@"lianMeng",self.model.details_lat, self.model.details_lng] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            BOOL aaa=  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
            NSLog(@"%@",aaa?@"Yes":@"NO");
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"您手机没有谷歌地图"];
        }
        
        return;
        UIAlertController *alertV =[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertV addAction:[UIAlertAction actionWithTitle:@"谷歌地图" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
            
        }]] ;
        
        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]]){
            
            　　UIAlertAction *action = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                　　MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
                　　MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake([self.model.details_lat doubleValue], [self.model.details_lng doubleValue]) addressDictionary:nil]];
                　　[MKMapItem openMapsWithItems:@[currentLocation, toLocation] launchOptions:@{MKLaunchOptionsDirectionsModeKey: 　　　　MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
                
            }];
            
            　　[alertV addAction:action];
        }
        
        [alertV addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [_VC presentViewController:alertV animated:YES completion:nil];

}

- (void)goMapVC{
    
    HomePageMapViewController *vc =[[HomePageMapViewController alloc]init];
    vc.VCType = 2;
    vc.shopLocation = CLLocationCoordinate2DMake([_model.details_lat doubleValue], [_model.details_lng doubleValue]);
    vc.shopId = _model.Id;
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [self.VC.navigationController pushViewController:vc animated:NO];
    } completion:^(BOOL finished) {
    }];
    
}


@end

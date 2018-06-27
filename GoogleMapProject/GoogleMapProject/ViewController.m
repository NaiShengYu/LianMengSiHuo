//
//  ViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ViewController.h"
@import GoogleMaps;
#import "BottomView.h"
#import "TopView.h"

#import "FilterView.h"

#import "FilterItem.h"
#import "FilterHeaderModel.h"
@interface ViewController ()<GMSMapViewDelegate,CLLocationManagerDelegate>
{
    
    GMSMarker *_marker;
    CLLocationCoordinate2D position2D;
    CLLocationCoordinate2D BIGposition2D;

}
@property (nonatomic,strong)GMSMapView *mapV ;
@property (nonatomic,strong)CLLocationManager *locationManager;

@property (nonatomic,strong)NSMutableArray *markersArray;

@property (nonatomic,strong)BottomView *bottomV;

@property (nonatomic,strong)NSMutableArray *filterArray;

@property (nonatomic,strong)FilterView *filterV;
@end

@implementation ViewController

- (FilterView *)filterV{
    if (!_filterV) {
        _filterV =[[FilterView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 0)];
        FilterHeaderModel *headerModel = [[FilterHeaderModel alloc]init];
        headerModel.isSelect = YES;
        headerModel.title =@"类别";
        FilterItem *item1 =[[FilterItem alloc]init];
        item1.title = @"全部";
        item1.isSelect =YES;
        [headerModel.itemsArray addObject:item1];
        
        FilterItem *item2 =[[FilterItem alloc]init];
        item2.title = @"餐厅";
        item2.isSelect =NO;
        [headerModel.itemsArray addObject:item2];
        
        FilterItem *item3 =[[FilterItem alloc]init];
        item3.title = @"景点";
        item3.isSelect =NO;
        [headerModel.itemsArray addObject:item3];
        
        FilterItem *item4 =[[FilterItem alloc]init];
        item4.title = @"购物";
        item4.isSelect =NO;
        [headerModel.itemsArray addObject:item4];
        
        FilterItem *item5 =[[FilterItem alloc]init];
        item5.title = @"酒店";
        item5.isSelect =NO;
        [headerModel.itemsArray addObject:item5];
        
        
        FilterHeaderModel *headerModel1 = [[FilterHeaderModel alloc]init];
        headerModel1.isSelect = NO;
        headerModel1.title =@"距离";
        FilterItem *item11 =[[FilterItem alloc]init];
        item11.title = @"500M";
        item11.isSelect =YES;
        [headerModel1.itemsArray addObject:item11];
        
        FilterItem *item22 =[[FilterItem alloc]init];
        item22.title = @"1km";
        item22.isSelect =NO;
        [headerModel1.itemsArray addObject:item22];
        
        FilterItem *item33 =[[FilterItem alloc]init];
        item33.title = @"2km";
        item33.isSelect =NO;
        [headerModel1.itemsArray addObject:item33];
        
        FilterItem *item44 =[[FilterItem alloc]init];
        item44.title = @"5km";
        item44.isSelect =NO;
        [headerModel1.itemsArray addObject:item44];
        
        FilterItem *item55 =[[FilterItem alloc]init];
        item55.title = @"8km";
        item55.isSelect =NO;
        [headerModel1.itemsArray addObject:item55];
        
        FilterItem *item66 =[[FilterItem alloc]init];
        item66.title = @"10km";
        item66.isSelect =NO;
        [headerModel1.itemsArray addObject:item66];
        
        FilterItem *item77 =[[FilterItem alloc]init];
        item77.title = @"20km";
        item77.isSelect =NO;
        [headerModel1.itemsArray addObject:item77];
        
        FilterHeaderModel *headerModel2 = [[FilterHeaderModel alloc]init];
        headerModel2.isSelect = NO;
        headerModel2.title =@"菜系";
        FilterItem *item111 =[[FilterItem alloc]init];
        item111.title = @"当地热门 1120";
        item111.isSelect =YES;
        [headerModel2.itemsArray addObject:item111];
        
        FilterItem *item222 =[[FilterItem alloc]init];
        item222.title = @"米其林 9";
        item222.isSelect =NO;
        [headerModel2.itemsArray addObject:item222];
        
        FilterItem *item333 =[[FilterItem alloc]init];
        item333.title = @"法餐 134";
        item333.isSelect =NO;
        [headerModel2.itemsArray addObject:item333];
        
        FilterItem *item444 =[[FilterItem alloc]init];
        item444.title = @"意大利菜 32";
        item444.isSelect =NO;
        [headerModel2.itemsArray addObject:item444];
        
        FilterItem *item555 =[[FilterItem alloc]init];
        item555.title = @"中餐 22";
        item555.isSelect =NO;
        [headerModel2.itemsArray addObject:item555];
        
        FilterItem *item666 =[[FilterItem alloc]init];
        item666.title = @"亚洲餐厅 999";
        item666.isSelect =NO;
        [headerModel2.itemsArray addObject:item666];
        
        FilterItem *item888 =[[FilterItem alloc]init];
        item888.title = @"日餐 10";
        item888.isSelect =NO;
        [headerModel2.itemsArray addObject:item888];
        
        FilterItem *item999 =[[FilterItem alloc]init];
        item999.title = @"印度菜 87";
        item999.isSelect =NO;
        [headerModel2.itemsArray addObject:item999];
        
        FilterItem *item1000 =[[FilterItem alloc]init];
        item1000.title = @"酒吧 79";
        item1000.isSelect =NO;
        [headerModel2.itemsArray addObject:item1000];
        
        FilterItem *item1001 =[[FilterItem alloc]init];
        item1001.title = @"墨西哥 1232";
        item1001.isSelect =NO;
        [headerModel2.itemsArray addObject:item1001];
        
        FilterItem *item1002 =[[FilterItem alloc]init];
        item1002.title = @"西班牙菜 879";
        item1002.isSelect =NO;
        [headerModel2.itemsArray addObject:item1002];
        
        FilterItem *item1003 =[[FilterItem alloc]init];
        item1003.title = @"甜点 89";
        item1003.isSelect =NO;
        [headerModel2.itemsArray addObject:item1003];
        
        FilterItem *item1004 =[[FilterItem alloc]init];
        item1004.title = @"韩餐 56";
        item1004.isSelect =NO;
        [headerModel2.itemsArray addObject:item1004];
        
        FilterItem *item1005 =[[FilterItem alloc]init];
        item1005.title = @"咖啡厅 90";
        item1005.isSelect =NO;
        [headerModel2.itemsArray addObject:item1005];
        
        FilterItem *item1006 =[[FilterItem alloc]init];
        item1006.title = @"西餐 999";
        item1006.isSelect =NO;
        [headerModel2.itemsArray addObject:item1006];
        
        _filterArray =[[NSMutableArray alloc]initWithObjects:headerModel, headerModel1,headerModel2,nil];
        _filterV.dataArray =_filterArray;
        
        
    }
    return _filterV;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.markersArray =[[NSMutableArray alloc]init];
    GMSCameraPosition *position = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:14];
    _mapV =[GMSMapView mapWithFrame:self.view.bounds camera:position];
    _mapV.myLocationEnabled = YES;
    _mapV.delegate =self;
    _mapV.settings.compassButton = YES;//显示指南针
    
    _mapV.contentScaleFactor = 100;

    
    [self.view addSubview:_mapV];

    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc]init];
    }
    self.locationManager.delegate =self;
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//最精确的定位
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // 默认是kCLDistanceFilterNone，也可以设置其他值，表示用户移动的距离小于该范围内就不会接收到通知
    [self.locationManager startUpdatingLocation];

    
     self.bottomV=[[BottomView alloc]initWithFrame:CGRectMake(10, self.view.bounds.size.height, self.view.bounds.size.width-20, 153)];
 
    self.bottomV.vc =self;
    [self.view addSubview:self.bottomV];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(viewDismiss)];
    [self.bottomV addGestureRecognizer:tap];
//    UIWebView *web =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
//    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.xkddyz.com/admin/index.php"]]];
//    [self.view addSubview:web];
    
  
  

    
    
    UIView *bacv =[[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, MaxY+80, 60, 120)];
    bacv.backgroundColor =[UIColor clearColor];
    [self.view addSubview:bacv];
    
    UIView *bacv1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 150)];
    bacv1.backgroundColor =[UIColor whiteColor];
    bacv1.alpha =0.4;
    [bacv addSubview:bacv1];
    
    UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 60, 60)];
    [but addTarget:self action:@selector(saoMiao) forControlEvents:UIControlEventTouchUpInside];
    [but setImage:[UIImage imageNamed:@"19"] forState:UIControlStateNormal];
    [bacv addSubview:but];
    
    UIButton *but1 =[[UIButton alloc]initWithFrame:CGRectMake(0, 80, 60, 60)];
    [but1 addTarget:self action:@selector(currentCenter) forControlEvents:UIControlEventTouchUpInside];
    [but1 setImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
    [bacv addSubview:but1];
    
    [self.view addSubview:self.filterV];
    self.view.backgroundColor =[UIColor whiteColor];
    TopView*topV=[[TopView alloc]initWithFrame:CGRectMake(0, 0,screenWigth , MaxY)];
    [self.view addSubview:topV];
    [topV.backBut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topV.chooseBut addTarget:self action:@selector(chooseBut:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)currentCenter{

    if (position2D.latitude !=0 && position2D.longitude !=0) {
        GMSCameraPosition *position1 = [GMSCameraPosition cameraWithTarget:position2D zoom:14];
        [self.mapV animateToCameraPosition:position1];

    }
}
static int a =0 ;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *curLocation = [locations lastObject];
    // 通过location  或得到当前位置的经纬度
    CLLocationCoordinate2D curCoordinate2D = curLocation.coordinate;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:curCoordinate2D.latitude longitude:curCoordinate2D.longitude zoom:14];
     position2D = CLLocationCoordinate2DMake(curLocation.coordinate.latitude, curLocation.coordinate.longitude);//可以吧这个存起来
    
    BIGposition2D = CLLocationCoordinate2DMake(curLocation.coordinate.latitude, curLocation.coordinate.longitude);//可以吧这个存起来

    
    if (a ==0) {
        a +=1;
        _marker =[[GMSMarker alloc]init];
        _marker.position =CLLocationCoordinate2DMake(curLocation.coordinate.latitude, curLocation.coordinate.longitude);
        _marker.icon =[UIImage imageNamed:@"25"];
        _marker.draggable =YES;
        _marker.map = self.mapV;
        
        for (int i =0 ; i <15; i ++) {
            GMSMarker *marker =[[GMSMarker alloc]init];
            double c = arc4random()%2;
            double d = pow(-1, c);
            CGFloat a = d *(arc4random() % 999)/100000.0;
            CGFloat b = d * (arc4random() % 999)/100000.0;
            
            marker.position =CLLocationCoordinate2DMake(curLocation.coordinate.latitude +a, curLocation.coordinate.longitude+b);
            marker.title =[NSString stringWithFormat:@"第%d个",i+1];
            //        marker.icon = [UIImage imageNamed:@"25"];\
            
            UILabel *view =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
            view.backgroundColor =[UIColor colorWithRed:156/255.0 green:37/255.0 blue:29/255.0 alpha:1];
            view.layer.cornerRadius =12.5;
            view.text =[NSString stringWithFormat:@"%d",i +1];
            view.textColor =[UIColor whiteColor];
            view.adjustsFontSizeToFitWidth =YES;
            view.layer.masksToBounds =YES;
            view.textAlignment =NSTextAlignmentCenter;
            marker.iconView =view;
            
            marker.map =self.mapV;
            
            [self.markersArray addObject:marker];
            
        }
    }
  
    self.mapV.camera = camera;//这句话很重要很重要，将我们获取到的经纬度转成影像并赋值给地图的camera属性
    
  
    [self.locationManager stopUpdatingLocation];//定位成功后停止定位
}




- (void)mapView:(GMSMapView *)mapView didEndDraggingMarker:(GMSMarker *)marker{
    
    NSLog(@"%f",marker.position.latitude);
    BIGposition2D.latitude =marker.position.latitude;
    BIGposition2D.longitude =marker.position.longitude;
    
}

#pragma mark --检索周围店铺
- (void)saoMiao{
    [self.mapV clear];
    
    _marker =[[GMSMarker alloc]init];
    _marker.position =CLLocationCoordinate2DMake(BIGposition2D.latitude, BIGposition2D.longitude);
    _marker.icon =[UIImage imageNamed:@"25"];
    _marker.draggable =YES;
    _marker.map = self.mapV;
    
    for (int i =0 ; i <15; i ++) {
        GMSMarker *marker =[[GMSMarker alloc]init];
        double c = arc4random()%2;
        double d = pow(-1, c);
        CGFloat a = d *(arc4random() % 999)/100000.0;
        CGFloat b = d * (arc4random() % 999)/100000.0;
        
        marker.position =CLLocationCoordinate2DMake(BIGposition2D.latitude +a, BIGposition2D.longitude+b);
        marker.title =[NSString stringWithFormat:@"第%d个",i+1];
        //        marker.icon = [UIImage imageNamed:@"25"];\
        
        UILabel *view =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        view.backgroundColor =[UIColor colorWithRed:156/255.0 green:37/255.0 blue:29/255.0 alpha:1];
        view.layer.cornerRadius =12.5;
        view.text =[NSString stringWithFormat:@"%d",i +1];
        view.textColor =[UIColor whiteColor];
        view.adjustsFontSizeToFitWidth =YES;
        view.layer.masksToBounds =YES;
        view.textAlignment =NSTextAlignmentCenter;
        marker.iconView =view;
        
        marker.map =self.mapV;
        
        [self.markersArray addObject:marker];
        
    }
    
    
}


- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker{
    
    if (marker ==_marker) {
        
        return YES;
    }
    WS(blockSelf)
    self.bottomV.coor = marker.position;
    [UIView animateWithDuration:0.3 animations:^{
        blockSelf.bottomV.frame =CGRectMake(10, screenHeight -153, screenWigth-20, 153);
    }];
    
    return NO;
}


- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    if (self.bottomV.frame.origin.y <screenHeight) {
        [self viewDismiss];
        return;
    }
    
    _marker.position =coordinate;
    BIGposition2D =coordinate;

}
//- (void)mapView:(GMSMapView *)mapView didCloseInfoWindowOfMarker:(GMSMarker *)marker{
//
//
//
//}


- (void)viewDismiss{
    WS(blockSelf);
    [UIView animateWithDuration:0.3 animations:^{
        blockSelf.bottomV.frame =CGRectMake(10, screenHeight +10, screenWigth-20, 153);
    }];
    
}

- (void)chooseBut:(UIButton *)but{
    
    but.selected = !but.selected;
    if (but.selected ==YES) {
        [UIView animateWithDuration:0.4 animations:^{
            self.filterV.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY);
        }];
    }else{
        [UIView animateWithDuration:0.4 animations:^{
            self.filterV.frame =CGRectMake(0, 0, screenWigth, 0);
        }];
    }
    
}


- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

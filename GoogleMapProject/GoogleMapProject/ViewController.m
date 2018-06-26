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
@property (nonatomic,strong)TopView *topV;
@end

@implementation ViewController

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
    
    self.topV=[[TopView alloc]initWithFrame:CGRectMake(0, 0,screenWigth , MaxY)];
    [self.view addSubview:self.topV];
    [_topV.backBut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];

    
    
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

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

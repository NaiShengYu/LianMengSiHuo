//
//  ViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageMapViewController.h"
@import GoogleMaps;
#import "BottomView.h"
#import "TopView.h"
#import "FilterView.h"
#import "FilterItem.h"
#import "FilterHeaderModel.h"
#import "YNSFunctionBar.h"
#import "ShopInfoViewController.h"
#import "CustomMarker.h"
@interface HomePageMapViewController ()<GMSMapViewDelegate>
{
//    GMSMarker *_marker;
    CLLocationCoordinate2D position2D;
    CLLocationCoordinate2D BIGposition2D;
}
@property (nonatomic,strong)GMSMapView *mapV ;

@property (nonatomic,strong)BottomView *bottomV;
@property (nonatomic,strong)TopView*topV;


@property (nonatomic,strong)NSMutableArray *filterArray;

@property (nonatomic,strong)FilterView *filterV;


@property (nonatomic,strong)YNSFunctionBar * functionBar;

//距离
@property (nonatomic,copy)NSString *raidus;
//分类
@property (nonatomic,copy)NSString *list_condition;
//评分
@property (nonatomic,copy)NSString *star;


@end

@implementation HomePageMapViewController

- (FilterView *)filterV{
    if (!_filterV) {
        _filterV =[[FilterView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 0)];
        FilterHeaderModel *headerModel = [[FilterHeaderModel alloc]init];
        headerModel.isSelect = YES;
        headerModel.title =@"评分";
        FilterItem *item1 =[[FilterItem alloc]init];
        item1.title = @"全部";
        item1.Id = @"";
        item1.isSelect =YES;
        [headerModel.itemsArray addObject:item1];
        
        FilterItem *item2 =[[FilterItem alloc]init];
        item2.title = @"五星";
        item2.isSelect =NO;
        item2.Id = @"5";
        [headerModel.itemsArray addObject:item2];
        
        FilterItem *item3 =[[FilterItem alloc]init];
        item3.title = @"四星";
        item3.isSelect =NO;
        item3.Id = @"4";
        [headerModel.itemsArray addObject:item3];
        
        FilterItem *item4 =[[FilterItem alloc]init];
        item4.title = @"三星";
        item4.isSelect =NO;
        item4.Id = @"3";
        
        [headerModel.itemsArray addObject:item4];
        
        FilterItem *item5 =[[FilterItem alloc]init];
        item5.title = @"二星";
        item5.isSelect =NO;
        item5.Id = @"2";
        
        [headerModel.itemsArray addObject:item5];
        
        FilterItem *item6 =[[FilterItem alloc]init];
        item6.title = @"一星";
        item6.isSelect =NO;
        item6.Id = @"1";
        
        [headerModel.itemsArray addObject:item6];
        
        FilterHeaderModel *headerModel1 = [[FilterHeaderModel alloc]init];
        headerModel1.isSelect = NO;
        headerModel1.title =@"距离";
        FilterItem *item11 =[[FilterItem alloc]init];
        item11.title = @"500M";
        item11.isSelect =NO;
        item11.Id = @"0.5";
        [headerModel1.itemsArray addObject:item11];
        
        FilterItem *item22 =[[FilterItem alloc]init];
        item22.title = @"1km";
        item22.isSelect =NO;
        item22.Id = @"1";
        
        [headerModel1.itemsArray addObject:item22];
        
        FilterItem *item33 =[[FilterItem alloc]init];
        item33.title = @"2km";
        item33.isSelect =YES;
        item33.Id = @"2";
        
        [headerModel1.itemsArray addObject:item33];
        
        FilterItem *item44 =[[FilterItem alloc]init];
        item44.title = @"5km";
        item44.isSelect =NO;
        item44.Id = @"5";
        
        [headerModel1.itemsArray addObject:item44];
        
        FilterItem *item55 =[[FilterItem alloc]init];
        item55.title = @"8km";
        item55.isSelect =NO;
        item55.Id = @"8";
        
        [headerModel1.itemsArray addObject:item55];
        
        FilterItem *item66 =[[FilterItem alloc]init];
        item66.title = @"10km";
        item66.isSelect =NO;
        item66.Id = @"10";
        
        [headerModel1.itemsArray addObject:item66];
        
        FilterItem *item77 =[[FilterItem alloc]init];
        item77.title = @"20km";
        item77.isSelect =NO;
        item77.Id = @"20";
        [headerModel1.itemsArray addObject:item77];
        
        _filterArray =[[NSMutableArray alloc]initWithObjects:headerModel, headerModel1,nil];
        _filterV.dataArray =_filterArray;
        
    }
    return _filterV;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.star =@"";
    self.raidus = @"";
    self.list_condition = @"";
    
    GMSCameraPosition *position = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:13];
    _mapV =[GMSMapView mapWithFrame:self.view.bounds camera:position];
    //    _mapV.myLocationEnabled = YES;
    _mapV.delegate =self;
    _mapV.settings.compassButton = YES;//显示指南针
    
    _mapV.contentScaleFactor = 100;
    [self.view addSubview:_mapV];
    
    CGFloat Y = self.VCType==1?TabbarHeight:0;
    self.bottomV=[[BottomView alloc]initWithFrame:CGRectMake(10, screenHeight -153-Y, screenWigth-20, 153)];
    self.bottomV.vc =self;
    
    
    //    UIWebView *web =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    //    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.xkddyz.com/admin/index.php"]]];
    //    [self.view addSubview:web];
    
    UIView *bacv =[[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-70, MaxY+60, 60, 120)];
    bacv.backgroundColor =[UIColor clearColor];
    [self.view addSubview:bacv];
    
    UIView *bacv1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 110)];
    bacv1.backgroundColor =[UIColor whiteColor];
    bacv1.alpha =0.4;
    [bacv addSubview:bacv1];
    
    UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(0, 5, 50, 50)];
    [but addTarget:self action:@selector(saoMiao) forControlEvents:UIControlEventTouchUpInside];
    [but setImage:[UIImage imageNamed:@"19"] forState:UIControlStateNormal];
    [bacv addSubview:but];
    
    UIButton *but1 =[[UIButton alloc]initWithFrame:CGRectMake(0, 55, 50, 50)];
    [but1 addTarget:self action:@selector(currentCenter) forControlEvents:UIControlEventTouchUpInside];
    [but1 setImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
    [bacv addSubview:but1];
    
    [self.view addSubview:self.filterV];
    WS(blockSelf);
    self.filterV.selectChangeBLock = ^(FilterItem *selectItem) {
        [blockSelf makeDataWithSaoMiao:NO];
    };
    self.view.backgroundColor =[UIColor whiteColor];
    TopView*topV=[[TopView alloc]initWithFrame:CGRectMake(0, 0,screenWigth , MaxY)];
    [self.view addSubview:topV];
    topV.vc =self;
    [topV.backBut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];    
    [topV.chooseBut addTarget:self action:@selector(chooseBut:) forControlEvents:UIControlEventTouchUpInside];
    _topV = topV;
    //    if ([CustomAccount sharedCustomAccount].curCoordinate2D.latitude==0 && [CustomAccount sharedCustomAccount].curCoordinate2D.longitude==0) {
    //        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getLocation) name:@"getCityName" object:nil];
    //    }else{
    [self currentLocation];
    //    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden =YES;
    
}

- (void)getLocation{
    [self currentLocation];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getCityName" object:nil];
}

- (void)currentCenter{
    
    if (position2D.latitude !=0 && position2D.longitude !=0) {
        GMSCameraPosition *position1 = [GMSCameraPosition cameraWithTarget:position2D zoom:13];
        [self.mapV animateToCameraPosition:position1];
        BIGposition2D = position2D;
    }
}


- (void)currentLocation{
    
    
    
    
    // 通过location  或得到当前位置的经纬度
    CLLocationCoordinate2D curCoordinate2D = [CustomAccount sharedCustomAccount].cityLocation;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:curCoordinate2D.latitude longitude:curCoordinate2D.longitude zoom:13];
    position2D = [CustomAccount sharedCustomAccount].curCoordinate2D;//可以吧这个存起来
    BIGposition2D = curCoordinate2D;
    if (self.VCType ==1) {
        [self creatBottomView];
    }
    if (self.dataArray ==nil) {
        self.dataArray =[[NSMutableArray alloc]init];
        [self makeDataWithSaoMiao:NO];
    }else{
        self.bottomV.model = self.dataArray[0];
        [self saoMiaoJieGuo];
        [self.view addSubview:self.bottomV];
        self.topV.dataArray = self.dataArray;
    }
    [self getCollection];
    
    self.mapV.camera = camera;//这句话很重要很重要，将我们获取到的经纬度转成影像并赋值给地图的camera属性
    
//    _marker =[[GMSMarker alloc]init];
//    _marker.position =CLLocationCoordinate2DMake(BIGposition2D.latitude, BIGposition2D.longitude);
//    _marker.icon =[UIImage imageNamed:@"25"];
//    _marker.draggable =YES;
//    _marker.map = self.mapV;
    GMSCameraPosition *position1 = [GMSCameraPosition cameraWithLatitude:BIGposition2D.latitude longitude:BIGposition2D.longitude zoom:13];
    [_mapV animateToCameraPosition:position1];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
    
    
}
- (void)creatBottomView{
    WS(blockSelf);
    _functionBar =[[YNSFunctionBar alloc]init];
    _functionBar.frame =CGRectMake(0, screenHeight-TabbarHeight, screenWigth, TabbarHeight);
    _functionBar.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_functionBar];
    [CustomAccount sharedCustomAccount].className =@"list_map_scenic";
    [CustomAccount sharedCustomAccount].classtype =@"2";
    
    _functionBar.selectBlock = ^(NSInteger index) {
        [blockSelf makeDataWithSaoMiao:NO];
        [blockSelf getCollection];
    };
}

- (void)mapView:(GMSMapView *)mapView didEndDraggingMarker:(GMSMarker *)marker{
    NSLog(@"%f",marker.position.latitude);
    BIGposition2D.latitude =marker.position.latitude;
    BIGposition2D.longitude =marker.position.longitude;
}

#pragma mark --检索周围店铺
- (void)saoMiao{
    
    [self makeDataWithSaoMiao:YES];
}

- (void)saoMiaoJieGuo{
    
    [self.mapV clear];
//    _marker =[[GMSMarker alloc]init];
//    _marker.position =CLLocationCoordinate2DMake(BIGposition2D.latitude, BIGposition2D.longitude);
//    _marker.icon =[UIImage imageNamed:@"25"];
//    _marker.draggable =YES;
//    _marker.map = self.mapV;
    //    GMSCameraPosition *position1 = [GMSCameraPosition cameraWithLatitude:BIGposition2D.latitude longitude:BIGposition2D.longitude zoom:14];
    //    [_mapV animateToCameraPosition:position1];
    
    for (int i =0 ; i <self.dataArray.count; i ++) {
        //         if(i >19)return;
        MapBottomModel *model = self.dataArray[i];
        CustomMarker *marker =[[CustomMarker alloc]init];
        marker.bottomModel = model;
        
        
        //        double c = arc4random()%2;
        //        double d = pow(-1, c);
        //        CGFloat a = d *(arc4random() % 999)/100000.0;
        //        CGFloat b = d * (arc4random() % 999)/100000.0;
        //
        //        marker.position =CLLocationCoordinate2DMake(BIGposition2D.latitude +a, BIGposition2D.longitude+b);
        
        double lat = [model.lat doubleValue];
        double lng = [model.lng doubleValue];
        
        marker.position =CLLocationCoordinate2DMake(lat,lng);
        
        
        
        DLog(@"i===%d___ lat===%f----lng===%f",i,lat,lng)
        ;
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
    }
    
    
}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker{
    

    WS(blockSelf)
    CustomMarker *maker1 =(CustomMarker *)marker;
    self.bottomV.coor = marker.position;
    self.bottomV.model = maker1.bottomModel;
    [UIView animateWithDuration:0.3 animations:^{
        blockSelf.bottomV.frame =CGRectMake(10, screenHeight -153-TabbarHeight, screenWigth-20, 153);
    }];
    
    return NO;
}


- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    if (self.bottomV.frame.origin.y <screenHeight) {
        [self viewDismiss];
        return;
    }
    [mapView animateToLocation:coordinate];
    BIGposition2D =coordinate;
    [self viewDismiss];
    
}

- (void)goInfo{
    ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDismiss{
    WS(blockSelf);
    [UIView animateWithDuration:0.3 animations:^{
        blockSelf.bottomV.frame =CGRectMake(10, screenHeight +10, screenWigth-20, 153);
    }];
    
}

- (void)chooseBut:(UIButton *)but{
    WS(blockSelf)
    but.selected = !but.selected;
    if (but.selected ==YES) {
        [UIView animateWithDuration:0.4 animations:^{
            blockSelf.filterV.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY);
            if (self.VCType ==1) {
                blockSelf.bottomV.frame =CGRectMake(10, screenHeight +10, screenWigth-20, 153);
                blockSelf.functionBar.frame =CGRectMake(10, screenHeight +10+153, screenWigth-20, 153);
            }
            
        }];
        but.backgroundColor = zhuse;
        but.layer.borderColor = [UIColor whiteColor].CGColor;
        but.layer.borderWidth =1;
        
    }else{
        but.layer.borderWidth =0;
        but.backgroundColor =RGBA(133, 31, 24, 1);
        [UIView animateWithDuration:0.4 animations:^{
            self.filterV.frame =CGRectMake(0, 0, screenWigth, 0);
            if (self.VCType ==1) {
                blockSelf.bottomV.frame =CGRectMake(10, screenHeight -153-TabbarHeight, screenWigth-20, 153);
                blockSelf.functionBar.frame =CGRectMake(10, screenHeight-TabbarHeight , screenWigth-20, 153);
            }
        }];
    }
    
}


- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)makeDataWithSaoMiao:(BOOL)isSaoMiao{
    WS(blockSelf);
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    
    if(isSaoMiao ==NO){
        
        if(self.VCType ==1 ||self.VCType ==0){
            [self.filterArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                FilterHeaderModel *headerModel =obj;
                [headerModel.itemsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    FilterItem *item = obj;
                    if (item.isSelect ==YES) {
                        if ([headerModel.title isEqualToString:@"评分"]) {
                            blockSelf.star =item.Id;
                        }
                        if ([headerModel.title isEqualToString:@"距离"]) {
                            blockSelf.raidus =item.Id;
                        }
                        if ([headerModel.title isEqualToString:@"菜系"]) {
                            if (blockSelf.list_condition.length ==0) {
                                blockSelf.list_condition = [NSString stringWithFormat:@"%@",item.Id];
                            }else{
                                blockSelf.list_condition = [NSString stringWithFormat:@"%@,%@",blockSelf.list_condition,item.Id];
                            }
                        }
                        
                    }
                }];
            }];
            
            [param setObject:@"list_show" forKey:@"app"];
            [param setObject:acc.classtype forKey:@"type"];
            [param setObject:[NSString stringWithFormat:@"%f",BIGposition2D.longitude] forKey:@"lng"];
            [param setObject:[NSString stringWithFormat:@"%f",BIGposition2D.latitude] forKey:@"lat"];
            
            //    [param setObject:@"2.3411111" forKey:@"lng"];
            //    [param setObject:@"48.8600" forKey:@"lat"];
            
            //距离
            [param setObject:self.raidus forKey:@"raidus"];
            //分类
            [param setObject:self.list_condition forKey:@"list_condition"];
            //评分
            [param setObject:self.star forKey:@"star"];
            
            //请求起始个数
            [param setObject:@"0" forKey:@"pageno"];
            
        }
        if (self.VCType ==2) {
            [param setObject:@"new_list" forKey:@"app"];
            [param setObject:acc.classtype forKey:@"type"];
            [param setObject:[NSString stringWithFormat:@"%f",self.shopLocation.longitude] forKey:@"lng"];
            [param setObject:[NSString stringWithFormat:@"%f",self.shopLocation.latitude] forKey:@"lat"];
            [param setObject:self.shopId forKey:@"id"];
        }
    }else{
        DLog(@"lat==%f--lng==%f",_mapV.camera.target.latitude,_mapV.camera.target.longitude);
        CLLocationCoordinate2D leftTop = [_mapV.projection coordinateForPoint:CGPointMake(10, TabbarHeight+10)];
        CLLocationCoordinate2D rightBottom = [_mapV.projection coordinateForPoint:CGPointMake(screenWigth-10, screenHeight-50)];
        [param setObject:[NSString stringWithFormat:@"%f",leftTop.longitude] forKey:@"zs_lng"];
        [param setObject:[NSString stringWithFormat:@"%f",leftTop.latitude] forKey:@"zs_lat"];
        [param setObject:[NSString stringWithFormat:@"%f",rightBottom.longitude] forKey:@"yx_lng"];
        [param setObject:[NSString stringWithFormat:@"%f",rightBottom.latitude] forKey:@"yx_lat"];
        [param setObject:[NSString stringWithFormat:@"%f",acc.curCoordinate2D.longitude] forKey:@"user_lng"];
        [param setObject:[NSString stringWithFormat:@"%f",acc.curCoordinate2D.latitude] forKey:@"user_lat"];
        [param setObject:@"show_list_4" forKey:@"app"];
        [param setObject:acc.classtype forKey:@"type"];
    }
    
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            [blockSelf.dataArray removeAllObjects];
            
            if (self.VCType ==2 || isSaoMiao ==YES) {
                for (NSDictionary *list_showDic in responseObject[@"data"]) {
                    MapBottomModel *model = [[MapBottomModel alloc]initWithDic:list_showDic];
                    [blockSelf.dataArray addObject:model];
                }
            }else{
                for (NSDictionary *dataDic in responseObject[@"data"]) {
                    for (NSDictionary *list_showDic in dataDic[@"list_show"]) {
                        MapBottomModel *model = [[MapBottomModel alloc]initWithDic:list_showDic];
                        [blockSelf.dataArray addObject:model];
                    }
                }
            }
            
            [blockSelf.view addSubview:blockSelf.bottomV];
            if (blockSelf.dataArray.count >0) {
                blockSelf.bottomV.model = blockSelf.dataArray[0];
                if (isSaoMiao ==NO) {
                    if (blockSelf.VCType ==2) {
                        [blockSelf.mapV animateToLocation:blockSelf.shopLocation];
                    }else
                        [blockSelf.mapV animateToLocation:self->BIGposition2D];
                }
                blockSelf.bottomV.hidden = NO;
            }else{
                blockSelf.bottomV.hidden =YES;
                [PubulicObj ShowSVWhitMessage];
                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"未在周围查到相关信息"];
            }
            blockSelf.topV.dataArray = blockSelf.dataArray;
            [blockSelf saoMiaoJieGuo];
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:YES];
    
}

- (void)getCollection{
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_condition" forKey:@"app"];
    [param setObject:acc.city_id forKey:@"city_id"];
    [param setObject:acc.classtype forKey:@"type"];
    
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            @try {
                [blockSelf.filterArray removeObjectAtIndex:2];
            } @catch (NSException *exception) {
            } @finally {
            }
            @try {
                FilterHeaderModel *headerModel2 = [[FilterHeaderModel alloc]init];
                headerModel2.isSelect = NO;
                NSArray *arr =responseObject[@"data"];
                [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    FilterItem *item =[[FilterItem alloc]initWithDic:obj];
                    if (idx ==0) {
                        if ([item.type integerValue] ==1) {
                            headerModel2.title =@"菜系";
                        }
                        if ([item.type integerValue] ==3) {
                            headerModel2.title =@"购物";
                        }
                        if ([item.type integerValue] ==4) {
                            headerModel2.title =@"酒店";
                        }
                    }
                    [headerModel2.itemsArray addObject:item];
                }];
                [blockSelf.filterArray addObject:headerModel2];
                blockSelf.filterV.dataArray = blockSelf.filterArray;
                
            } @catch (NSException *exception) {
            } @finally {
            }
        }else{
            [PubulicObj ShowSVWhitMessage];
            
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];
        
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:NO];
    
}

@end

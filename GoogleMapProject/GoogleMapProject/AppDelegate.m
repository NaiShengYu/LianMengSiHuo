//
//  AppDelegate.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "AppDelegate.h"

#import "KNLocationConverter.h"
#import "FirstViewController.h"
#import "CustormAlertView.h"
#import "CustomNetAlertView.h"
#import "CustomNoFoodAlert.h"
#import "TestViewController.h"

@import GoogleMaps;
@interface AppDelegate ()<CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //
    [GMSServices provideAPIKey:@"AIzaSyBUuB_ESkwf_2qx5SpiE5IWuMbg1wpiMYM"];

    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc]init];
    }
    self.locationManager.delegate =self;
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//最精确的定位
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // 默认是kCLDistanceFilterNone，也可以设置其他值，表示用户移动的距离小于该范围内就不会接收到通知
    [self.locationManager startUpdatingLocation];
    
    _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    _window.rootViewController =[[FirstViewController alloc]init];
//    _window.rootViewController =[[UINavigationController alloc]initWithRootViewController:[[TestViewController alloc]init]];

    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleCustom)];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeClear)];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HUDDismiss) name:SVProgressHUDDidReceiveTouchEventNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow) name:UIKeyboardDidShowNotification object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardHiden) name:UIKeyboardDidHideNotification object:nil];



    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showUpdata) name:@"UPDATA" object:nil];
    
    NSUserDefaults *user =[NSUserDefaults standardUserDefaults];
    NSString *state =[user objectForKey:@"qiDongState"];

    if ([state integerValue] ==1) {
        [self getNetState];
        [self getLocationState];
    }
    
    //1.设置状态栏隐藏(YES)或显示(NO)
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    //2.设置状态栏字体颜色
    //UIStatusBarStyleDefault,黑色(默认)
    //UIStatusBarStyleLightContent,白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
    
    
    
    [ShareSDK registerActivePlatforms:@[
//                                        @(SSDKPlatformTypeSinaWeibo),
//                                        @(SSDKPlatformTypeWechat),
                                        @(SSDKPlatformTypeQQ),
                                        ]
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
//             case SSDKPlatformTypeSinaWeibo:
//                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
//                 [appInfo SSDKSetupSinaWeiboByAppKey:@
//                                           appSecret:@”38a4f8204cc784f81f9f0daaf31e02e3″
//                                         redirectUri:@”http://www.sharesdk.cn“
//                                            authType:SSDKAuthTypeBoth];
//                 break;
//             case SSDKPlatformTypeWechat:
//                 [appInfo SSDKSetupWeChatByAppId:@""
//                                       appSecret:@""];
//                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"101484583"
                                      appKey:@"e198a13a18e3d18504bf0d04bd76eb48"
                                    authType:SSDKAuthTypeBoth];
                 break;
            

                 
             default:
                   break;
                   }
                   }];
    return YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *curLocation = [locations lastObject];
    // 通过location  或得到当前位置的经纬度
    CLLocationCoordinate2D curCoordinate2D = curLocation.coordinate;
    [CustomAccount sharedCustomAccount].curCoordinate2D =[KNLocationConverter transformFromWGSToGCJ:curCoordinate2D];
    [CustomAccount sharedCustomAccount].cityLocation =[KNLocationConverter transformFromWGSToGCJ:curCoordinate2D];

//     curCoordinate2D = CLLocationCoordinate2DMake(48.8600000000, 2.3411111000);

    CLGeocoder  *coder = [[CLGeocoder alloc]init];

    [coder reverseGeocodeLocation:curLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = [placemarks firstObject];
        DLog(@"%@",placemark.name);
        DLog(@"%@",placemark.locality);
        DLog(@"%@",placemark.country);
        DLog(@"%@",placemark.postalCode);
        DLog(@"%@",placemark.postalAddress);
        
        DLog(@"%@",placemark.addressDictionary);

        if (placemark!=nil) {
            [CustomAccount sharedCustomAccount].cityName = placemark.addressDictionary[@"City"];
            [CustomAccount sharedCustomAccount].currentCityName = placemark.addressDictionary[@"City"];

            [[NSNotificationCenter defaultCenter]postNotificationName:@"getCityName" object:nil];
        }
        
        
        
    }];
    
    
}

- (void)getNetState{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status ==AFNetworkReachabilityStatusNotReachable) {
            NSLog(@"网络不能连接");
            [self showAlertWithMessage:@"未连接网络\n请检查WIFI或数据是否开启" setButtonTitle:@"设置网络"];

        }
    }];
    
    
}

- (void)getLocationState{
    
    if ([CLLocationManager locationServicesEnabled]==NO) {
        NSLog(@"无法定位：locationServicesEnabled");
       
        [self showAlertWithMessage:@"定位信号较弱，\n点击开启GPS提高定位准确性" setButtonTitle:@"开启GPS"];
    }else{
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
            NSLog(@"无法定位：关闭了定位服务");
            [self showAlertWithMessage:@"定位信号较弱，\n点击开启GPS提高定位准确性" setButtonTitle:@"开启GPS"];
        };
    }
}

- (void)showAlertWithMessage:(NSString *)message setButtonTitle:(NSString *)title{
    CustomNetAlertView *alert =[[CustomNetAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    alert.messageLab.text = message;
    [alert.setBut setTitle:title forState:UIControlStateNormal];
    [self.window addSubview:alert];
}



- (void)showUpdata{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"get_app_version" forKey:@"app"];
    [param setObject:@"1" forKey:@"os"];
    
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
          NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            NSDictionary *dic =responseObject[@"data"][0];
            if (![app_Version isEqualToString:dic[@"versionCode"]]) {
                
                CustormAlertView *alert =[[CustormAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                alert.versionLab.text =dic[@"versionCode"];
                NSString *str = dic[@"content"];
                str =[str stringByReplacingOccurrencesOfString:instailString withString:@"\r"];
                alert.textV.text = str;
                [alert.upBut setTitle:[NSString stringWithFormat:@"更新到v%@",dic[@"versionName"]] forState:UIControlStateNormal];
                [blockSelf.window addSubview:alert];
            }
        }else{
        }
    } failure:^(NSError *error) {
        
    } isShowHUD:NO];
}
- (void)HUDDismiss{
    
    [SVProgressHUD popActivity];
    
}
- (void)keyBoardDidShow{
    DLog(@"键盘出现了");
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0,100)];

}
//- (void)keyBoardHiden{
//    
//    DLog(@"键盘消失了");
////    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 0)];
//
//}

- (void)keyBoardHiden{
    DLog(@"键盘消失了");

    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0,0)];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"GoogleMapProject"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

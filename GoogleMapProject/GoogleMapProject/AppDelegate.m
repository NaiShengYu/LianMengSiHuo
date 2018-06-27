//
//  AppDelegate.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "HomePageViewController.h"
#import "LeftViewController.h"
#import "ViewController.h"
@import GoogleMaps;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //
    [GMSServices provideAPIKey:@"AIzaSyBUuB_ESkwf_2qx5SpiE5IWuMbg1wpiMYM"];

    _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   
    [_window makeKeyAndVisible];
    
    
    LeftViewController *leftVC =[[LeftViewController alloc]init];
    
    HomePageViewController *homePageVC =[[HomePageViewController alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:homePageVC];

    self.drawerController =[[MMDrawerController alloc]initWithCenterViewController:nav leftDrawerViewController:leftVC];
    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask =MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    
    self.drawerController.maximumLeftDrawerWidth =200;
    homePageVC.drawerController =self.drawerController;
    leftVC.homePageVC =homePageVC;
    leftVC.drawerController =self.drawerController;
    _window.rootViewController =self.drawerController;
//    _window.rootViewController =[[ViewController alloc]init];
    
    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleCustom)];
    [SVProgressHUD setBackgroundColor:HEXCOLOR(0x303132)];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setFont:FontSize(19)];
    [SVProgressHUD setMinimumSize:CGSizeMake(260, 44)];
    [SVProgressHUD setCornerRadius:5];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeClear)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HUDDismiss) name:SVProgressHUDDidReceiveTouchEventNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDidShow) name:UIKeyboardDidShowNotification object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardHiden) name:UIKeyboardDidHideNotification object:nil];
    
    return YES;
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

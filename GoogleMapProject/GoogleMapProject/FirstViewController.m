//
//  FirstViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/28.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#import "HomePageViewController.h"
#import "LeftViewController.h"

#import "SearchResultViewController.h"
@interface FirstViewController ()
{
    UIScrollView *scr;
}
@property (strong, nonatomic) MMDrawerController *drawerController;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    NSUserDefaults *user =[NSUserDefaults standardUserDefaults];
    NSString *state =[user objectForKey:@"qiDongState"];
    
    //判断已经登陆了
    if ([user objectForKey:USERID]) {
        [CustomAccount sharedCustomAccount].loginType =1;
    }
    
    if ([state integerValue] ==1) {
        [self click];
    }else{
        scr =[[UIScrollView alloc]initWithFrame:self.view.bounds];
        scr.contentSize =CGSizeMake(screenWigth *3, screenHeight);
        scr.pagingEnabled =YES;
        scr.showsHorizontalScrollIndicator =NO;
        scr.showsVerticalScrollIndicator =NO;
        scr.bounces = NO;
        
        [self.view addSubview:scr];
        for (int i =0; i <3;  i ++) {
            UIImageView *imageV =[[UIImageView alloc]initWithFrame:CGRectMake(screenWigth *i, 0, screenWigth, screenHeight)];
            imageV.backgroundColor =[UIColor blackColor];
            imageV.image =[UIImage imageNamed:[NSString stringWithFormat:@"lead%d",i+1]];
            [scr addSubview:imageV];
            
            if (i ==2) {
                UIButton *but =[[UIButton alloc]init];
                but.center =CGPointMake(screenWigth/2+screenWigth*i, 800 *screenHeight/960);
                but.bounds =CGRectMake(0, 0, 210, 50);
                [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
                [scr addSubview:but];
            }
        }
     
    }
    
}


#pragma mark --创建工程
- (void)click{
    DLog(@"创建了工程");
    NSUserDefaults *user =[NSUserDefaults standardUserDefaults];
    [user setObject:@"1" forKey:@"qiDongState"];
    [user synchronize];
    LeftViewController *leftVC =[[LeftViewController alloc]init];
    HomePageViewController *homePageVC =[[HomePageViewController alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:homePageVC];
    
    self.drawerController =[[MMDrawerController alloc]initWithCenterViewController:nav leftDrawerViewController:leftVC];
    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask =MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    
    self.drawerController.maximumLeftDrawerWidth =screenWigth/4*3;
    homePageVC.drawerController =self.drawerController;
    leftVC.homePageVC =homePageVC;
    leftVC.drawerController =self.drawerController;
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    window.rootViewController =self.drawerController;
//    window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[SearchResultViewController new]];

}

@end

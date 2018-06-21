//
//  AppDelegate.h
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MMDrawerController *drawerController;


@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


//
//  TestViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/4.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "TestViewController.h"
#import <MWPhotoBrowser.h>
#import "CustomBrowser.h"
@interface TestViewController ()<MWPhotoBrowserDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)CustomBrowser *browser;
@end

@implementation TestViewController

- (CustomBrowser *)browser{
    if (!_browser) {
        _browser=[[CustomBrowser alloc]initWithDelegate:self];
        _browser.displayActionButton =NO;
        _browser.imgs = self.dataArray;
    }
    return _browser;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray =[[NSMutableArray alloc]init];
    
    [self.dataArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530697623164&di=1a7b2682266602bffd5116a3d1a92147&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fa50f4bfbfbedab64ab4731d9f436afc379311ef5.jpg"]]];
    [self.dataArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530697654623&di=528845b343ff26e0a4ca77c059a2d147&imgtype=0&src=http%3A%2F%2Fhiphotos.baidu.com%2Fimage%2F%2577%3D%2536%2534%2530%3B%2563%2572%256F%2570%3D%2530%2C%2530%2C%2536%2534%2530%2C%2533%2535%2535%2Fsign%3Dfd6a9b4d8bcb39dbc1c06452e02d6a56%2Fa50f4bfbfbedab6423e1b267fd36afc378311e81.jpg"]]];
    [self.dataArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530697654623&di=1347387a25000d08be543f59f5728c25&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Ffaedab64034f78f0b3361e9378310a55b3191c94.jpg"]]];
    [self.dataArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530697654623&di=fb0ba544d50b5449f47eca94ddd10eba&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2Fbbe0d3114f133356b8127b7b.jpg"]]];
    
   
    [self.navigationController pushViewController:self.browser animated:YES];
    
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    
    return self.dataArray.count;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return self.dataArray[index];
}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index{
    
    self.browser.index = index;
    
}
@end

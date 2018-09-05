//
//  ShopInfoFooter.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoFooter.h"

#import <MWPhotoBrowser.h>
@interface ShopInfoFooter()<MWPhotoBrowserDelegate>

@property (nonatomic,strong)NSMutableArray *butsArray;

@property (nonatomic,strong)NSMutableArray *photoArray;
@end
@implementation ShopInfoFooter

- (NSMutableArray *)butsArray{
    if (!_butsArray) {
        _butsArray =[[NSMutableArray alloc]init];
        CGFloat W = (screenWigth-65-30-20)/4;
        for (int i =0; i <9; i ++) {
            int a = i/4;
            int b = i%4;
            UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(65 +b*(10+W),  10 +a*(10+W/3*2), W, W/3*2)];
//            UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(65 +b*(10+W), 10 +a*(10+W/3*2), W, W/3*2)];
            [but setImage:[UIImage imageNamed:@"timg-2"] forState:UIControlStateNormal];
            but.tag =800+i;
            [_butsArray addObject:but];
            
        }
        
    }
    return _butsArray;
    
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor =[UIColor whiteColor];
        _photoArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)setImgsArray:(NSMutableArray *)imgsArray{
    _imgsArray =imgsArray;
    for (UIButton *but in self.butsArray) {
        [but removeFromSuperview];
    }
    [self.photoArray removeAllObjects];
    for (int i =0; i <imgsArray.count; i ++) {
        UIButton *but = self.butsArray[i];
        [but sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BaseURL,imgsArray[i]]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"timg-2"]];
        [but addTarget:self action:@selector(BrowsePicture) forControlEvents:UIControlEventTouchUpInside];
        
        MWPhoto *p = [[MWPhoto alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BaseURL,imgsArray[i]]]];
        [self.photoArray addObject:p];
        [self.contentView addSubview:but];
    }
 
}


- (void)BrowsePicture{
    
    MWPhotoBrowser *browser=[[MWPhotoBrowser alloc]initWithDelegate:self];
    browser.displayActionButton =NO;
    browser.alwaysShowControls = YES;
    [self.VC.navigationController pushViewController:browser animated:NO];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.photoArray.count;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return self.photoArray[index];
}

@end

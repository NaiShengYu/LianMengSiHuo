//
//  HomePageViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageNavView.h"
#import "HomePageSectionZeroCell.h"
#import "HomePageSectionOneCell.h"
#import "HomePageSecitonThreeCell.h"
#import "HomePageSectionOneheader.h"
#import "HomePageSectionTowheader.h"
@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionV;
@end

@implementation HomePageViewController
- (UICollectionView *)collectionV{
    if(!_collectionV){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionV =[[UICollectionView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY) collectionViewLayout:layout];
        _collectionV.backgroundColor =[UIColor groupTableViewBackgroundColor];
        _collectionV.delegate =self;
        _collectionV.dataSource =self;
        [_collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionV registerClass:[HomePageSectionOneheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageSectionOneheader"];
        [_collectionV registerClass:[HomePageSectionTowheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageSectionTowheader"];
        [_collectionV registerClass:[HomePageSectionZeroCell class] forCellWithReuseIdentifier:@"HomePageSectionZeroCell"];
        [_collectionV registerClass:[HomePageSectionOneCell class] forCellWithReuseIdentifier:@"HomePageSectionOneCell"];
        [_collectionV registerClass:[HomePageSecitonThreeCell class] forCellWithReuseIdentifier:@"HomePageSecitonThreeCell"];

        
    }
    return _collectionV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor =[UIColor whiteColor];
    [self creatNav];
    [self.view addSubview:self.collectionV];    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
    self.drawerController.openDrawerGestureModeMask =MMOpenDrawerGestureModeAll;

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
    self.drawerController.openDrawerGestureModeMask =MMOpenDrawerGestureModeNone;

}

- (void)creatNav{
    HomePageNavView *navView = [[HomePageNavView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    [navView.backBut addTarget:self action:@selector(showLeftVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navView];
}

#pragma mark --collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0)return 1;
    else if (section==1)return 2;
    else return 3;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==2) {
        HomePageSectionTowheader *header =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageSectionTowheader" forIndexPath:indexPath];
        return header;
    }else if (indexPath.section ==1){
        HomePageSectionOneheader *header =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageSectionOneheader" forIndexPath:indexPath];
        return header;
    }else{
        UICollectionReusableView *header =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header;
    }
 
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        HomePageSectionZeroCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSectionZeroCell" forIndexPath:indexPath];
        cell.VC =self;
        return cell;
    }else if (indexPath.section ==1){
        HomePageSectionOneCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSectionOneCell" forIndexPath:indexPath];
        cell.contentView.backgroundColor =[UIColor whiteColor];
        return cell;
        
    }
    
    HomePageSecitonThreeCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSecitonThreeCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor =[UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0)return CGSizeMake(screenWigth, 300);
    else if (indexPath.section ==1)return CGSizeMake(screenWigth-30, 190);
    else return CGSizeMake((screenWigth-40)/3, (screenWigth-40)/3/8*5+50);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section ==0)return CGSizeMake(0, 0);
    else if (section ==1)return CGSizeMake(screenWigth, 30);
    else return CGSizeMake(screenWigth, 30);

    
    
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section ==0) {
        
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 9;
}

#pragma mark --出现左菜单
- (void)showLeftVC{
    [self.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
    }];
 
    
}
@end

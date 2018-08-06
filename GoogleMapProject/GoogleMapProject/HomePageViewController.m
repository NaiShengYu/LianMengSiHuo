//
//  HomePageViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageViewController.h"
#import "ShopInfoViewController.h"

#import "HomePageNavView.h"
#import "HomePageSectionZeroCell.h"
#import "HomePageSectionZeroTypeTowCell.h"
#import "HomePageSectionOneCell.h"
#import "HomePageSecitonThreeCell.h"
#import "HomePageSectionOneheader.h"
#import "HomePageSectionTowheader.h"

#import "HomePageSectionOneModel.h"
#import "HomePageSectionTowModel.h"

#import "UIImage+GIFImage.h"
@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionV;

@property (nonatomic,strong)NSMutableArray * topArray;
@property (nonatomic,strong)NSMutableArray * aroundCityArray;

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
        [_collectionV registerClass:[HomePageSectionZeroTypeTowCell class] forCellWithReuseIdentifier:@"HomePageSectionZeroTypeTowCell"];
        [_collectionV registerClass:[HomePageSectionOneCell class] forCellWithReuseIdentifier:@"HomePageSectionOneCell"];
        [_collectionV registerClass:[HomePageSecitonThreeCell class] forCellWithReuseIdentifier:@"HomePageSecitonThreeCell"];
        WS(blockSelf);
        _collectionV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [blockSelf makeData];
        }];
    }
    return _collectionV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.view.backgroundColor =[UIColor whiteColor];
    self.topArray =[[NSMutableArray alloc]init];
    self.aroundCityArray =[[NSMutableArray alloc]init];
    [self creatNav];
    if ([CustomAccount sharedCustomAccount].cityName ==nil ||[CustomAccount sharedCustomAccount].cityName.length ==0) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCityName) name:@"getCityName" object:nil];
    }else{
        [self makeData];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makeData) name:@"selectCity" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATA" object:nil];
    
    //1.设置状态栏隐藏(YES)或显示(NO)
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    //2.设置状态栏字体颜色
    //UIStatusBarStyleDefault,黑色(默认)
    //UIStatusBarStyleLightContent,白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
//
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
    self.drawerController.openDrawerGestureModeMask =MMOpenDrawerGestureModeAll;
    
    HomePageNavView *navView = [self.view viewWithTag:10010];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *imgURL =[NSString stringWithFormat:@"%@",[user objectForKey:USERHEADPIC]];
    if([imgURL rangeOfString:@"http"].location == NSNotFound){
        [navView.backBut sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,imgURL]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"个人中心_07"]];
    }else{
        [navView.backBut sd_setImageWithURL:[NSURL URLWithString:imgURL] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"个人中心_07"]];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
    self.drawerController.openDrawerGestureModeMask =MMOpenDrawerGestureModeNone;

}

- (void)creatNav{
    HomePageNavView *navView = [[HomePageNavView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    navView.tag = 10010;
  
    navView.vc =self;
    navView.cancelBut.enabled =NO;
    [navView.rightBut addTarget:self action:@selector(changeLocation) forControlEvents:UIControlEventTouchUpInside];
    [navView.backBut addTarget:self action:@selector(showLeftVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navView];
}

#pragma mark --collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0)return 1;
    else if (section==1)return self.topArray.count;
    else return self.aroundCityArray.count;
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
        if ([[CustomAccount sharedCustomAccount].city_id isEqual:[NSNull null]] ||[CustomAccount sharedCustomAccount].city_id ==nil ||[CustomAccount sharedCustomAccount].city_id.length ==0) {
            HomePageSectionZeroTypeTowCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSectionZeroTypeTowCell" forIndexPath:indexPath];
            return cell;
        }
        
        HomePageSectionZeroCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSectionZeroCell" forIndexPath:indexPath];
        cell.VC =self;
        return cell;
    }else if (indexPath.section ==1){
        HomePageSectionOneCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSectionOneCell" forIndexPath:indexPath];
        cell.contentView.backgroundColor =[UIColor whiteColor];
        cell.model =self.topArray[indexPath.row];
        return cell;
        
    }
    
    HomePageSecitonThreeCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSecitonThreeCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor =[UIColor whiteColor];
    cell.model = self.aroundCityArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section >0) {
        ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
        if (indexPath.section==1) {
            HomePageSectionOneModel *model =self.topArray[indexPath.row];
            [CustomAccount sharedCustomAccount].classtype = model.type;
            vc.Id = model.Id;
            [self.navigationController pushViewController:vc animated:YES];

        }
        if (indexPath.section ==2) {
            HomePageSectionTowModel *model = self.aroundCityArray[indexPath.row];

            
            CustomAccount *acc = [CustomAccount sharedCustomAccount];
            acc.city_id = model.Id;
            @try {
                acc.cityName =model.name;
                acc.cityEnName =model.name_e;
            } @catch (NSException *exception) {
            } @finally {
            }
            [self makeData];
            
        }

    }
 
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0){
        if ([[CustomAccount sharedCustomAccount].city_id isEqual:[NSNull null]] ||[CustomAccount sharedCustomAccount].city_id ==nil ||[CustomAccount sharedCustomAccount].city_id.length ==0) {
            return CGSizeMake(screenWigth, screenWigth*480/1080);
        }
        return CGSizeMake(screenWigth, 300);
    }
        
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

- (void)makeData{
    WS(blockSelf);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getCityName" object:nil];
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_index" forKey:@"app"];
    @try {
        
        NSString *string =[CustomAccount sharedCustomAccount].cityName;
        NSString *CName =[CustomAccount sharedCustomAccount].cityName;
        
        NSString *shi =[string substringFromIndex:string.length-1];
        if ([shi isEqualToString:@"市"]) {
            string =[string substringToIndex:string.length-1];
            CName =string;
        }
        
        
        [param setObject:CName forKey:@"city_cn"];

    } @catch (NSException *exception) {
        [param setObject:@"" forKey:@"city_cn"];
    } @finally {
    }
    [param setObject:[NSString stringWithFormat:@"%f",acc.curCoordinate2D.longitude] forKey:@"lng"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.curCoordinate2D.latitude] forKey:@"lat"];
    if (acc.cityEnName ==nil) {
        acc.cityEnName =@"";
    }
    [param setObject:acc.cityEnName forKey:@"city_en"];

    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            [blockSelf.topArray removeAllObjects];
            [blockSelf.aroundCityArray removeAllObjects];
            NSDictionary *dataDic =responseObject[@"data"][0];
            acc.city_id = dataDic[@"city_id"];
            @try {
                if ([acc.city_id isEqual:[NSNull null]] ||acc.city_id ==nil ||acc.city_id.length ==0) {
                }else{
                    acc.cityLocation = CLLocationCoordinate2DMake([dataDic[@"city_lat"] doubleValue], [dataDic[@"city_lng"] doubleValue]);
                }
            } @catch (NSException *exception) {
            } @finally {
            }
            @try {
                for (NSDictionary *topDic in dataDic[@"top"]) {
                    HomePageSectionOneModel *model = [[HomePageSectionOneModel alloc]initWithDic:topDic];
                    [blockSelf.topArray addObject:model];
                }
              } @catch (NSException *exception) {
            } @finally {
            }
            
            @try {
                for (NSDictionary *cityDic in dataDic[@"around_city"]) {
                    HomePageSectionTowModel *model = [[HomePageSectionTowModel alloc]initWithDic:cityDic];
                    [blockSelf.aroundCityArray addObject:model];
                }
            } @catch (NSException *exception) {
            } @finally {
            }
           
            [blockSelf.collectionV removeFromSuperview];
            blockSelf.collectionV =nil;
            [blockSelf.view addSubview:blockSelf.collectionV];
          
        }else{
            [blockSelf.collectionV.mj_header endRefreshing];
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [blockSelf.collectionV.mj_header endRefreshing];
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];

    } isShowHUD:YES];
    
}



//通知获取当前位置
- (void)getCityName{
    [self makeData];
    
}

- (void)changeLocation{
    [CustomAccount sharedCustomAccount].cityName = [CustomAccount sharedCustomAccount].currentCityName;
    [CustomAccount sharedCustomAccount].cityEnName = @"";
    [CustomAccount sharedCustomAccount].cityLocation = [CustomAccount sharedCustomAccount].curCoordinate2D;

    [self makeData];
}
@end

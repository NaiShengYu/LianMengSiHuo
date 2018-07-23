//
//  SearchNoResultViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/23.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchNoResultViewController.h"
#import "HomePageSectionOneheader.h"
#import "SearchNoResultHeader.h"
#import "HomePageSectionOneCell.h"
#import "ShopInfoViewController.h"
@interface SearchNoResultViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionV;

@property (nonatomic,strong)NSMutableArray * topArray;


@end

@implementation SearchNoResultViewController

- (UICollectionView *)collectionV{
    if(!_collectionV){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionV =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, screenHeight-MaxY) collectionViewLayout:layout];
        _collectionV.backgroundColor =[UIColor groupTableViewBackgroundColor];
        _collectionV.delegate =self;
        _collectionV.dataSource =self;
        [_collectionV registerClass:[SearchNoResultHeader class] forCellWithReuseIdentifier:@"SearchNoResultHeader"];
        [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionV registerClass:[HomePageSectionOneheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageSectionOneheader"];
        [_collectionV registerClass:[HomePageSectionOneCell class] forCellWithReuseIdentifier:@"HomePageSectionOneCell"];
     
    }
    return _collectionV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.topArray = [[NSMutableArray alloc]init];
    [self ziDingYiDaoHangLan];
    [self makeData];

}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =NO;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =YES;
}


#pragma mark --collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0)return 1;
    return self.topArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
   if (indexPath.section ==1){
        HomePageSectionOneheader *header =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageSectionOneheader" forIndexPath:indexPath];
        return header;
    }else{
        UICollectionReusableView *header =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header;
    }
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section ==1){
        HomePageSectionOneCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageSectionOneCell" forIndexPath:indexPath];
        cell.contentView.backgroundColor =[UIColor whiteColor];
        cell.model =self.topArray[indexPath.row];
        return cell;
        
    }
    SearchNoResultHeader *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchNoResultHeader" forIndexPath:indexPath];
    NSString *titleStr = [NSString stringWithFormat:@"未搜索到与 %@ 相关的内容",_searchKey];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc]initWithString:titleStr];
    [mut addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6, _searchKey.length)];
    cell.titleLab.attributedText = mut;
    return cell;
    
 
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section >0) {
        ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
            HomePageSectionOneModel *model =self.topArray[indexPath.row];
            [CustomAccount sharedCustomAccount].classtype = model.type;
            vc.Id = model.Id;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0){
          return CGSizeMake(screenWigth, 200);
    }
    
    return CGSizeMake(screenWigth-30, 190);
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


- (void)makeData{
    WS(blockSelf);
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_index" forKey:@"app"];
    @try {
        [param setObject:acc.cityName forKey:@"city_cn"];
        
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
            NSDictionary *dataDic =responseObject[@"data"][0];
            @try {
                for (NSDictionary *topDic in dataDic[@"top"]) {
                    HomePageSectionOneModel *model = [[HomePageSectionOneModel alloc]initWithDic:topDic];
                    [blockSelf.topArray addObject:model];
                }
            } @catch (NSException *exception) {
            } @finally {
            }
            
            [blockSelf.collectionV removeFromSuperview];
            blockSelf.collectionV =nil;
            [blockSelf.view addSubview:blockSelf.collectionV];
            
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
        
    } isShowHUD:YES];
    
}



#pragma mark --自定义导航栏
- (void)ziDingYiDaoHangLan{
    
    self.navigationController.navigationBar.translucent =NO;
    self.navigationController.navigationBar.barTintColor =zhuse;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                      NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    UIButton *img =[[UIButton alloc]init];
    [img sizeToFit];
    [img addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [img setImage:[UIImage imageNamed:@"turn_back"]
         forState:UIControlStateNormal];
    [img setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    [img setTitle:@"搜索" forState:UIControlStateNormal];
    UIBarButtonItem *left =[[UIBarButtonItem alloc]initWithCustomView:img];
    left.tintColor =[UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem =left;
}
- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

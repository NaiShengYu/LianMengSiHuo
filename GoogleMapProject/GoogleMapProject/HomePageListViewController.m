//
//  CollectionShopViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageListViewController.h"
#import "ShopInfoViewController.h"
#import "TopView.h"
#import "CollectionShopUneditCell.h"
#import "ViewController.h"

#import "FilterView.h"

#import "FilterItem.h"
#import "FilterHeaderModel.h"
@interface HomePageListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIButton *deleteBut;

@property (nonatomic,strong)NSMutableArray *filterArray;

@property (nonatomic,strong)FilterView *filterV;


@end

@implementation HomePageListViewController

- (FilterView *)filterV{
    if (!_filterV) {
        _filterV =[[FilterView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 0)];
        FilterHeaderModel *headerModel = [[FilterHeaderModel alloc]init];
        headerModel.isSelect = YES;
        headerModel.title =@"类别";
        FilterItem *item1 =[[FilterItem alloc]init];
        item1.title = @"全部";
        item1.isSelect =YES;
        [headerModel.itemsArray addObject:item1];
        
        FilterItem *item2 =[[FilterItem alloc]init];
        item2.title = @"餐厅";
        item2.isSelect =NO;
        [headerModel.itemsArray addObject:item2];
        
        FilterItem *item3 =[[FilterItem alloc]init];
        item3.title = @"景点";
        item3.isSelect =NO;
        [headerModel.itemsArray addObject:item3];
        
        FilterItem *item4 =[[FilterItem alloc]init];
        item4.title = @"购物";
        item4.isSelect =NO;
        [headerModel.itemsArray addObject:item4];
        
        FilterItem *item5 =[[FilterItem alloc]init];
        item5.title = @"酒店";
        item5.isSelect =NO;
        [headerModel.itemsArray addObject:item5];
        
        
        FilterHeaderModel *headerModel1 = [[FilterHeaderModel alloc]init];
        headerModel1.isSelect = NO;
        headerModel1.title =@"距离";
        FilterItem *item11 =[[FilterItem alloc]init];
        item11.title = @"500M";
        item11.isSelect =YES;
        [headerModel1.itemsArray addObject:item11];
        
        FilterItem *item22 =[[FilterItem alloc]init];
        item22.title = @"1km";
        item22.isSelect =NO;
        [headerModel1.itemsArray addObject:item22];
        
        FilterItem *item33 =[[FilterItem alloc]init];
        item33.title = @"2km";
        item33.isSelect =NO;
        [headerModel1.itemsArray addObject:item33];
        
        FilterItem *item44 =[[FilterItem alloc]init];
        item44.title = @"5km";
        item44.isSelect =NO;
        [headerModel1.itemsArray addObject:item44];
        
        FilterItem *item55 =[[FilterItem alloc]init];
        item55.title = @"8km";
        item55.isSelect =NO;
        [headerModel1.itemsArray addObject:item55];
        
        FilterItem *item66 =[[FilterItem alloc]init];
        item66.title = @"10km";
        item66.isSelect =NO;
        [headerModel1.itemsArray addObject:item66];
        
        FilterItem *item77 =[[FilterItem alloc]init];
        item77.title = @"20km";
        item77.isSelect =NO;
        [headerModel1.itemsArray addObject:item77];
        
        FilterHeaderModel *headerModel2 = [[FilterHeaderModel alloc]init];
        headerModel2.isSelect = NO;
        headerModel2.title =@"菜系";
        FilterItem *item111 =[[FilterItem alloc]init];
        item111.title = @"当地热门 1120";
        item111.isSelect =YES;
        [headerModel2.itemsArray addObject:item111];
        
        FilterItem *item222 =[[FilterItem alloc]init];
        item222.title = @"米其林 9";
        item222.isSelect =NO;
        [headerModel2.itemsArray addObject:item222];
        
        FilterItem *item333 =[[FilterItem alloc]init];
        item333.title = @"法餐 134";
        item333.isSelect =NO;
        [headerModel2.itemsArray addObject:item333];
        
        FilterItem *item444 =[[FilterItem alloc]init];
        item444.title = @"意大利菜 32";
        item444.isSelect =NO;
        [headerModel2.itemsArray addObject:item444];
        
        FilterItem *item555 =[[FilterItem alloc]init];
        item555.title = @"中餐 22";
        item555.isSelect =NO;
        [headerModel2.itemsArray addObject:item555];
        
        FilterItem *item666 =[[FilterItem alloc]init];
        item666.title = @"亚洲餐厅 999";
        item666.isSelect =NO;
        [headerModel2.itemsArray addObject:item666];
        
        FilterItem *item888 =[[FilterItem alloc]init];
        item888.title = @"日餐 10";
        item888.isSelect =NO;
        [headerModel2.itemsArray addObject:item888];
        
        FilterItem *item999 =[[FilterItem alloc]init];
        item999.title = @"印度菜 87";
        item999.isSelect =NO;
        [headerModel2.itemsArray addObject:item999];
        
        FilterItem *item1000 =[[FilterItem alloc]init];
        item1000.title = @"酒吧 79";
        item1000.isSelect =NO;
        [headerModel2.itemsArray addObject:item1000];
        
        FilterItem *item1001 =[[FilterItem alloc]init];
        item1001.title = @"墨西哥 1232";
        item1001.isSelect =NO;
        [headerModel2.itemsArray addObject:item1001];
        
        FilterItem *item1002 =[[FilterItem alloc]init];
        item1002.title = @"西班牙菜 879";
        item1002.isSelect =NO;
        [headerModel2.itemsArray addObject:item1002];
        
        FilterItem *item1003 =[[FilterItem alloc]init];
        item1003.title = @"甜点 89";
        item1003.isSelect =NO;
        [headerModel2.itemsArray addObject:item1003];
        
        FilterItem *item1004 =[[FilterItem alloc]init];
        item1004.title = @"韩餐 56";
        item1004.isSelect =NO;
        [headerModel2.itemsArray addObject:item1004];
        
        FilterItem *item1005 =[[FilterItem alloc]init];
        item1005.title = @"咖啡厅 90";
        item1005.isSelect =NO;
        [headerModel2.itemsArray addObject:item1005];
        
        FilterItem *item1006 =[[FilterItem alloc]init];
        item1006.title = @"西餐 999";
        item1006.isSelect =NO;
        [headerModel2.itemsArray addObject:item1006];
        
        _filterArray =[[NSMutableArray alloc]initWithObjects:headerModel, headerModel1,headerModel2,nil];
        _filterV.dataArray =_filterArray;
        
        
    }
    return _filterV;
    
}

- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[CollectionShopUneditCell class] forCellReuseIdentifier:@"CollectionShopUneditCell"];
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1", nil];
 
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.myTable];
    [self.view addSubview:self.filterV];
    
   TopView *topV=[[TopView alloc]initWithFrame:CGRectMake(0, 0,screenWigth , MaxY)];
    [topV.rightBut setImage:[UIImage imageNamed:@"列表_03"] forState:UIControlStateNormal];
    [topV.rightBut addTarget:self action:@selector(goMap) forControlEvents:UIControlEventTouchUpInside];
    [topV.backBut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topV.chooseBut addTarget:self action:@selector(chooseBut:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:topV];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        CollectionShopUneditCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CollectionShopUneditCell" forIndexPath:indexPath];
    cell.topickNumLab.text = @"200 ￥ 12432条评论";
        return cell;
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --让cell的横线到最左边
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)goMap{
    
    ViewController *VC =[[ViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}
- (void)chooseBut:(UIButton *)but{
    
    but.selected = !but.selected;
    if (but.selected ==YES) {
        [UIView animateWithDuration:0.4 animations:^{
            self.filterV.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY);
        }];
    }else{
        [UIView animateWithDuration:0.4 animations:^{
            self.filterV.frame =CGRectMake(0, 0, screenWigth, 0);
        }];
    }
 
}



- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

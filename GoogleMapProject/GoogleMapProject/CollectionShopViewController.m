//
//  CollectionShopViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CollectionShopViewController.h"
#import "ShopInfoViewController.h"
#import "NavHeader.h"
#import "CollectionShopUneditCell.h"
#import "CollectionShopEditCell.h"
#import "FilterView.h"

#import "FilterItem.h"
#import "FilterHeaderModel.h"
@interface CollectionShopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIButton *deleteBut;

@property (nonatomic,strong)NSMutableArray *filterArray;

@property (nonatomic,strong)FilterView *filterV;


@property (nonatomic,assign)BOOL isEdit;
@end

@implementation CollectionShopViewController

- (FilterView *)filterV{
    if (!_filterV) {
        _filterV =[[FilterView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 0)];
    }
    return _filterV;
    
}

- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[CollectionShopUneditCell class] forCellReuseIdentifier:@"CollectionShopUneditCell"];
        [_myTable registerClass:[CollectionShopEditCell class] forCellReuseIdentifier:@"CollectionShopEditCell"];
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isEdit =NO;
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1", nil];
    
    
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
    self.filterArray =[[NSMutableArray alloc]initWithObjects:headerModel, nil];

    
    self.view.backgroundColor =[UIColor whiteColor];
  

    [self.view addSubview:self.myTable];
    
    _deleteBut =[[UIButton alloc]initWithFrame:CGRectMake(0, screenHeight-TabbarHeight, screenWigth, TabbarHeight)];
    [_deleteBut setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _deleteBut.backgroundColor =[UIColor whiteColor];
    _deleteBut.hidden =YES;
    [self.view addSubview:_deleteBut];
    UIView *lineV =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 1)];
    lineV.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [_deleteBut addSubview:lineV];
    
    self.filterV.dataArray =self.filterArray;
    [self.view addSubview:self.filterV];
    
    
    NavHeader *header =[[NavHeader alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    header.centerLab.text = @"我的收藏";
    [self.view addSubview:header];
    [header.backBaut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [header.rightBut addTarget:self action:@selector(changeEdit:) forControlEvents:UIControlEventTouchUpInside];
    [header.chooseBut addTarget:self action:@selector(chooseBut:) forControlEvents:UIControlEventTouchUpInside];
    
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
    if (self.isEdit ==NO) {
        CollectionShopUneditCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CollectionShopUneditCell" forIndexPath:indexPath];
        return cell;
    }else{
        CollectionShopEditCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CollectionShopEditCell" forIndexPath:indexPath];
        return cell;
    }
  
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

- (void)changeEdit:(UIButton *)but{
    _isEdit =!_isEdit;
    but.selected =!but.selected;
    WS(blockSelf);
    if (_isEdit==YES) {
        self.deleteBut.hidden =NO;
        [UIView animateWithDuration:0.4 animations:^{
            blockSelf.myTable.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-TabbarHeight-MaxY);
        }];
    }else{
        self.deleteBut.hidden =YES;
        [UIView animateWithDuration:0.4 animations:^{
            blockSelf.myTable.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY);
        }];
        
    }
    [self.myTable reloadData];
}
- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

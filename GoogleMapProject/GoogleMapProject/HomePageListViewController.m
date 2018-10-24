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
#import "FilterView.h"

#import "FilterItem.h"
#import "FilterHeaderModel.h"
#import "MapBottomModel.h"
@interface HomePageListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)UIButton *deleteBut;

@property (nonatomic,strong)NSMutableArray *filterArray;

@property (nonatomic,strong)FilterView *filterV;

//距离
@property (nonatomic,copy)NSString *raidus;
//分类
@property (nonatomic,copy)NSString *list_condition;
//评分
@property (nonatomic,copy)NSString *star;

@property (nonatomic,strong)TopView *navBarView;


@end

@implementation HomePageListViewController

- (FilterView *)filterV{
    if (!_filterV) {
        _filterV =[[FilterView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 0)];
        FilterHeaderModel *headerModel = [[FilterHeaderModel alloc]init];
        headerModel.isSelect = YES;
        headerModel.title =@"评分";
        FilterItem *item1 =[[FilterItem alloc]init];
        item1.title = @"全部";
        item1.Id = @"";
        item1.isSelect =YES;
        [headerModel.itemsArray addObject:item1];
        
        FilterItem *item2 =[[FilterItem alloc]init];
        item2.title = @"五星";
        item2.isSelect =NO;
        item2.Id = @"5";
        [headerModel.itemsArray addObject:item2];
        
        FilterItem *item3 =[[FilterItem alloc]init];
        item3.title = @"四星";
        item3.isSelect =NO;
        item3.Id = @"4";
        [headerModel.itemsArray addObject:item3];
        
        FilterItem *item4 =[[FilterItem alloc]init];
        item4.title = @"三星";
        item4.isSelect =NO;
        item4.Id = @"3";

        [headerModel.itemsArray addObject:item4];
        
        FilterItem *item5 =[[FilterItem alloc]init];
        item5.title = @"二星";
        item5.isSelect =NO;
        item5.Id = @"2";

        [headerModel.itemsArray addObject:item5];
        
        FilterItem *item6 =[[FilterItem alloc]init];
        item6.title = @"一星";
        item6.isSelect =NO;
        item6.Id = @"1";

        [headerModel.itemsArray addObject:item6];
        
        
        FilterHeaderModel *headerModel1 = [[FilterHeaderModel alloc]init];
        headerModel1.isSelect = NO;
        headerModel1.title =@"距离";
        FilterItem *item11 =[[FilterItem alloc]init];
        item11.title = @"500M";
        item11.isSelect =NO;
        item11.Id = @"0.5";
        [headerModel1.itemsArray addObject:item11];
        
        FilterItem *item22 =[[FilterItem alloc]init];
        item22.title = @"1km";
        item22.isSelect =NO;
        item22.Id = @"1";

        [headerModel1.itemsArray addObject:item22];
        
        FilterItem *item33 =[[FilterItem alloc]init];
        item33.title = @"2km";
        item33.isSelect =YES;
        item33.Id = @"2";

        [headerModel1.itemsArray addObject:item33];
        
        FilterItem *item44 =[[FilterItem alloc]init];
        item44.title = @"5km";
        item44.isSelect =NO;
        item44.Id = @"5";

        [headerModel1.itemsArray addObject:item44];
        
        FilterItem *item55 =[[FilterItem alloc]init];
        item55.title = @"8km";
        item55.isSelect =NO;
        item55.Id = @"8";

        [headerModel1.itemsArray addObject:item55];
        
        FilterItem *item66 =[[FilterItem alloc]init];
        item66.title = @"10km";
        item66.isSelect =NO;
        item66.Id = @"10";

        [headerModel1.itemsArray addObject:item66];
        
        FilterItem *item77 =[[FilterItem alloc]init];
        item77.title = @"20km";
        item77.isSelect =NO;
        item77.Id = @"20";

        [headerModel1.itemsArray addObject:item77];
        
        _filterArray =[[NSMutableArray alloc]initWithObjects:headerModel, headerModel1,nil];
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
        WS(blockSelf);
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [blockSelf makeDataIsRefresh:NO];
        }];
        _myTable.mj_footer = footer;
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.star =@"";
    self.raidus = @"";
    self.list_condition = @"";
 
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.myTable];
    [self.view addSubview:self.filterV];
    WS(blockSelf);
    self.filterV.selectChangeBLock = ^(FilterItem *selectItem) {
        [blockSelf makeDataIsRefresh:YES];
    };
   TopView *topV=[[TopView alloc]initWithFrame:CGRectMake(0, 0,screenWigth , MaxY)];
    [topV.rightBut setImage:[UIImage imageNamed:@"列表_03"] forState:UIControlStateNormal];
    [topV.backBut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topV.chooseBut addTarget:self action:@selector(chooseBut:) forControlEvents:UIControlEventTouchUpInside];
    topV.vc =self;
    _navBarView = topV;
    _navBarView.dataArray = self.dataArray;
    [self.view addSubview:topV];

    [self getCollection];
    if (self.dataArray ==nil) {
        self.dataArray =[[NSMutableArray alloc]init];
        [self makeDataIsRefresh:YES];
    }

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
    cell.homePageModel = self.dataArray[indexPath.row];
        return cell;
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MapBottomModel *model = self.dataArray[indexPath.row];
    ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
    vc.Id = model.Id;
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
        but.backgroundColor = zhuse;
        but.layer.borderColor = [UIColor whiteColor].CGColor;
        but.layer.borderWidth =1;
        
        
    }else{
        but.layer.borderWidth =0;
        but.backgroundColor =RGBA(133, 31, 24, 1);
        [self makeDataIsRefresh:YES];
        [UIView animateWithDuration:0.4 animations:^{
            self.filterV.frame =CGRectMake(0, 0, screenWigth, 0);
        }];
    }
 
}


- (void)makeDataIsRefresh:(BOOL) isRefresh{
    WS(blockSelf);
    blockSelf.list_condition = @"";
    [self.filterArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        FilterHeaderModel *headerModel =obj;
            [headerModel.itemsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                FilterItem *item = obj;
                if (item.isSelect ==YES) {
                    if ([headerModel.title isEqualToString:@"评分"]) {
                        blockSelf.star =item.Id;
                    }
                    if ([headerModel.title isEqualToString:@"距离"]) {
                        blockSelf.raidus =item.Id;
                    }
                    if ([headerModel.title isEqualToString:@"菜系"]||
                        [headerModel.title isEqualToString:@"购物"]||
                        [headerModel.title isEqualToString:@"酒店"]) {
                        if (blockSelf.list_condition.length ==0) {
                            blockSelf.list_condition = [NSString stringWithFormat:@"%@",item.Id];
                        }else{
                            blockSelf.list_condition = [NSString stringWithFormat:@"%@,%@",blockSelf.list_condition,item.Id];
                        }
                    }
                    
                }
            }];
    }];
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_show" forKey:@"app"];
    [param setObject:acc.classtype forKey:@"type"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.cityLocation.longitude] forKey:@"lng"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.cityLocation.latitude] forKey:@"lat"];
    
//    [param setObject:@"2.3411111" forKey:@"lng"];
//    [param setObject:@"48.8600" forKey:@"lat"];
    
    //距离
    [param setObject:self.raidus forKey:@"raidus"];
    //分类
    [param setObject:self.list_condition forKey:@"list_condition"];
    //评分
    [param setObject:self.star forKey:@"star"];
    
    //请求起始个数
    
    [param setObject:[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count] forKey:@"pageno"];
    if (isRefresh==YES) {
        [param setObject:@"0" forKey:@"pageno"];
    }
    
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            @try {
                if (isRefresh==YES) {
                    [blockSelf.dataArray removeAllObjects];
                }
                NSDictionary *dataDic = responseObject[@"data"][0];
                NSArray *arr = dataDic[@"list_show"];
                [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    MapBottomModel *model = [[MapBottomModel alloc]initWithDic:obj];
                    [blockSelf.dataArray addObject:model];
                }];
                if (blockSelf.dataArray.count >=[dataDic[@"list_num"] integerValue]) {
                    [blockSelf.myTable.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [blockSelf.myTable.mj_footer endRefreshing];
                }
                [blockSelf.myTable.mj_header endRefreshing];
                [blockSelf.myTable reloadData];
                blockSelf.navBarView.dataArray = blockSelf.dataArray;

            } @catch (NSException *exception) {
                
            } @finally {
                
            }
          
            }else{
                [PubulicObj ShowSVWhitMessage];
                [blockSelf.myTable.mj_header endRefreshing];
                [blockSelf.myTable.mj_footer endRefreshing];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
            }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:isRefresh];
    
}

- (void)getCollection{
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_condition" forKey:@"app"];
    [param setObject:acc.city_id forKey:@"city_id"];
    [param setObject:acc.classtype forKey:@"type"];

    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            @try {
                
                FilterHeaderModel *headerModel2 = [[FilterHeaderModel alloc]init];
                headerModel2.isSelect = NO;
                NSArray *arr =responseObject[@"data"];
                [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    FilterItem *item =[[FilterItem alloc]initWithDic:obj];
                    if (idx ==0) {
                        if ([item.type integerValue] ==1) {
                            headerModel2.title =@"菜系";
                        }
                        if ([item.type integerValue] ==3) {
                            headerModel2.title =@"购物";
                        }
                        if ([item.type integerValue] ==4) {
                            headerModel2.title =@"酒店";
                        }
                    }
                    [headerModel2.itemsArray addObject:item];
                }];
                [blockSelf.filterArray addObject:headerModel2];
                blockSelf.filterV.dataArray = blockSelf.filterArray;
            } @catch (NSException *exception) {
            } @finally {
            }
        }else{
            [PubulicObj ShowSVWhitMessage];

            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];

        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:NO];
 
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

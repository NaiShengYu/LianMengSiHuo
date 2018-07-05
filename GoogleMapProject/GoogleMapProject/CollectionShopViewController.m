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

#import "CollectionShopModel.h"
@interface CollectionShopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIButton *deleteBut;

@property (nonatomic,strong)NSMutableArray *filterArray;

@property (nonatomic,strong)FilterView *filterV;

@property (nonatomic,strong)FilterItem *LastItem;

@property (nonatomic,assign)BOOL isEdit;
@end

@implementation CollectionShopViewController

- (FilterView *)filterV{
    if (!_filterV) {
        _filterV =[[FilterView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 0)];
        _filterV.dataArray =self.filterArray;

    }
    return _filterV;
    
}

- (UITableView *)myTable{
    if(!_myTable){
        WS(blockSelf);
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[CollectionShopUneditCell class] forCellReuseIdentifier:@"CollectionShopUneditCell"];
        [_myTable registerClass:[CollectionShopEditCell class] forCellReuseIdentifier:@"CollectionShopEditCell"];
    
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [blockSelf makeDataIsRefresh:NO];
        }];
        _myTable.mj_footer = footer;
        
        MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [blockSelf makeDataIsRefresh:YES];
        }];
        header.lastUpdatedTimeLabel.hidden =YES;
        header.stateLabel.textColor =[UIColor blackColor];
        _myTable.mj_header =header;
        
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isEdit =NO;
    self.dataArray = [[NSMutableArray alloc]init];
    
    FilterHeaderModel *headerModel = [[FilterHeaderModel alloc]init];
    headerModel.isSelect = YES;
    headerModel.title =@"类别";
    FilterItem *item1 =[[FilterItem alloc]init];
    item1.title = @"全部";
    item1.type = @"0";
    item1.isSelect =YES;
    [headerModel.itemsArray addObject:item1];
    self.LastItem = item1;
    
    FilterItem *item2 =[[FilterItem alloc]init];
    item2.title = @"餐厅";
    item2.isSelect =NO;
    item2.type = @"1";
    [headerModel.itemsArray addObject:item2];
    
    FilterItem *item3 =[[FilterItem alloc]init];
    item3.title = @"景点";
    item3.isSelect =NO;
    item3.type = @"2";
    [headerModel.itemsArray addObject:item3];
    
    FilterItem *item4 =[[FilterItem alloc]init];
    item4.title = @"购物";
    item4.isSelect =NO;
    item4.type = @"3";
    [headerModel.itemsArray addObject:item4];
    
    FilterItem *item5 =[[FilterItem alloc]init];
    item5.title = @"酒店";
    item5.type = @"4";
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
    [_deleteBut addTarget:self action:@selector(deleteCollection) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteBut];
    UIView *lineV =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 1)];
    lineV.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [_deleteBut addSubview:lineV];
    
    [self.view addSubview:self.filterV];
    WS(blockSelf);
    self.filterV.selectChangeBLock = ^(FilterItem *selectItem) {
        blockSelf.LastItem = selectItem;
        [blockSelf makeDataIsRefresh:YES];

    };
    
    NavHeader *header =[[NavHeader alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    header.centerLab.text = @"我的收藏";
    [self.view addSubview:header];
    [header.backBaut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [header.rightBut addTarget:self action:@selector(changeEdit:) forControlEvents:UIControlEventTouchUpInside];
    [header.chooseBut addTarget:self action:@selector(chooseBut:) forControlEvents:UIControlEventTouchUpInside];
    
    [self makeDataIsRefresh:YES];
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
        cell.imgV.hidden =YES;
        cell.collecitonModel = self.dataArray[indexPath.row];
        return cell;
    }else{
        CollectionShopEditCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CollectionShopEditCell" forIndexPath:indexPath];
        cell.collecitonModel = self.dataArray[indexPath.row];

        return cell;
    }
  
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.isEdit ==YES){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }
    ShopInfoViewController *vc = [[ShopInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

 
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
        self.myTable.mj_footer = nil;
        self.myTable.mj_header =nil;

        self.deleteBut.hidden =NO;
        [UIView animateWithDuration:0.4 animations:^{
            blockSelf.myTable.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-TabbarHeight-MaxY);
        }];
    }else{
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [blockSelf makeDataIsRefresh:NO];
        }];
        self.myTable.mj_footer = footer;
        
        MJRefreshNormalHeader *header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [blockSelf makeDataIsRefresh:YES];
        }];
        header.lastUpdatedTimeLabel.hidden =YES;
        header.stateLabel.textColor =[UIColor blackColor];
        self.myTable.mj_header =header;
        self.deleteBut.hidden =YES;
        
        [UIView animateWithDuration:0.4 animations:^{
            blockSelf.myTable.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY);
        }];
        
    }
    [self.myTable reloadData];
}

- (void)makeDataIsRefresh:(BOOL) isRefresh{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_collection" forKey:@"app"];
    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
    [param setObject:[NSString stringWithFormat:@"%f",[CustomAccount sharedCustomAccount].curCoordinate2D.longitude] forKey:@"lng"];
    [param setObject:[NSString stringWithFormat:@"%f",[CustomAccount sharedCustomAccount].curCoordinate2D.latitude] forKey:@"lat"];
    [param setObject:self.LastItem.type forKey:@"type"];
    
    if (isRefresh==YES) {
        [param setObject:@"0" forKey:@"pageno"];
    }else{
        [param setObject:[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count] forKey:@"pageno"];
    }
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            if (isRefresh==YES) {
                [self.dataArray removeAllObjects];
            }
            NSDictionary *dataDic = responseObject[@"data"][0];
            for (NSDictionary *dic in dataDic[@"collection_info"]) {
                CollectionShopModel *model = [[CollectionShopModel alloc]initWithDic:dic];
                [blockSelf.dataArray addObject:model];
            }
            
            if (blockSelf.dataArray.count >=[dataDic[@"collection_num"] integerValue]) {
                [blockSelf.myTable.mj_footer endRefreshingWithNoMoreData];
            }else{
                [blockSelf.myTable.mj_footer endRefreshing];
            }
            [blockSelf.myTable.mj_header endRefreshing];
            [blockSelf.myTable reloadData];
            
        }else{
            [blockSelf.myTable.mj_header endRefreshing];
            [blockSelf.myTable.mj_footer endRefreshing];

            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
        
        
    } failure:^(NSError *error) {
        [blockSelf.myTable.mj_header endRefreshing];
        [blockSelf.myTable.mj_footer endRefreshing];
    } isShowHUD:NO];

    
}

- (void)deleteCollection{
    NSString *deleteId =@"";
    for ( CollectionShopModel *model in self.dataArray) {
        if (model.isSelect ==YES) {
            if (deleteId.length ==0) {
                deleteId = [NSString stringWithFormat:@"%@",model.Id];
            }else {
                deleteId = [NSString stringWithFormat:@"%@,%@",deleteId,model.Id];
            }
        }
    }
    if (deleteId.length ==0) {
        return;
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_collection_delete" forKey:@"app"];
    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
    [param setObject:deleteId forKey:@"delete_id"];
  
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            for (NSInteger i =blockSelf.dataArray.count-1 ;i >=0 ;i --) {
                CollectionShopModel *model = self.dataArray[i];
                if (model.isSelect ==YES) {
                    [blockSelf.dataArray removeObject:model];
                }
            }
            [blockSelf.myTable reloadData];
        }else{
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
  
    } isShowHUD:YES];
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

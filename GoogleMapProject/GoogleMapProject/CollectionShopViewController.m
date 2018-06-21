//
//  CollectionShopViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CollectionShopViewController.h"
#import "NavHeader.h"
#import "CollectionShopUneditCell.h"
#import "CollectionShopEditCell.h"
@interface CollectionShopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIButton *deleteBut;


@property (nonatomic,assign)BOOL isEdit;
@end

@implementation CollectionShopViewController
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
    self.view.backgroundColor =[UIColor whiteColor];
    NavHeader *header =[[NavHeader alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    header.centerLab.text = @"我的收藏";
    [self.view addSubview:header];
    [header.backBaut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [header.rightBut addTarget:self action:@selector(changeEdit:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.myTable];
    
    _deleteBut =[[UIButton alloc]initWithFrame:CGRectMake(0, screenHeight-45, screenWigth, 45)];
    [_deleteBut setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _deleteBut.backgroundColor =[UIColor whiteColor];
    _deleteBut.hidden =YES;
    [self.view addSubview:_deleteBut];
    UIView *lineV =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 1)];
    lineV.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [_deleteBut addSubview:lineV];
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

- (void)changeEdit:(UIButton *)but{
    _isEdit =!_isEdit;
    but.selected =!but.selected;
    WS(blockSelf);
    if (_isEdit==YES) {
        self.deleteBut.hidden =NO;
        [UIView animateWithDuration:0.4 animations:^{
            blockSelf.myTable.frame =CGRectMake(0, MaxY, screenWigth, screenHeight-44-MaxY);
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

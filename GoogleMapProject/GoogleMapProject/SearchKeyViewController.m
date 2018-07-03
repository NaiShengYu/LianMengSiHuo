//
//  SearchKeyViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/7/3.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchKeyViewController.h"
#import "SearchResultViewController.h"
#import "SearchKeyNavVar.h"
@interface SearchKeyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *myTable;
@end

@implementation SearchKeyViewController
- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1", nil];
    [self creatNav];
    [self.view addSubview:self.myTable];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
}
- (void)creatNav{
    SearchKeyNavVar *navView = [[SearchKeyNavVar alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    navView.vc =self;
    [navView.backBut addTarget:self action:@selector(showLeftVC) forControlEvents:UIControlEventTouchUpInside];
    [navView.searchBar becomeFirstResponder];
    [self.view addSubview:navView];
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
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.detailTextLabel.textColor =[UIColor blackColor];
   
    if (indexPath.row==0) {
        cell.imageView.image =[UIImage imageNamed:@"首页-搜索s_03_03"];
        cell.detailTextLabel.text =@"【北京】";
        cell.textLabel.text =@"附近";
    }else{
        cell.imageView.image =[UIImage imageNamed:@"详情_11"];
        cell.detailTextLabel.text =@"";
         cell.textLabel.text = @"巴黎Paris";
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchResultViewController *vc = [[SearchResultViewController alloc]init];
    vc.searchKey =@"";
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
#pragma mark --出现左菜单
- (void)showLeftVC{
    [self.navigationController popViewControllerAnimated:NO];
//    [self.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
//    }];
}
@end

//
//  AboutUsViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchResultHeader.h"
#import "SearchResultSectionZeroCell.h"
#import "SearchResultSectionOneCell.h"

#import "ShopInfoViewController.h"
@interface SearchResultViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation SearchResultViewController
- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0,50, screenWigth, screenHeight-50-MaxY) style:UITableViewStylePlain];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[SearchResultSectionZeroCell class] forCellReuseIdentifier:@"SearchResultSectionZeroCell"];
        [_myTable registerClass:[SearchResultSectionOneCell class] forCellReuseIdentifier:@"SearchResultSectionOneCell"];
        [_myTable registerClass:[SearchResultHeader class] forHeaderFooterViewReuseIdentifier:@"SearchResultHeader"];
    }
    return _myTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"目的地",@"餐厅",@"购物",nil];
    [self.view addSubview:self.myTable];
    self.title =@"搜索";
    UILabel *titleLab =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, screenWigth-20, 50)];
    [self.view addSubview:titleLab];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"搜索%@得到的内容",self.searchKey]];
    [att addAttribute:NSForegroundColorAttributeName value:zhuse range:NSMakeRange(2, self.searchKey.length)];
    titleLab.attributedText =att;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SearchResultHeader *header =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SearchResultHeader"];
    header.titleLab.text = self.dataArray[section];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        SearchResultSectionZeroCell *cell =[tableView dequeueReusableCellWithIdentifier:@"SearchResultSectionZeroCell" forIndexPath:indexPath];
        cell.textLabel.numberOfLines =0;
        return cell;
    }
    
    SearchResultSectionOneCell *cell =[tableView dequeueReusableCellWithIdentifier:@"SearchResultSectionOneCell" forIndexPath:indexPath];

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
    UIBarButtonItem *left =[[UIBarButtonItem alloc]initWithCustomView:img];
    left.tintColor =[UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem =left;
}
- (void)goBack{

    [self.navigationController popViewControllerAnimated:YES];
}

@end

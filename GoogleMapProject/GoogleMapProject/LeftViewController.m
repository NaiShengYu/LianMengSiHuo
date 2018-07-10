//
//  LeftViewController.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftViewHeader.h"
#import "CollectionShopViewController.h"
#import "CommentViewController.h"
#import "FogotViewController.h"
#import "BindingPhoneViewController.h"
#import "AboutUsViewController.h"
#import "VersionInformationViewController.h"
#import "PersonDataController.h"

#import "LoginViewController.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *titlesArray;
@property (nonatomic,strong)NSMutableArray *imgArray;


@end

@implementation LeftViewController

- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_myTable registerClass:[LeftViewHeader class] forHeaderFooterViewReuseIdentifier:@"LeftViewHeader"];
        
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationController.navigationBar.translucent =NO;
    _titlesArray =[[NSMutableArray alloc]initWithObjects:@"我的收藏",@"我的点评",@"忘记密码",@"绑定手机",@"关于我们",@"版本信息", nil];
    _imgArray =[[NSMutableArray alloc]initWithObjects:@"个人中心_11",@"个人中心_14",@"个人中心_16",@"个人中心_18",@"个人中心_20",@"个人中心_22", nil];

    [self.view addSubview:self.myTable];
    [self.myTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets =UIEdgeInsetsMake(0, 0, 0, 0);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.myTable reloadData];
    self.navigationController.navigationBar.hidden =YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden =NO;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titlesArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150-64+MaxY;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    LeftViewHeader *header =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LeftViewHeader"];
    [header.imgBut addTarget:self action:@selector(changeUserData) forControlEvents:UIControlEventTouchUpInside];
    
    if ([CustomAccount sharedCustomAccount].loginType ==1) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [header.headerImgV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,[user objectForKey:USERHEADPIC]]] placeholderImage:[UIImage imageNamed:@"个人中心_07"]];
        [header.titleBut setTitle:[user objectForKey:USERNAME] forState:UIControlStateNormal];
        
    }else{
        [header.titleBut setTitle:@"未登录" forState:UIControlStateNormal];
        header.headerImgV.image =[UIImage imageNamed:@"个人中心_07"];
    }
    
    return header;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text =self.titlesArray[indexPath.row];
    cell.imageView.image =[UIImage imageNamed:self.imgArray[indexPath.row]];
    cell.textLabel.font =FontSize(16);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.row <4) {
        WS(blockSelf);
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if ([user objectForKey:USERID] ==nil) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还没有登录！" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"去登陆" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                [blockSelf.homePageVC.navigationController pushViewController:[LoginViewController new] animated:NO];
                [blockSelf.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                }];
            }]];
            
            
            [self presentViewController:alert animated:YES completion:nil];
            
            return;
        }
    }
    
    
    switch (indexPath.row) {
        case 0:
            [self.homePageVC.navigationController pushViewController:[CollectionShopViewController new] animated:NO];
            break;
        case 1:
            [self.homePageVC.navigationController pushViewController:[CommentViewController new] animated:NO];
            break;
        case 2:
            [self.homePageVC.navigationController pushViewController:[FogotViewController new] animated:NO];
            break;
        case 3:
            [self.homePageVC.navigationController pushViewController:[BindingPhoneViewController new] animated:NO];
            break;
        case 4:
            [self.homePageVC.navigationController pushViewController:[AboutUsViewController new] animated:NO];
            break;
        case 5:
            [self.homePageVC.navigationController pushViewController:[VersionInformationViewController new] animated:NO];
            break;
        default:
            break;
    }
    [self.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
    }];
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
- (void)changeUserData{
    
    if ([CustomAccount sharedCustomAccount].loginType ==1) {
        PersonDataController *dataVC =[[PersonDataController alloc]initWithStyle:UITableViewStyleGrouped];
        [self.homePageVC.navigationController pushViewController:dataVC animated:NO];
        [self.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        }];
    }else{
        [self.homePageVC.navigationController pushViewController:[LoginViewController new] animated:NO];
        [self.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        }];

    }
  
    
}
@end

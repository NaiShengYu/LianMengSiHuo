//
//  ShopInfoViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopInfoViewController.h"
#import "ShopCommentViewController.h"

#import "ShopInfoCommentTableViewCell.h"
#import "ShopInfoTableViewCell.h"
#import "ShopInfoFooter.h"
#import "ShopInfoNavBar.h"

#import "LoginViewController.h"
@interface ShopInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation ShopInfoViewController

- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY-TabbarHeight) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        _myTable.separatorStyle =UITableViewCellSeparatorStyleNone;
        [_myTable registerClass:[ShopInfoTableViewCell class] forCellReuseIdentifier:@"ShopInfoTableViewCell"];
        [_myTable registerClass:[ShopInfoCommentTableViewCell class] forCellReuseIdentifier:@"ShopInfoCommentTableViewCell"];
        
        [_myTable registerClass:[ShopInfoFooter class] forHeaderFooterViewReuseIdentifier:@"ShopInfoFooter"];
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1", nil];
    [self.view addSubview:self.myTable];
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    ShopInfoNavBar *navbar =[[ShopInfoNavBar alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    [self.view addSubview:navbar];
    [navbar.backBaut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [navbar.shareBut addTarget:self action:@selector(shareBut) forControlEvents:UIControlEventTouchUpInside];
    [navbar.collectionBut addTarget:self action:@selector(collectionBut) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *bottomBut =[[UIButton alloc]initWithFrame:CGRectMake(0, screenHeight-TabbarHeight, screenWigth, TabbarHeight)];
    [bottomBut setImage:[UIImage imageNamed:@"详情_22"] forState:UIControlStateNormal];
    [bottomBut setTitle:@"  评论" forState:UIControlStateNormal];
    [bottomBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bottomBut.backgroundColor =[UIColor whiteColor];
    [bottomBut addTarget:self action:@selector(commentBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBut];
    UIView *lineV =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 1)];
    lineV.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bottomBut addSubview:lineV];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }
    CGFloat W = (screenWigth-65-30-20)/4;

    return W +20;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section >0) {
        ShopInfoFooter *footer =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ShopInfoFooter"];
        footer.imgsArray =@[@"3",@"3",@"3",@"3"];
        return footer;
    }
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section ==0) {
        ShopInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ShopInfoTableViewCell" forIndexPath:indexPath];
        cell.VC = self;
        cell.infoLab.text =@"一举手，前後左右要有定向.起动举动未能由己，要悉心体认，随人所动，随曲就伸，不丢不顶. 勿自伸缩.彼有力，我亦有力，我力在先.彼无力，我亦无力，我意仍在先.要刻刻留心.挨何处，心要用在何处，须向不丢不顶中讨消息.切记一静无有不静，静须静如山岳.所谓他强由他强，清风拂山冈.一动无有不动，动当动若江河，所谓他横任他横，明月照大江.从此做去，一年半载，便能施於身.此全是用意不是用劲.久之，则人为我制，我不为人制矣.";
        cell.textLabel.numberOfLines =0;
        return cell;
    }
    
    ShopInfoCommentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ShopInfoCommentTableViewCell" forIndexPath:indexPath];
    cell.contentLab.text =@"一举手，前後左右要有定向.起动举动未能由己，要悉心体认，随人所动，随曲就伸，不丢不顶. 勿自伸缩.彼有力，我亦有力，我力在先.彼无力，我亦无力，我意仍在先.要刻刻留心.挨何处，心要用在何处，须向不丢不顶中讨消息.切记一静无有不静，静须静如山岳.所谓他强由他强，清风拂山冈.一动无有不动，动当动若江河，所谓他横任他横，明月照大江.从此做去，一年半载，便能施於身.此全是用意不是用劲.久之，则人为我制，我不为人制矣.";
    cell.textLabel.numberOfLines =0;
    return cell;
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

- (void)commentBut{
    WS(blockSelf);
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:USERID] ==nil) {
        
       UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您还没有登录！" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"去登陆" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController pushViewController:[LoginViewController new] animated:NO];
        }]];
        
        
        [self presentViewController:alert animated:YES completion:nil];
 
        return;
  
    }
    
    ShopCommentViewController *commentVC =[[ShopCommentViewController alloc]init];
    commentVC.type = self.type;
    commentVC.Id = self.Id;
    [self.navigationController pushViewController:commentVC animated:YES];
    
}

- (void)collectionBut{

}

- (void)shareBut{



}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

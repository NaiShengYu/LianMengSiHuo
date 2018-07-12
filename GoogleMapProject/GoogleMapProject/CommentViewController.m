//
//  CommentViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentCell.h"
#import "CommentModel.h"
@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CommentViewController
- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[CommentCell class] forCellReuseIdentifier:@"CommentCell"];
        WS(blockSelf);
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
    self.title =@"我的点评";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    
    self.dataArray =[[NSMutableArray alloc]init];
  
    [self.view addSubview:self.myTable];
    [self makeDataIsRefresh:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    cell.model =self.dataArray[indexPath.section];
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

- (void)makeDataIsRefresh:(BOOL) isRefresh{

    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_my_comment" forKey:@"app"];
    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
    if (isRefresh==YES) {
        [param setObject:@"0" forKey:@"pageno"];
    }else{
        [param setObject:[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count] forKey:@"pageno"];
    }
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            for (NSDictionary *dic in responseObject[@"data"][0][@"comment"]) {
                CommentModel *model = [[CommentModel alloc]initWithDic:dic];
                [blockSelf.dataArray addObject:model];
            }
            
            NSDictionary *dataDic = responseObject[@"data"][0];
            if (blockSelf.dataArray.count >=[dataDic[@"comment_num"] integerValue]) {
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
    UIBarButtonItem *left =[[UIBarButtonItem alloc]initWithCustomView:img];
    left.tintColor =[UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem =left;
}
- (void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end

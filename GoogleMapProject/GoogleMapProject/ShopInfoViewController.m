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
#import "ShopInfoModel.h"
#import "ShopInfoCommentModel.h"
#import "LoginViewController.h"
@interface ShopInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)ShopInfoModel *infoModel;

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
        WS(blockSelf);
      
        
    }
    return _myTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.dataArray =[[NSMutableArray alloc]init];
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
    
    [self makeData];
    [self getCommentDataIsRefresh:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addCommentSuccess) name:@"addCommentSuccess" object:nil];
    [self ziDingYiDaoHangLan];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden =NO;
//}

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
    
    ShopInfoCommentModel *model = self.dataArray[section-1];
    if (model.comment_img.count ==0) {
        return 20;
    }
    NSInteger a = model.comment_img.count/4 ;
    NSInteger b = model.comment_img.count%4 ;
    CGFloat W =0;
    if (b==0) {
         W= (screenWigth-65-30-20)/4 *a;
    }else{
        W= (screenWigth-65-30-20)/4 *(a+1);

    }

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
        ShopInfoCommentModel *model = self.dataArray[section-1];
        footer.imgsArray =model.comment_img;
        return footer;
    }
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section ==0) {
        ShopInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ShopInfoTableViewCell" forIndexPath:indexPath];
        cell.VC = self;
        cell.model= self.infoModel;
        return cell;
    }
    
    ShopInfoCommentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ShopInfoCommentTableViewCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.section-1];
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
    commentVC.Id = self.Id;
    [self.navigationController pushViewController:commentVC animated:YES];
    
}
#pragma mark --添加收藏
- (void)collectionBut{

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
    
    
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"user_add_collection" forKey:@"app"];
    [param setObject:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:USERID]] forKey:@"userid"];
    [param setObject:acc.classtype forKey:@"type"];
    [param setObject:self.Id forKey:@"Id"];
    
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
           
            
        }else{
            [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:YES];
    
    
    
    
}
#pragma mark 分享
- (void)shareBut{



}


- (void)makeData{
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_details" forKey:@"app"];
    [param setObject:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:USERID]] forKey:@"userid"];
    [param setObject:acc.classtype forKey:@"type"];
    [param setObject:self.Id forKey:@"Id"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.curCoordinate2D.longitude] forKey:@"lng"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.curCoordinate2D.latitude] forKey:@"lat"];

    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            @try {
                [responseObject[@"data"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    blockSelf.infoModel = [[ShopInfoModel alloc]initWithDic:obj];
                }];
                [blockSelf.myTable removeFromSuperview];
                blockSelf.myTable =nil;
                [blockSelf.view addSubview:blockSelf.myTable];
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
    } isShowHUD:YES];
    
    
}

- (void)addCommentSuccess{
    
    [self getCommentDataIsRefresh:YES];
    
}
- (void)getCommentDataIsRefresh:(BOOL)isRefresh{
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_details_comment" forKey:@"app"];
    [param setObject:acc.classtype forKey:@"type"];
    [param setObject:self.Id forKey:@"Id"];
    if (isRefresh==YES) {
        [param setObject:@"0" forKey:@"pageno"];
    }else{
        [param setObject:[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count] forKey:@"pageno"];
    }
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            @try {
                if (isRefresh==YES) {
                    [blockSelf.dataArray removeAllObjects];
                    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                        [blockSelf getCommentDataIsRefresh:NO];
                    }];
                    blockSelf.myTable.mj_footer = footer;
                }
                NSDictionary *dataDic = responseObject[@"data"][0];
                NSArray *arr = dataDic[@"comment_list"];
                [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    ShopInfoCommentModel *model =[[ShopInfoCommentModel alloc]initWithDic:obj];
                    [blockSelf.dataArray addObject:model];
                }];
                if (blockSelf.dataArray.count >=[dataDic[@"comment_num"] integerValue]) {
                    [blockSelf.myTable.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [blockSelf.myTable.mj_footer endRefreshing];
                }
                [blockSelf.myTable reloadData];
            } @catch (NSException *exception) {
                [blockSelf.myTable.mj_footer endRefreshing];
            } @finally {
            }
        }else{
             [PubulicObj ShowSVWhitMessage];
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
            [blockSelf.myTable.mj_footer endRefreshing];

        }
    } failure:^(NSError *error) {
        [blockSelf.myTable.mj_footer endRefreshing];
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:NO];
 
    
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

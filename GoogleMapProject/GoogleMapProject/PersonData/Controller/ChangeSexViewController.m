//
//  AboutUsViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ChangeSexViewController.h"

@interface ChangeSexViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ChangeSexViewController
- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, screenHeight) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        
    }
    return _myTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"修改性别";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    self.dataArray =[[NSMutableArray alloc]initWithObjects:@"无",@"男",@"女", nil];
    
    [self.view addSubview:self.myTable];
    
    
    UIView *backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, 70)];
    backView.backgroundColor =[UIColor whiteColor];
    
    UIButton* updataBut =[UIButton new];
    [backView addSubview:updataBut];
    [updataBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset =0;
        make.bottom.offset =-15;
        make.height.offset =40;
        make.width.offset =200;
    }];
    updataBut.backgroundColor =zhuse;
    [updataBut setTitle:@"提交" forState:UIControlStateNormal];
    updataBut.layer.cornerRadius =5;
    updataBut.layer.masksToBounds =YES;
    [updataBut addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    self.myTable.tableFooterView = backView;
    
}

- (void)update{
    [SVProgressHUD showSuccessWithStatus:@"修改昵称成功"];
    
    if (self.changeSexBlock) {
        self.changeSexBlock(self.sex);
    }
    [self.navigationController popViewControllerAnimated:YES];
//    NSString *sexNum = @"0";
//    if ([self.sex isEqualToString:@"无"]) {
//        sexNum = @"0";
//    }
//    if ([self.sex isEqualToString:@"男"]) {
//        sexNum = @"1";
//    }
//    if ([self.sex isEqualToString:@"女"]) {
//        sexNum = @"2";
//    }
    
    
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
//    DLog(@"url==%@",url);
//    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
//    [param setObject:@"user_change_nickname" forKey:@"app"];
//    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
//    [param setObject:sexNum forKey:@"nickname"];
//
//    WS(blockSelf);
//    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
//        if ([responseObject[@"code"] integerValue] ==1) {
//            [user setObject:sexNum forKey:NICKNAME];
//            [user synchronize];
//            [SVProgressHUD showSuccessWithStatus:@"修改昵称成功"];
//            [self.navigationController popViewControllerAnimated:YES];
//        }else{
//            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
//        }
//    } failure:^(NSError *error) {
//
//    } isShowHUD:YES];
//
//
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text =self.dataArray[indexPath.row];
    cell.textLabel.numberOfLines =0;
    
    if (self.dataArray[indexPath.row] == self.sex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else cell.accessoryType =UITableViewCellAccessoryNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.sex =self.dataArray[indexPath.row];
    [tableView reloadData];
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

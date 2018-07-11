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
@interface SearchKeyViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,copy)NSString *searchKey;
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
    self.searchKey = @"";
    self.dataArray =[[NSMutableArray alloc]init];
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
    navView.searchBar.delegate =self;
    [navView.backBut addTarget:self action:@selector(showLeftVC) forControlEvents:UIControlEventTouchUpInside];
    [navView.searchBar becomeFirstResponder];
    [navView.searchBar addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:navView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.dataArray.count+1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
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
        cell.detailTextLabel.text =[NSString stringWithFormat:@"【%@】",[CustomAccount sharedCustomAccount].currentCityName];
        cell.textLabel.text =@"附近";
    }else{
        NSDictionary *dic =self.dataArray[indexPath.row-1];
        cell.detailTextLabel.text =@"";
         cell.textLabel.text = dic[@"res"];
        cell.textLabel.numberOfLines =2;
        cell.textLabel.font =FontSize(15);
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        switch ([dic[@"type"] integerValue]) {
            case 1:
                cell.imageView.image =[UIImage imageNamed:@"首页_06"];
                break;
            case 2:
                cell.imageView.image =[UIImage imageNamed:@"首页_03"];

                break;
            case 3:
                cell.imageView.image =[UIImage imageNamed:@"首页_09"];

                break;
            case 4:
                cell.imageView.image =[UIImage imageNamed:@"首页_13"];

                break;
            case 5:
                cell.imageView.image =[UIImage imageNamed:@"详情_11"];

                break;
           
            default:
                break;
        }
        
        
        
        
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        
        
        return;
    }
    
    
    
    NSDictionary *dic =self.dataArray[indexPath.row-1];
    NSInteger type = [dic[@"type"] integerValue];
    if (type ==5) {
        
       CustomAccount *acc = [CustomAccount sharedCustomAccount];
        acc.city_id = dic[@"Id"];
        NSString *cityName = dic[@"res"];
        NSArray *arr = [cityName componentsSeparatedByString:@" "];
        @try {
            acc.cityName =arr[0];
            acc.cityEnName =arr[1];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
                
        [[NSNotificationCenter defaultCenter] postNotificationName:@"selectCity" object:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }else{
        
        SearchResultViewController *vc = [[SearchResultViewController alloc]init];
        vc.searchKey =dic[@"res"];
        [self.navigationController pushViewController:vc animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    
    
  
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

//发送搜索请求

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([string isEqualToString:@"\n"] &&textField.returnKeyType ==UIReturnKeySearch){
        DLog(@"搜索");
        
        SearchResultViewController *vc = [[SearchResultViewController alloc]init];
        vc.searchKey =self.searchKey;
        [self.navigationController pushViewController:vc animated:YES];
        [self.view endEditing:YES];
        
        //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
    
}

- (void)textChange:(UITextField *)textF{
    self.searchKey = textF.text;
    if (self.searchKey.length >2 && self.searchKey !=nil) {
        [self makeData];
    }
}


- (void)makeData{
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"list_rel_search" forKey:@"app"];
    [param setObject:self.searchKey forKey:@"keyword"];
  
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            [blockSelf.dataArray removeAllObjects];
           
            for (NSDictionary *dic in responseObject[@"data"]) {
                [blockSelf.dataArray addObject:dic];
            }
            [blockSelf.myTable reloadData];
        }else{
         
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
        
        
    } failure:^(NSError *error) {
    } isShowHUD:NO];

    
    
    
    
    
}



#pragma mark --出现左菜单
- (void)showLeftVC{
    [self.navigationController popViewControllerAnimated:NO];
//    [self.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
//    }];
}
@end

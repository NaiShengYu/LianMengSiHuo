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
#import "SearchResultFooter.h"
#import "ShopInfoViewController.h"
@interface SearchResultViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *citysArray;
@property (nonatomic,strong)NSMutableArray *foodsArray;
@property (nonatomic,strong)NSMutableArray *scenicsArray;
@property (nonatomic,strong)NSMutableArray *shopsArray;
@property (nonatomic,strong)NSMutableArray *hotelsArray;
@property (nonatomic,strong)NSMutableArray *titleArray;

@property (nonatomic,assign)BOOL foodsIsMore;
@property (nonatomic,assign)BOOL scenicsIsMore;
@property (nonatomic,assign)BOOL shopsIsMore;
@property (nonatomic,assign)BOOL hotelsIsMore;



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
        [_myTable registerClass:[SearchResultFooter class] forHeaderFooterViewReuseIdentifier:@"SearchResultFooter"];
    }
    return _myTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.foodsIsMore = YES;
    self.shopsIsMore = YES;
    self.hotelsIsMore = YES;
    self.scenicsIsMore = YES;
    
    
    [self ziDingYiDaoHangLan];
    self.citysArray =[[NSMutableArray alloc]init];
    self.foodsArray =[[NSMutableArray alloc]init];
    self.scenicsArray =[[NSMutableArray alloc]init];
    self.shopsArray =[[NSMutableArray alloc]init];
    self.hotelsArray =[[NSMutableArray alloc]init];
    self.titleArray =[[NSMutableArray alloc]initWithObjects:@"目的地",@"餐厅",@"景点",@"购物",@"酒店", nil];
    [self.view addSubview:self.myTable];
    self.title =@"搜索";
    UILabel *titleLab =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, screenWigth-20, 50)];
    [self.view addSubview:titleLab];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"搜索%@得到的内容",self.searchKey]];
    [att addAttribute:NSForegroundColorAttributeName value:zhuse range:NSMakeRange(2, self.searchKey.length)];
    titleLab.attributedText =att;
    
    [self makeData];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) return self.citysArray.count;
    else if (section==1) return self.foodsArray.count;
    else if (section==1) return self.scenicsArray.count;
    else if (section==1) return self.shopsArray.count;
    else  return self.hotelsArray.count;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section ==0) {
        return 1;
    }
    if (section ==1) {
        if (_foodsIsMore ==NO) {
            return 1;
        }
    }
    if (section ==2) {
        if (_scenicsIsMore ==NO) {
            return 1;
        }
    }
    if (section ==3) {
        if (_shopsArray ==NO) {
            return 1;
        }
    }
    if (section ==4) {
        if (_hotelsIsMore ==NO) {
            return 1;
        }
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SearchResultHeader *header =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SearchResultHeader"];
    header.titleLab.text = self.titleArray[section];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section ==0) {
        return nil;
    }
    if (section ==1) {
        if (_foodsIsMore ==NO) {
            return nil;
        }
    }
    if (section ==2) {
        if (_scenicsIsMore ==NO) {
            return nil;
        }
    }
    if (section ==3) {
        if (_shopsArray ==NO) {
            return nil;
        }
    }
    if (section ==4) {
        if (_hotelsIsMore ==NO) {
            return nil;
        }
    }
    
    SearchResultFooter *footer =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SearchResultFooter"];
    footer.addMoreBut.tag =1000+section;
    [footer.addMoreBut addTarget:self action:@selector(addMore:) forControlEvents:UIControlEventTouchUpInside];
        

    
    
    return footer;
    
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


- (void)makeData{
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"list_search" forKey:@"app"];
    [param setObject:self.searchKey forKey:@"keyword"];
    
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            
          
            [blockSelf.myTable reloadData];
        }else{
            
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
        
        
    } failure:^(NSError *error) {
  
    } isShowHUD:NO];
    
}

- (void)addMore:(UIButton *)but{
    
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"list_search_more" forKey:@"app"];
    [param setObject:self.searchKey forKey:@"keyword"];
    [param setObject:[NSString stringWithFormat:@"%ld",but.tag-1000] forKey:@"type"];
    switch (but.tag-1000) {
        case 1:
            [param setObject:[NSString stringWithFormat:@"%ld",self.foodsArray.count] forKey:@"pageno"];

            break;
        case 2:
            [param setObject:[NSString stringWithFormat:@"%ld",self.scenicsArray.count] forKey:@"pageno"];

            break;
        case 3:
            [param setObject:[NSString stringWithFormat:@"%ld",self.shopsArray.count] forKey:@"pageno"];
            break;
        case 4:
            [param setObject:[NSString stringWithFormat:@"%ld",self.hotelsArray.count] forKey:@"pageno"];

            break;
        default:
            break;
    }

    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            
            
            [blockSelf.myTable reloadData];
        }else{
            
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:responseObject[@"message"]];
        }
        
        
    } failure:^(NSError *error) {
        
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

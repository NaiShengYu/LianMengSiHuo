//
//  AboutUsViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;

@property (nonatomic,copy)NSString *content;

@end

@implementation AboutUsViewController
- (UITableView *)myTable{
    if(!_myTable){
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTable.delegate =self;
        _myTable.backgroundColor =[UIColor whiteColor];
        _myTable.dataSource =self;
        [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _myTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"关于我们";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    
    [self.view addSubview:self.myTable];
    [self request];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 180;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UITableViewHeaderFooterView *header =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!header) {
        header = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"header"];
        UIImageView *imgV =[UIImageView new];
        [header.contentView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(CGPointMake(0, 0));
            make.size.mas_equalTo(CGSizeMake(90, 90));
        }];
        imgV.image = [UIImage imageNamed:@"logo2"];
        header.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    @try {
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:self.content];
        NSRange range1 = [self.content rangeOfString:@"品牌定位"];
        if (range1.location !=NSNotFound) {
            [att addAttribute:NSFontAttributeName value:FontSize(19) range:NSMakeRange(range1.location, 4)];
            [att addAttribute:NSForegroundColorAttributeName value:zhuse range:NSMakeRange(range1.location, 4)];
        }
        NSRange range2 = [self.content rangeOfString:@"连盟旅游信息网组成"];
        if (range2.location !=NSNotFound) {
            [att addAttribute:NSFontAttributeName value:FontSize(19) range:NSMakeRange(range2.location, 9)];
            [att addAttribute:NSForegroundColorAttributeName value:zhuse range:NSMakeRange(range2.location, 9)];
        }
        NSRange range3 = [self.content rangeOfString:@"连接梦想"];
        if (range3.location !=NSNotFound) {
            [att addAttribute:NSFontAttributeName value:FontSize(19) range:NSMakeRange(range3.location, 4)];
            [att addAttribute:NSForegroundColorAttributeName value:zhuse range:NSMakeRange(range3.location, 4)];
        }
        
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font =FontSize(16);
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        
        [paragraphStyle setLineSpacing:6];
        
        [att addAttribute:NSParagraphStyleAttributeName
         
                    value:paragraphStyle
         
                    range:NSMakeRange(0, [self.content length])];
        
        cell.textLabel.attributedText = att;
        NSLog(@"%@",self.content);
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }

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

- (void)request{
    
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    NSMutableDictionary *parama =[[NSMutableDictionary alloc]init];
    [parama setObject:@"user_about_us" forKey:@"app"];
    WS(blockSelf);
    [AFNetRequest HttpPostCallBack:url Parameters:parama success:^(id responseObject) {
        DLog(@"responese===%@",responseObject);
        blockSelf.content = responseObject[@"data"];
        blockSelf.content = [blockSelf.content stringByReplacingOccurrencesOfString:instailString withString:@"\n"];
        [blockSelf.myTable reloadData];
        
    } failure:^(NSError *error) {
        
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

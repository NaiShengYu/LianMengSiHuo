//
//  CommentViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/21.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentCell.h"
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
    }
    return _myTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"我的点评";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];
    
    self.dataArray =[[NSMutableArray alloc]initWithObjects:
                     @"「人徒知枯坐息思为进德之功，殊不知上达之士，圆通定慧，体用双修，即动而静，虽撄而宁。」不但有打坐修炼的静功，也有由外而内的动功。",
                     @"“天之道，损有余而补不足，是故虚胜实，不足胜有余。\n其意博，其理奥，其趣深，天地之象分，阴阳之候列，变化之由表，死生之兆彰，不谋而遗迹自同，勿约而幽明斯契，稽其言有微，验之事不忒，诚可谓至道之宗，奉生之始矣。假若天机迅发，妙识玄通，成谋虽属乎生知，标格亦资于治训，未尝有行不由送，出不由产者亦。然刻意研精，探微索隐，或识契真要，则目牛无全，故动则有成，犹鬼神幽赞，而命世奇杰，时时间出焉。 ",
                     @"爪力无比，鬼气回荡，不攻自惧。其爪可使头骨成孔而不碎，爪心有强大的吸力可隔空取物或吸取他人功力，爪指有强大的透劲可隔空伤人。一收一放，一开一合，合乎武学大道之理。 　　第一重金丝手诀曰：面北背南朝天坐，气行任督贯大椎。意聚丹田一柱香，分支左右聚掌心。打开气海命门穴，气满冲贯十指爪。旋入阴气一坤炉，放收来回金丝手。凡习九阴白骨爪需先习九阴神功百日，于极阴之地，谷地为佳。面北背南，五心朝天坐于低处。双手放于膝上，手心朝下，意守丹田。开气海、命门，旋转吸入阴气汇于丹田。气顺任、督两脉上行汇于大椎穴，于右肩井穴入掌心，气满鼓支，掌起平胸。五指下垂，气贯入指，十指内扣、回拉，手丝为一。回气丹田，温养柱香。",nil];
  
    [self.view addSubview:self.myTable];
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
    cell.contentLab.text =self.dataArray[indexPath.section];
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

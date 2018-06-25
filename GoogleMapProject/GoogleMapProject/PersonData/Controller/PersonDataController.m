//
//  PersonDataController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/25.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "PersonDataController.h"
#import "PersonImageCell.h"
#import "PersonDataCell.h"

#import "ChangePersonNameViewController.h"
#import "ChangeSexViewController.h"
@interface PersonDataController ()
@property (nonatomic,strong)NSMutableArray *titlesArray;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *sex;


@end

@implementation PersonDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor lightGrayColor];
    self.name =@"俞乃胜";
    self.sex =@"男";
    _titlesArray =[[NSMutableArray alloc]initWithObjects:@[@"1",@"昵称",@"性别"],@[@"手机号",@"密码"] ,nil];
    self.title =@"个人信息";
    self.view.backgroundColor =[UIColor whiteColor];
    [self ziDingYiDaoHangLan];

    [self.tableView registerClass:[PersonImageCell class] forCellReuseIdentifier:@"PersonImageCell"];
    [self.tableView registerClass:[PersonDataCell class] forCellReuseIdentifier:@"PersonDataCell"];
    
    self.tableView.frame =CGRectMake(0, 0, screenWigth, screenHeight-MaxY-TabbarHeight-1);
    
    UIButton *bottomeBut =[[UIButton alloc]initWithFrame:CGRectMake(0, screenHeight-TabbarHeight-MaxY, screenWigth, TabbarHeight)];
    [bottomeBut setTitle:@"退出账号" forState:UIControlStateNormal];
    [bottomeBut setTitleColor:zhuse forState:UIControlStateNormal];
    [bottomeBut addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
    bottomeBut.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bottomeBut];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr =self.titlesArray[section];
    return arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0 && indexPath.row ==0) {
        return 70;
    }
    return 50;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section ==0 &&indexPath.row ==0) {
        PersonImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonImageCell" forIndexPath:indexPath];

        return cell;

        
    }else{
        PersonDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonDataCell" forIndexPath:indexPath];

        cell.titleLab.text =self.titlesArray[indexPath.section][indexPath.row];
        
        if (indexPath.section ==0 ) {
            if (indexPath.row ==1) {
                cell.nameLab.text =self.name;
            }
            if (indexPath.row ==2) {
                cell.otherLab.text =self.sex;
            }
            
            }
        
        if (indexPath.row ==1) {
            cell.otherLab.textColor =HEXCOLOR(0x4cabfc);
        }else{
            cell.otherLab.textColor =[UIColor grayColor];
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        if (indexPath.row ==0) {
            
        }
        if (indexPath.row ==1) {
           ChangePersonNameViewController *nameVC =[[ChangePersonNameViewController alloc]init];
            nameVC.nickName = self.name;
            nameVC.changeSuccussBlock = ^(NSString *name) {
                self.name =name;
                [tableView reloadData];
            };
            [self.navigationController pushViewController:nameVC animated:YES];
            
        }
        if (indexPath.row ==2) {
            ChangeSexViewController *sexVC =[[ChangeSexViewController alloc]init];
            sexVC.sex =self.sex;
            sexVC.changeSexBlock = ^(NSString *sex) {
                self.sex = sex;
                [tableView reloadData];
            };
            [self.navigationController pushViewController:sexVC animated:YES];
            
            
            
        }
    }
    if (indexPath.section ==0) {
        if (indexPath.row ==0) {
            
        }
        if (indexPath.row ==1) {
            
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark --让cell的横线到最左边

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
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


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



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

#pragma mark --退出账号
- (void)loginOut{
    DLog(@"%f",TabbarHeight);
}

@end

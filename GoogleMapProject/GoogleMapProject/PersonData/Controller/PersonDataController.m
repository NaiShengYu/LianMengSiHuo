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
#import "ChangeTelphoneNumViewController.h"
#import "ChangePasswordViewController.h"

@interface PersonDataController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong)NSMutableArray *titlesArray;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *nickName;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *telNum;
@property (nonatomic,strong)UIImage *headerImg;
@property (nonatomic,copy)NSString *imgURL;
@property (nonatomic,copy)NSString *email;

@end

@implementation PersonDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor lightGrayColor];
  
    _titlesArray =[[NSMutableArray alloc]initWithObjects:@[@"1",@"昵称",@"性别"],@[@"手机号",@"邮箱",@"密码"] ,nil];
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
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    self.name =[user objectForKey:USERNAME];
    self.nickName =[user objectForKey:NICKNAME];
    self.sex =[user objectForKey:SEX];
    self.telNum = [user objectForKey:PHONE];
    self.imgURL = [user objectForKey:USERHEADPIC];
    self.email = [user objectForKey:EMAIL];
    [self.tableView reloadData];
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 60;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
        if (!header) {
            header = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"header"];
            UILabel *titleLab =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 70, 60)];
            titleLab.font =FontSize(18);
            titleLab.text = @"用户名";
            [header.contentView addSubview:titleLab];
            UILabel *nameLab =[[UILabel alloc]initWithFrame:CGRectMake(90, 00, 70, 60)];
            nameLab.textColor =[UIColor grayColor];
            nameLab.tag = 890;
            [header.contentView addSubview:nameLab];
        }
        UILabel *lab = [header.contentView viewWithTag:890];
        lab.text = self.name;
        
        return header;
    }
    
    
    
    return nil;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section ==0 &&indexPath.row ==0) {
        PersonImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonImageCell" forIndexPath:indexPath];
        if (self.headerImg ==nil) {
            [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",allImageURL,self.imgURL]] placeholderImage:[UIImage imageNamed:@"个人中心_07"]];
        }else{
            cell.imageV.image = self.headerImg;
        }
        return cell;

        
    }else{
        PersonDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonDataCell" forIndexPath:indexPath];

        cell.titleLab.text =self.titlesArray[indexPath.section][indexPath.row];
        
        if (indexPath.section ==0 ) {
            if (indexPath.row ==1) {
                cell.nameLab.text =self.nickName;
            }
            if (indexPath.row ==2) {
                cell.otherLab.text =self.sex;
            }
        }
        
        if (indexPath.section ==1 ) {
            if (indexPath.row ==0) {
                if (self.telNum.length >8) {
                    NSString * phone=[self.telNum substringWithRange:NSMakeRange(3, 4)];
                    phone = [self.telNum stringByReplacingOccurrencesOfString:phone withString:@"****"];
                }
                cell.otherLab.text =self.telNum;
            }
            if (indexPath.row ==1) {
                cell.otherLab.text =self.email;
            }
            if (indexPath.row ==2) {
//                cell.otherLab.text =self.sex;
            }
        }
        
        
        if ((indexPath.section ==1 && indexPath.row==2) || (indexPath.section ==0 && indexPath.row==1)) {
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
            WS(blockSelf)
            UIImagePickerController* picker = [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.allowsEditing =YES;
            
            UIAlertController *alert =[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [blockSelf presentViewController:picker animated:YES completion:nil];
                
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [blockSelf presentViewController:picker animated:YES completion:nil];
            }]];
            
            [self presentViewController:alert animated:YES completion:nil];
                    
                
        }
        if (indexPath.row ==1) {
           ChangePersonNameViewController *nameVC =[[ChangePersonNameViewController alloc]init];
            nameVC.nickName = self.nickName;
          
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
    if (indexPath.section ==1) {
        if (indexPath.row ==0) {
            ChangeTelphoneNumViewController *numVC =[[ChangeTelphoneNumViewController alloc]init];
            numVC.telNum =self.telNum;
            numVC.changetelNumBlock = ^(NSString *telNum) {
                self.telNum = telNum;
                [tableView reloadData];
            };
            [self.navigationController pushViewController:numVC animated:YES];
            
        }
        if (indexPath.row ==1) {
            
        }
        if (indexPath.row ==2) {
            [self.navigationController pushViewController:[ChangePasswordViewController new] animated:YES];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //获取图片裁剪的图
    UIImage* edit = [info objectForKey:UIImagePickerControllerEditedImage];
    //数据请求
    PersonImageCell *cell =(PersonImageCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.imageV.image =edit;
    self.headerImg =edit;
    
    [self finishedWithImage:edit];
    //完成
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)finishedWithImage:(UIImage *)image{
    
    NSUserDefaults *user =[NSUserDefaults standardUserDefaults];
    
    NSString *urlStr =[NSString stringWithFormat:@"%@app_user.php",BaseURL];
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc]init];
    [parameter setObject:[user objectForKey:USERID] forKey:@"userid"];
    [parameter setObject:@"" forKey:@"headpic"];
    [parameter setObject:@"user_change_headpic" forKey:@"app"];
    
    WS(blockSelf);

            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"charset=utf-8",@"text/css",@"text/fild", nil];
            [SVProgressHUD show];
            [manager POST:urlStr parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                if (image){
                    NSData *imgData =UIImageJPEGRepresentation(blockSelf.headerImg, 0.6);
                    [formData appendPartWithFileData:imgData name:@"headpic" fileName:@"header.jpeg" mimeType:@"image/jpeg"];
                }
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                DLog(@"responseObject===%@",dic);
                if ([dic[@"code"] integerValue] ==0) {
                    [SVProgressHUD showErrorWithStatus:@"修改失败"];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"修改成功"];
                        [user setObject:dic[@"data"] forKey:USERHEADPIC];
                        [user synchronize];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [SVProgressHUD dismiss];
                DLog(@"%@",error);
                
                [SVProgressHUD showErrorWithStatus:@"网络错误"];
            }
             ];
    
    
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
    NSUserDefaults *user =[NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:USERID];
    [user removeObjectForKey:USERNAME];
    [user removeObjectForKey:NICKNAME];
    [user removeObjectForKey:USERSTATE];
    [user removeObjectForKey:USERHEADPIC];
    [user removeObjectForKey:PHONE];
    [user removeObjectForKey:SEX];
    [user synchronize];
    [CustomAccount sharedCustomAccount].loginType =0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

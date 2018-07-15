//
//  ShopCommentViewController.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopCommentViewController.h"
#import "ShopCommentNavBar.h"
#import "ShopCommentSectionZeroHeader.h"
#import "ShopCommentSectionZeroCell.h"
#import "ShopCommentSectionOneCell.h"
#import "ShopCommentSectionThreeCell.h"
@interface ShopCommentViewController ()<UITableViewDelegate,UITableViewDataSource,CWStarRateViewDelegate>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *imagesArray;
@property (nonatomic,strong)NSMutableArray *assetsArray;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)NSInteger star;
@end

@implementation ShopCommentViewController

- (UITableView *)myTable{
    if (!_myTable) {
        _myTable =[[UITableView alloc]initWithFrame:CGRectMake(0, MaxY, screenWigth, screenHeight-MaxY) style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
        [_myTable registerClass:[ShopCommentSectionThreeCell class] forCellReuseIdentifier:@"ShopCommentSectionThreeCell"];
        [_myTable registerClass:[ShopCommentSectionZeroCell class] forCellReuseIdentifier:@"ShopCommentSectionZeroCell"];
        [_myTable registerClass:[ShopCommentSectionOneCell class] forCellReuseIdentifier:@"ShopCommentSectionOneCell"];
        [_myTable registerClass:[ShopCommentSectionZeroHeader class] forHeaderFooterViewReuseIdentifier:@"ShopCommentSectionZeroHeader"];
    }
    return _myTable;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTable];
    self.star = 0;
    ShopCommentNavBar *navbar =[[ShopCommentNavBar alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    [self.view addSubview:navbar];
    navbar.centerLab.text = @"评论";
    [navbar.backBaut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [navbar.rightBut addTarget:self action:@selector(Publish) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section ==0)return 80;
    if (indexPath.section ==1)return 140;
    
    CGFloat width =(screenWigth-50)/4;
    return (self.imagesArray.count/4 +1) *(width +10)+40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 50;
    }
    return 0;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        ShopCommentSectionZeroHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ShopCommentSectionZeroHeader"];
        return header;
    }
    
    return nil;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WS(blockSelf);
    if (indexPath.section ==0) {
        ShopCommentSectionZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCommentSectionZeroCell" forIndexPath:indexPath];
        cell.starRateView.delegate = self;
        return cell;
    }
    
    if (indexPath.section ==1) {
        ShopCommentSectionOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCommentSectionOneCell" forIndexPath:indexPath];
        cell.descriptionstr =@"还满意吗？想说的话写下了~~~";
        cell.textV.text = self.content;
        cell.textChangeBlock =^(NSString *pinglun){
            blockSelf.content =pinglun;
        };
        return cell;
    }
    
    ShopCommentSectionThreeCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ShopCommentSectionThreeCell" forIndexPath:indexPath];
    [cell.addBut addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    cell.dataArray =self.imagesArray;
    cell.controller =self;
    cell.cancelImgsBlock =^(NSInteger a){
        [blockSelf.imagesArray removeObjectAtIndex:a];
        [blockSelf.assetsArray removeObjectAtIndex:a];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    
    return cell;
}

- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent{
    
    self.star = newScorePercent*10/2;
    DLog(@"%ld",(long)self.star);
}

- (void)click{
    WS(blockSelf);
    TZImagePickerController *imagePicker =[[TZImagePickerController alloc]initWithMaxImagesCount:9 delegate:nil];
    imagePicker.allowPickingOriginalPhoto =NO;
    imagePicker.allowPickingVideo =NO;
    imagePicker.selectedAssets =self.assetsArray;
    [imagePicker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        DLog(@"count===%lu",(unsigned long)assets.count);
        blockSelf.imagesArray =[[NSMutableArray alloc]initWithArray:photos];
        blockSelf.assetsArray =[[NSMutableArray alloc]initWithArray:assets];
        
        [blockSelf.myTable reloadData];
        
    }];
    [self presentViewController:imagePicker animated:YES completion:nil];
}



- (void)Publish{
    
    WS(blockSelf);
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"%@app_user.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:@"user_add_comment" forKey:@"app"];
    [param setObject:[user objectForKey:USERID] forKey:@"userid"];
    [param setObject:[CustomAccount sharedCustomAccount].classtype forKey:@"type"];
    [param setObject:self.Id forKey:@"Id"];
    [param setObject:[NSString stringWithFormat:@"%ld",(long)self.star] forKey:@"star"];
    [param setObject:self.content forKey:@"comment"];
    [param setObject:@"img" forKey:@"comment_img"];
    
    NSMutableArray *shopDataArray =[[NSMutableArray alloc]init];
    for (UIImage *img in self.imagesArray) {
        NSData *data =UIImageJPEGRepresentation(img, 0.5);
        [shopDataArray addObject:data];
    }

            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer =[AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
            [PubulicObj ShowSVWithoutImage];
            [SVProgressHUD showInfoWithStatus:@""];
            [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                [shopDataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSString *filename =[NSString stringWithFormat:@"%lu.jpeg",(unsigned long)idx];
                    [formData appendPartWithFileData:obj name:@"comment_img[]" fileName:filename mimeType:@"image/jpeg"];
                }];
                
                for (int i =0; i <blockSelf.imagesArray.count; i ++) {
                    NSString *filename =[NSString stringWithFormat:@"%d.jpeg",i];
                    [formData appendPartWithFileData:shopDataArray[i] name:@"ad_image[]" fileName:filename mimeType:@"image/jpeg"];
                }
                
              
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                
                NSString *str =[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                DLog(@"str=%@",str);
                NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
                //系统自带JSON解析
                NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingAllowFragments error:nil];
                if ([resultDic[@"code"]integerValue] ==1) {
                    [PubulicObj ShowSVWhitMessage];
                    [SVProgressHUD showErrorWithStatus:@"评论成功"];
                    [blockSelf.navigationController popViewControllerAnimated:YES];
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"addCommentSuccess" object:nil];
                }else{
                    [PubulicObj ShowSVWhitMessage];
                    [SVProgressHUD showErrorWithStatus:resultDic[@"message"]];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"error==%@",error);
                [SVProgressHUD dismiss];
                
            }];
    
    
}
- (void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

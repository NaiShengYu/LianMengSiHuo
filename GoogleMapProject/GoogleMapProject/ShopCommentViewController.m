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
@interface ShopCommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *imagesArray;
@property (nonatomic,strong)NSMutableArray *assetsArray;
@property (nonatomic,copy)NSString *content;
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
    
    ShopCommentNavBar *navbar =[[ShopCommentNavBar alloc]initWithFrame:CGRectMake(0, 0, screenWigth, MaxY)];
    [self.view addSubview:navbar];
    navbar.centerLab.text = @"评论";
    [navbar.backBaut addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [navbar.rightBut addTarget:self action:@selector(Publish) forControlEvents:UIControlEventTouchUpInside];
    
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
        return cell;
    }
    
    if (indexPath.section ==1) {
        ShopCommentSectionOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCommentSectionOneCell" forIndexPath:indexPath];
        cell.descriptionstr =@"还满意吗？想说的话写下了~~~";
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
    
    
}
- (void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

//
//  HomePageSectionZeroCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionZeroCell.h"
#import "HomePageListViewController.h"
@interface HomePageSectionZeroCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *titlesArray;
@end
@implementation HomePageSectionZeroCell
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        _titlesArray =[[NSMutableArray alloc]initWithObjects:@"景点 Attractions",@"餐厅 Restaurant",@"购物 Shopping",@"酒店 Hotel", nil];
        
        _mapV =[[GMSMapView alloc]initWithFrame:frame];
        [self.contentView addSubview:_mapV];
        
        UIView *backView =[UIView new];
        [self.contentView addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =20;
            make.left.offset =20;
            make.right.offset =-20;
            make.height.offset =60;
        }];
        backView.backgroundColor =[UIColor whiteColor];
        backView.alpha =0.6;
        
        _titleBut =[UIButton new];
        [self.contentView addSubview:_titleBut];
        [_titleBut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =20;
            make.left.offset =10;
            make.right.offset =-10;
            make.height.offset =60;
        }];
        _titleBut.titleLabel.numberOfLines =2;
        [_titleBut setTitle:@"巴黎\nParis" forState:UIControlStateNormal];
        [_titleBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _tab =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _tab.delegate =self;
        _tab.dataSource =self;
        [_tab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.contentView addSubview:_tab];
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.titleBut.mas_bottom).offset =20;
            make.left.offset =20;
            make.right.offset =-20;
            make.bottom.offset =-20;
        }];
        _tab.bounces =NO;
        _tab.layer.cornerRadius =5;
        _tab.layer.masksToBounds =YES;
    }
    return self;
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text =self.titlesArray[indexPath.row];
    cell.imageView.image =[UIImage imageNamed:@"timg"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.VC.navigationController pushViewController:[HomePageListViewController new] animated:YES];
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
@end

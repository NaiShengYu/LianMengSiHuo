//
//  FilterView.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/26.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "FilterView.h"
#import "FilterHeader.h"
#import "FilterHeaderModel.h"
#import "FilterItem.h"
#import "FilterCell.h"
@interface FilterView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTable;

@end
@implementation FilterView

- (UITableView *)myTable{
    if (!_myTable) {
        _myTable =[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _myTable.delegate = self;
        _myTable.dataSource =self;
        [_myTable registerClass:[FilterHeader class] forHeaderFooterViewReuseIdentifier:@"FilterHeader"];
        [_myTable registerClass:[FilterCell class] forCellReuseIdentifier:@"FilterCell"];
    }
    return _myTable;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray =[[NSMutableArray alloc]init];
        [self addSubview:self.myTable];
        [self.myTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
        
        
    }
    
    return self;
    
}

- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray =dataArray;
    [_myTable reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FilterHeaderModel *model =self.dataArray[section];
    if (model.isSelect ==YES) {
         return model.itemsArray.count;
    }
    return 0;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FilterHeaderModel *model =self.dataArray[section];
    FilterHeader *header =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FilterHeader"];
    header.headerModel = model;
    header.changeHeaderState = ^(BOOL isselect) {
        for (FilterHeaderModel *model in self.dataArray) {
            model.isSelect =NO;
        }
        model.isSelect =isselect;
        [tableView reloadData];
    };
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FilterCell * cell =[tableView dequeueReusableCellWithIdentifier:@"FilterCell" forIndexPath:indexPath];
    cell.backBut.index =indexPath;
    FilterHeaderModel *model =self.dataArray[indexPath.section];
    FilterItem *item =model.itemsArray[indexPath.row];
    cell.item = item;
    cell.changeItemSelect = ^(BOOL isselect) {
        for (FilterItem *item1  in model.itemsArray) {
            item1.isSelect =NO;
        }
        item.isSelect =YES;
        [tableView reloadData];
    };
    return cell;
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

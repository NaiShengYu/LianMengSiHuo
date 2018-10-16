//
//  HomePageSectionZeroCell.m
//  GoogleMapProject
//
//  Created by 俞乃胜 on 2018/6/20.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "HomePageSectionZeroCell.h"
#import "HomePageListViewController.h"
#import "HomePageMapViewController.h"
#import "MapBottomModel.h"
#import "CustomNoFoodAlert.h"
@interface HomePageSectionZeroCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *titlesArray;
@property (nonatomic,strong)NSMutableArray *imgArray;

@end
@implementation HomePageSectionZeroCell
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        WS(blockSelf);
        _titlesArray =[[NSMutableArray alloc]initWithObjects:@"景点 Attractions",@"餐厅 Restaurant",@"购物 Shopping",@"酒店 Hotel", nil];
        _imgArray =[[NSMutableArray alloc]initWithObjects:@"首页_03",@"首页_06",@"首页_09",@"首页_13", nil];
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
        [_titleBut addTarget:self action:@selector(goMap) forControlEvents:UIControlEventTouchUpInside];

        _titleLab =[UILabel new];
        [self.titleBut addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset =10;
            make.right.offset =-10;
            make.height.offset =60;
            make.centerY.offset = 0;
        }];
        _titleLab.numberOfLines = 2;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        
        
        
//        NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:@"巴黎\nParis"];
//        [att addAttribute:NSFontAttributeName value:FontSize(18) range:NSMakeRange(0, 2)];
//        [_titleBut setAttributedTitle:att forState:UIControlStateNormal];
        _titleBut.titleLabel.font =FontSize(18);
        [_titleBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _titleBut.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
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
        [self getCityName];
    }
    return self;
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font =FontSize(13);
    cell.textLabel.textColor =RGBA(208, 208, 208, 1);
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:self.titlesArray[indexPath.row]];
    [att addAttribute:NSFontAttributeName value:FontSize(18) range:NSMakeRange(0, 2)];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.attributedText = att;
    
    cell.imageView.image =[UIImage imageNamed:self.imgArray[indexPath.row]];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@"list_map_scenic",@"list_map_food",@"list_map_shop",@"list_map_hotel"];
    NSArray *arr1 =@[@"2",@"1",@"3",@"4"];
    [CustomAccount sharedCustomAccount].className =arr[indexPath.row];
    [CustomAccount sharedCustomAccount].classtype =arr1[indexPath.row];
    
    [self makeData];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)makeData{
    WS(blockSelf);
  
    NSString *url = [NSString stringWithFormat:@"%@app_list.php",BaseURL];
    DLog(@"url==%@",url);
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    CustomAccount *acc = [CustomAccount sharedCustomAccount];
    [param setObject:@"list_show" forKey:@"app"];
    [param setObject:acc.classtype forKey:@"type"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.cityLocation.longitude] forKey:@"lng"];
    [param setObject:[NSString stringWithFormat:@"%f",acc.cityLocation.latitude] forKey:@"lat"];
    //    [param setObject:@"2.3411111" forKey:@"lng"];
    //    [param setObject:@"48.8600" forKey:@"lat"];
    
    //距离
    [param setObject:@"5" forKey:@"raidus"];
    //分类
    [param setObject:@"" forKey:@"list_condition"];
    //评分
    [param setObject:@"" forKey:@"star"];
    
    //请求起始个数
        [param setObject:@"0" forKey:@"pageno"];
   
    
    [AFNetRequest HttpPostCallBack:url Parameters:param success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] ==1) {
            @try {
                NSMutableArray *dataArray = [[NSMutableArray alloc]init];
                NSDictionary *dataDic = responseObject[@"data"][0];
                NSArray *arr = dataDic[@"list_show"];
                [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    MapBottomModel *model = [[MapBottomModel alloc]initWithDic:obj];
                    [dataArray addObject:model];
                }];
                if (dataArray.count >0) {
                    HomePageListViewController * homeListVC =[[HomePageListViewController alloc]init];
                    homeListVC.dataArray =dataArray;
                    [self.VC.navigationController pushViewController:homeListVC animated:YES];
                }else{
                    CustomNoFoodAlert *alert =[[CustomNoFoodAlert alloc]initWithFrame:[UIScreen mainScreen].bounds];
                    UIWindow *window = [[UIApplication sharedApplication].delegate window];
                    if ([acc.classtype isEqualToString:@"1"]) {
                        alert.messageLab.text = @"附近暂时没有餐厅\n换个地方试试";
                    }
                    if ([acc.classtype isEqualToString:@"2"]) {
                        alert.messageLab.text = @"附近暂时没有景点\n换个地方试试";
                    }
                    if ([acc.classtype isEqualToString:@"3"]) {
                        alert.messageLab.text = @"附近暂时没有商场\n换个地方试试";
                    }
                    if ([acc.classtype isEqualToString:@"4"]) {
                        alert.messageLab.text = @"附近暂时没有酒店\n换个地方试试";
                    }
                    [window addSubview:alert];
                }
                
              
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
            
        }else{
          
        }
    } failure:^(NSError *error) {
        [PubulicObj ShowSVWhitMessage];
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"网络错误"];
    } isShowHUD:YES];
    
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

- (void)goMap{
    HomePageMapViewController *vc =[[HomePageMapViewController alloc]init];
    vc.VCType = 1;
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [self.VC.navigationController pushViewController:vc animated:NO];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)getCityName{

    NSString *string =[CustomAccount sharedCustomAccount].cityName;
    NSString *CName =[CustomAccount sharedCustomAccount].cityName;

    NSString *shi =[string substringFromIndex:string.length-1];
    if ([shi isEqualToString:@"市"]) {
        string =[string substringToIndex:string.length-1];
        CName =string;
    }
    if ([CustomAccount sharedCustomAccount].cityEnName !=nil &&[CustomAccount sharedCustomAccount].cityEnName.length !=0) {
        string = [NSString stringWithFormat:@"%@\n%@",string,[CustomAccount sharedCustomAccount].cityEnName];
    }
    if ([CustomAccount sharedCustomAccount].cityName.length ==0 || string == nil) {
        string = [NSString stringWithFormat:@"%@",[CustomAccount sharedCustomAccount].cityEnName];
        CName =[CustomAccount sharedCustomAccount].cityEnName;
    }
    
    
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:string];
    [att addAttribute:NSFontAttributeName value:FontSize(18) range:NSMakeRange(0, CName.length)];
    _titleLab.font =FontSize(15);
    _titleLab.attributedText = att;
    
    GMSCameraPosition *position1 = [GMSCameraPosition cameraWithTarget:[CustomAccount sharedCustomAccount].cityLocation zoom:14];
    [self.mapV animateToCameraPosition:position1];
    
}

- (void)dealloc{
    [_mapV removeFromSuperview];
    _mapV =nil;
}
@end

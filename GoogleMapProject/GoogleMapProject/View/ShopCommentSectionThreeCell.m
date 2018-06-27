//
//  ShopCommentSectionThreeCell.m
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import "ShopCommentSectionThreeCell.h"
#import "YFScrollView.h"
@interface ShopCommentSectionThreeCell ()
@property (nonatomic,strong)NSMutableArray *imageArr;
@end
@implementation ShopCommentSectionThreeCell

- (NSMutableArray *)imageArr {
    if (!_imageArr) {
        _imageArr = [[NSMutableArray alloc]initWithCapacity:9];
        CGFloat width =(screenWigth-50)/4;
        for (int i =0; i<11; i++) {
            
            UIButton *but = [UIButton new];
            but.frame = CGRectMake(10 +(width +10)*(i%4),35+ 5+(width+10)*(i/4), width, width);
            but.tag =900+i;
            but.imageView.contentMode =UIViewContentModeScaleAspectFill;
            
            UIButton *cancelBut =[[UIButton alloc]initWithFrame:CGRectMake(width-25, 0, 25, 25)];
            cancelBut.tag =900+i;
            [cancelBut setImage:[UIImage imageNamed:@"tuichu"] forState:UIControlStateNormal];
            [cancelBut setImageEdgeInsets:UIEdgeInsetsMake(2.5, 2.5, 2.5, 2.5)];
            [cancelBut addTarget:self action:@selector(cancelimages:) forControlEvents:UIControlEventTouchUpInside];
            [but addSubview:cancelBut];
            [_imageArr addObject:but];
        }
    }
    return _imageArr;
}
- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray =dataArray;
    for (int i =0; i <10; i ++) {
        UIButton *imageV = self.imageArr[i];
        [imageV removeFromSuperview];
    }
    
    UIButton *imageV = self.imageArr[dataArray.count];
    _addBut.frame =CGRectMake(imageV.frame.origin.x, imageV.frame.origin.y, imageV.frame.size.width, imageV.frame.size.height);
    [self.contentView bringSubviewToFront:_addBut];
    
    for (int i =0; i <_dataArray.count; i ++) {
        if (i>=9) {
            return;
        }
        UIButton *imageV = self.imageArr[i];
        [imageV setImage:dataArray[i] forState:UIControlStateNormal];
        [imageV addTarget:self action:@selector(BrowsePictures:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:imageV];
    }
    if (dataArray.count >=9) {
        return;
    }
  
}

- (void)setImgUrlArray:(NSMutableArray *)imgUrlArray{
    _imgUrlArray =imgUrlArray;
    if (self.dataArray.count ==0) {
        for (int i =0; i <11; i ++) {
            UIButton *imageV = self.imageArr[i];
            [imageV removeFromSuperview];
        }
        
        UIButton *imageV = self.imageArr[imgUrlArray.count];
        _addBut.frame =CGRectMake(imageV.frame.origin.x, imageV.frame.origin.y, imageV.frame.size.width, imageV.frame.size.height);
        [self.contentView bringSubviewToFront:_addBut];
        
        for (int i =0; i <imgUrlArray.count; i ++) {
            UIButton *imageV = self.imageArr[i];
            DLog(@"imgUrlArray==%@",imgUrlArray[i]);
            [imageV sd_setImageWithURL:[NSURL URLWithString:imgUrlArray[i]] forState:UIControlStateNormal];
            [imageV addTarget:self action:@selector(BrowsePictures:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:imageV];
            UIButton *cancelBut =[imageV viewWithTag:1000+i];
            cancelBut.hidden =YES;
        }
        
     
        
    }
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        _addBut =[UIButton new];
        [self.contentView addSubview:_addBut];
        [_addBut setBackgroundImage:[UIImage imageNamed:@"用户_04"] forState:UIControlStateNormal];
        
        UILabel *titleLab =[UILabel new];
        [self.contentView addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset =10;
            make.left.offset =10;
            make.right.offset =10;
        }];
        titleLab.textColor = [UIColor grayColor];
        titleLab.text = @"上传照片";
        
        
    }
    return self;
}
- (void)BrowsePictures:(UIButton *)but{
  
        UIWindow *window =[[UIApplication sharedApplication].delegate window];
        YFScrollView *Myscroll = [[YFScrollView alloc]initWithFrame:self.controller.view.bounds];
        Myscroll.backgroundColor =[UIColor blackColor];
        Myscroll.selectNum =but.tag-900;
        Myscroll.ImagesArry = self.dataArray;
        
        [window addSubview:Myscroll];
    
    
    
}
- (void)cancelimages:(UIButton *)but{
    if (self.cancelImgsBlock) {
        self.cancelImgsBlock(but.tag-900);
    }
}
@end

//
//  ShopCommentSectionOneCell.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/6/27.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCommentSectionOneCell : UITableViewCell
@property (nonatomic,strong)UITextView *textV;
@property (nonatomic,strong)UILabel *plachodlLab;
@property (nonatomic,copy)NSString *descriptionstr;
@property (nonatomic,copy)void(^textChangeBlock)(NSString *str);
@end

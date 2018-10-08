//
//  SearchHistoryView.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/10/8.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchHistoryView : UIView

@property (nonatomic,copy) void(^selectHistoryKeyBlock)(NSString * historyKey);

@end

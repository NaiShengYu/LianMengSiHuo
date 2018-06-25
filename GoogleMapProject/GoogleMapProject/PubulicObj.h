//
//  PubulicObj.h
//  APPDemoForAll
//
//  Created by 俞乃胜 on 17/2/9.
//  Copyright © 2017年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface PubulicObj : NSObject
/**
 *判断手机号码是否正确
 *
 */
+ (NSString *)valiMobile:(NSString *)mobile;
/**
 *  是否登录了
 */
+ (BOOL)isLoging;

/**
    系统缓存大小
 */
+ (float)getFileSize;

+ (void)getUserInfo;
/**
 *   获取当前时区的时间
 */

+ (NSDate *)getNowDateWithDate:(NSDate *)date;

/**
 *   两个日期相距多少天
 */
+ (NSInteger)getDifferenceByDate:(NSString *)date ;

/**
 根据 PHAsset 来获取 媒体文件(视频或图片)相关信息：文件名、文件上传类型（data 或 path）
 
 @param asset  PHAsset对象
 @param completion 成功回调
 */

+ (void)getMediaInfoFromAsset: (PHAsset *)asset completion: (void(^)(NSString *name, id pathData))completion;


+ (void)ShowSVWithoutImage;
@end

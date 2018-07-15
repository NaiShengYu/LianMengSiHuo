//
//  AFNetRequest.m
//  ShangChengApp
//
//  Created by 俞乃胜 on 16/11/30.
//  Copyright © 2016年 俞乃胜. All rights reserved.
//

#import "AFNetRequest.h"
@implementation AFNetRequest
// post 请求
+ (void)HttpPostCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure isShowHUD:(BOOL)animation
{
    if (animation==YES) {
        [PubulicObj ShowSVWithoutImage];
        [SVProgressHUD showInfoWithStatus:@""];
    }
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"charset=utf-8",@"text/css",@"text/fild", nil];
            [manager POST:Url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (animation) {
                    [SVProgressHUD dismiss];
                }
                NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                DLog(@"str==%@",str);
                str =[str stringByReplacingOccurrencesOfString:@"\n" withString:instailString];
                str =[str stringByReplacingOccurrencesOfString:@"\r" withString:instailString];
                NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
                //系统自带JSON解析
                NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
                if (success) {
                    success (resultDic);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (animation) {
                    [SVProgressHUD dismiss];
                }
                if (error) {
                    failure (error);
                }
            }];
    
}

//post 图片
+ (void)HttpPostImageCallBack:(NSString *)Url Parameters:(NSDictionary *)dict ImageArrays:(NSMutableArray *)imagesArray success:(httpSuccess)success failure:(httpFailure)failure{

   
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"charset=utf-8",@"text/css",@"text/fild", nil];
            [SVProgressHUD show];
            
            [manager POST:Url parameters:dict
                 progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                DLog(@"responseObject==%@",responseObject);
                str =[str stringByReplacingOccurrencesOfString:@"\n" withString:instailString];
                str =[str stringByReplacingOccurrencesOfString:@"\r" withString:instailString];
                NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
                //系统自带JSON解析
                NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
                if (success) {
                    success (responseObject);
                    
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [SVProgressHUD dismiss];
                if (error) {
                    failure (error);
                }
                
            }];
            
      
}
// get  请求
+ (void)HttpGetCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure isShowHUD:(BOOL)animation
{
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    Url = [Url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status ==AFNetworkReachabilityStatusNotReachable) {
            [SVProgressHUD showErrorWithStatus:@"网络不能连接!"];
            NSLog(@"网络不能连接");
        }else{
            if (animation) {
                [SVProgressHUD show];
            }
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"charset=utf-8",@"text/css",@"text/fild", nil];
            [manager GET:Url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (animation) {
                    [SVProgressHUD dismiss];
                }
                NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                DLog(@"str==%@",str);
                str =[str stringByReplacingOccurrencesOfString:@"\n" withString:instailString];
                str =[str stringByReplacingOccurrencesOfString:@"\r" withString:instailString];
                str =[str stringByReplacingOccurrencesOfString:@"\t" withString:instailString];
                DLog(@"str2=%@",str);
                
                NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
                //系统自带JSON解析
                NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingAllowFragments error:nil];
                if (success) {
                    success(resultDic);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"error====%@",error);
                if (animation) {
                    [SVProgressHUD dismiss];
                }
                [PubulicObj ShowSVWhitMessage];
                [SVProgressHUD showErrorWithStatus:@"网络错误"];
                if (failure) {
                    failure(error);
                }
            }];
         }
    }];
}
+ (void)httpGetAsystemWithUrl:(NSString *)url success:(httpSuccess)success failure:(httpFailure)failure isShowHUD:(BOOL)animation{
    if (animation) {
        [SVProgressHUD show];
    }
    NSOperationQueue *queue =[[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        NSString *urlstr =[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        DLog(@"urlstr==%@",urlstr);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"charset=utf-8",@"text/css",@"text/fild", nil];
    [manager GET:urlstr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             DLog(@"responseObject==%@",responseObject);
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (animation) {
                     
                     [SVProgressHUD dismiss];
                 }
                 NSDictionary *resultDic;
                 if (![responseObject isKindOfClass:[NSDictionary class]]) {
                     NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                     DLog(@"str==%@",str);
                     str =[str stringByReplacingOccurrencesOfString:@"\n" withString:instailString];
                     str =[str stringByReplacingOccurrencesOfString:@"\r" withString:instailString];
                     str =[str stringByReplacingOccurrencesOfString:@"\t" withString:instailString];
                     DLog(@"str2=%@",str);
                     
                     NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
                     //系统自带JSON解析
                     resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingAllowFragments error:nil];
                 }else{
                     resultDic =responseObject;
                 }
               
                 if (success) {
                     success(resultDic);
                 }
             });
                 
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             DLog(@"error====%@",error);
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (animation) {
                     [SVProgressHUD dismiss];
                 }
                 [SVProgressHUD showErrorWithStatus:@"网络错误"];
                 if (failure) {
                     failure(error);
                 }
             });

         }];
 }];
}



-(NSString *)removeUnescapedCharacter:(NSString *)inputStr{ NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];//获取那些特殊字符
    NSRange range = [inputStr rangeOfCharacterFromSet:controlChars]; //寻找字符串中有没有这些特殊字符
    if (range.location != NSNotFound){ NSMutableString *mutable = [NSMutableString stringWithString:inputStr];
        while (range.location != NSNotFound) {
            [mutable deleteCharactersInRange:range];//去掉这些特殊字符
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputStr;
}
@end

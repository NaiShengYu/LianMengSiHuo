//
//  CustomMarker.h
//  GoogleMapProject
//
//  Created by Nasheng Yu on 2018/7/9.
//  Copyright © 2018年 俞乃胜. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "MapBottomModel.h"
@interface CustomMarker : GMSMarker

@property (nonatomic,strong)MapBottomModel *bottomModel;
@end

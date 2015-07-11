//
//  NetworkHelper.h
//  LoveSport
//
//  Created by Liang Zhang on 14/11/28.
//  Copyright (c) 2014年 bangtianxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"

@interface NetworkHelper : NSObject

+ (void)startMonitorNetworkConnection;
+ (void)stopMonitorNetworkConnection;

@end

//
//  NetworkHelper.m
//  LoveSport
//
//  Created by Liang Zhang on 14/11/28.
//  Copyright (c) 2014年 bangtianxia. All rights reserved.
//

#import "NetworkHelper.h"

@implementation NetworkHelper

+ (void)startMonitorNetworkConnection{
    AFNetworkReachabilityManager *afNetworkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [afNetworkReachabilityManager startMonitoring];
    
    [afNetworkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                break;
            }
            default:
                break;
        }
    }];
}

+(void)stopMonitorNetworkConnection{
    AFNetworkReachabilityManager *afNetworkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [afNetworkReachabilityManager stopMonitoring];
}
@end

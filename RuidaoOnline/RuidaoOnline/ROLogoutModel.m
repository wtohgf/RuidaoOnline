//
//  ROLogoutModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/7.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLogoutModel.h"

@implementation ROLogoutModel

+(instancetype)logoutReturnModelWithDict:(NSDictionary*)dict{
    
    if (dict == nil) {
        return nil;
    }
    
    ROLogoutModel* model = [[ROLogoutModel alloc]init];
    if (model != nil) {
        //根据字典 进行模型的初始化
        NSDictionary* loginReturnDict = [dict objectForKey:@"logoutReturn"];
        
        NSString* logoutFlag = [loginReturnDict objectForKey:@"logoutFlag"];
        model.logoutFlag = logoutFlag;

    }
    return model;
}
@end

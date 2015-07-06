//
//  ROLogonReturnModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/4.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLogonReturnModel.h"

@implementation ROLogonReturnModel

+(instancetype)logonReturnModelWithDict:(NSDictionary*)dict{
    
    if (dict == nil) {
        return nil;
    }
    
    ROLogonReturnModel* model = [[ROLogonReturnModel alloc]init];
    if (model != nil) {
        //根据字典 进行模型的初始化
        NSDictionary* loginReturnDict = [dict objectForKey:@"loginReturn"];
        
        NSString* loginFlag = [loginReturnDict objectForKey:@"loginFlag"];
        model.loginFlag = loginFlag;
        NSString* msg = [loginReturnDict objectForKey:@"msg"];
        model.msg = msg;
    }
    return model;
}

@end

//
//  RONetworkMngTool.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/4.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "RONetworkMngTool.h"
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import "MBProgressHUD+ROHUD.h"
#import "ROLogonReturnModel.h"
#import "ROLogoutModel.h"

static RONetworkMngTool* tool;

@implementation RONetworkMngTool

+ (instancetype)sharedNetworkMngTool{
    static dispatch_once_t predicate;
    //下边是保证分配空间的操作 只做一次 保证了单例对象
    dispatch_once(&predicate, ^{
        tool = [[RONetworkMngTool alloc]init];
    });
    return tool;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t predicate;
    //下边是保证分配空间的操作 只做一次 保证了单例对象
    dispatch_once(&predicate, ^{
        tool = [super allocWithZone:zone];
    });
    return tool;
}

-(void)RONetwork_LogonWithParameters:(NSDictionary*)parameters View:(UIView*)view Result:(NetworkBlock) block{
    
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //向服务器发送登录请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:RO_LOGON parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block != nil) {
            
            //将返回的字典转换为模型对象
            ROLogonReturnModel* logonReturnModel = [ROLogonReturnModel logonReturnModelWithDict:responseObject];
            if (logonReturnModel != nil) {
                if ([logonReturnModel.loginFlag isEqualToString:@"1"]) {
                    block(@"1");
                }else{
                    [MBProgressHUD showDelayHUDToView:view messeage:logonReturnModel.msg];
                    block(@"0");
                }
            }
            else
            {
                [MBProgressHUD showDelayHUDToView:view messeage:@"可能网络原因 登录失败"];
                block(@"0");
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        [MBProgressHUD showDelayHUDToView:view messeage:@"可能网络原因 登录失败"];
        if (block != nil) {
            block(@"0");
        }
    }];
}

-(void)RONetwork_LogoutView:(UIView *)view Result:(NetworkBlock)block{
    
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //向服务器发送登录请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:RO_LOGOUT parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block != nil) {
            
            //将返回的字典转换为模型对象
            ROLogoutModel* logoutModel = [ROLogoutModel logoutReturnModelWithDict:responseObject];
            if (logoutModel != nil) {
                if ([logoutModel.logoutFlag isEqualToString:@"1"]) {
                    [MBProgressHUD showDelayHUDToView:view messeage:@"退出成功"];
                    block(@"1");
                }else{
                    [MBProgressHUD showDelayHUDToView:view messeage:@"可能网络原因 退出失败"];
                    block(@"0");
                }
            }
            else
            {
                [MBProgressHUD showDelayHUDToView:view messeage:@"可能网络原因 退出失败"];
                block(@"0");
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        [MBProgressHUD showDelayHUDToView:view messeage:@"可能网络原因 退出失败"];
        if (block != nil) {
            block(@"0");
        }
    }];
}


-(void)RONetwork_GetPositionListView:(UIView *)view Result:(NetworkPositonListBlock)block{
    
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //向服务器发送登录请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:RO_GETPOSTIONLIST parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        /* 没有登录的情况下 会反回一下信息
         {
         noLoginReturn =     {
         msg = "\U8bf7\U5148\U767b\U5f55";
         noLoginFlag = 0;
         };
         }
        */
        [MBProgressHUD hideHUDForView:view animated:YES];
        if (block != nil) {
            //将返回的字典转换为模型对象
            
           
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        [MBProgressHUD showDelayHUDToView:view messeage:@"可能网络原因 退出失败"];
        if (block != nil) {
            block(nil);
        }
    }];
}

@end

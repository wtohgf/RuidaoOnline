//
//  RONetworkMngTool.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/4.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*定义所有的服务器API*/
//登录接口
#define RO_LOGON @"http://www.neuedu.cn/m/mobileLogin!loginNeu.action"

//退出接口
#define RO_LOGOUT @"http://www.neuedu.cn/m/mobileLogout!logoutNeu.action"


typedef void (^NetworkBlock)(NSString* flag);

@interface RONetworkMngTool : NSObject
//定义一个静态函数 返回工具单例对象
+ (instancetype)sharedNetworkMngTool;


//登录操作
-(void)RONetwork_LogonWithParameters:(NSDictionary*)parameters View:(UIView*)view Result:(NetworkBlock) block;

//登出操作
-(void)RONetwork_LogoutView:(UIView*)view Result:(NetworkBlock) block;

@end

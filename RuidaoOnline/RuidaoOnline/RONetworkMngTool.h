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

//获取岗位信息
#define RO_GETPOSTIONLIST @"http://www.neuedu.cn/m/mobilePostInfo!findPostInfo.action"

//获取岗位下关联课程
#define RO_GETCOURSELIST @"http://www.neuedu.cn/m/mobilePostCourse!findPostCourse.action"

typedef void (^NetworkBlock)(NSString* flag);
typedef void (^NetworkPositonListBlock)(NSArray* posList);
typedef void (^NetworkCourseListBlock)(NSArray* courseList);

@interface RONetworkMngTool : NSObject
//定义一个静态函数 返回工具单例对象
+ (instancetype)sharedNetworkMngTool;


//登录操作
-(void)RONetwork_LogonWithParameters:(NSDictionary*)parameters View:(UIView*)view Result:(NetworkBlock) block;

//登出操作
-(void)RONetwork_LogoutView:(UIView*)view Result:(NetworkBlock) block;

//获取岗位信息
-(void)RONetwork_GetPositionListView:(UIView*)view Result:(NetworkPositonListBlock) block;

//获取岗位下关联课程
-(void)RONetwork_GetCourseListParameters:(NSDictionary*)parameters View:(UIView *)view Result:(NetworkCourseListBlock) block;

@end

//
//  ROLogonReturnModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/4.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 strong 强引用 一般用于修饰OC对象
 weak 弱引用 一般用于修饰 子控件（View）
 copy 用于修饰NSString
 */


/* {}字典 []数组
 {
 loginReturn =     {
 loginFlag = 1;
 msg = "<null>";
 };
 }
 */

/*
 loginFlag  1或0；（1为成功；0为失败）
 msg      错误提示信息（失败才有错误消息；成功提示信息为空）
 */
@interface ROLogonReturnModel : NSObject
@property (copy, nonatomic) NSString* loginFlag;
@property (copy, nonatomic) NSString* msg;

+(instancetype)logonReturnModelWithDict:(NSDictionary*)dict;

@end

//
//  MBProgressHUD+ROHUD.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/3.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (ROHUD)

//延时显示message内容到指定的View
+ (void)showDelayHUDToView:(UIView*)view messeage:(NSString*)message;

@end

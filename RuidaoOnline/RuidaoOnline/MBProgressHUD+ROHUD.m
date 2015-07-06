//
//  MBProgressHUD+ROHUD.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/3.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "MBProgressHUD+ROHUD.h"

@implementation MBProgressHUD (ROHUD)

+(void)showDelayHUDToView:(UIView *)view messeage:(NSString *)message{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    HUD.yOffset = view.frame.size.height*1/4;
    HUD.customView = [[UIImageView alloc] initWithFrame:CGRectZero];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = message;
    [HUD show:YES];
    [HUD hide:YES afterDelay: 1.f];
}

@end

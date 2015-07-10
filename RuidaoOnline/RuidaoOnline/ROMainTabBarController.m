//
//  ROMainTabBarController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/6.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROMainTabBarController.h"
#import <RDVTabBarItem.h>

@implementation ROMainTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    //设置 所有的子控制器 定义字控制器的图标和标题
    [self setupTabBarController];
}

#pragma mark 设置 所有的子控制器 定义字控制器的图标和标题
- (void)setupTabBarController{
    
    //从storyBoard中取得 在线学习主页对应的导航控制器即可。
    UIStoryboard* onlineLearnStoryBoard = [UIStoryboard storyboardWithName:@"OnlineLearn" bundle:nil];
    
    UIViewController* onlineLearnNavgationController = [onlineLearnStoryBoard instantiateViewControllerWithIdentifier:@"onLineLearnNav"];
    
    
    UIStoryboard* onolinetestStoryBoard = [UIStoryboard storyboardWithName:@"OnLineTest" bundle:nil];
    
    UIViewController* onlineTestNavgationController = [onolinetestStoryBoard instantiateViewControllerWithIdentifier:@"onlineTestNav"];
    
    UIStoryboard* meStoryBoard = [UIStoryboard storyboardWithName:@"Me" bundle:nil];
    
    UIViewController* meNavgationController = [meStoryBoard instantiateViewControllerWithIdentifier:@"meNav"];
    
    [self setViewControllers:@[onlineLearnNavgationController, onlineTestNavgationController, meNavgationController]];

    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third"];
    NSArray *tabBarItemTitles = @[@"在线学习", @"在线测试", @"我"];
    
    RDVTabBar *tabBar = [self tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = tabBarItemTitles[index];
        index++;
    }

}

@end

//
//  ROBaseViewController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROBaseViewController.h"
#import <RDVTabBarController.h>

@interface ROBaseViewController ()

@end

@implementation ROBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏tabBar
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES];
}

//显示tabBar
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.rdv_tabBarController setTabBarHidden:NO];
}

@end

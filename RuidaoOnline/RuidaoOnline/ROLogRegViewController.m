//
//  ROLogRegViewController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/2.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLogRegViewController.h"

@interface ROLogRegViewController ()

@end

@implementation ROLogRegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 返回主页
- (IBAction)backToMainPage:(UIButton *)sender {
    //返回上一级控制器 即主页
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 登录
- (IBAction)logon:(UIButton *)sender {
}

#pragma mark 注册
- (IBAction)regeist:(UIButton *)sender {
}

@end

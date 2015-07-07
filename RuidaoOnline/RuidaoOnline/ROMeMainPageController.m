//
//  ROMeMainPageController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/6.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROMeMainPageController.h"
#import "RONetworkMngTool.h"

@interface ROMeMainPageController ()
//@property (weak, nonatomic) IBOutlet UIButton *logoutbutton;

- (IBAction)logout:(UIButton *)sender;

@end

@implementation ROMeMainPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if(section == 1)
    {
        return 5;
    }
    else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell  = [tableView dequeueReusableCellWithIdentifier:@"MeCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"pic_checked"];
        cell.textLabel.text = @"关于睿道";
    }else if(indexPath.section == 1){
        cell  = [tableView dequeueReusableCellWithIdentifier:@"MeCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"second_selected"];
        cell.textLabel.text = @"测试测试111";
    }else{
        cell  = [tableView dequeueReusableCellWithIdentifier:@"LogoutCell" forIndexPath:indexPath];
    }
    // Configure the cell...
    
    return cell;
}

#pragma mark 在用户点击了TableView的任意一行时调用这个代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //第一组 第一行
    if (indexPath.section == 0 && indexPath.row == 0) {
        //方法1:使用导航控制器 push的方式切换
//        UIStoryboard* story = [UIStoryboard storyboardWithName:@"Me" bundle:nil];
//        UIViewController* aboutRuiDao = [story instantiateViewControllerWithIdentifier:@"aboutRuidao"];
//        [self.navigationController pushViewController:aboutRuiDao animated:YES];
        
        //方法2:使用Segue切换到其他界面
        [self performSegueWithIdentifier:@"toAboutRuidao" sender:nil];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 60.f;
    }
    return 44.f;
}

#pragma mark 退出功能
- (IBAction)logout:(UIButton *)sender {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"友情提示" message:@"您确认要退出吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            //取消退出 不做任何操作
        }
            break;
        case 1:
        {
            //登出操作 使用RONetworkMngTool
            [[RONetworkMngTool sharedNetworkMngTool]RONetwork_LogoutView:self.view Result:^(NSString *flag) {
                if ([flag isEqualToString:@"1"]) {
                    //如果退出成功
                    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    UIViewController* logonNav = [storyBoard instantiateViewControllerWithIdentifier:@"LogonNav"];
                    //[UIApplication sharedApplication].keyWindow.rootViewController = logonNav;
                    [UIApplication sharedApplication].delegate.window.rootViewController =  logonNav;
                }
            }];
        }
            break;
            
        default:
            break;
    }
}

@end

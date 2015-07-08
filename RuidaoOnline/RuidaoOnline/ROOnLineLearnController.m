//
//  ROOnLineLearnController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/7.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROOnLineLearnController.h"
#import "RONetworkMngTool.h"
#import "ROPostionModel.h"
#import <UIImageView+AFNetworking.h>
#import "ROPosDetailController.h"

@interface ROOnLineLearnController ()
@property (strong, nonatomic) NSArray* posList;
@end

@implementation ROOnLineLearnController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //向服务器发送获取岗位信息的请求
    [[RONetworkMngTool sharedNetworkMngTool]RONetwork_GetPositionListView:self.view Result:^(NSArray *posList) {
        _posList = posList;
        //刷新tableView 暂时信息
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (_posList == nil) {
        return 0;
    }
    return _posList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"positionCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (_posList != nil) {
        ROPostionModel* postion = _posList[indexPath.row];
        //显示岗位名称
        cell.textLabel.text = postion.postName;
        //从网络下载岗位图片进行显示
        NSString* imageStr = postion.postUrl;
        NSURL* imageURL = [NSURL URLWithString:imageStr];
        [cell.imageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ROPostionModel* postion = _posList[indexPath.row];
    //完成从本页面向岗位详细信息界面的切换
    [self performSegueWithIdentifier:@"toDetailPosInfo" sender:postion];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //取出将要切换到的目标控制器
    ROPosDetailController* posDetailController = segue.destinationViewController;
    //将点击选择的岗位赋值目标控制器的属性，将岗位信息传递过去。
    posDetailController.position = sender;
}

@end

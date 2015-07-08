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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"positionCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (_posList != nil) {
        ROPostionModel* postion = _posList[indexPath.row];
        cell.textLabel.text = postion.postName;
    }
    return cell;
}

@end

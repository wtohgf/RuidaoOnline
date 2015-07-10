//
//  ROPosDetailController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/8.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROPosDetailController.h"
#import <RDVTabBarController.h>
#import "ROPositionHeaderCell.h"
#import "ROCourseIntroduceCell.h"
#import <UIImageView+AFNetworking.h>

@interface ROPosDetailController ()

@end

@implementation ROPosDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //更具传递过来的岗位模型，设置title
    if (_position != nil) {
        self.title = _position.postName;
    }
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
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* basecell = nil;
    
    if (indexPath.row == 0) {
        ROPositionHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"positionHeaderCell" forIndexPath:indexPath];
        
        cell.frame = CGRectMake(0.f, 0.f, [UIScreen mainScreen].bounds.size.width, CELLHEIGHT);
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // Configure the cell...
        NSString* imageStr = _position.postUrl;
        NSURL* imageURL = [NSURL URLWithString:imageStr];
        [cell.postImageView setImageWithURL:imageURL];
        //学习人数 从NSNumber向NSString转化
        cell.studyPersonCount.text = [NSString stringWithFormat:@"%@", _position.personNums];
        //课程数量
        cell.courseCount.text = [NSString stringWithFormat:@"%@", _position.courseNums];
        //学习时长
        cell.studyTime.text = [NSString stringWithFormat:@"%@", _position.courseHours];
        //是否学习过(NSNumber)
        if ([_position.isStudy integerValue] == 0) {
            cell.isLearn.text = @"否";
        }else{
            cell.isLearn.text = @"是";
        }
        basecell = cell;
    }else if(indexPath.row == 1){
        ROCourseIntroduceCell* cell = (ROCourseIntroduceCell*)[tableView dequeueReusableCellWithIdentifier:@"courseIntrCell" forIndexPath:indexPath];
        //先设置模型
        cell.postion = _position;
        //再算Cell的frame
        cell.frame = CGRectMake(0.f, 0.f, [UIScreen mainScreen].bounds.size.width, [ROCourseIntroduceCell cellHeightWithPostinModel:_position]);
        
        basecell = cell;
    }
    
    return basecell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return CELLHEIGHT;
    }else if(indexPath.row == 1){
        //返回可变的cell高度 需要根据模型的内容进行计算
        return [ROCourseIntroduceCell cellHeightWithPostinModel:_position];
    }else{
        return 0;
    }
}

@end

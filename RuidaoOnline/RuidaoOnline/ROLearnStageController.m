//
//  ROLearnStageController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLearnStageController.h"
#import "RONetworkMngTool.h"
#import "ROChildStageModel.h"
#import "ROLearnStageModel.h"
#import "ROCourseResModel.h"

@interface ROLearnStageController ()
@property (strong, nonatomic) NSArray* courseList;
@end

@implementation ROLearnStageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取详细课程的网络接口
    if(_postId != nil){
        NSDictionary* parameters = @{@"postid": _postId};
        [[RONetworkMngTool sharedNetworkMngTool]RONetwork_GetCourseListParameters:parameters View:self.view Result:^(NSArray *courseList) {
            _courseList = courseList;
            //更新数据后 需要刷tableView， 进行重新显示
            [self.tableView reloadData];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    //一个Stage显示到一个Section
    if (_courseList != nil) {
        return _courseList.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_courseList == nil) {
        return 0;
    }
    //通过section 从学习阶段列表_courseList 取得对应的学习阶段模型
    ROLearnStageModel* learnStage = _courseList[section];
    //遍历学习阶段模型中的子阶段childStageList 默认一个阶段只有一个子阶段
    ROChildStageModel* childStage = [learnStage.childStageList firstObject];
    
    return childStage.childStageResList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseResCell" forIndexPath:indexPath];
    
    // Configure the cell...
    //通过section 从学习阶段列表_courseList 取得对应的学习阶段模型
    ROLearnStageModel* learnStage = _courseList[indexPath.section];
    //遍历学习阶段模型中的子阶段childStageList
    ROChildStageModel* childStage = [learnStage.childStageList firstObject];
    
    //通过index.row 返回的行号 作为索引找到对应行的课程资源模型
    ROCourseResModel* courseRes = childStage.childStageResList[indexPath.row];
    //设定课程资源的名称
    cell.textLabel.text = courseRes.resName;
    
    return cell;
}
//每section的头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}

//定义每组头的title 标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //通过section 从学习阶段列表_courseList 取得对应的学习阶段模型
    ROLearnStageModel* learnStage = _courseList[section];
    //遍历学习阶段模型中的子阶段childStageList
    ROChildStageModel* childStage = [learnStage.childStageList firstObject];
    
    NSString* title = [NSString stringWithFormat:@"%@-%@", learnStage.parentStageName, childStage.stageName];
    return title;
}


@end

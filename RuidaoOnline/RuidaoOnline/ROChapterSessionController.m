//
//  ROChapterSessionController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROChapterSessionController.h"
#import "RONetworkMngTool.h"
#import "ROChapterModel.h"
#import "ROSessionModel.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AFNetworkReachabilityManager.h>
#import "MBProgressHUD+ROHUD.h"

@interface ROChapterSessionController ()
@property (strong, nonatomic) NSArray* chapterList;
@property (strong, nonatomic) NSURL* playURL;
@end

@implementation ROChapterSessionController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_courseName != nil) {
        self.title = _courseName;
    }
    NSDictionary* parameters = @{@"courseid": _courseid};
    [[RONetworkMngTool sharedNetworkMngTool] RONetwork_GetDetailCourseListParameters:parameters View:self.view Result:^(NSArray *detailcourseList) {
        ;
        _chapterList = detailcourseList;
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
    return _chapterList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    ROChapterModel* chapter = _chapterList[section];
    return chapter.sessionList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SeccsionCell" forIndexPath:indexPath];
    
    // Configure the cell...
    ROChapterModel* chapter = _chapterList[indexPath.section];
    ROSessionModel* session = chapter.sessionList[indexPath.row];
    
    cell.textLabel.text = session.title;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}

//自定义seciton的header的图形View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel* header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30.f)];
    
    header.backgroundColor = [UIColor purpleColor];
    header.textColor = [UIColor whiteColor];
    
    ROChapterModel* chapter = _chapterList[section];
    header.text = chapter.title;
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ROChapterModel* chapter = _chapterList[indexPath.section];
    ROSessionModel* session = chapter.sessionList[indexPath.row];
    
    
    if ([AFNetworkReachabilityManager sharedManager].reachableViaWiFi) {
        //根据取得的对应小节的url进行在线视频播放学习
        NSString* playURLString = session.url;
        NSURL* playURL = [NSURL URLWithString:playURLString];
        
        MPMoviePlayerViewController* player = [[MPMoviePlayerViewController alloc]initWithContentURL:playURL];
        [self presentMoviePlayerViewControllerAnimated:player];
    }else if( [AFNetworkReachabilityManager sharedManager].reachableViaWWAN){
        NSString* playURLString = session.url;
        NSURL* playURL = [NSURL URLWithString:playURLString];
        _playURL = playURL;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前WIFI未连接 会耗费流量" delegate:self cancelButtonTitle:@"不看了" otherButtonTitles:@"继续看", nil];
        alert.delegate = self;
        alert.tag = 111;
        [alert show];
        
    }else{
        [MBProgressHUD showDelayHUDToView:self.view messeage:@"网络链接错误 请检查网络"];
    }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
        case 1:
        {
            //继续观看视频
            if (alertView.tag == 111) {
                //根据取得的对应小节的url进行在线视频播放学习
                MPMoviePlayerViewController* player = [[MPMoviePlayerViewController alloc]initWithContentURL:_playURL];
                [self presentMoviePlayerViewControllerAnimated:player];
            }
            break;
        default:
            break;
        }
    }
}


@end

//
//  ROOnlineTestController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROOnlineTestController.h"
#import "ROOnlineTestQuestionController.h"

@interface ROOnlineTestController ()
@property (strong, nonatomic) NSArray* testTitleList;
@end

@implementation ROOnlineTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"OnlineTestTitle.plist" ofType:nil];
    
    _testTitleList = [NSArray arrayWithContentsOfFile:path];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _testTitleList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"onLineTestCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary* dict = _testTitleList[indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* testTitleDict = _testTitleList[indexPath.row];
    [self performSegueWithIdentifier:@"toRealTest" sender:testTitleDict];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ROOnlineTestQuestionController* ontestCtlr = segue.destinationViewController;
    ontestCtlr.testTitle = sender;
}

@end

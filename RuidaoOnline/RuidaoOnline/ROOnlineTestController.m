//
//  ROOnlineTestController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROOnlineTestController.h"

@interface ROOnlineTestController ()
@property (strong, nonatomic) NSArray* testTitleList;
@end

@implementation ROOnlineTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"OnlineTestTitle.plist" ofType:nil];
    
    _testTitleList = [NSArray arrayWithContentsOfFile:path];
    
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
    cell.textLabel.text = _testTitleList[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toRealTest" sender:nil];
}

@end

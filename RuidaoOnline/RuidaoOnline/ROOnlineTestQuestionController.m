//
//  ROOnlineTestQuestionController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROOnlineTestQuestionController.h"
#import "MBProgressHUD+ROHUD.h"
#import "ROTestTableViewCell.h"

@interface ROOnlineTestQuestionController ()

@property (strong, nonatomic) NSArray* questionList;
@property (strong, nonatomic) NSMutableArray* answerList;
@property (assign, nonatomic) NSInteger curQuestionIndex;
@property (assign, nonatomic) NSInteger curSelectedIndex;

- (IBAction)upQuestion:(UIButton *)sender;
- (IBAction)nextQuestion:(UIButton *)sender;

@end

@implementation ROOnlineTestQuestionController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* path = [[NSBundle mainBundle]pathForResource:@"CTestList.plist" ofType:nil];
    _questionList = [NSArray arrayWithContentsOfFile:path];
    _curQuestionIndex = 0;
    _curSelectedIndex = 0;
    
    [self.tableView reloadData];
    NSString* rigthBarButtonTitle = [NSString stringWithFormat:@"答题进度1/%ld", _questionList.count];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:rigthBarButtonTitle style:UIBarButtonItemStylePlain target:nil action:nil];
    
    _answerList = [NSMutableArray array];
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
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    NSDictionary* questionDict =  _questionList[_curQuestionIndex];
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"testQuestionCell" forIndexPath:indexPath];
        cell.textLabel.text = [questionDict objectForKey:@"question"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if(indexPath.row == 5){
         cell = [tableView dequeueReusableCellWithIdentifier:@"questionControlCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"testQuestionCell" forIndexPath:indexPath];
        NSArray* answers = [questionDict objectForKey:@"Answers"];
        NSDictionary* answerDict = answers[indexPath.row-1];
        NSString* answer = [NSString stringWithFormat:@"%@: %@", [answerDict objectForKey:@"index"], [answerDict objectForKey:@"content"]];
        cell.textLabel.text = answer;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _curSelectedIndex = indexPath.row;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* questionDict =  _questionList[_curQuestionIndex];
    
    if (indexPath.row == 0) {
        return [ROTestTableViewCell cellHeightWithText:[questionDict objectForKey:@"question"]];
    }else if(indexPath.row == 5){
        return 44.f;
    }else{
        NSArray* answers = [questionDict objectForKey:@"Answers"];
        NSDictionary* answerDict = answers[indexPath.row-1];
        NSString* answer = [NSString stringWithFormat:@"%@: %@", [answerDict objectForKey:@"index"], [answerDict objectForKey:@"content"]];
        return [ROTestTableViewCell cellHeightWithText:answer];
    }

}

- (IBAction)upQuestion:(UIButton *)sender {
    _curQuestionIndex--;
    if (_curQuestionIndex < 0) {
        _curQuestionIndex = 0;
        [MBProgressHUD showDelayHUDToView:self.view messeage:@"没有上一题了！"];
        return;
    }
    
    NSString* rigthBarButtonTitle = [NSString stringWithFormat:@"答题进度%ld/%ld", _curQuestionIndex+1, _questionList.count];
    self.navigationItem.rightBarButtonItem.title = rigthBarButtonTitle;
    
    NSString* answer = _answerList[_curQuestionIndex];
    NSDictionary* dict = @{@"A": @1, @"B":@2, @"C":@3, @"D":@4};
    NSInteger selectIndex = [[dict objectForKey:answer] integerValue];
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:selectIndex inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
    //[self.tableView reloadData];
}

- (IBAction)nextQuestion:(UIButton *)sender {
    if (_curSelectedIndex == 0) {
        [MBProgressHUD showDelayHUDToView:self.view messeage:@"请您选择一个答案"];
        return;
    }else{
        NSDictionary* questionDict =  _questionList[_curQuestionIndex];
        NSArray* answers = [questionDict objectForKey:@"Answers"];
        NSDictionary* answerDict = answers[_curSelectedIndex-1];
        NSString* answer = [answerDict objectForKey:@"index"];
        if (_curQuestionIndex < _answerList.count) {
            [_answerList replaceObjectAtIndex:_curQuestionIndex withObject:answer];
        }else{
            [_answerList addObject:answer];
        }
        _curSelectedIndex = 0;
    }
    _curQuestionIndex++;
    if (_curQuestionIndex > _questionList.count-1) {
        _curQuestionIndex = _questionList.count-1;
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您确定要提交?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    NSString* rigthBarButtonTitle = [NSString stringWithFormat:@"答题进度%ld/%ld", _curQuestionIndex+1, _questionList.count];
    self.navigationItem.rightBarButtonItem.title = rigthBarButtonTitle;
    
    [self.tableView reloadData];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            if ([[alertView title]isEqualToString:@"得分情况"]) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }
            break;
        case 1:
        {
            NSInteger rightCount = 0;
            for (int index=0; index<_answerList.count; index++) {
                NSString* answer = _answerList[index];
                NSDictionary* questionDict =  _questionList[index];
                if ([answer isEqualToString:[questionDict objectForKey:@"rightAnswer"]]) {
                    rightCount++;
                }
            }
            
            NSString* scoreMsg = [NSString stringWithFormat:@"您共答对%ld道题目 正确率为%.2f%%",rightCount, rightCount*100.f/_questionList.count];
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"得分情况" message:scoreMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}
@end

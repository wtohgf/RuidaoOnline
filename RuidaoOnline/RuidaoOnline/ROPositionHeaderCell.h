//
//  ROPositionHeaderCell.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/9.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CELLHEIGHT 100.f

@interface ROPositionHeaderCell : UITableViewCell

//岗位图片
@property (weak, nonatomic) UIImageView* postImageView;
//定义学习时长title
@property (weak, nonatomic) UILabel* studyTimeTitle;
//定义学习时长
@property (weak, nonatomic) UILabel* studyTime;
//定义课程数量Title
@property (weak, nonatomic) UILabel* courseCountTitle;
//定义课程数量
@property (weak, nonatomic) UILabel* courseCount;
//定义是否学习过title
@property (weak, nonatomic) UILabel* isLearnTitle;
//定义是否学习过
@property (weak, nonatomic) UILabel* isLearn;
//定义学习人数title
@property (weak, nonatomic) UILabel* studyPersonCountTitle;
//定义学习人数
@property (weak, nonatomic) UILabel* studyPersonCount;

@end

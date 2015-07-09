//
//  ROPositionHeaderCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/9.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROPositionHeaderCell.h"

#define MARGIN 8.f
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define WHRatio 133.f/100.f
#define TITLEFONT [UIFont systemFontOfSize:16.f]

@implementation ROPositionHeaderCell

//1.在以下函数 添加子控件
- (void)awakeFromNib {
    // Initialization code
    // 添加子控件
    [self addContentSubviews];
}

#pragma mark 添加子控件
- (void)addContentSubviews{
    self.contentView.backgroundColor = [UIColor colorWithRed:212.f/255.f green:223.f/255.f blue:213.f/255.f alpha:1.f];
    //添加子控件
    UIImageView* postImageView = [[UIImageView alloc]init];
    _postImageView = postImageView;
    [self.contentView addSubview:postImageView];
    
    //定义学习时长title
    UILabel* studyTimeTitle = [[UILabel alloc]init];
    _studyTimeTitle = studyTimeTitle;
    studyTimeTitle.text = @"学习时长:";
    studyTimeTitle.font = TITLEFONT;
    [self.contentView addSubview:studyTimeTitle];
    
    //定义学习时长
    UILabel* studyTime = [[UILabel alloc]init];
    _studyTime = studyTime;
    studyTime.font = TITLEFONT;
    [self.contentView addSubview:studyTime];
    
    //定义课程数量Title
    UILabel* courseCountTitle = [[UILabel alloc]init];
    _courseCountTitle = courseCountTitle;
    courseCountTitle.text = @"课程数量:";
    courseCountTitle.font = TITLEFONT;
    [self.contentView addSubview:courseCountTitle];
    
    //定义课程数量
    UILabel* courseCount = [[UILabel alloc]init];
    _courseCount = courseCount;
    courseCount.font = TITLEFONT;
    [self.contentView addSubview:courseCount];
    
    //定义是否学习过title
    UILabel* isLearnTitle = [[UILabel alloc]init];
    _isLearnTitle = isLearnTitle;
    isLearnTitle.text = @"是否学过:";
    isLearnTitle.font = TITLEFONT;
    [self.contentView addSubview:isLearnTitle];
    
    //定义是否学习过
    UILabel* isLearn = [[UILabel alloc]init];
    _isLearn = isLearn;
    isLearn.font = TITLEFONT;
    [self.contentView addSubview:isLearn];
    
    //定义学习人数title
    UILabel* studyPersonCountTitle = [[UILabel alloc]init];
    _studyPersonCountTitle = studyPersonCountTitle;
    studyPersonCountTitle.text = @"学习人数:";
    studyPersonCountTitle.font = TITLEFONT;
    [self.contentView addSubview:studyPersonCountTitle];
    
    //定义学习人数
    UILabel* studyPersonCount = [[UILabel alloc]init];
    _studyPersonCount = studyPersonCount;
    studyPersonCount.font = TITLEFONT;
    [self.contentView addSubview:studyPersonCount];
}

//2.设置子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    _postImageView.frame = CGRectMake(0.f, 0.f, WHRatio*CELLHEIGHT, CELLHEIGHT);
    
    _studyTimeTitle.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN, 0.f, 80.f, 20.f);
    
    _studyTime.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN + 80.f, 0.f, ScreenWidth-(WHRatio*CELLHEIGHT + MARGIN + 80.f), 20.f);
    
    _courseCountTitle.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN, CELLHEIGHT/4, 80.f, 20.f);
    
    _courseCount.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN + 80.f, CELLHEIGHT/4, ScreenWidth-(WHRatio*CELLHEIGHT + MARGIN + 80.f), 20.f);
    
    
    _isLearnTitle.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN, CELLHEIGHT*2/4, 80.f, 20.f);
    
    _isLearn.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN + 80.f, CELLHEIGHT*2/4, ScreenWidth-(WHRatio*CELLHEIGHT + MARGIN + 80.f), 20.f);
    
    _studyPersonCountTitle.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN, CELLHEIGHT*3/4, 80.f, 20.f);
    
    _studyPersonCount.frame = CGRectMake(WHRatio*CELLHEIGHT + MARGIN + 80.f,  CELLHEIGHT*3/4, ScreenWidth-(WHRatio*CELLHEIGHT + MARGIN + 80.f), 20.f);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

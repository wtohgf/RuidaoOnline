//
//  ROQuestionControlCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROQuestionControlCell.h"

@implementation ROQuestionControlCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _upButton.frame = CGRectMake(0.f, 7.f, [UIScreen mainScreen].bounds.size.width/2, 30.f);
    _nextButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, 7.f, [UIScreen mainScreen].bounds.size.width/2, 30.f);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

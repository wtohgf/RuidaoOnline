//
//  RODetailButtonCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/13.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "RODetailButtonCell.h"

@implementation RODetailButtonCell

- (void)awakeFromNib {
    // Initialization code
    _detailCourseButton.layer.cornerRadius = 20.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

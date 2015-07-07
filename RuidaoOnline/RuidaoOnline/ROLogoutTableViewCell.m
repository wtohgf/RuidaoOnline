//
//  ROLogoutTableViewCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/7.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLogoutTableViewCell.h"

@implementation ROLogoutTableViewCell

- (void)awakeFromNib {
    // Initialization code
    //设置按钮的边缘圆形化 值是浮点型 小于等于按钮 高度／2
    _logoutButton.layer.cornerRadius = 20.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

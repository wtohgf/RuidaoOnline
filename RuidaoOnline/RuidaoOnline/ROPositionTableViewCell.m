//
//  ROPositionTableViewCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/8.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROPositionTableViewCell.h"

@implementation ROPositionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//Cell的布局函数 只要cell的大小发生改变就会调用这个函数
//一般需要重写这个函数 用来布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //固定imageView的大小和位置
    self.imageView.frame = CGRectMake(8.f, 4.f, 100.f, 72.f);
    
    //不允许直接对x进行赋值 可以对frame整体赋值
    //self.textLabel.frame.origin.x = 116.f;
    //以下是只改变frame的某一个值，其他值不改变的做法。
    CGRect tmpframe = self.textLabel.frame;
    tmpframe.origin.x = 116.f;
    self.textLabel.frame = tmpframe;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

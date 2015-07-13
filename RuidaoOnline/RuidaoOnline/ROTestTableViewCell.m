//
//  ROTestTableViewCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROTestTableViewCell.h"

@implementation ROTestTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.textLabel.font = [UIFont systemFontOfSize:18.f];
    self.textLabel.numberOfLines = 0;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    //得到正文
    //告诉boundingRectWithSize 正文放置在一个多宽的长方形中，高度不限
    CGSize maxSize = {[UIScreen mainScreen].bounds.size.width - 16.f, MAXFLOAT};
    //告诉boundingRectWithSize 正文的字体是多大
    NSDictionary* attribute = @{NSFontAttributeName:
                                    [UIFont systemFontOfSize:18.f]};
    
    CGRect rect = [self.textLabel.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    CGFloat tlh = rect.size.height;
    self.textLabel.frame = CGRectMake(8.f, 4.f, [UIScreen mainScreen].bounds.size.width-8.f, tlh);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    if(selected){
        self.textLabel.textColor = [UIColor blueColor];
    }else{
        self.textLabel.textColor = [UIColor blackColor];
    }
}

+(CGFloat)cellHeightWithText:(NSString*)text{
    //告诉boundingRectWithSize 正文放置在一个多宽的长方形中，高度不限
    CGSize maxSize = {[UIScreen mainScreen].bounds.size.width - 16.f, MAXFLOAT};
    //告诉boundingRectWithSize 正文的字体是多大
    NSDictionary* attribute = @{NSFontAttributeName:
                                    [UIFont systemFontOfSize:18.f]};
    
    CGRect rect = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    CGFloat tlh = rect.size.height;
    return tlh+8.f;
}

@end

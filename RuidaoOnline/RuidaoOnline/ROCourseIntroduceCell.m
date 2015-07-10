//
//  ROCourseIntroduceCell.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/9.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROCourseIntroduceCell.h"

@implementation ROCourseIntroduceCell

//添加子控件
- (void)awakeFromNib {
    // Initialization code
    //标题
    UILabel* title = [[UILabel alloc]init];
    _title = title;
    title.text = @"课程介绍";
    title.font = [UIFont systemFontOfSize:24.f];
    title.textColor = [UIColor blueColor];
    [self.contentView addSubview:title];
    
    //课程介绍正文
    UILabel* courceIntroduce = [[UILabel alloc]init];
    _courseIntroduce = courceIntroduce;
    _courseIntroduce.numberOfLines = 0;
    courceIntroduce.font = [UIFont systemFontOfSize:18.f];
    courceIntroduce.textColor = [UIColor grayColor];
    [self.contentView addSubview:courceIntroduce];
    
}

//设置位置 正文的位置确定的前提是需要知道正文是什么。
-(void)layoutSubviews{
    [super layoutSubviews];
    
    _title.frame = CGRectMake(8.f, 8.f, [UIScreen mainScreen].bounds.size.width-16.f, 20.f);

    _title.textAlignment = NSTextAlignmentLeft;
    
    CGFloat cix = 8.f;
    CGFloat ciy = 28.f;
    CGFloat ciw = [UIScreen mainScreen].bounds.size.width -  16.f;
    //需要根据正文进行计算
    CGFloat cih = 0.f;
    if (_postion != nil) {
        
        //得到正文
        NSMutableString* courceIntroduce = [_postion.postDesc mutableCopy];
        [courceIntroduce replaceOccurrencesOfString:@"&nbsp;" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, courceIntroduce.length)];
        
        
        //告诉boundingRectWithSize 正文放置在一个多宽的长方形中，高度不限
        CGSize maxSize = {[UIScreen mainScreen].bounds.size.width-16.f, MAXFLOAT};
        //告诉boundingRectWithSize 正文的字体是多大
        NSDictionary* attribute = @{NSFontAttributeName:
                                        [UIFont systemFontOfSize:18.f]};
        
        //计算正文占多大的长方形
        CGRect intrRect = [courceIntroduce boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
        
        cih = intrRect.size.height;
    }
    
    _courseIntroduce.frame = CGRectMake(cix, ciy, ciw, cih);

}


+(CGFloat)cellHeightWithPostinModel:(ROPostionModel*)postion{
    CGFloat cih = 0.f;
    if (postion != nil) {
        //得到正文
        NSMutableString* courceIntroduce = [postion.postDesc mutableCopy];
        [courceIntroduce replaceOccurrencesOfString:@"&nbsp;" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, courceIntroduce.length)];
        //告诉boundingRectWithSize 正文放置在一个多宽的长方形中，高度不限
        CGSize maxSize = {[UIScreen mainScreen].bounds.size.width, MAXFLOAT};
        //告诉boundingRectWithSize 正文的字体是多大
        NSDictionary* attribute = @{NSFontAttributeName:
                                        [UIFont systemFontOfSize:18.f]};
        
        //计算正文占多大的长方形
        CGRect intrRect = [courceIntroduce boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
        
        cih = intrRect.size.height;
    }
    return cih+20.f+16.f;
}

//设置模型 设置内容
-(void)setPostion:(ROPostionModel *)postion{
    _postion = postion;
    
    //设置正文
    NSMutableString* courceIntroduce = [postion.postDesc mutableCopy];
    [courceIntroduce replaceOccurrencesOfString:@"&nbsp;" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, courceIntroduce.length)];
    _courseIntroduce.text = courceIntroduce;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

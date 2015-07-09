//
//  ROCourseIntroduceCell.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/9.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ROPostionModel.h"

@interface ROCourseIntroduceCell : UITableViewCell
@property (weak, nonatomic) UILabel* title;
@property (weak, nonatomic) UILabel* courseIntroduce;

@property (strong, nonatomic) ROPostionModel* postion;

+(CGFloat)cellHeightWithPostinModel:(ROPostionModel*)postion;

@end

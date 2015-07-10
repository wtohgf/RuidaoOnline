//
//  ROLearnStageModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROLearnStageModel : NSObject

//保存ROChildStageModel的List 需要选择可变数组
@property (strong, nonatomic) NSMutableArray* childStageList;
@property (copy, nonatomic) NSString * parentStageName;

+(instancetype)learnStageModelWithDict:(NSDictionary*)dict;
@end

//
//  ROChildStageModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROChildStageModel : NSObject
//保存课程资源模型列表
@property (strong, nonatomic) NSMutableArray* childStageResList;
@property (strong, nonatomic) NSNumber * stageId;
@property (copy, nonatomic) NSString* stageName;
@property (strong, nonatomic) NSNumber* stageProcess;

+(instancetype)childStageModelWithDict:(NSDictionary*)dict;
@end

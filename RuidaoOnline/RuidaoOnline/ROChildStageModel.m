//
//  ROChildStageModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROChildStageModel.h"
#import "ROCourseResModel.h"

@implementation ROChildStageModel

+(instancetype)childStageModelWithDict:(NSDictionary *)dict{
    if (dict == nil) {
        return nil;
    }
    
    ROChildStageModel* model = [[ROChildStageModel alloc]init];
    
    //初始化课程资源模型列表
    model.childStageResList = [NSMutableArray array];
    
    if (model) {
        NSArray* childStageResList = [dict objectForKey:@"childStageResList"];
        if (childStageResList != nil) {
            for (int index=0; index<childStageResList.count; index++) {
                //将字典转化为课程资源模型;
                ROCourseResModel* course = [ROCourseResModel courseResModelWithDict:childStageResList[index]];
                [model.childStageResList addObject:course];
            }
        }
        
        model.stageId = [dict objectForKey:@"stageId"];
        model.stageName = [dict objectForKey:@"stageName"];
        model.stageProcess = [dict objectForKey:@"stageProcess"];
    }
    return model;
}
@end

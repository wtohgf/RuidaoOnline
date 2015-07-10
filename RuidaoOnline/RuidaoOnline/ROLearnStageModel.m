//
//  ROLearnStageModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLearnStageModel.h"
#import "ROChildStageModel.h"

@implementation ROLearnStageModel
+(instancetype)learnStageModelWithDict:(NSDictionary *)dict{
    if (dict == nil) {
        return nil;
    }
    
    ROLearnStageModel* model = [[ROLearnStageModel alloc]init];
    if (model) {
        NSArray* childStageList = [dict objectForKey:@"childStageList"];
        //遍历childStageList 将childStageList中的字典模型化
        
        //初始化存储子阶段模型的数组
        model.childStageList = [NSMutableArray array];
        
        if (childStageList != nil) {
            for (int index=0; index<childStageList.count; index++) {
                //将字典转化为模型
                ROChildStageModel* childStage = [ROChildStageModel childStageModelWithDict:childStageList[index]];
                [model.childStageList addObject:childStage];
            }
        }
        
        model.parentStageName = [dict objectForKey:@"parentStageName"];
    }
    return model;
    
}
@end

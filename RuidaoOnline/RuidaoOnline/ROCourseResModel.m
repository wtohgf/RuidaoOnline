//
//  ROCourseResModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROCourseResModel.h"

@implementation ROCourseResModel
+(instancetype)courseResModelWithDict:(NSDictionary *)dict{
    if (dict == nil) {
        return nil;
    }
    ROCourseResModel* model = [[ROCourseResModel alloc]init];
    if (model) {
        //使用KVC
        [model setValuesForKeysWithDictionary:dict];
    }
    return model;
}
@end

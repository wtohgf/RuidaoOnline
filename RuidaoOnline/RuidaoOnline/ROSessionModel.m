//
//  ROSessionModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROSessionModel.h"

@implementation ROSessionModel
+(instancetype)sessionModelWithDict:(NSDictionary *)dict{
    if (dict == nil) {
        return nil;
    }
    
    ROSessionModel* model = [[ROSessionModel alloc]init];
    if (model) {
        //KVC
        [model setValuesForKeysWithDictionary:dict];
    }
    return model;
    
}
@end

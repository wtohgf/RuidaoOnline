//
//  ROPostionModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/8.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROPostionModel.h"

@implementation ROPostionModel

+(instancetype)postionModelWithDict:(NSDictionary *)dict{
    ROPostionModel* model = [[ROPostionModel alloc]init];
    if (model!= nil) {
        //KVC 键值编码 Key Value Coding
        //用一下一句代码可以赋值全部的属性，前提dict中的key 一定要和属性名完全一致。如果有不一致的话，下边的代码会崩溃！有风险的 慎重使用！
        [model setValuesForKeysWithDictionary:dict];
    }
    return model;
}

@end

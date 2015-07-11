//
//  ROChapterModel.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROChapterModel.h"
#import "ROSessionModel.h"

/*
 @property (copy, nonatomic) NSString * courseId;
 @property (strong, nonatomic) NSNumber* id;
 @property (strong, nonatomic) NSMutableArray* sessionList;
 @property (strong, nonatomic) NSNumber* parentId;
 @property (strong, nonatomic) NSNumber* time;
 @property (copy, nonatomic) NSString * title;
 @property (copy, nonatomic) NSString * url;
 */
@implementation ROChapterModel
+(instancetype)chapterModelWithDict:(NSDictionary *)dict{
    if (dict == nil) {
        return nil;
    }
    
    ROChapterModel* model = [[ROChapterModel alloc]init];
    if (model) {
        
        model.sessionList = [NSMutableArray array];
        
        model.courseId = [dict objectForKey:@"courseId"];
        model.id = [dict objectForKey:@"id"];
        
        //进行对应本章的小节session进行模型转化 并保存到sessionList中
        NSArray* sessionDictList = [dict objectForKey:@"mList"];
        for (int index=0; index<sessionDictList.count; index++) {
            ROSessionModel* session = [ROSessionModel sessionModelWithDict:sessionDictList[index]];
            [model.sessionList addObject:session];
        }
        
        model.parentId = [dict objectForKey:@"parentId"];
        model.time = [dict objectForKey:@"time"];
        model.title = [dict objectForKey:@"title"];
        model.url = [dict objectForKey:@"url"];
    }
    return model;
}
@end

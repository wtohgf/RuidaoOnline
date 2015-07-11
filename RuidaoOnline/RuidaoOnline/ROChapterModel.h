//
//  ROChapterModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 courseId = "";
 id = 4153;
 mList =             (
 {
 courseId = 3402;
 id = n3402;
 parentId = 4153;
 time = 15;
 title = "\U9879\U76ee\U7b80\U4ecb";
 url = "http://www.neuedu.com/nps/courseware/course/java_neuonline/oracle_sql_new/2-4.mp4";
 }
 );
 parentId = 0;
 time = 15;
 title = "\U9879\U76ee\U5f15\U5bfc";
 url = "";
 */
@interface ROChapterModel : NSObject
@property (copy, nonatomic) NSString * courseId;
@property (strong, nonatomic) NSNumber* id;
@property (strong, nonatomic) NSMutableArray* sessionList;
@property (strong, nonatomic) NSNumber* parentId;
@property (strong, nonatomic) NSNumber* time;
@property (copy, nonatomic) NSString * title;
@property (copy, nonatomic) NSString * url;

+(instancetype)chapterModelWithDict:(NSDictionary*)dict;
@end

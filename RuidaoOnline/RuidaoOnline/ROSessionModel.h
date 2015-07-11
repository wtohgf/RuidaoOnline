//
//  ROSessionModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/11.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 mList =             (
 {
 courseId = 3402;
 id = n3402;
 parentId = 4153;
 time = 15;
 title = "\U9879\U76ee\U7b80\U4ecb";
 url = "http://www.neuedu.com/nps/courseware/course/java_neuonline/oracle_sql_new/2-4.mp4";
 }
 */
@interface ROSessionModel : NSObject
@property (strong, nonatomic) NSNumber* courseId;
@property (strong, nonatomic) NSNumber* id;
@property (strong, nonatomic) NSNumber* parentId;
@property (strong, nonatomic) NSNumber* time;
@property (copy, nonatomic) NSString * title;
@property (copy, nonatomic) NSString * url;

+(instancetype)sessionModelWithDict:(NSDictionary*)dict;

@end

//
//  ROCourseResModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 examType = "";
 resId = 39;
 resName = "Java\U9762\U5411\U5bf9\U8c61\U5f00\U53d1\U8bbe\U8ba1";
 resProcess = "";
 resType = 1;
 */
@interface ROCourseResModel : NSObject
@property (copy, nonatomic) NSString * examType;
@property (strong, nonatomic) NSNumber* resId;
@property (copy, nonatomic) NSString * resName;
@property (copy, nonatomic) NSString * resProcess;
@property (strong, nonatomic) NSNumber* resType;

+(instancetype)courseResModelWithDict:(NSDictionary*)dict;
@end

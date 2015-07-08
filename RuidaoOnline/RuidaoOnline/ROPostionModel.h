//
//  ROPostionModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/8.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 {
 courseHours = 5023;
 courseNums = 12;
 directId = 2;
 isStudy = 0;
 personNums = 72;
 postDesc = "&nbsp; &nbsp; JAVA\U8bed\U8a00\U591a\U5e74\U6765\U4e00\U76f4\U96c4\U8e1e\U4e16\U754c\U7f16\U7a0b\U8bed\U8a00\U524d\U4e09\U7532\Uff0c\U65e0\U8bba\U662f\U670d\U52a1\U5668\U3001\U5ba2\U6237\U7aef\Uff0c\U8fd8\U662f\U7ec8\U7aef\U8bbe\U5907\Uff0c\U5b83\U90fd\U65e0\U5904\U4e0d\U5728\Uff0c\U800c\U4e14\U6570\U91cf\U5e9e\U5927\U3002\U66f4\U6709450\U591a\U4e07\U5f00\U53d1\U8005\U4ece\U4e8b\U7740JAVA\U7f16\U7a0b\U7684\U5de5\U4f5c\Uff0c\U8fd8\U6ca1\U6709\U54ea\U79cd\U8bed\U8a00\U80fd\U50cfJAVA\U90a3\U6837\U53d1\U5c55\U4e4b\U5feb\Uff0c\U7528\U9014\U4e4b\U5e7f\U3002\U6bcf\U4e2aJAVA\U8f6f\U4ef6\U5de5\U7a0b\U5e08\U7528\U4ed6\U4eec\U7684\U667a\U6167\U5728\U6539\U53d8\U7740\U6211\U4eec\U7684\U751f\U6d3b\Uff0c\U6539\U53d8\U7740\U4f01\U4e1a\U3001\U793e\U4f1a\U548c\U8fd9\U4e2a\U4e16\U754c\U3002\U5982\U679c\U60f3\U5b66\U4e60JAVA\U6280\U80fd\Uff0c\U6210\U4e3aJAVA\U8f6f\U4ef6\U5de5\U7a0b\U5e08\Uff0c\U90a3\U4e48\U5c31\U4ece\U8fd9\U91cc\U5f00\U59cb\U5427\U3002";
 postId = 48;
 postName = "JAVA\U8f6f\U4ef6\U5de5\U7a0b\U5e08";
 postUrl = "http://resource.neuedu.cn/path/picture/course/1384134723860.jpg";
 studyDays = "3\U4e2a\U6708";
 testNums = 777;
 videoNums = 862;
 }
 
 */
@interface ROPostionModel : NSObject

@property (copy, nonatomic) NSString * courseHours;
@property (copy, nonatomic) NSString * courseNums;
@property (copy, nonatomic) NSString * directId;
@property (copy, nonatomic) NSString * isStudy;
@property (copy, nonatomic) NSString * personNums;
@property (copy, nonatomic) NSString * postDesc;
@property (copy, nonatomic) NSString * postId;
@property (copy, nonatomic) NSString * postName;
@property (copy, nonatomic) NSString * postUrl;
@property (copy, nonatomic) NSString * studyDays;
@property (copy, nonatomic) NSString * testNums;
@property (copy, nonatomic) NSString * videoNums;

+(instancetype)postionModelWithDict:(NSDictionary*)dict;

@end

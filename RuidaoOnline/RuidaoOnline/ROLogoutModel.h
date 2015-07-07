//
//  ROLogoutModel.h
//  RuidaoOnline
//
//  Created by hegf on 15/7/7.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROLogoutModel : NSObject
@property (copy, nonatomic) NSString* logoutFlag;

+(instancetype)logoutReturnModelWithDict:(NSDictionary*)dict;

@end

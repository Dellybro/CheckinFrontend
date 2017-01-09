//
//  HTTPHelper.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonReturn.h"

@interface HTTPHelper : NSObject

#pragma My Methods

@property (nonatomic, strong) NSURLSession *session;

//Only return needed
@property JsonReturn *latestReturn;

-(void)postMethodTaskSession:(NSString*)typeOfUser method:(NSString*)method action:(NSString*)action post:(NSString*)post auth:(NSString*)auth_token version:(NSString *)version completionHandler:(void (^)(BOOL success, JsonReturn *latestReturn))completionHandler;
//Only Methods Needed for databasing

-(void)getMethodTaskSession:(NSString*)typeOfUser method:(NSString*)method action:(NSString*)action auth:(NSString*)auth_token version:(NSString *)version completionHandler:(void (^)(BOOL success, JsonReturn *latestReturn))completionHandler;
@end



//API
#define API_V2 @"api/v2"
#define API_V1 @"api/v1"

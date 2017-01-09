//
//  HTTPHelper.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "HTTPHelper.h"
#import "AppDelegate.h"

@interface HTTPHelper()

@property NSString* baseURL;
@property NSString* startURL;

@end

@implementation HTTPHelper{
    AppDelegate *sharedDelegate;
}




-(id)init{
    self = [super init];
    if (self){
        sharedDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
#if DEBUG
        NSString *urlMainhost = @"http://localhost:3000";
#else
        NSString *urlMainhost = @"https://elasticIp:3000";
#endif
        
        _startURL = [NSString stringWithFormat:@"%@", urlMainhost];
        
        
    }
    return self;
}

-(void)postMethodTaskSession:(NSString*)typeOfUser method:(NSString*)method action:(NSString*)action post:(NSString*)post auth:(NSString*)auth_token version:(NSString *)version completionHandler:(void (^)(BOOL success, JsonReturn *latestReturn))completionHandler{
    
    
    //setup url
    NSString* finalURL;
    if(action == nil){
        finalURL = [NSString stringWithFormat:@"%@/%@/%@/%@", _startURL, version,typeOfUser, method];
    } else {
        finalURL = [NSString stringWithFormat:@"%@/%@/%@/%@%@", _startURL, version, typeOfUser, method, action];
    }
    //setup request using mutableurlrequest
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:finalURL]];
    
    //setup postdata
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //set request
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    if(!(auth_token == nil)){
        NSString *authValue = [NSString stringWithFormat:@"Token %@", auth_token];
        [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    }
    
    //Make REQUEST
    //    NSHTTPURLResponse * response = nil;
    //    NSError * error = nil;
    //    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    self.session = [NSURLSession sharedSession];  // use sharedSession or create your own
    
    NSURLSessionTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@", error);
            
            completionHandler(NO,nil);
            return;
        }
        
        NSError *jsonError;
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        if(json){
            _latestReturn = [[JsonReturn alloc] initWithJSON:json];
        }else{
            
            completionHandler(NO,nil);
            return;
        }
        
        completionHandler(YES,_latestReturn);
    }];
    [task resume];
    
}

#pragma mark - Only Methods Needed, Other will be deleted over time
-(void)getMethodTaskSession:(NSString *)typeOfUser method:(NSString *)method action:(NSString *)action auth:(NSString *)auth_token version:(NSString *)version completionHandler:(void (^)(BOOL, JsonReturn *))completionHandler{
    
    NSString *finalURL;
    if(action == nil){
        
        finalURL = [NSString stringWithFormat:@"%@/%@/%@/%@", _startURL, version, typeOfUser, method];
        
    } else {
        
        finalURL = [NSString stringWithFormat:@"%@/%@/%@/%@%@", _startURL, version, typeOfUser, method, action];
        
    }
    
    //setup request using mutableurlrequest
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:finalURL]];
    
    //set request
    [request setHTTPMethod:@"GET"];
    if(!(auth_token == nil)){
        NSString *authValue = [NSString stringWithFormat:@"Token %@", auth_token];
        [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    }
    
    //Make REQUEST
    self.session = [NSURLSession sharedSession];  // use sharedSession or create your own
    NSURLSessionTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error = %@", error);
            
            completionHandler(NO,nil);
            return;
        }
        
        NSError *jsonError;
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        if(json){
            _latestReturn = [[JsonReturn alloc] initWithJSON:json];
        }else{
            
            completionHandler(NO,nil);
            return;
        }
        
        completionHandler(YES,_latestReturn);
    }];
    [task resume];
    
}

@end

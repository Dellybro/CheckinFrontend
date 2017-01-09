//
//  JsonReturn.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonReturn : NSObject

-(void)toJson:(NSMutableDictionary*)jsonDictionary;
-(NSMutableDictionary*)toDict;
-(id)initWithJSON:(NSMutableDictionary*)jsonDictionary;

@property NSInteger code;
@property NSMutableDictionary *object;
@property NSString *message;


@end

//
//  CustomScripts.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomScripts : NSObject

+(NSString *)coolDate:(NSDate *)date;
+ (UIImage *)scaleImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end


#define FyresiteRed [UIColor colorWithRed:241.0f/255.0f green:126.0f/255.0f blue:45.0f/255.0f alpha:1]
#define FyresiteBlue [UIColor colorWithRed:25.0f/255.0f green:135.0f/255.0f blue:193.0f/255.0f alpha:1]

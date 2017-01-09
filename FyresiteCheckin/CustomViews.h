//
//  CustomViews.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomViews : NSObject

+(UIView*)coloredDot:(UIColor*)color;
+(UILabel *)customLabel:(NSString*)text options:(NSDictionary*)options;

@end

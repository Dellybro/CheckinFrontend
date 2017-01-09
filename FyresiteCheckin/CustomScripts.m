//
//  CustomScripts.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "CustomScripts.h"

@implementation CustomScripts


+ (UIImage *)scaleImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(NSString *)coolDate:(NSDate *)date{
    NSDateComponents *components;
    NSInteger seconds;
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitSecond
                                                 fromDate: date toDate: [NSDate date] options: 0];
    seconds = [components second];
    
    if(seconds > 60){
        components = [[NSCalendar currentCalendar] components: NSCalendarUnitMinute
                                                     fromDate: date toDate: [NSDate date] options: 0];
        NSInteger minutes = [components minute];
        if(minutes > 60){
            components = [[NSCalendar currentCalendar] components: NSCalendarUnitHour
                                                         fromDate: date toDate: [NSDate date] options: 0];
            NSInteger hours = [components hour];
            if(hours > 24){
                components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay
                                                             fromDate: date toDate: [NSDate date] options: 0];
                NSInteger days = [components day];
                if(days > 30){
                    components = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth
                                                                 fromDate: date toDate: [NSDate date] options: 0];
                    NSInteger months = [components month];
                    if(months > 12){
                        components = [[NSCalendar currentCalendar] components: NSCalendarUnitYear
                                                                     fromDate: date toDate: [NSDate date] options: 0];
                        NSInteger years = [components year];
                        if(years == 1){
                            return [NSString stringWithFormat:@"%li year ago", (long)years];
                        }else{
                            return [NSString stringWithFormat:@"%li years ago", (long)years];
                        }
                    }else{
                        if(months == 1){
                            return [NSString stringWithFormat:@"%li month ago", (long)months];
                        }else{
                            return [NSString stringWithFormat:@"%li months ago", (long)months];
                        }
                    }
                }else{
                    if(days == 1){
                        return [NSString stringWithFormat:@"%li day ago", (long)days];
                    }else{
                        return [NSString stringWithFormat:@"%li days ago", (long)days];
                    }
                }
            }else{
                return [NSString stringWithFormat:@"%li hours ago", (long)hours];
            }
        }else{
            return [NSString stringWithFormat:@"%li minutes ago", (long)minutes];
        }
    }else{
        return [NSString stringWithFormat:@"%li seconds ago", (long)seconds];
    }
    
}


@end

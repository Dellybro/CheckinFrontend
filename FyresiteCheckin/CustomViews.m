//
//  CustomViews.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "CustomViews.h"

@implementation CustomViews

+(UIView*)coloredDot:(UIColor*)color{
    UIView *newView = [[UIView alloc] init];
    newView.backgroundColor = color;
    newView.translatesAutoresizingMaskIntoConstraints = NO;
    newView.layer.masksToBounds = YES;
    return newView;
}

+(UILabel *)customLabel:(NSString*)text options:(NSDictionary*)options{
    UILabel *label = [UILabel new];
    label.text = text;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textAlignment = [options objectForKey:@"text-alignment"] ? [[options objectForKey:@"text-alignment"] integerValue] : NSTextAlignmentLeft;
    
    label.textColor = [options objectForKey:@"font-color"] ? [options objectForKey:@"font-color"] : [UIColor blackColor];
    label.font = [UIFont fontWithName:[options objectForKey:@"font-name"] size:[[options objectForKey:@"font-size"] floatValue]];
    label.layer.cornerRadius = [[options objectForKey:@"corner-radius"] floatValue];
    label.layer.borderColor = [options objectForKey:@"border-color"] ? (__bridge CGColorRef _Nullable)([options objectForKey:@"border-color"]) : [UIColor whiteColor].CGColor;
    label.backgroundColor = [options objectForKey:@"background-color"] ? [options objectForKey:@"background-color"] : [UIColor clearColor];
    label.layer.borderWidth = [options objectForKey:@"border-width"] || 0;
    return label;
}

@end

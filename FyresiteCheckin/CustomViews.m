//
//  CustomViews.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "CustomViews.h"

@implementation CustomViews

+(UIImageView*)customImageView:(NSString*)imageString{
    UIImageView* charImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageString]];
    charImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    return charImage;
}
+(void)addShadowToView:(UIView*)view options:(NSDictionary *)options{
    view.layer.masksToBounds = NO;
    view.layer.shadowColor = [options objectForKey:@"shadowColor"] ? [[options objectForKey:@"shadowColor"] CGColor] : [UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor;
    view.layer.shadowOpacity = [options objectForKey:@"shadowRadius"] ? [[options objectForKey:@"shadowRadius"] floatValue] : 0.6;
    view.layer.shadowRadius = [options objectForKey:@"shadowRadius"] ? [[options objectForKey:@"shadowRadius"] floatValue] : 4;
    view.layer.shadowOffset = CGSizeMake([options objectForKey:@"shadowOffsetX"] ? [[options objectForKey:@"shadowOffsetX"] floatValue] : 1.0f, [options objectForKey:@"shadowOffsetY"] ? [[options objectForKey:@"shadowOffsetY"] floatValue] : 2.0f);
}
+(BFPaperButton *)BFSquareBtn:(NSDictionary *)options{
    BFPaperButton* button =[[BFPaperButton alloc] initWithRaised: [options objectForKey:@"raised"] ? [[options objectForKey:@"raised"] boolValue] : true];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setBackgroundColor:[options objectForKey:@"backgroundColor"] ? [options objectForKey:@"backgroundColor"] : TDLightBlue500];
    [button setTitle:[options objectForKey:@"title"] ? [options objectForKey:@"title"] : @"" forState:UIControlStateNormal];
    [button setTitleColor:[options objectForKey:@"title-color"] ? [options objectForKey:@"title-color"] : TDLightBlue500 forState:UIControlStateNormal];
    button.tapCircleColor = [options objectForKey:@"tap-color"] ? [options objectForKey:@"tap-color"] : TDLightBlue500;
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    [button setTitleFont:[UIFont fontWithName:[options objectForKey:@"font-name"] ? [options objectForKey:@"font-name"] : FONTROBOTOLIGHT size:[options objectForKey:@"font-size"] ? [[options objectForKey:@"font-size"] floatValue] : [@13 floatValue]]];
    button.rippleFromTapLocation = YES;
    button.tag = [options objectForKey:@"tag"] ? [[options objectForKey:@"tag"] intValue] : 0;
    return button;
}


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

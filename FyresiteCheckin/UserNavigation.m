//
//  UserNavigation.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "UserNavigation.h"
#import <BFPaperButton/BFPaperButton.h>
#import "AppDelegate.h"

@interface UserNavigation ()

@property UIView *customTabBar;
@property BFPaperButton *SCBtn;
@property BFPaperButton *RCBtn;


@end

@implementation UserNavigation{
    AppDelegate *sharedDelegate;
}



#pragma mark - Setups
-(instancetype)init{
    self = [super init];
    if(self) {
        sharedDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
    }
    return self;
}

-(void)setup{
    _customTabBar = [CustomViews coloredDot:[UIColor whiteColor]];
    _SCBtn = [[BFPaperButton alloc] initWithRaised:NO];
    _SCBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_SCBtn setTitle:@"Checkin / Checkout" forState:UIControlStateNormal];
    _SCBtn.backgroundColor = [UIColor whiteColor];  // You can find this from my other library, BFPaperColors :)
    _SCBtn.tapCircleColor = FyresiteRed;
    [_SCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_SCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    _RCBtn = [[BFPaperButton alloc] initWithRaised:NO];
    _RCBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_RCBtn setTitle:@"Reports" forState:UIControlStateNormal];
    _RCBtn.backgroundColor = [UIColor whiteColor];  // You can find this from my other library, BFPaperColors :)
    _RCBtn.tapCircleColor = FyresiteBlue;
    [_RCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_RCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //[_SCBtn addTarget:self action:@selector(checkinWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_customTabBar];
    [_customTabBar addSubview:_SCBtn];
    [_customTabBar addSubview:_RCBtn];
    
    
}

@end

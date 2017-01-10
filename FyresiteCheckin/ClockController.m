//
//  StartController.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "ClockController.h"
#import <BFPaperButton/BFPaperButton.h>
#import "AppDelegate.h"

@interface ClockController ()

@property BFPaperButton *checkInBtn;
@property BFPaperButton *checkOutBtn;

@end

@implementation ClockController




-(void)checkinWasClicked:(BFPaperButton*)sender{
    
}

#pragma mark - setups

-(instancetype)init{
    self = [super init];
    if(self){
        self.view.backgroundColor = [UIColor whiteColor];
        [self setupViews];
    }
    return self;
}


-(void)setupViews{
    _checkInBtn = [[BFPaperButton alloc] initWithRaised:NO];
    _checkInBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_checkInBtn setTitle:@"Check In" forState:UIControlStateNormal];
    _checkInBtn.backgroundColor = FyresiteBlue;
    [_checkInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_checkInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_checkInBtn addTarget:self action:@selector(checkinWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _checkInBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _checkInBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _checkOutBtn = [[BFPaperButton alloc] initWithRaised:NO];
    _checkOutBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_checkOutBtn setTitle:@"Check Out" forState:UIControlStateNormal];
    _checkOutBtn.backgroundColor = FyresiteRed;
    [_checkOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_checkOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_checkOutBtn addTarget:self action:@selector(checkinWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _checkOutBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _checkOutBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_checkOutBtn];
    [self.view addSubview:_checkInBtn];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkOutBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkOutBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkOutBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkOutBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkInBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkInBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkInBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_checkInBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0]];
}


@end

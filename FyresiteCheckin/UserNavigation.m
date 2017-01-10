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
#import "OptionDropDown.h"

#define NUMBEROFSLIDES 2

@interface UserNavigation ()

@property UIView *customTabBar;
@property BFPaperButton *clockBtn;
@property BFPaperButton *reportBtn;


@end

@implementation UserNavigation{
    AppDelegate *sharedDelegate;
    NSArray *buttons;
}

#pragma mark - PageView Delegate

-(UIViewController*)viewControllerAtIndex:(NSInteger)index{
    //Controllers
    if(index == 0){
        _clockController = [[ClockController alloc] init];
        _clockController.presenter = self;
        _clockController.index = index;
        return _clockController;
    }else if(index == 1){
        _reportsController = [[ReportsController alloc] init];
        _reportsController.presenter = self;
        _reportsController.index = index;
        return _reportsController;
    }else{
        return nil;
    }
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = [(BaseController *)viewController index];
    
    //Increase index by 1 to return, if index is 5 don't increase.
    index++;
    
    if (index > NUMBEROFSLIDES) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    
    NSUInteger index = [(BaseController *)viewController index];
    
    if (index== 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return -1;
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return NUMBEROFSLIDES;
}

#pragma mark - page view extras


-(void)changeActiveBtn:(NSInteger)index{
    for (UIButton *button in buttons) {
        (button.tag == index) ? [button setSelected:YES] : [button setSelected:NO];
    }
}
-(void)navBarButtonClicked:(BFPaperButton*)sender{
    NSLog(@"Setting index to %ld",(long)sender.tag);
    
    [self changeActiveBtn:sender.tag];
    [self changePage:sender];
    
}

- (void)changePage:(UIButton*)sender {
    BaseController *viewController = (BaseController*)[self viewControllerAtIndex:sender.tag];
    
    if (viewController == nil) {
        
        return;
    }
    
    
    [self setViewControllers:@[viewController]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    
}


#pragma mark - Setups
-(instancetype)init{
    if(self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil]){
        
        self.view.backgroundColor = [UIColor whiteColor];
        sharedDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.delegate = self;
        self.dataSource = self;
        [self setup];
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[CustomScripts scaleImage:[UIImage imageNamed:@"menuVertical"] scaledToSize:CGSizeMake(25, 25)] style:UIBarButtonItemStyleDone target:self action:@selector(rightMenuClicked:)];
}


-(void)rightMenuClicked:(UIBarButtonItem*)sender{
    OptionDropDown *dropDown = [sharedDelegate.window viewWithTag:EditDropDownTag];
    if(dropDown){
        [dropDown removeFromSuperview];
        return;
    }
    
    dropDown = [[OptionDropDown alloc] init];
    dropDown.delegate = self;
    [dropDown addToView:self];
    
}

-(void)setup{
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //Setup pageview
    _clockController=[[ClockController alloc] init];
    NSArray *viewControllers = [NSArray arrayWithObject:_clockController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    //SetupTabBar
    _customTabBar = [CustomViews coloredDot:[UIColor whiteColor]];
    [CustomViews addShadowToView:self.customTabBar options:@{@"shadowOffsetX": @0,@"shadowOffsetY": @3}];
    
    _clockBtn = [CustomViews BFSquareBtn:@{@"raised":@NO, @"backgroundColor":[UIColor clearColor], @"corner-radius":@0, @"tag" : @0}];
    [_clockBtn setImage:[CustomScripts scaleImage:[UIImage imageNamed:@"clock-grey"] scaledToSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
    [_clockBtn setImage:[CustomScripts scaleImage:[UIImage imageNamed:@"clock-blue"] scaledToSize:CGSizeMake(25, 25)] forState:UIControlStateSelected];
    [_clockBtn addTarget:self action:@selector(navBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _reportBtn = [CustomViews BFSquareBtn:@{@"raised":@NO, @"backgroundColor":[UIColor clearColor], @"corner-radius":@0, @"tag" : @1}];
    [_reportBtn setImage:[CustomScripts scaleImage:[UIImage imageNamed:@"report-icon-grey"] scaledToSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
    [_reportBtn setImage:[CustomScripts scaleImage:[UIImage imageNamed:@"report-icon-blue"] scaledToSize:CGSizeMake(25, 25)] forState:UIControlStateSelected];
    [_reportBtn addTarget:self action:@selector(navBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:_customTabBar];
    [_customTabBar addSubview:_clockBtn];
    [_customTabBar addSubview:_reportBtn];
    
    buttons = @[_clockBtn, _reportBtn];
    //Custom tab bar
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:35.0]];
    
    //Start button
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_clockBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_clockBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_clockBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_clockBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    //Report button
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_reportBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_reportBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_reportBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    [_customTabBar addConstraint:[NSLayoutConstraint constraintWithItem:_reportBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_customTabBar attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    
}

@end

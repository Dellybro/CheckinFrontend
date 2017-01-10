//
//  UserNavigation.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockController.h"
#import "ReportsController.h"

@interface UserNavigation : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property ClockController *clockController;
@property ReportsController *reportsController;

@end

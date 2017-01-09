//
//  AppDelegate.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "HTTPHelper.h"
#import "CustomViews.h"
#import "CustomScripts.h"
#import "StartController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property StartController *rootView;
@property UINavigationController *navigationController;

@end


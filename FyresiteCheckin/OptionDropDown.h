//
//  RightMenu.h
//  FyresiteCheckin
//
//  Created by Travis Delly on 1/9/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>

#define EditDropDownTag 150

@class OptionDropDown;

@protocol OptionDropDownDelegate <NSObject>
@required

@end

@interface OptionDropDown : UIView <UITableViewDelegate, UITableViewDataSource>{
    id <OptionDropDownDelegate>_delegate;
}
@property (nonatomic,strong) id delegate;


@property UITableView *tableView;
-(void)addToView:(UIViewController*)viewController;

@end

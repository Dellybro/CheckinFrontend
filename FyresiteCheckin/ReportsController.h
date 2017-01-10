//
//  ReportsController.h
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@interface ReportsController : BaseController <UITableViewDelegate, UITableViewDataSource>

@property UITableView *tableView;

@end

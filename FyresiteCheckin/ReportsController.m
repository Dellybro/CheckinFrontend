//
//  ReportsController.m
//  FyresiteCheckin
//
//  Created by Travis on 9/1/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "ReportsController.h"
#import "AppDelegate.h"

#pragma mark - Start Report Header view

@interface ReportHeaderView : UIView

@property UILabel *weekLabel;
@property UIView *borderBottom;

@end

@implementation ReportHeaderView

-(instancetype)init{
    self = [super init];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}

-(void)setupView{
    _weekLabel = [CustomViews customLabel:@"Week of 1/9/17 - 1/16/17" options:@{@"text-alignment" : [NSNumber numberWithInt:NSTextAlignmentLeft], @"font-color" : TDGrey700, @"font-name" : FONTROBOTOLIGHT, @"font-size" : @FONTSMALL}];
    _borderBottom = [CustomViews coloredDot:TDGrey300];
    
    [self addSubview:_borderBottom];
    [self addSubview:_weekLabel];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_weekLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_weekLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_weekLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:20.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_weekLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20.0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
}

@end

@interface ReportDayView : UITableViewCell

@property UILabel *dayLabel;
@property UIView *borderBottom;

@end

@implementation ReportDayView



-(instancetype)init{
    self = [super init];
    if(self){
        [self setupView];
    }
    return self;
}

-(void)setupView{
    _dayLabel = [CustomViews customLabel:@"Tuesday" options:@{@"text-alignment" : [NSNumber numberWithInt:NSTextAlignmentLeft], @"font-color" : TDGrey700, @"font-name" : FONTROBOTOLIGHT, @"font-size" : @FONTSMALL}];
    _borderBottom = [CustomViews coloredDot:TDGrey300];
    
    [self addSubview:_borderBottom];
    [self addSubview:_dayLabel];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dayLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dayLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dayLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:20.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_dayLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:140.0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
}


@end

#pragma mark - Start report Cell
@interface ReportCell : UITableViewCell

@property UILabel *action;
@property UILabel *datetime;
@property UILabel *location;
@property UIImageView *icon;
@property UIView *borderBottom;

@end

@implementation ReportCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupCell];
    }
    return self;
}

-(void)setupCell{
    _datetime = [CustomViews customLabel:@"Jan 9th, 2017\n 10:00:00am" options:@{@"text-alignment" : [NSNumber numberWithInt:NSTextAlignmentRight], @"font-color" : TDGrey900, @"font-name" : FONTROBOTOMD, @"font-size" : @12}];
    _datetime.numberOfLines = 2;
    _datetime.lineBreakMode = NSLineBreakByWordWrapping;
    _action = [CustomViews customLabel:@"Check in" options:@{@"text-alignment" : [NSNumber numberWithInt:NSTextAlignmentLeft], @"font-color" : TDGrey900, @"font-name" : FONTROBOTOMD, @"font-size" : @12}];
    _location = [CustomViews customLabel:@"1215 e jefferson st" options:@{@"text-alignment" : [NSNumber numberWithInt:NSTextAlignmentLeft], @"font-color" : TDGrey900, @"font-name" : FONTROBOTOLIGHT, @"font-size" : @9}];
    _icon = [CustomViews customImageView:@"in-icon"];
    _borderBottom = [CustomViews coloredDot:TDGrey300];
    
    [self addSubview:_borderBottom];
    [self addSubview:_action];
    [self addSubview:_datetime];
    [self addSubview:_location];
    [self addSubview:_icon];
    
    //Icon constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:40.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:40.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:40.0]];
    
    //DateTime constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_datetime attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_datetime attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_datetime attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:35.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_datetime attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:140.0]];
    
    
    //action constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_action attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_icon attribute:NSLayoutAttributeRight multiplier:1.0 constant:10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_action attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_icon attribute:NSLayoutAttributeTop multiplier:1.0 constant:4.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_action attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:13.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_action attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:140.0]];
    
    
    //action constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_location attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_icon attribute:NSLayoutAttributeRight multiplier:1.0 constant:10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_location attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_action attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_location attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:14.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_location attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:140.0]];
    
    //Border bottom
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    
}

@end

#pragma mark - Report Controller

@interface ReportsController ()

@end

@implementation ReportsController{
    NSMutableArray *days;
    NSMutableDictionary *data;
    NSMutableArray *datakeys;
    
    NSString *dropDownDay;
}

-(instancetype)init{
    self = [super init];
    if(self){
        [self setup];
    }
    return self;
}


#pragma mark - TableView Delegate


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ReportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reportCell"];
    if(!cell){
        cell = [[ReportCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reportCell"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        ReportHeaderView *headerView  = [[ReportHeaderView alloc] init];
        headerView.weekLabel.text = [NSString stringWithFormat:@"Week of %@", [datakeys objectAtIndex:section]];
    
        return headerView;
    }else{
        ReportDayView *dayView = [[ReportDayView alloc] init];
        dayView.dayLabel.text = [days objectAtIndex:section-1];
        return dayView;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return days.count+1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section % 2 == 0){
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 40;
    }else{
        return 50;
    }
}


#pragma mark - Setup

-(void)setup{
    days = [NSMutableArray arrayWithArray:@[@"Monday", @"Tuesday", @"Wednesdsay", @"Thursday", @"Friday", @"Saturday", @"Sunday"]];
    datakeys = [NSMutableArray arrayWithArray:@[@"1/9/17 - 1/16/17"]];
    data = [NSMutableDictionary dictionaryWithDictionary:
            @{@"1/9/17 - 1/16/17": @{@"Monday": @[@{@"action":@"Check In", @"location": @"1215 e lemon st", @"datetime":@"January 3rd, 2017\n 10:00:51am"}],
                                    @"Tuesday":@[],
                                    @"Wednesdsay":@[],
                                    @"Thursday":@[],
                                     @"Friday": @[],
                                     @"Satuday": @[],
                                     @"Sunday": @[]}} ];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] init];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
}

@end

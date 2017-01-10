//
//  RightMenu.m
//  FyresiteCheckin
//
//  Created by Travis Delly on 1/9/17.
//  Copyright © 2017 Fyresite. All rights reserved.
//

#import "OptionDropDown.h"
#import "AppDelegate.h"

@interface DropDownCell : UITableViewCell

@property UIView *borderBottom;

@end

@implementation DropDownCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupCell];
    }
    return self;
}

-(void)setupCell{
    
    _borderBottom = [CustomViews coloredDot:TDGrey300];
    [self addSubview:_borderBottom];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_borderBottom attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0f]];
}

@end

@implementation OptionDropDown{
    AppDelegate *sharedDelegate;
}

-(instancetype)init{
    self = [super init];
    if(self){
        sharedDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [CustomViews addShadowToView:self options:@{}];
        self.layer.borderWidth = 1;
        self.layer.borderColor = TDGrey300.CGColor;
        [self setup];
    }
    return self;
}

-(void)addToView:(UIViewController*)viewController{
    [viewController.view addSubview:self];
    self.tag = EditDropDownTag;
    self.alpha = 0.0f;
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:viewController.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15.0];
    [viewController.view addConstraint:constraint];
    [viewController.view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:150.0]];
    [viewController.view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:150.0]];
    [viewController.view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:viewController.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
    [viewController.view layoutIfNeeded];
    
    constraint.constant = 0.0f;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0f;
        [viewController.view layoutIfNeeded];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 2){
        [self removeFromSuperview];
    }else if(indexPath.row == 1) {
//        [_delegate DropDownDeleteButtonClicked:self];
        
    }else if(indexPath.row == 0){
//        [_delegate DropDownPrivacyButtonClicked:self];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DropDownCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[DropDownCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if(indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"privacy-grey"];
        cell.textLabel.text = @"Privacy";
        cell.borderBottom.hidden = YES;
    }else if(indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"trash-grey"];
        cell.textLabel.text = @"Delete";
    }
    else if(indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"back-grey"];
        cell.textLabel.text = @"Back";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)setup{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_tableView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
}

@end

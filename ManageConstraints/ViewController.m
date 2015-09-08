//
//  ViewController.m
//  ManageConstraints
//
//  Created by Adusa on 15/9/8.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "MyLabel.h"
#import "ConstraintsHelper.h"
@interface ViewController ()

@end

@implementation ViewController
{
    MyLabel *view1;
    BOOL top;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem*nextBarButton=[[UIBarButtonItem alloc]initWithTitle:@"GO" style:UIBarButtonItemStyleDone target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=nextBarButton;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    view1=[[MyLabel alloc]init];
    view1.text=@"View1";
    view1.backgroundColor = [UIColor colorWithRed:0.694 green:0.894 blue:0.702 alpha:1];
    view1.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:view1];
    
    NSLayoutConstraint *updatedConstraint = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [self.view addConstraint:updatedConstraint];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    [self.view addConstraint:constraint];
    top=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)next:(UIBarButtonItem *)item
{
    if (top) {
        NSLayoutConstraint *constraintToMatch=[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
        [self.view removeMatchingConstraint:constraintToMatch];
        
        NSLayoutConstraint *updatedConstraint=[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
        [self.view addConstraint:updatedConstraint];
    }
    else
    {
        NSLayoutConstraint *constraintToMatch  = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
        [self.view removeMatchingConstraint:constraintToMatch ];
    
        NSLayoutConstraint *updatedConstraint = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
        [self.view addConstraint:updatedConstraint];
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    top = !top;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

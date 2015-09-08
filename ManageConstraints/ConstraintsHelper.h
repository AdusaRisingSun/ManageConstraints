//
//  ConstraintsHelper.h
//  ManageConstraints
//
//  Created by Adusa on 15/9/8.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ConstraintsHelper)
-(BOOL)constraint:(NSLayoutConstraint*)constraint1 matches:(NSLayoutConstraint*)constraint2;
-(NSLayoutConstraint*)constraintMatchingConstraint:(NSLayoutConstraint*)aConstraint;
-(void)removeMatchingConstraint:(NSLayoutConstraint *)aConstraint;
-(void)removeMatchingConstraints:(NSArray *)anArray;
@end

//
//  ConstraintsHelper.m
//  ManageConstraints
//
//  Created by Adusa on 15/9/8.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ConstraintsHelper.h"

@implementation UIView (ConstraintsHelper)
-(BOOL)constraint:(NSLayoutConstraint *)constraint1 matches:(NSLayoutConstraint *)constraint2
{
    if (constraint1.firstItem!=constraint2.firstItem) {
        return NO;
    }
    if (constraint1.secondItem !=constraint2.secondItem) {
        return NO;
    }
    if (constraint1.firstAttribute!=constraint2.firstAttribute) {
        return NO;
    }
    if (constraint1.secondAttribute!=constraint2.secondAttribute) {
        return NO;
    }
    if (constraint1.relation!=constraint2.relation) {
        return NO;
    }
    if (constraint1.multiplier!=constraint2.multiplier) {
        return NO;
    }
    if (constraint1.constant!=constraint2.constant) {
        return NO;
    }
    return YES;
}

-(NSLayoutConstraint*)constraintMatchingConstraint:(NSLayoutConstraint *)aConstraint
{
    for (NSLayoutConstraint*constraint in self.constraints) {
        if ([self constraint:constraint matches:aConstraint]) {
            return constraint;
        }
    }
    for (NSLayoutConstraint*constraint in self.superview.constraints) {
        if ([self constraint:constraint matches:aConstraint]) {
            return constraint;
        }
    }
    return nil;
}

-(void)removeMatchingConstraint:(NSLayoutConstraint *)aConstraint
{
    NSLayoutConstraint *match=[self constraintMatchingConstraint:aConstraint];
    if (match) {
        [self removeConstraint:match];
        [self.superview removeConstraint:match];
    }
}

-(void)removeMatchingConstraints:(NSArray *)anArray
{
    for (NSLayoutConstraint *constraint in anArray) {
        [self removeMatchingConstraint:constraint];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

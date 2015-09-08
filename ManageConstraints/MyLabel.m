//
//  MyLabel.m
//  VisualFormat
//
//  Created by Adusa on 15/9/8.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.textAlignment=NSTextAlignmentCenter;
        self.textColor=[UIColor darkGrayColor];
    }
    return self;
}
-(CGSize)intrinsicContentSize
{
    return CGSizeMake(100, 100);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

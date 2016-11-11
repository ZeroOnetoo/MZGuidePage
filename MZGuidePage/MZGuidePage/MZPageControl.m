//
//  MZPageControl.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "MZPageControl.h"

@implementation MZPageControl

- (instancetype)init{
    self = [super init];
    if (self) {
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height*4/5);
        self.currentPageIndicatorTintColor = [UIColor redColor];
    }
    return self;
}

@end

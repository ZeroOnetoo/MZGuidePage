//
//  MZButton.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "MZButton.h"

@implementation MZButton

- (instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIImage imageNamed:@"splash_video_ignore_132x44_.png"].size.width, [UIImage imageNamed:@"splash_video_ignore_132x44_.png"].size.height);
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height*8/9);
        [self setBackgroundImage:[UIImage imageNamed:@"splash_video_ignore_132x44_.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"splash_video_ignore_click_132x44_.png"] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(enterInfotheAppAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
//发送“更换根视图”消息
- (void)enterInfotheAppAction{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MZChangeViewControllerNotification" object:nil];
}

@end

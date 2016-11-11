//
//  ViewController.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, 300)];
    label.text = @"千呼万唤终究来，感谢感谢！！！";
    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:36];
    label.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

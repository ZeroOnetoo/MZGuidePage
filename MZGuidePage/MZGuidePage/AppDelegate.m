//
//  AppDelegate.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MZGuidePageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    NSString *key = @"CFBundleVersion";
    //取出沙盒中存储上次使用软件的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:key];
    //获取当前软件的版本号
    NSString *currenVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currenVersion isEqualToString:lastVersion]) {
        application.statusBarHidden = NO;
        _window.rootViewController = [ViewController new];
    }else{  //新版本
        //新特性（新手指导页）
        NSMutableArray *urls = [[NSMutableArray alloc]initWithCapacity:4];
        for (int i=0; i<4; i++) {
            NSString *fileName = [NSString stringWithFormat:@"guide_%02d.jpg",i+1];
            NSURL *url = [[NSBundle mainBundle]URLForResource:fileName withExtension:nil];
            [urls addObject:url];
        }
        MZGuidePageController *gvc = [[MZGuidePageController alloc]initWithURLs:urls CompletionHandel:^{
            ViewController *vc = [[ViewController alloc]init];
            _window.rootViewController = vc;
        }];
        _window.rootViewController = gvc;
        //存储新版本
        [defaults setObject:currenVersion forKey:key];
        [defaults synchronize];
    }
    
    [_window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

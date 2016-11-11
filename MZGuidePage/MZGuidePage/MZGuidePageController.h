//
//  MZGuidePageController.h
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZGuidePageController : UIViewController

- (instancetype)initWithURLs:(NSArray *)urls CompletionHandel:(void(^)())completionHandleBlock;
@end

//
//  MZGuidePageController.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "MZGuidePageController.h"
#import "MZPageControl.h"
#import "MZLoopView.h"

typedef void(^CompletionHandleBlock)();

@interface MZGuidePageController ()<UICollectionViewDelegate>
@property (nonatomic,strong) NSArray *urls;
@property (nonatomic,strong) CompletionHandleBlock completionHandleBlock;
@property (nonatomic,strong) MZPageControl *pageControl;
@end

@implementation MZGuidePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    MZLoopView *loopView = [[MZLoopView alloc]initWithURLs:_urls];
    loopView.frame = self.view.frame;
    loopView.delegate = self;
    [self.view addSubview:loopView];
    MZPageControl *page = [[MZPageControl alloc]init];
    page.backgroundColor = [UIColor yellowColor];
    page.numberOfPages = _urls.count;
    [self.view addSubview:page];
    //注册消息
    [[NSNotificationCenter defaultCenter]addObserverForName:@"MZChangeViewControllerNotification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        _completionHandleBlock();
    }];
}

- (instancetype)initWithURLs:(NSArray *)urls CompletionHandel:(void(^)())completionHandleBlock{
    if (self = [super init]) {
        _urls = urls;
        _completionHandleBlock = completionHandleBlock;
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageIndex = (scrollView.contentOffset.x + self.view.bounds.size.width * 0.5) / self.view.bounds.size.width;
    _pageControl.currentPage = pageIndex;
}
@end

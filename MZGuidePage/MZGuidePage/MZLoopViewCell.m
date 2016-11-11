//
//  MZLoopViewCell.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "MZLoopViewCell.h"
#import "MZButton.h"
@interface MZLoopViewCell()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) MZButton *button;
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation MZLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _button = [[MZButton alloc]init];
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_button];
    }
    return self;
}

- (void)setUrl:(NSURL *)url{
    _url = url;
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    _imageView.image = image;
    _button.hidden = self.isButtonHiden;
    //button不隐藏时，倒计时5秒
    if (!self.isButtonHiden) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(skippingGuidePageAction) userInfo:nil repeats:NO];
        _timer = timer;
//        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }else{
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)skippingGuidePageAction{
    [_button enterInfotheAppAction];
}


@end

//
//  MZLoopView.m
//  MZGuidePage
//
//  Created by iosh on 16/11/10.
//  Copyright © 2016年 iosh. All rights reserved.
//

#import "MZLoopView.h"
#import "MZLoopViewCell.h"
#import "MZLoopViewLayout.h"

NSString *const MZCellID = @"cellId";
@interface MZLoopView()<UICollectionViewDataSource>
@property (nonatomic,strong) NSArray *urls;
@end

@implementation MZLoopView

- (instancetype)initWithURLs:(NSArray<NSURL *> *)urls{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[MZLoopViewLayout alloc] init]];
    if (self) {
        _urls = urls;
        self.dataSource = self;
        [self registerClass:[MZLoopViewCell class] forCellWithReuseIdentifier:MZCellID];
    }
    return self;
}
#pragma mark - UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _urls.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MZLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MZCellID forIndexPath:indexPath];
    if (indexPath.item == (_urls.count-1)) {
        cell.isButtonHiden = NO;
    }else{
        cell.isButtonHiden = YES;
    }
    cell.url = _urls[indexPath.item];
    return cell;
}




@end

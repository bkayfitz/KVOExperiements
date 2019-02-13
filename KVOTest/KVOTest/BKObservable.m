//
//  BKObservable.m
//  KVOTest
//
//  Created by Brian Kayfitz on 2019-02-13.
//  Copyright © 2019 Brian Kayfitz. All rights reserved.
//

#import "BKObservable.h"

@implementation BKObservable
bool _isRandomizing = NO;

- (id) init {
    self = [super init];
    [self generateRandomizedData];
    return self;
}

- (void) randomizeData {
    _isRandomizing = YES;
    [self generateRandomizedData];
}

- (void) generateRandomizedData {
    self.data = [[NSUUID UUID] UUIDString];
    
    if (!_isRandomizing) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf generateRandomizedData];
    });
}

- (void) stopRandomizingData {
    _isRandomizing = NO;
}

@end

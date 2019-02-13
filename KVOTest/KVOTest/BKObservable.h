//
//  BKObservable.h
//  KVOTest
//
//  Created by Brian Kayfitz on 2019-02-13.
//  Copyright © 2019 Brian Kayfitz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKObservable : NSObject
@property (strong, nonatomic) NSString *data;

- (void) randomizeData;
- (void) stopRandomizingData;
@end

NS_ASSUME_NONNULL_END

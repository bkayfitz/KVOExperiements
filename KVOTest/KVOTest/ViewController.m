//
//  ViewController.m
//  KVOTest
//
//  Created by Brian Kayfitz on 2019-02-13.
//  Copyright © 2019 Brian Kayfitz. All rights reserved.
//

#import "ViewController.h"
#import "BKObservable.h"

void *kvoContext = &kvoContext;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *randomLabel;
@property (strong, nonatomic) BKObservable *observable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _observable = [[BKObservable alloc] init];
    _randomLabel.text = _observable.data;
}

- (IBAction)startTapped:(id)sender {
    [_observable addObserver:self
                  forKeyPath:NSStringFromSelector(@selector(data))
                     options:NSKeyValueObservingOptionNew
                     context:kvoContext];
    [_observable randomizeData];
}

- (IBAction)stopTapped:(id)sender {
    @try {
        [_observable removeObserver:self forKeyPath:NSStringFromSelector(@selector(data))];
    } @catch (NSException *exception) {
        // Don't worry about it
    }

    [_observable stopRandomizingData];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (context == kvoContext) {
        _randomLabel.text = _observable.data;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


@end

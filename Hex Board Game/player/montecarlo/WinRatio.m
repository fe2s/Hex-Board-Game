//
//  Created by fe2s on 4/3/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "WinRatio.h"


@implementation WinRatio

@synthesize wins = _wins;
@synthesize games = _games;

- (id)initNew {
    self = [super init];
    if (self) {
        _wins = 0;
        _games = 0;
    }
    return self;
}

- (void)addWin {
    _wins++;
    _games++;
}

- (void)addLoss {
    _games++;
}

- (void)add:(WinRatio *)anotherWinRatio {
    _wins += anotherWinRatio.games;
    _games += anotherWinRatio.games;
}

- (float)value {
    return ((1.0) * _wins) / _games;
}

- (bool)isPositiveRatio {
    return _games != 0 && [self value] > 0.5;
}

// true if self is better
- (bool)compareTo:(WinRatio *)another {
    if (_games == 0) {
        return false;
    }

    if (another.games == 0) {
        return true;
    }

    return [self value] > [another value];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%f", [self value]];
}


@end
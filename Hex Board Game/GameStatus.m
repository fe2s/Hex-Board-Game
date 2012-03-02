//
//  Created by fe2s on 3/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "GameStatus.h"


@implementation GameStatus {

@private Player _nextTurnPlayer;
@private bool _isEnded;
@private Player _winner;

}

- (id)initNew {
    self = [super init];
    if (self) {
        _winner = None;
        _isEnded = false;
        _nextTurnPlayer = Red; // OK ?
    }
    return self;
}

- (Player)_inversePlayer :(Player)p {
    return p == Blue ? Red : Blue;
}

- (Player)prevTurnPlayer {
    // not abs correct
    return [self _inversePlayer:_nextTurnPlayer];
}

- (Player)nextTurnPlayer {
    return _nextTurnPlayer;
}

- (void)victory:(Player)winner {
    _winner = winner;
    _nextTurnPlayer = None;
    _isEnded = true;
}

- (void)toggleTurn {
    _nextTurnPlayer = [self _inversePlayer:_nextTurnPlayer];
}

- (bool)isEnded {
    return _isEnded;
}

- (Player)winner {
    return _isEnded ? _winner : None;
}

@end
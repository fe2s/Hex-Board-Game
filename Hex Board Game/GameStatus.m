//
//  Created by fe2s on 3/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "GameStatus.h"


@implementation GameStatus

@synthesize timeForMoveLeft = _timeForMoveLeft;

- (id)initNew:(id <Player>)firstPlayer:(id <Player>)secondPlayer {
    self = [super init];
    if (self) {
        _isEnded = false;
        _firstPlayer = firstPlayer;
        _secondPlayer = secondPlayer;
        _nextMovePlayer = firstPlayer;
    }
    return self;
}

- (id <Player>)_inversePlayer :(id <Player>)p {
    return p == _firstPlayer ? _secondPlayer : _firstPlayer;
}

- (id <Player>)prevMovePlayer {
    // not abs correct
    return [self _inversePlayer:_nextMovePlayer];
}

- (id <Player>)nextMovePlayer {
    return _nextMovePlayer;
}

- (void)victory:(id <Player>)winner {
    _winner = winner;
    _isEnded = true;
}

- (void)toggleMove {
    _nextMovePlayer = [self _inversePlayer:_nextMovePlayer];
}

- (bool)isEnded {
    return _isEnded;
}

- (id <Player>)winner {
    return _isEnded ? _winner : nil;
}

- (bool)isMoveTimeLimited {
    return _nextMovePlayer.isMoveTimeLimited;
}


@end
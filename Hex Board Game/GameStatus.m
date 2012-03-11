//
//  Created by fe2s on 3/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "GameStatus.h"


@implementation GameStatus {

    id <Player> _firstPlayer;
    id <Player> _secondPlayer;

    id <Player> _nextTurnPlayer;
    bool _isEnded;
    id <Player> _winner;

}

@synthesize timeForTurnLeft = _timeForTurnLeft;

- (id)initNew:(id <Player>)firstPlayer:(id <Player>)secondPlayer {
    self = [super init];
    if (self) {
        _isEnded = false;
        _firstPlayer = firstPlayer;
        _secondPlayer = secondPlayer;
        _nextTurnPlayer = firstPlayer;
    }
    return self;
}

- (id <Player>)_inversePlayer :(id <Player>)p {
    return p == _firstPlayer ? _secondPlayer : _firstPlayer;
}

- (id <Player>)prevTurnPlayer {
    // not abs correct
    return [self _inversePlayer:_nextTurnPlayer];
}

- (id <Player>)nextTurnPlayer {
    return _nextTurnPlayer;
}

- (void)victory:(id <Player>)winner {
    _winner = winner;
    _isEnded = true;
}

- (void)toggleTurn {
    _nextTurnPlayer = [self _inversePlayer:_nextTurnPlayer];
}

- (bool)isEnded {
    return _isEnded;
}

- (id <Player>)winner {
    return _isEnded ? _winner : nil;
}

- (bool)isTurnTimeLimited {
    return _nextTurnPlayer.isTurnTimeLimited;
}


@end
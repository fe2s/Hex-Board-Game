//
//  Created by Oleksiy Dyagilev on 3/26/12.
//

#import "PlayersPair.h"
#import "Player.h"


@implementation PlayersPair

@synthesize first = _firstPlayer;
@synthesize second = _secondPlayer;


- (id)initWithFirstPlayer:(id <Player>)firstPlayer secondPlayer:(id <Player>)secondPlayer {
    self = [super init];
    if (self) {
        _firstPlayer = firstPlayer;
        _secondPlayer = secondPlayer;
    }

    return self;
}

- (id <Player>)anotherOne:(id <Player>)player {
    return player == _firstPlayer ? _secondPlayer : _firstPlayer;
}


@end
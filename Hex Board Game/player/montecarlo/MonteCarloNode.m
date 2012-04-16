//
//  Created by Oleksiy Dyagilev on 3/26/12.
//

#import "MonteCarloNode.h"
#import "Board.h"
#import "RandomUtils.h"
#import "Hex.h"
#import "PlayersPair.h"
#import "WinRatio.h"
#import "Player.h"


@implementation MonteCarloNode

@synthesize board = _board;
@synthesize turn = _turn;
@synthesize winner = _winner;

- (id)initWithBoard:(Board *)board:(Hex *)turn:(MonteCarloNode *)parent {
    self = [super init];
    if (self) {
        _board = board;
        _turn = turn;
        _children = [[NSMutableArray alloc] init];
        _undiscovered = [NSMutableSet setWithArray:_board.emptyHexes];
        _parent = parent;
//        _winRatio = [[WinRatio alloc] initNew];
    }
    return self;
}

- (NSMutableArray *)children {
    return _children;
}

- (NSMutableSet *)undiscovered {
    return _undiscovered;
}

- (bool)isRoot {
    return _parent == nil;
}

- (bool)findWinnerPath {
    if ([self isRoot]) {
        return false;
    }

    Boolean isWinner = [_board findWinnerPath:_turn.player];
    if (isWinner) {
        _winner = _turn.player;
    }
    return isWinner;
}

- (bool)hasWinner {
    return _winner != nil;
}


@end
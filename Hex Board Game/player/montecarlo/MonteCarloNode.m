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
@synthesize move = _move;
@synthesize winner = _winner;

- (id)initWithBoard:(Board *)board:(Hex *)move:(MonteCarloNode *)parent {
    self = [super init];
    if (self) {
        _board = board;
        _move = move;
        _children = [[NSMutableArray alloc] init];
        _notVisited = [NSMutableSet setWithArray:_board.emptyHexes];
        _parent = parent;
//        _winRatio = [[WinRatio alloc] initNew];
    }
    return self;
}

- (NSMutableArray *)children {
    return _children;
}

- (NSMutableSet *)notVisited {
    return _notVisited;
}

- (bool)isRoot {
    return _parent == nil;
}

- (bool)findWinnerPath {
    if ([self isRoot]) {
        return false;
    }

    Boolean isWinner = [_board findWinnerPath:_move.player];
    if (isWinner) {
        _winner = _move.player;
    }
    return isWinner;
}

- (bool)hasWinner {
    return _winner != nil;
}


@end
//
//  Game.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game {

@private GameStatus *_status;

}

@synthesize board = _board;


- (id)init {
    self = [super init];
    if (self) {

        const int defaultSize = 3;

        _board = [[Board alloc] initWithSize:defaultSize];
        _status = [[GameStatus alloc] initNew];

    }
    return self;
}


- (void)onTurnMade {

    [_status toggleTurn];

    // check for winner
    Player player = [_status prevTurnPlayer];

    if ([_board checkForWinner:player]) {
        [_status victory:player];
    }

}


- (GameStatus *)status {
    return _status;
}

@end

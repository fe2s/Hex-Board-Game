//
//  Game.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Player.h"
#import "Human.h"

@implementation Game {

    GameStatus *_status;

    id <Player> _firstPlayer;
    id <Player> _secondPlayer;

}

@synthesize board = _board;


- (id)init {
    self = [super init];
    if (self) {

        _firstPlayer = [[Human alloc] initWithId:1 horizontal:true name:@"vasya"];
        _secondPlayer = [[Human alloc] initWithId:2 horizontal:false name:@"petya"];

        const int defaultSize = 6;

        _board = [[Board alloc] initWithSize:defaultSize];

        _status = [[GameStatus alloc] initNew:_firstPlayer :_secondPlayer];

    }
    return self;
}


- (void)onTurnMade {

    [_status toggleTurn];

    // check for winner
    id<Player> player = [_status prevTurnPlayer];

    if ([_board checkForWinner:player]) {
        [_status victory:player];
    }

}


- (GameStatus *)status {
    return _status;
}

@end

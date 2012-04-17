//
//  Game.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Human.h"
#import "Hex.h"
#import "RandomAI.h"
#import "MonteCarloAI.h"

@implementation Game

@synthesize board = _board;

- (id)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _view = view;

        _firstPlayer = [[Human alloc] initWithId:1 horizontal:true name:@"vasya"];
//        _secondPlayer = [[Human alloc] initWithId:2 horizontal:false name:@"petya"];
        _secondPlayer = [[MonteCarloAI alloc] initWithId:2 horizontal:false name:@"Random AI"];

        const int defaultSize = 6;

        _board = [[Board alloc] initWithSize:defaultSize];

        _status = [[GameStatus alloc] initNew:_firstPlayer :_secondPlayer];

    }
    return self;
}

- (void)tickerThread:(id)param {
    while (_status.timeForMoveLeft > 0) {
        NSLog(@"ticker");
        [_view performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:false];
        [NSThread sleepForTimeInterval:1];
        _status.timeForMoveLeft = _status.timeForMoveLeft - 1;
    }
}


- (void)aiMoveThread:(id)param {
    const int moveTimeLimitSec = 5;

    [NSThread sleepForTimeInterval:moveTimeLimitSec];

    id <Player> nextPlayer = [_status nextMovePlayer];
    Hex *movePosition = [nextPlayer makeMove:_board :moveTimeLimitSec];
    [_board applyMove:movePosition :nextPlayer];

    [self onMoveMade];
    [_view performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:false];

}

- (void)onMoveMade {

    [_status toggleMove];

    // check for winner
    id <Player> player = [_status prevMovePlayer];

    if ([_board findWinnerPath:player]) {
        [_status victory:player];
        return;
    }

    id <Player> nextPlayer = [_status nextMovePlayer];
    if (nextPlayer.isHuman) {
        return;
    } else {
//        AI move in background thread
        [NSThread detachNewThreadSelector:@selector(aiMoveThread:) toTarget:self withObject:nil];
        _status.timeForMoveLeft = 5;
        // ticker background thread
        [NSThread detachNewThreadSelector:@selector(tickerThread:) toTarget:self withObject:nil];

    }


}

// return if turn made
- (bool)humanMove:(CGPoint)touchLocation {
    if (![[_status nextMovePlayer] isHuman]) {
        NSLog(@"Human move is not allowed !");
        return false;
    }

    NSMutableArray *hexes = _board.hexes;

    for (Hex *hex in hexes) {
        if ([hex contains:touchLocation] && hex.player == nil) {
            NSLog(@"Hit hex %@", hex);

            hex.player = [_status nextMovePlayer];

            [self onMoveMade];

            return true;
        }
    }

    return false;
}


- (GameStatus *)status {
    return _status;
}

@end

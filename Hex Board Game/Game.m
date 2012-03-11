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

@implementation Game {

    UIView *_view;

    GameStatus *_status;

    id <Player> _firstPlayer;
    id <Player> _secondPlayer;


}

@synthesize board = _board;


- (id)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _view = view;

        _firstPlayer = [[Human alloc] initWithId:1 horizontal:true name:@"vasya"];
//        _secondPlayer = [[Human alloc] initWithId:2 horizontal:false name:@"petya"];
        _secondPlayer = [[RandomAI alloc] initWithId:2 horizontal:false name:@"Random AI"];

        const int defaultSize = 6;

        _board = [[Board alloc] initWithSize:defaultSize];

        _status = [[GameStatus alloc] initNew:_firstPlayer :_secondPlayer];

    }
    return self;
}

- (void)tickerThread:(id)param {
    while (_status.timeForTurnLeft > 0){
        NSLog(@"ticker");
        [_view performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:false];
        [NSThread sleepForTimeInterval:1];
        _status.timeForTurnLeft = _status.timeForTurnLeft - 1;
    }
}


- (void)aiTurnThread:(id)param {
    const int turnTimeSec = 5;

    [NSThread sleepForTimeInterval:turnTimeSec];

    id <Player> nextPlayer = [_status nextTurnPlayer];
    Hex *turnPosition = [nextPlayer makeTurn:_board];
    turnPosition.player = nextPlayer;

    [self onTurnMade];
    [_view performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:false];

}

- (void)onTurnMade {

    [_status toggleTurn];

    // check for winner
    id <Player> player = [_status prevTurnPlayer];

    if ([_board checkForWinner:player]) {
        [_status victory:player];
        return;
    }

    id <Player> nextPlayer = [_status nextTurnPlayer];
    if (nextPlayer.isHuman) {
        return;
    } else {
//        AI turn in background thread
        [NSThread detachNewThreadSelector:@selector(aiTurnThread:) toTarget:self withObject:nil];
        _status.timeForTurnLeft = 5;
        // ticker background thread
        [NSThread detachNewThreadSelector:@selector(tickerThread:) toTarget:self withObject:nil];

    }


}

// return if turn made
- (bool)humanTurn:(CGPoint)touchLocation {
    if (![[_status nextTurnPlayer] isHuman]) {
        NSLog(@"Human turn is not allowed !");
        return false;
    }

    NSMutableArray *hexes = _board.hexes;

    int hexCount = [hexes count];

    for (int i = 0; i < hexCount; i++) {
        Hex *hex = (Hex *) [hexes objectAtIndex:i];
        if ([hex contains:touchLocation] && hex.player == nil) {
            NSLog(@"Hit hex #%d", i);

            hex.player = [_status nextTurnPlayer];

            [self onTurnMade];

            return true;
        }
    }

    return false;
}


- (GameStatus *)status {
    return _status;
}

@end

//
//  MonteCarloTest.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MonteCarloTest.h"
#import "Player.h"
#import "AIFight.h"
#import "Board.h"
#import "PlayersPair.h"
#import "RandomAI.h"
#import "MonteCarloAI.h"

#import <UIKit/UIKit.h>
//#import "application_headers" as required

@implementation MonteCarloTest

// All code under test is in the iOS Application
- (void)testVsRandom {

    RandomAI *ai1 = [[RandomAI alloc] initWithId:1 horizontal:true name:@"ai 1"];
    MonteCarloAI *ai2 = [[MonteCarloAI alloc] initWithId:2 horizontal:false name:@"Monte Carlo"];

    PlayersPair *players = [[PlayersPair alloc] initWithFirstPlayer:ai1 secondPlayer:ai2];

    Board *board = [[Board alloc] initWithSize:3];

    AIFight *fight = [[AIFight alloc] initWithPlayers:players board:board turnTime:3];
    id <Player> winner = [fight start];
    NSLog(@"winner: %@", winner.name);

}

@end

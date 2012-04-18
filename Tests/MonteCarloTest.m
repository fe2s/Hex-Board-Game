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

- (void)testVsRandom {

    RandomAI *ai1 = [[RandomAI alloc] initWithId:1 horizontal:true name:@"ai 1"];
    MonteCarloAI *ai2 = [[MonteCarloAI alloc] initWithId:2 horizontal:false name:@"Monte Carlo"];

    PlayersPair *players = [[PlayersPair alloc] initWithFirstPlayer:ai1 secondPlayer:ai2];

    Board *board = [[Board alloc] initWithSize:2];

    AIFight *fight = [[AIFight alloc] initWithPlayers:players board:board moveTimeLimit:3];
    id <Player> winner = [fight start];
    NSLog(@"winner: %@", winner.name);

}

- (void)testVsRandom_batch {

    RandomAI *ai1 = [[RandomAI alloc] initWithId:1 horizontal:true name:@"ai 1"];
    MonteCarloAI *ai2 = [[MonteCarloAI alloc] initWithId:2 horizontal:false name:@"Monte Carlo"];

    PlayersPair *players = [[PlayersPair alloc] initWithFirstPlayer:ai1 secondPlayer:ai2];

    const int gamesNum = 1;

    int monteCarloWins = 0;
    for (int i = 0; i < gamesNum; i++) {
        Board *board = [[Board alloc] initWithSize:11];
        AIFight *fight = [[AIFight alloc] initWithPlayers:players board:board moveTimeLimit:1];
        id <Player> winner = [fight start];
        if (winner == ai2) {
            monteCarloWins++;
        }
    }

    NSLog(@"monte carlo win rate: %f", monteCarloWins*1.0 / gamesNum);


}

@end

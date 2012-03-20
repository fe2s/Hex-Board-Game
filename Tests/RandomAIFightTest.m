//
//  Created by Oleksiy Dyagilev on 3/20/12.
//

#import "RandomAIFightTest.h"
#import "RandomAI.h"
#import "Board.h"
#import "AIFight.h"


@implementation RandomAIFightTest


- (void)testExample {

    RandomAI *ai1 = [[RandomAI alloc] initWithId:1 horizontal:true name:@"ai 1"];
    RandomAI *ai2 = [[RandomAI alloc] initWithId:2 horizontal:false name:@"ai 2"];
    Board *board = [[Board alloc] initWithSize:1];

    AIFight *fight = [[AIFight alloc] initWithPlayers:ai1 secondAI:ai2 board:board turnTime:3];
    id <Player> winner = [fight start];
    NSLog(@"winner: %@", winner.name);

}

@end
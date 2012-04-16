//
//  Created by Oleksiy Dyagilev on 3/21/12.
//

#import "MonteCarloAI.h"
#import "Board.h"
#import "MonteCarloNode.h"
#import "RandomUtils.h"
#import "Hex.h"
#import "PlayersPair.h"
#import "Stack.h"
#import "WinRatio.h"

@implementation MonteCarloAI

- (id <Player>)findOpponentOnBoard:(Board *)board {

    for (Hex *h in board.hexes) {
        if (h.player != nil && h.player != self) {
            return h.player;
        }
    }

    @throw [NSException exceptionWithName:nil reason:@"opponent not found on board" userInfo:nil];
}

- (PlayersPair *)getPlayers:(Board *)board {
    id <Player> opponent = [self findOpponentOnBoard:board];
    return [[PlayersPair alloc] initWithFirstPlayer:self secondPlayer:opponent];
}


- (void)simulate:(MonteCarloNode *)root:(PlayersPair *)players {

    MonteCarloNode *currNode = root;
    int iteratesCount = 0;

    // TODO: replace with time constraints
    while (iteratesCount++ != 10000) {

        Board *board = currNode.board;

        // check for winner
        Boolean isWinner = [currNode findWinnerPath];
        if (isWinner) {
            // start from root
            currNode = root;
            continue;
        }

        // selection: pick random from undiscovered set
        Hex *selection = [RandomUtils pickAnyFromSet:currNode.undiscovered];
        if (selection == nil) {
            // all discovered, pick child and go down. Simply random for now. TODO: enhance
            currNode = [RandomUtils pickAnyFromArray:currNode.children];
            continue;
        }

        // fork board
        Board *newChildBoard = [board copy];

        // apply turn
        id <Player> player;
        if ([currNode isRoot]) {
            player = self;
        } else {
            player = [players anotherOne:currNode.turn.player];
        }
        Hex *turn = [newChildBoard applyTurn:selection :player];

        // add to children and remove from undiscovered set
        MonteCarloNode *newChildNode = [[MonteCarloNode alloc] initWithBoard:newChildBoard :turn :currNode];
        [currNode.children addObject:newChildNode];
        [currNode.undiscovered removeObject:selection];

        currNode = newChildNode;
    }

}

- (WinRatio *)calcWinRatio:(MonteCarloNode *)startNode {
    WinRatio *winRatio = [[WinRatio alloc] initNew];

    // DFS
    Stack *stack = [[Stack alloc] init];
    [stack push:startNode];
    while (![stack isEmpty]) {

        MonteCarloNode *node = [stack pop];

        // win ratio
        if ([node hasWinner]) {
            if ([node winner] == self) {
                [winRatio addWin];
            } else {
                [winRatio addLoss];
            }
        }

        // children
        for (MonteCarloNode *child in node.children) {
            [stack push:child];
        }
    }

    return winRatio;
}

- (Hex *)selectBestTurn:(MonteCarloNode *)root {

    WinRatio *bestRatio = [[WinRatio alloc] initNew];
    Hex *bestTurn = nil;

    for (MonteCarloNode *child in root.children) {
        WinRatio *ratio = [self calcWinRatio:child];
        NSLog(@"win ratio %@", ratio);
        if ([ratio compareTo:bestRatio]) {
            bestRatio = ratio;
            bestTurn = child.turn;
        }
    }

    if (bestTurn == nil) {
        // TODO: we should select any, but raise exception for now
        @throw [NSException exceptionWithName:nil reason:@"Couldn't find best turn" userInfo:nil];
    }
    return bestTurn;
}


- (Hex *)makeTurn:(Board *)board :(int)turnTime {

    PlayersPair *players = [self getPlayers:board];
    id <Player> opponent = [players anotherOne:self];

    MonteCarloNode *root = [[MonteCarloNode alloc] initWithBoard:board :nil :nil];

    // simulate
    [self simulate:root :players];


    return [self selectBestTurn:root];
}


@end
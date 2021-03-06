//
//  Created by Oleksiy Dyagilev on 3/26/12.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@class Board;
@class PlayersPair;
@class Hex;
@class WinRatio;
@protocol Player;


@interface MonteCarloNode : NSObject {

    Board *_board;
    Hex *_move;
    MonteCarloNode *_parent;

    NSMutableSet *_notVisited; // hexes = (board.emptyHexes - children)
    NSMutableArray *_children; // nodes

    id <Player> _winner;
}

@property(nonatomic, readonly, strong) Board *board;
@property(nonatomic, readonly, strong) Hex *move;
@property(nonatomic, strong) id <Player> winner;

- (id)initWithBoard:(Board *)board:(Hex *)turn:(MonteCarloNode *)parent;

- (NSMutableArray *)children;

- (NSMutableSet *)notVisited;

- (bool)findWinnerPath;

- (bool)hasWinner;

- (bool)isRoot;




//- (WinRatio *)winRatio;

@end
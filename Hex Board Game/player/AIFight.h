//
//  Created by Oleksiy Dyagilev on 3/12/12.
//

#import <Foundation/Foundation.h>

@protocol Player;
@class Board;
@class PlayersPair;
@class GameStatus;


@interface AIFight : NSObject   {

    PlayersPair *_players;
    Board *_board;
    GameStatus *_gameStatus;
    int _turnTime;
}

- (id)initWithPlayers:(PlayersPair *)players board:(Board *)board turnTime:(int)turnTime;

- (id <Player>)start;

@end
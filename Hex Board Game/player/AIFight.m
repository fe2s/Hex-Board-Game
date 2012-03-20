//
//  Created by Oleksiy Dyagilev on 3/12/12.
//

#import "AIFight.h"
#import "GameStatus.h"
#import "Player.h"
#import "Board.h"
#import "Hex.h"


@implementation AIFight {

    id <Player> _firstAI;
    id <Player> _secondAI;
    Board *_board;
    GameStatus *_gameStatus;
    int _turnTime;
}
- (id)initWithPlayers:(id <Player>)firstAI secondAI:(id <Player>)secondAI board:(Board *)board turnTime:(int)turnTime {
    self = [super init];
    if (self) {
        _firstAI = firstAI;
        _secondAI = secondAI;
        _board = board;
        _gameStatus = [[GameStatus alloc] initNew:_firstAI :_secondAI];
        _turnTime = turnTime;
    }

    return self;
}

- (id <Player>)start {

    while (!_gameStatus.isEnded) {
        // make turn
        id <Player> player = _gameStatus.nextTurnPlayer;
        Hex *hex = [player makeTurn:_board :_turnTime];
        hex.player = player;
        NSLog(@"player [%@]: %@ ", player.name, hex.toString);
        [_gameStatus toggleTurn];

        // check for winner
        if ([_board checkForWinner:player]) {
            [_gameStatus victory:player];
        }

    }
    return _gameStatus.winner;

}


@end
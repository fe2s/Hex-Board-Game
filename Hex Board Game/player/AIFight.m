//
//  Created by Oleksiy Dyagilev on 3/12/12.
//

#import "AIFight.h"
#import "GameStatus.h"
#import "Player.h"
#import "Board.h"
#import "Hex.h"
#import "PlayersPair.h"


@implementation AIFight

- (id)initWithPlayers:(PlayersPair *)players board:(Board *)board moveTimeLimit:(int)moveTimeLimit {
    self = [super init];
    if (self) {
        _players = players;
        _board = board;
        _gameStatus = [[GameStatus alloc] initNew:_players.first :_players.second];
        _turnLimit = moveTimeLimit;
    }

    return self;
}

- (id <Player>)start {

    while (!_gameStatus.isEnded) {
        // make turn
        id <Player> player = _gameStatus.nextMovePlayer;
        Hex *hex = [player makeMove:_board :_turnLimit];

        // validate turn
        if (![[_board at:hex.i :hex.j] isEmpty]){
            @throw [NSException exceptionWithName:nil reason:@"Not valid turn" userInfo:nil];
        }

        [_board applyMove:hex :player];

        NSLog(@"player [%@]: %@ ", player.name, hex);
        [_gameStatus toggleMove];

        // check for winner
        if ([_board findWinnerPath:player]) {
            [_gameStatus victory:player];
        }

    }
    return _gameStatus.winner;

}


@end
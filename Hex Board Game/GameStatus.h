//
//  Created by fe2s on 3/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameStatus : NSObject {

    // TODO: replace with PlayersPair
    id <Player> _firstPlayer;
    id <Player> _secondPlayer;

    id <Player> _nextMovePlayer;
    bool _isEnded;
    id <Player> _winner;

}

@property int timeForMoveLeft;

- (id)initNew:(id <Player>)firstPlayer:(id <Player>)secondPlayer;

- (id <Player>)prevMovePlayer;

- (id <Player>)nextMovePlayer;

- (void)victory:(id <Player>)aWinner;

- (void)toggleMove;

- (bool)isEnded;

- (id <Player>)winner;

- (bool)isMoveTimeLimited;

@end
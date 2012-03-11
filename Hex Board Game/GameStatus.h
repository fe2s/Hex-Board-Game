//
//  Created by fe2s on 3/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameStatus : NSObject {

}

@property int timeForTurnLeft;

- (id)initNew:(id <Player>)firstPlayer:(id <Player>)secondPlayer;

- (id <Player>)prevTurnPlayer;

- (id <Player>)nextTurnPlayer;

- (void)victory:(id <Player>)aWinner;

- (void)toggleTurn;

- (bool)isEnded;

- (id <Player>)winner;

- (bool) isTurnTimeLimited;

@end
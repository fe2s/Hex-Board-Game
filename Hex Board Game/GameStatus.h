//
//  Created by fe2s on 3/1/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameStatus : NSObject {

}

- (id)initNew;

- (Player)prevTurnPlayer;

- (Player)nextTurnPlayer;

- (void)victory:(Player)aWinner;

- (void)toggleTurn;

- (bool)isEnded;

- (Player)winner;


@end
//
//  Created by Oleksiy Dyagilev on 3/12/12.
//

#import <Foundation/Foundation.h>

@protocol Player;
@class Board;


@interface AIFight : NSObject

- (id)initWithPlayers:(id <Player>)firstAI secondAI:(id <Player>)secondAI board:(Board *)board turnTime:(int)turnTime;

- (id <Player>)start;

@end
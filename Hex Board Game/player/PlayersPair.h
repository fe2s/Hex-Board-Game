//
//  Created by Oleksiy Dyagilev on 3/26/12.
//

#import <Foundation/Foundation.h>

@protocol Player;


@interface PlayersPair : NSObject {

    id <Player> _firstPlayer;
    id <Player> _secondPlayer;
}

@property(nonatomic, readonly, strong) id <Player> first;
@property(nonatomic, readonly, strong) id <Player> second;


- (id)initWithFirstPlayer:(id <Player>)firstPlayer secondPlayer:(id <Player>)secondPlayer;

- (id <Player>)anotherOne:(id <Player>)player;

@end
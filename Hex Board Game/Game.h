//
//  Game.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "GameStatus.h"


@interface Game : NSObject {

    UIView *_view;

    GameStatus *_status;

    id <Player> _firstPlayer;
    id <Player> _secondPlayer;

}

@property(nonatomic, readonly, strong) Board *board;


- (id)initWithView:(UIView *)view;

- (void)onMoveMade;

- (GameStatus *)status;

- (bool)humanMove:(CGPoint)touchLocation;


@end

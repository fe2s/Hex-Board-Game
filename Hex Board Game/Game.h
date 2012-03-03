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


@interface Game : NSObject

@property(nonatomic, readonly, strong) Board *board;

//- (void)onTurnMade;

- (GameStatus *)status;

- (bool) humanTurn: (CGPoint) touchLocation;


@end

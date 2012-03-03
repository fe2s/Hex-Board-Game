//
//  Board.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Board : NSObject

@property(nonatomic, readonly) int size;
@property(nonatomic, readonly, strong) NSMutableArray *hexes;

- (id)initWithSize:(int)size;

- (Boolean)checkForWinner:(id<Player>)player;

- (NSMutableArray *) emptyHexes;

@end

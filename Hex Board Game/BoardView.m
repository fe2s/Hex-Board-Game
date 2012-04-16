//
//  BoardView.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"
#import "Hex.h"
#import "HexView.h"

@implementation BoardView

- (BoardView *)initWithBoard:(Board *)board {

    self = [super init];
    if (self) {
        _board = board;
    }
    return self;

}


- (void)draw:(CGContextRef)context {

    NSMutableArray *hexes = _board.hexes;

    for (Hex *hex in hexes) {
        HexView *hexView = [[HexView alloc] initWithHex:hex];

        [hexView draw:context :hex.centerPoint];

    }

}

@end

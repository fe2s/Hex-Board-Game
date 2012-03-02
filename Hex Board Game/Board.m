//
//  Board.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Hex.h"
#import "Stack.h"

@implementation Board

@synthesize size=_size;
@synthesize hexes=_hexes;


- (id)initWithSize:(int)theSize {

    self = [super init];
    if (self) {
        _size = theSize;

        // init hexagons
        _hexes = [[NSMutableArray alloc] initWithCapacity:_size];
        int hexNumber = pow(_size, 2);

        float startCenterPointX = 100;
        float startCenterPointY = 100;

        for (int i = 0; i < hexNumber; i++) {
            Hex *hex = [[Hex alloc] init];
            hex.edgeSize = 20;
            hex.j = i / _size;
            hex.i = i % _size;
            hex.player = None;

            // can optimize
            float deltaX = -(i / _size) * hex.edgeSize * cosf(M_PI/ 6) +
                    (i % _size) * 2 * hex.edgeSize * cosf(M_PI/ 6);

            float deltaY = (i / _size) * (1.5) * hex.edgeSize;

            float centerPointX = startCenterPointX + deltaX;
            float centerPointY = startCenterPointY + deltaY;

            CGPoint centerPoint = {centerPointX, centerPointY};


            hex.centerPoint = centerPoint;

            [_hexes addObject:hex];
        }

    }

    return self;
}

- (Hex *)at:(int)i :(int)j {
    return [_hexes objectAtIndex:j * _size + i];
}


- (NSMutableArray *)neighbours:(Hex *)hex {

    NSMutableArray *res = [[NSMutableArray alloc] init];
    int i = hex.i;
    int j = hex.j;

    if (j > 0) {
        [res addObject:[self at:i :j - 1]];
    }
    if (j > 0 && i > 0) {
        [res addObject:[self at:i - 1 :j - 1]];
    }
    if (i < _size - 1) {
        [res addObject:[self at:i + 1 :j]];
    }
    if (i > 0) {
        [res addObject:[self at:i - 1 :j]];
    }
    if (j < _size - 1) {
        [res addObject:[self at:i :j + 1]];
    }
    if (j < _size - 1 && i < _size - 1) {
        [res addObject:[self at:i + 1 :j + 1]];
    }

    return res;
}

- (void)resetVisitedFlags {

    for (Hex *hex in _hexes) {
        hex.visitedFlag = false;
    }

}

- (Boolean)isRightBorder:(Hex *)hex {
    return hex.i == _size - 1;
}

- (Boolean)isBottomBorder:(Hex *)hex {
    return hex.j == _size - 1;
}


// Blue: left -> right , Red: top -> bottom
- (Boolean)checkForWinner:(Player)player {

    // reset visited flags
    [self resetVisitedFlags];

    // find start hexes
    Stack *stack = [[Stack alloc] init];
    for (int j = 0; j < _size; j++) {
        Hex *hex;
        if (player == Blue) {
            hex = [self at:0 :j];
        } else {
            hex = [self at:j :0];
        }
        if (hex.player == player) {
            [stack push:hex];
        }
    }

    // traverse 
    while (![stack isEmpty]) {

        Hex *h = [stack pop];

        if ((player == Blue && [self isRightBorder:h]) ||
                (player == Red && [self isBottomBorder:h])) {
            return true;
        }

        h.visitedFlag = true;

        NSMutableArray *neighbours = [self neighbours:h];
        for (Hex *neighbour in neighbours) {
            if (!neighbour.visitedFlag && (neighbour.player == player)) {
                [stack push:neighbour];
            }
        }
    }

    return false;
}


@end

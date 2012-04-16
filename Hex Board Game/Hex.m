//
//  Hexagon.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Hex.h"

@implementation Hex

@synthesize edgeSize = _edgeSize;
@synthesize centerPoint = _centerPoint;
@synthesize player = _player;
@synthesize i = _i;
@synthesize j = _j;

- (Boolean)isEmpty {
    return _player == nil;
}

- (Boolean)contains:(CGPoint)point {

    // TODO: rough circle
    float radius = _edgeSize / 1.5;
    return sqrt(pow(point.x - _centerPoint.x, 2) + pow(point.y - _centerPoint.y, 2)) <= radius;

}

- (NSString *)description {
    return [NSString stringWithFormat:@"[%d %d]", _i, _j];
}

- (id)copyWithZone:(NSZone *)zone {
    Hex *another = [[Hex alloc] init];
    another.edgeSize = _edgeSize;
    another.centerPoint = _centerPoint;
    another.player = _player;
    another.i = _i;
    another.j = _j;
    return another;
}


@end

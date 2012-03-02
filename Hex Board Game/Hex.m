//
//  Hexagon.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Hex.h"

@implementation Hex

@synthesize edgeSize;
@synthesize centerPoint;
@synthesize player;
@synthesize i;
@synthesize j;
@synthesize visitedFlag;

- (Boolean) contains: (CGPoint) point {
   
    float radius = edgeSize / 1.5;
    return sqrt(pow(point.x - centerPoint.x, 2) + pow(point.y - centerPoint.y, 2)) <= radius;
    
}

@end

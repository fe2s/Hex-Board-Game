//
//  Hexagon.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface Hex : NSObject

@property(nonatomic) int edgeSize;
@property(nonatomic) CGPoint centerPoint;

@property(nonatomic, strong) id<Player> player;

@property(nonatomic) int i;
@property(nonatomic) int j;


- (Boolean)contains:(CGPoint)point;

- (NSString *) toString;

@end

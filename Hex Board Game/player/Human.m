//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "Human.h"
#import "Hex.h"
#import "Board.h"


@implementation Human

- (bool)isHuman {
    return true;
}

- (Hex *)makeTurn:(Board *)board :(int)turnTime {
    @throw [NSException exceptionWithName:@"I'm too stupid" reason:nil userInfo:nil];
}

- (bool)isTurnTimeLimited {
    return false;
}


@end
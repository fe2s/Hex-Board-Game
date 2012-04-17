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

- (Hex *)makeMove:(Board *)board :(int)moveTimeLimit {
    @throw [NSException exceptionWithName:@"I'm too stupid" reason:nil userInfo:nil];
}

- (bool)isMoveTimeLimited {
    return false;
}


@end
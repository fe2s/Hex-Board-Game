//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "RandomAI.h"
#import "Board.h"
#import "Hex.h"
#import "RandomUtils.h"


@implementation RandomAI

- (Hex *)makeTurn:(Board *)board :(int)turnTime {
      return [RandomUtils pickAnyFromArray:board.emptyHexes];
}

- (bool)isTurnTimeLimited {
    return true;
}

@end
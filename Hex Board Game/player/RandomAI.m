//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "RandomAI.h"
#import "Board.h"
#import "Hex.h"
#import "RandomUtils.h"


@implementation RandomAI

- (Hex *)makeMove:(Board *)board :(int)moveTimeLimit {
      return [RandomUtils pickAnyFromArray:board.emptyHexes];
}

- (bool)isMoveTimeLimited {
    return true;
}

@end
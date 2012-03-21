//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "RandomAI.h"
#import "Board.h"
#import "Hex.h"


@implementation RandomAI

- (Hex *)makeTurn:(Board *)board :(int)turnTime {

    NSMutableArray *emptyHexes = board.emptyHexes;

    int random = arc4random() % [emptyHexes count];

    Hex *hex = [emptyHexes objectAtIndex:random];

    return hex;
}

- (bool)isTurnTimeLimited {
    return true;
}

@end
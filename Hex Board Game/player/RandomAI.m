//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "RandomAI.h"
#import "Board.h"
#import "Hex.h"


@implementation RandomAI {

    int _id;
    bool _horizontal;
    NSString *_name;
}

- (id)initWithId:(int)id horizontal:(bool)horizontal name:(NSString *)name {
    self = [super init];
    if (self) {
        _id = id;
        _horizontal = horizontal;
        _name = name;
    }

    return self;
}

- (int)id {
    return _id;
}

- (NSString *)name {
    return _name;
}

- (bool)horizontal {
    return _horizontal;
}

- (bool)isHuman {
    return false;

}

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
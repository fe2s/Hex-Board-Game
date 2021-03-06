//
//  Created by Oleksiy Dyagilev on 3/21/12.
//

#import "AbstractPlayer.h"


@implementation AbstractPlayer

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
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"isHuman is not implemented"
                                 userInfo:nil];

}

- (Hex *)makeMove:(Board *)board :(int)moveTimeLimit {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"makeTurn is not implemented"
                                 userInfo:nil];
}

- (bool)isMoveTimeLimited {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"isTurnTimeLimited is not implemented"
                                 userInfo:nil];
}

@end
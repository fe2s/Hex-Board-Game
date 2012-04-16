//
//  Stack.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (id)init {

    self = [super init];
    if (self) {
        _arr = [[NSMutableArray alloc] init];
    }
    return self;

}

- (void)push:(id)object {
    [_arr addObject:object];
}

- (id)pop {
    id object = [_arr objectAtIndex:[_arr count] - 1];
    [_arr removeObjectAtIndex:[_arr count] - 1];
    return object;
}

- (Boolean)isEmpty {
    return [_arr count] == 0;
}


@end

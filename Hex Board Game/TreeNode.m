//
//  Created by Oleksiy Dyagilev on 3/21/12.
//

#import "TreeNode.h"


@implementation TreeNode

- (id)initWithValue:(id)value {
    self = [super init];
    if (self) {
        _value = value;
        _children = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMutableArray *)children {
    return _children;
}

- (void)addChild:(id)child {
    [_children addObject:child];
}


@end
//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "Human.h"


@implementation Human {
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


@end
//
//  Created by Oleksiy Dyagilev on 3/2/12.
//


#import "Array2D.h"


@implementation Array2D {

    NSMutableArray *_arr;
    int _i;
    int _j;

}
- (id)initWithSize:(int)i :(int)j {
    self = [super init];
    if (self) {
        _arr = [[NSMutableArray alloc] initWithCapacity:i * j];
        _i = i;
        _j = j;
    }
    return self;
}

- (id)get:(int)i :(int)j {
    return [_arr objectAtIndex:(_i * j + i)];
}

- (void)set:(id)obj:(int)i :(int)j {
    [_arr replaceObjectAtIndex:(_i * j + i) withObject:obj];
}


@end
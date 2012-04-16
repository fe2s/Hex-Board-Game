//
//  Created by Oleksiy Dyagilev on 3/26/12.
//

#import "RandomUtils.h"


@implementation RandomUtils


+ (id)pickAnyFromArray:(NSArray *)array {
    // return nil if empty
    if (array == nil || array.count == 0){
        return nil;
    }

    int random = arc4random_uniform([array count]);
    return [array objectAtIndex:random];
}

+ (id)pickAnyFromSet:(NSSet *)set {
    // return nil if empty
    if (set == nil || set.count == 0){
        return nil;
    }

    // not sure if it is OK
    return [set anyObject];
}


@end
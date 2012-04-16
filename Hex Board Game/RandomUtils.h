//
//  Created by Oleksiy Dyagilev on 3/26/12.
//

#import <Foundation/Foundation.h>


@interface RandomUtils : NSObject

+ (id) pickAnyFromArray: (NSArray *) array;
+ (id) pickAnyFromSet: (NSSet *) set;

@end
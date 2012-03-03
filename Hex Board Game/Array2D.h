//
//  Created by Oleksiy Dyagilev on 3/2/12.
//



#import <Foundation/Foundation.h>


@interface Array2D : NSObject

- (id)initWithSize:(int)i :(int)j;

- (id)get:(int)i:(int)j;

- (void)set:(id)obj:(int)i :(int)j;

@end
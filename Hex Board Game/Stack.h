//
//  Stack.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
    NSMutableArray *_arr;
}

- (void)push:(id)object;

- (id)pop;

- (Boolean)isEmpty;

@end

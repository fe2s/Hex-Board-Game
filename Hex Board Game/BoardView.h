//
//  BoardView.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface BoardView : NSObject {
    Board *_board;
}

- (BoardView *)initWithBoard:(Board *)board;

- (void)draw:(CGContextRef)c;

@end

//
//  UIViewImpl.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "Game.h"
#import "Board.h"
#import "BoardView.h"
#import "Hex.h"


@implementation MainView {

    Game *_game;

}

@synthesize nextTurnLabel;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"init with coder");

        _game = [[Game alloc] initWithView:self];

        NSLog(@"init with coder END");

    }

    return self;
}

- (void)_drawNextTurnLabel {
    NSString *labelText;
    GameStatus *gameStatus = _game.status;

    if ([gameStatus isEnded]) {
        labelText = @"Winner: ";
        labelText = [labelText stringByAppendingString:gameStatus.winner.name];
    } else {
        labelText = @"Next turn: ";
        labelText = [labelText stringByAppendingString:gameStatus.nextTurnPlayer.name];
    }

    nextTurnLabel.text = labelText;

}


- (void)drawRect:(CGRect)rect {

    Board *board = _game.board;
    BoardView *boardView = [[BoardView alloc] initWithBoard:board];

    CGContextRef context = UIGraphicsGetCurrentContext();

    [boardView draw:context];

    // next turn label
    [self _drawNextTurnLabel];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    // assume 1 touch for simplicity 
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [touch locationInView:self];
    NSLog(@"%f, %f", touchLocation.x, touchLocation.y);

    bool turnMade = [_game humanTurn:touchLocation];
    if (turnMade){
        [self setNeedsDisplay];
    }

}


@end

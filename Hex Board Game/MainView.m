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

@private Game *_game;

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

        _game = [[Game alloc] init];

        NSLog(@"init with coder END");

    }

    return self;
}

- (void)_drawNextTurnLabel {
    NSString *labelText;
    GameStatus *gameStatus = _game.status;

    if ([gameStatus isEnded]) {
        if ([gameStatus winner] == Red) {
            labelText = @"Red won!";
        } else {
            labelText = @"Blue won!";
        }
    } else {
        if ([gameStatus nextTurnPlayer] == Red) {
            labelText = @"Next turn - Red";
        } else {
            labelText = @"Next turn - Blue";
        }
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

    NSMutableArray *hexes = _game.board.hexes;

    int hexCount = [hexes count];

    for (int i = 0; i < hexCount; i++) {
        Hex *hex = (Hex *) [hexes objectAtIndex:i];
        if ([hex contains:touchLocation] && hex.player == None) {
            NSLog(@"Hit hex #%d", i);

            hex.player = [_game.status nextTurnPlayer];

            [_game onTurnMade];
            [self setNeedsDisplay];
            break;
        }
    }


    NSLog(@"%f, %f", touchLocation.x, touchLocation.y);

}


@end

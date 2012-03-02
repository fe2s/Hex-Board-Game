//
//  UIViewImpl.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIViewImpl.h"
#import "Game.h"


@implementation UIViewImpl

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self){
        NSLog(@"init with coder");
        
        Game* game = [[Game alloc] init];
        
        
        NSLog(@"init with coder END");
        
        
    }

    return self;
}



- (void)drawRect:(CGRect)rect {
    
       
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(c, red);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(c, 2.0);
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 5.0f, 5.0f);
    CGContextAddLineToPoint(c, 50.0f, 50.0f);
    CGContextStrokePath(c);
}


@end

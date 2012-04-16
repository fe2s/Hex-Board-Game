//
//  HexagonView.m
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HexView.h"


@implementation HexView


- (HexView *)initWithHex :(Hex *)hex {

    self = [super init];
    if (self) {
        _hex = hex;
    }
    return self;

}

- (void)drawHedgeBorders:(CGContextRef)c centerPoint:(CGPoint)centerPoint {
    int edgeSize = _hex.edgeSize;

    CGFloat color[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(c, color);
    CGContextSetLineWidth(c, 1.0);

    CGContextBeginPath(c);

    // TODO: optimize cos ?

    // start point

    CGContextMoveToPoint(c,
            centerPoint.x - edgeSize * cosf(M_PI/ 6),
            centerPoint.y - edgeSize / 2);

    // going clockwise

    CGContextAddLineToPoint(c, centerPoint.x,
            centerPoint.y - edgeSize);

    CGContextAddLineToPoint(c, centerPoint.x + edgeSize * cosf(M_PI/ 6),
            centerPoint.y - edgeSize / 2);

    CGContextAddLineToPoint(c, centerPoint.x + edgeSize * cosf(M_PI/ 6),
            centerPoint.y + edgeSize / 2);

    CGContextAddLineToPoint(c, centerPoint.x,
            centerPoint.y + edgeSize);

    CGContextAddLineToPoint(c, centerPoint.x - edgeSize * cosf(M_PI/ 6),
            centerPoint.y + edgeSize / 2);

    CGContextAddLineToPoint(c,
            centerPoint.x - edgeSize * cosf(M_PI/ 6),
            centerPoint.y - edgeSize / 2);


    CGContextStrokePath(c);
}

- (void)drawStone:(CGContextRef)c centerPoint:(CGPoint)centerPoint {
    if (_hex.player != nil) {

        CGColorRef color;
        // TODO: XXX
        if (_hex.player.id == 1) {
            color = [UIColor redColor].CGColor;
        } else {
            color = [UIColor blueColor].CGColor;
        }

        CGContextSetLineWidth(c, 1);
        CGContextSetStrokeColorWithColor(c, color);

        float radius = _hex.edgeSize / 1.5;

        CGRect rectangle = CGRectMake(centerPoint.x - radius,
                centerPoint.y - radius,
                2 * radius, 2 * radius);
        CGContextAddEllipseInRect(c, rectangle);
        CGContextStrokePath(c);
        CGContextSetFillColorWithColor(c, color);
        CGContextFillEllipseInRect(c, rectangle);
    }
}

- (void)draw:(CGContextRef)c :(CGPoint)centerPoint {

    [self drawHedgeBorders:c centerPoint:centerPoint];

    [self drawStone:c centerPoint:centerPoint];

}

@end

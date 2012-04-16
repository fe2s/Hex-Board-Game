//
//  HexagonView.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hex.h"

@interface HexView : NSObject  {

    Hex *_hex;

}


- (HexView *)initWithHex :(Hex *)hex;

- (void)draw:(CGContextRef)c :(CGPoint)centralPoint;

@end

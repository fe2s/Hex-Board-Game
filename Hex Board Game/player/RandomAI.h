//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface RandomAI : NSObject <Player>

- (id)initWithId:(int)id horizontal:(bool)horizontal name:(NSString *)name;

@end
//
//  Created by Oleksiy Dyagilev on 3/21/12.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface AbstractPlayer : NSObject <Player> {
    int _id;
    bool _horizontal;
    NSString *_name;
}

- (id)initWithId:(int)id horizontal:(bool)horizontal name:(NSString *)name;

@end
//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

@class Board;
@class Hex;

@protocol Player

- (int)id;

- (NSString *)name;

- (bool)horizontal;

- (bool)isHuman;

- (Hex *)makeMove:(Board *)board :(int)moveTimeLimit;

- (bool)isMoveTimeLimited;

@end
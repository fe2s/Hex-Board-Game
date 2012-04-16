//
//  Created by fe2s on 4/3/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface WinRatio : NSObject  {
    long _wins;
    long _games;
}

@property(nonatomic, readonly) long wins;
@property(nonatomic, readonly) long games;

- (id)initNew;

- (void)addWin;

- (void)addLoss;

- (void)add:(WinRatio *)anotherWinRatio;

// true if self is better
- (bool) compareTo:(WinRatio *)another;

@end
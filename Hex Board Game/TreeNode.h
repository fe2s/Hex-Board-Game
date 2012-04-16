//
//  Created by Oleksiy Dyagilev on 3/21/12.
//

#import <Foundation/Foundation.h>


@interface TreeNode : NSObject {
    id _value;
    NSMutableArray *_children;
}

- (id)initWithValue:(id)value;

- (NSMutableArray *)children;

- (void)addChild:(id)child;

@end
//
//  Created by Oleksiy Dyagilev on 3/3/12.
//

#import "MyTest.h"


@implementation MyTest

- (void)testAaaa {


//    int *arr = malloc(sizeof(int) * 10);
    int s = 100;

    bool arr[s][s];
//    for (int i = 0; i < 10; i++) {
//        arr[i][i] = false;
//    }

    for (int i = 9; i >= 0; i--) {
        NSLog(@"%d", arr[i][i]);
    }

//    free(arr);


}

@end
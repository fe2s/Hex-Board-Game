//
//  UIViewImpl.h
//  Hex Board Game
//
//  Created by Oleksii Diagiliev on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface MainView : UIView {

    Game *_game;

}

@property(weak, nonatomic) IBOutlet UILabel *nextTurnLabel;
@property(weak, nonatomic) IBOutlet UILabel *tickerLabel;

@end

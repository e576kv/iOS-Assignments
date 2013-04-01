//
//  SetMatchingGame.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MatchingGame.h"
#import "SetCard.h"

@interface SetMatchingGame : MatchingGame

-(SetCard *) cardAtIndex: (NSUInteger) index;
-(id) initWithCardCount: (NSUInteger) cardCount usingDeck: (Deck*) deck;
@end

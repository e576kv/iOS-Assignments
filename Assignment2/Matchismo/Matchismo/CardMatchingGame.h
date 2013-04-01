//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MatchingGame.h"

@interface CardMatchingGame : MatchingGame

-(id) initWithCardCount: (NSUInteger) cardCount usingDeck: (Deck*) deck;

@end

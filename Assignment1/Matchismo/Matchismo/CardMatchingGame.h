//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (readonly,nonatomic) int score;
@property (nonatomic) int numCardsToMatch;
@property (nonatomic, strong) NSString *matchStatus;

-(id) initWithCardCount: (NSUInteger) cardCount usingDeck: (Deck*) deck;
-(void) flipCardAtIndex: (NSUInteger) index;
-(Card *) cardAtIndex: (NSUInteger) index;
@end

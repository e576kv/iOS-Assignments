//
//  MatchingGame.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface MatchingGame : NSObject

@property (readonly,nonatomic) int score;
@property (nonatomic) int numCardsToMatch;
@property (nonatomic, strong) NSString *matchStatus;
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *flippedCards;

-(id) initWithCardCount: (NSUInteger) cardCount usingDeck: (Deck*) deck;
-(Card *) cardAtIndex: (NSUInteger) index;
-(void) flipCardAtIndex: (NSUInteger) index;
-(int) getMisMatchPenalty;
-(int) getMatchBonus;
-(int) getFlipCost;

@end

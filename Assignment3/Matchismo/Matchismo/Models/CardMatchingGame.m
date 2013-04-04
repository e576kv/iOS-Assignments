//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame() 
@property (readwrite, nonatomic) int score;
@end

@implementation CardMatchingGame
@synthesize score = _score;

#define MATCH_BONUS 4;
#define MISMATCH_PENALTY 2;
#define FLIP_COST 1;
#define NUM_CARDS_TO_MATCH 1


-(id) initWithCardCount: (NSUInteger) cardCount usingDeck: (Deck*) deck {
    
    if(self = [super initWithCardCount:cardCount usingDeck:deck]) {
        self.numCardsToMatch = NUM_CARDS_TO_MATCH;
    }
    return self;
}

-(int) getMisMatchPenalty {
    return MISMATCH_PENALTY;
}

-(int) getFlipCost {
    return FLIP_COST;
}

-(int) getMatchBonus {
    return MATCH_BONUS;
}

@end

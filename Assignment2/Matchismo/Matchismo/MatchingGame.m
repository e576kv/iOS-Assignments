//
//  MatchingGame.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MatchingGame.h"

@interface MatchingGame()
@property (readwrite,nonatomic) int score;
@end

@implementation MatchingGame

@synthesize numCardsToMatch = _numCardsToMatch;
@synthesize matchStatus = _matchStatus;
@synthesize score = _score;
@synthesize cards = _cards;
@synthesize flippedCards = _flippedCards;


-(NSMutableArray *) cards {
    if(!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

-(NSMutableArray *) flippedCards {
    if(!_flippedCards) {
        _flippedCards = [[NSMutableArray alloc] init];
    }
    
    return _flippedCards;
}

-(NSString *) matchStatus {
    if(!_matchStatus) {
        _matchStatus = @"";
    }
    
    return _matchStatus;
}

-(int) numCardsToMatch {
    if(_numCardsToMatch == 0) {
        _numCardsToMatch = 1;
    }
    
    return _numCardsToMatch;
}

-(id) initWithCardCount: (NSUInteger) cardCount usingDeck: (Deck*) deck {
    
    if(self = [super init]) {
        for(int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if(!card) {
                self = nil;
            } else {
                [self.cards addObject:card];
            }
        }
    }
    return self;
}

-(Card *) cardAtIndex: (NSUInteger) index {
    return (index < self.cards.count) ? [self.cards objectAtIndex:index] : nil;
}


-(void) flipCardAtIndex: (NSUInteger) index {
    Card *card = [self.cards objectAtIndex:index];
    if(!card.isUnplayable) {
        if(!card.isFaceUp ) {
            if(self.numCardsToMatch == self.flippedCards.count && ([self.flippedCards indexOfObject:card] == NSNotFound)) {
                int matchScore = [card match:self.flippedCards];
                if(matchScore) {
                    self.score += matchScore * [self getMatchBonus];
                    card.unplayable = YES;
                    
                    NSMutableString *matchText = [NSMutableString stringWithFormat:@"Matched %@ ", card.contents];
                    
                    for(int i = 0; i < self.flippedCards.count; i++) {
                        Card *otherCard = [self.flippedCards objectAtIndex:i];
                        otherCard.unplayable = YES;
                        [matchText appendFormat:@"%@ ", otherCard.contents];
                    }
                    self.matchStatus = [NSString stringWithFormat:@"%@ for %d points", matchText, matchScore * [self getMatchBonus]];
                    [self.flippedCards removeAllObjects];
                } else {
                    NSMutableString *penaltyText = [NSMutableString stringWithFormat:@"%@ ", card.contents];
                    for(int i = 0; i < self.flippedCards.count; i++) {
                        Card *otherCard = [self.flippedCards objectAtIndex:i];
                        otherCard.faceUp = NO;
                        [penaltyText appendFormat:@"%@ ", otherCard.contents];
                    }
                    int penalty = [self getMisMatchPenalty];
                    self.matchStatus = [NSString stringWithFormat:@"%@ do not match. %d penalty", penaltyText, penalty];
                    self.score -= [self getMisMatchPenalty];
                    self.flippedCards = [[NSMutableArray alloc] initWithObjects:card, nil];
                }
                
            } else {
                if([self.flippedCards indexOfObject:card] == NSNotFound) {
                    [self.flippedCards addObject:card];
                }
                self.matchStatus = [NSString stringWithFormat:@"%@ flipped", card.contents];
            }
            
            self.score -= [self getFlipCost];
        }
        
        card.faceUp = !card.isFaceUp;
    }
}

-(int) getMisMatchPenalty {
    return -1;
}

-(int) getFlipCost {
    return -1;
}

-(int) getMatchBonus {
    return -1;
}

@end

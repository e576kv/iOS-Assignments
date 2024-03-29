//
//  Deck.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Deck.h" 

@interface Deck() 
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end 

@implementation Deck
@synthesize cards = _cards;

-(NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) { 
        [self.cards insertObject:card atIndex:0];
    } else { 
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard {
    Card *randomCard = nil;
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count; 
        randomCard = [self.cards objectAtIndex:index]; 
        [self.cards removeObjectAtIndex:index];
    } 
    return randomCard;
}

@end

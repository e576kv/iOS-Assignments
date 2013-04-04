//
//  PlayingCard.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayingCard.h" 

@interface PlayingCard()
@end

@implementation PlayingCard
@synthesize suit = _suit;
@synthesize rank = _rank;

#define MATCH_RANK_2 4
#define MATCH_SUIT_2 1
#define MATCH_RANK_3 10
#define MATCH_SUIT_3 5

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [[rankStrings objectAtIndex:self.rank] stringByAppendingString:self.suit];
} 

+ (NSArray *)validSuits {
    return [[NSArray alloc] initWithObjects:@"♥",@"♦",@"♠",@"♣", nil];
}

- (void)setSuit:(NSString *)suit {
    
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }     
}

-(NSString *) suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings {
    return [[NSArray alloc] initWithObjects: @"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K", nil];
}

+ (NSUInteger)maxRank { 
    return [self rankStrings].count-1; 
}

-(void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) { 
        _rank = rank;
    }
}

-(int) match: (NSArray *) otherCards {
    int score = 0;
    
    if(otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if([otherCard.suit isEqualToString:self.suit]) {
            score = MATCH_SUIT_2;
        } else if(otherCard.rank == self.rank) {
            score = MATCH_RANK_2;
        }
    } else {
        PlayingCard *cardOne = [otherCards objectAtIndex:0];
        PlayingCard *cardTwo = [otherCards objectAtIndex:1];
        
        //Rank and suit matches
        //Rank matches
        //Suit matches
        if (cardOne.rank == cardTwo.rank && self.rank == cardTwo.rank && cardOne.rank == self.rank) {
            score = MATCH_RANK_3;
            
        } else if([cardOne.suit isEqualToString:cardTwo.suit] && [self.suit isEqualToString:cardTwo.suit] && [cardOne.suit isEqualToString:self.suit]) {
            score = MATCH_SUIT_3;
        }
        
    }
    
    return score;
}

    
@end

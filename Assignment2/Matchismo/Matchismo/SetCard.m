//
//  SetCard.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SetCard.h"

@interface SetCard()

@property (nonatomic, strong) NSDictionary *alternates;

@end

@implementation SetCard
@synthesize suit = _suit;
@synthesize rank = _rank;
@synthesize color = color;
@synthesize alternates = _alternates;

#define NUM_OBJECTS_PER_CARD 3
#define IS_MATCH 1
#define COLOR_SUIT_MATCH 3
#define SUIT_RANK_MATCH 2;

+ (int) maxRank {
    return NUM_OBJECTS_PER_CARD;
}

-(NSDictionary *) alternates {
    if(!_alternates) {
        NSMutableDictionary *alts = [[NSMutableDictionary alloc] init];
        [alts setValue:@"△" forKey:@"▲"];
        [alts setValue:@"□" forKey:@"■"];
        [alts setValue:@"○" forKey:@"●"];
        [alts setValue:@"▲" forKey:@"△"];
        [alts setValue:@"■" forKey:@"□"];
        [alts setValue:@"●" forKey:@"○"];
        
        _alternates = alts;
    }
    
    return _alternates;
}

- (NSString *)contents {
    NSMutableString *cardLabel = [[NSMutableString alloc] init];
    for(int i = 0; i < self.rank; i++) {
        [cardLabel appendFormat:@"%@", self.suit];
    }
    
    return cardLabel;
}


+ (NSArray *)validSuits {
    return [[NSArray alloc] initWithObjects:@"▲",@"△",@"■",@"□",@"●",@"○",nil];
}

+ (NSArray *)validColors {
    return [[NSArray alloc] initWithObjects:[UIColor greenColor],[UIColor redColor],[UIColor blueColor], nil];
}

-(int) match: (NSArray *) otherCards {
    int score = 0;
    SetCard *cardOne = [otherCards objectAtIndex:0];
    SetCard *cardTwo = [otherCards objectAtIndex:1];
    
    BOOL matchColor = [cardOne.color isEqual: cardTwo.color] && [self.color isEqual:cardTwo.color] && [cardOne.color isEqual:self.color];
    BOOL matchSuit = [cardOne.suit isEqualToString:cardTwo.suit] && [self.suit isEqualToString:cardTwo.suit] && [cardOne.suit isEqualToString:self.suit];
    BOOL matchRank = cardOne.rank == cardTwo.rank && self.rank == cardTwo.rank && cardOne.rank == self.rank;
    
    if(matchColor || matchSuit || matchRank) {
        score += IS_MATCH;
    }
    
    if(matchColor && matchSuit) {
        score += COLOR_SUIT_MATCH;
    }
    
    if(matchSuit && matchRank) {
        score += SUIT_RANK_MATCH;
    }
    
    
    
    return score;
}
@end

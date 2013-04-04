//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardDeck()


@end

@implementation SetCardDeck

-(id) init {
    if(self = [super init]) {
        for(NSNumber *hollow in [SetCard validHollowValues]) {
            for (UIColor *color in [SetCard validColors]) {
                for (NSString *suit in [SetCard validSuits]) {
                    for (NSUInteger rank = 1; rank <= [SetCard maxRank]; rank++) { 
                        SetCard *card = [[SetCard alloc] init]; 
                        card.suit = suit;
                        card.rank = rank;
                        card.color = color;
                        card.isHollow = [hollow boolValue];
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}

@end

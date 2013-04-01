//
//  SetCard.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Card.h"
#import <CoreText/CoreText.h>

@interface SetCard : Card

-(int) match: (NSArray *) otherCards;
+ (NSArray *)validSuits;
+ (int) maxRank;
+ (NSArray *)validColors;

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) int rank;
@property (nonatomic, strong) UIColor *color;

@end

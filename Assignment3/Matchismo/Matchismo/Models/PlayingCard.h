//
//  PlayingCard.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h" 

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit; 
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits; 
+ (NSUInteger)maxRank;
+ (NSArray *)rankStrings;

@end

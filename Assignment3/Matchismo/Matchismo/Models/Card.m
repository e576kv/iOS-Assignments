//
//  Card.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Card.h"

@interface Card() 

@end

@implementation Card
@synthesize  contents = _contents;
@synthesize faceUp = _faceUp;
@synthesize unplayable = _unplayable;

-(int) match: (NSArray *) otherCards {
    int score = 0;
    
    for(Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}
@end

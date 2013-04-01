//
//  Deck.h
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import "Card.h"

@interface Deck : NSObject 

- (void)addCard:(Card *)card atTop:(BOOL)atTop; 
- (Card *)drawRandomCard; @end
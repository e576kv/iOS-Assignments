//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Jeremy Roberts on 4/4/13.
//  Copyright (c) 2013 Jeremy Roberts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController
@property (nonatomic) NSInteger startingCount;

-(Deck *) createDeck;
-(void) updateCell: (UICollectionViewCell *)cell usingCard:(Card *)card;

@end

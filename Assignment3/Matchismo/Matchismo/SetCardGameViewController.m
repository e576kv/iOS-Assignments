//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Jeremy Roberts on 4/4/13.
//  Copyright (c) 2013 Jeremy Roberts. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCard.h"
#import "SetCardDeck.h"
#import "SetCardCollectionViewCell.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

-(NSInteger) startingCount {
    return 20;
}

-(Deck *) createDeck {
    return [[SetCardDeck alloc] init];
}

-(void) updateCell: (UICollectionViewCell *)cell usingCard:(Card *)card {
    if([cell isKindOfClass:[SetCardCollectionViewCell class]]) {
        SetCardView *setCardView = ((SetCardCollectionViewCell *) cell).setCardView;
        if([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            setCardView.rank = setCard.rank;
            setCardView.suit = setCard.suit;
            setCardView.faceUp = setCard.isFaceUp;
            setCardView.color = setCard.color;
            setCardView.isHollow = setCard.isHollow;
            setCardView.alpha = setCard.isUnplayable ? 0.3 : 1.0;
            setCardView.backgroundColor = setCard.isFaceUp ? [UIColor lightGrayColor] : [UIColor whiteColor];
        }
    }
}

@end

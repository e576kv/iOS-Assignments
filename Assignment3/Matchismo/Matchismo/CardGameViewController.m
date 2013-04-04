//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jeremy Roberts on 4/4/13.
//  Copyright (c) 2013 Jeremy Roberts. All rights reserved.
//

#import "CardGameViewController.h"
#import "MatchingGame.h"

@interface CardGameViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (strong, nonatomic) MatchingGame *game;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.startingCount;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Card" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    return cell;
}

-(void) updateCell: (UICollectionViewCell *)cell usingCard:(Card *)card {
    
}

-(Deck *) createDeck {
    return nil;
}

-(MatchingGame *) game {
    if(!_game) {
        _game = [[MatchingGame alloc] initWithCardCount:self.startingCount usingDeck:[self createDeck]];
    }
    
    return _game;
}

-(void) updateUI {
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
    }
    //[self.matchesLabel setText:self.game.matchStatus];
    //[self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        self.flipCount++;
        [self updateUI];
        //self.gameResult.score = self.game.score;
    }
}

@end

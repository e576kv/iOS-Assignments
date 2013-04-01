//
//  ViewController.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numCardsSwitcher;
@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;
-(void) updateUI;
@end

@implementation ViewController
@synthesize flipCount = _flipCount;
@synthesize cardButtons = _cardButtons;
@synthesize flipsLabel = _flipsLabel;
@synthesize game = _game;
@synthesize scoreLabel = _scoreLabel;
@synthesize numCardsSwitcher = _numCardsSwitcher;
@synthesize matchesLabel = _matchesLabel;

-(CardMatchingGame *) game {
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    
    return _game;
}

-(void) setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    self.numCardsSwitcher.enabled = NO;
}

-(void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    [_flipsLabel setText:[NSString stringWithFormat:@"Flips: %d", _flipCount]];
}

-(void) updateUI {
    for(UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cards.jpg"] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardsOn.jpg"] forState:UIControlStateSelected];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardsOn.jpg"] forState:UIControlStateSelected|UIControlStateDisabled];
    }
    
    [self.matchesLabel setText:self.game.matchStatus];
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
}


- (IBAction) deal {
    
    self.game = nil;
    [self updateUI];
    self.flipCount = 0;
    
}
@end

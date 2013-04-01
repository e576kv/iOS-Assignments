//
//  SetViewController.m
//  Matchismo
//
//  Created by Jeremy Roberts on 3/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SetViewController.h"
#import "SetCardDeck.h"

@interface SetViewController()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardCollection;
@property (strong, nonatomic) SetMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;

-(void) updateUI;
@end

@implementation SetViewController
@synthesize cardCollection = _cardCollection;
@synthesize game = _game;
@synthesize flipsLabel = _flipsLabel;
@synthesize scoreLabel = _scoreLabel;
@synthesize matchesLabel = _matchesLabel;


-(void) viewDidLoad {
    [self updateUI];
}

- (IBAction)deal {
    self.game = nil;
    [self updateUI];
}

-(SetMatchingGame *) game {
    if(!_game) {
        _game = [[SetMatchingGame alloc] initWithCardCount:self.cardCollection.count usingDeck:[[SetCardDeck alloc] init]];
    }
    return _game;
}

-(void) updateUI {
    for(UIButton *cardButton in self.cardCollection) {
        SetCard *card = [self.game cardAtIndex:[self.cardCollection indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateNormal];
        [cardButton setTitle:card.contents forState:UIControlStateNormal|UIControlStateDisabled];
        [cardButton setTitleColor:card.color forState:UIControlStateNormal];
        [cardButton setTitleColor:card.color forState:UIControlStateNormal|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        cardButton.backgroundColor = cardButton.selected ? [UIColor lightGrayColor] : [UIColor whiteColor];
    }
    
    [self.matchesLabel setText:self.game.matchStatus];
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
}

- (IBAction)selectCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardCollection indexOfObject:sender]];
    [self updateUI];
    
}

- (void)viewDidUnload {
    [self setCardCollection:nil];
    [self setFlipsLabel:nil];
    [self setScoreLabel:nil];
    [self setMatchesLabel:nil];
    [super viewDidUnload];
}
@end

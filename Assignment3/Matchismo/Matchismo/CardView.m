//
//  CardView.m
//  Matchismo
//
//  Created by Jeremy Roberts on 4/4/13.
//  Copyright (c) 2013 Jeremy Roberts. All rights reserved.
//

#import "CardView.h"

@interface CardView()

@property (readwrite, nonatomic) CGFloat faceCardScaleFactor;
@end

@implementation CardView
@synthesize faceCardScaleFactor = _faceCardScaleFactor;
#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90

-(void) setRank:(int)rank {
    _rank = rank;
    [self setNeedsDisplay];
}

-(void) setSuit:(NSString *)suit {
    _suit = suit;
    [self setNeedsDisplay];
}

-(void) setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

-(void) setup {
    
}

-(void) awakeFromNib {
    [self setup];
}


- (CGFloat)faceCardScaleFactor
{
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}

- (void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor
{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

@end

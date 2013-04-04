//
//  CardView.h
//  Matchismo
//
//  Created by Jeremy Roberts on 4/4/13.
//  Copyright (c) 2013 Jeremy Roberts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView
@property (nonatomic) int rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

@property (readonly, nonatomic) CGFloat faceCardScaleFactor;

@end

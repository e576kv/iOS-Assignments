//
//  PlayingCardCollectionViewCell.h
//  Matchismo
//
//  Created by Jeremy Roberts on 4/3/13.
//
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@end

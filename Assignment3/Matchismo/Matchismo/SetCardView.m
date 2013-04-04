//
//  SetCardView.m
//  Matchismo
//
//  Created by Jeremy Roberts on 4/4/13.
//  Copyright (c) 2013 Jeremy Roberts. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

- (void)drawRect:(CGRect)rect
{
    float shapeWidth = self.bounds.size.width / 4;
    
    for(int i = 0; i < self.rank; i++) {
        

        NSLog(@"%d%@",self.rank,self.suit);
        CGRect bounds = CGRectMake((shapeWidth * i), self.bounds.size.height / 2, shapeWidth, shapeWidth);
        
        //@"▲",@"■",@"●"
        UIBezierPath *shape = nil;
        
        if([self.suit isEqualToString:@"▲"]) {
            shape = [UIBezierPath bezierPath];
            [shape moveToPoint:CGPointMake(bounds.origin.x, bounds.size.height)];
            [shape addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width, bounds.size.height)];
            [shape addLineToPoint:CGPointMake(bounds.origin.x + (bounds.size.width / 2), 0)];
            [shape addLineToPoint:CGPointMake(bounds.origin.x, bounds.size.height)];
            NSLog(@"triangle");
        } else if([self.suit isEqualToString:@"●"]) {
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);
            shape = [UIBezierPath bezierPathWithOvalInRect:bounds];
            [shape addClip];
            CGContextRestoreGState(context);
            NSLog(@"circle");
        } else {
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);
            shape = [UIBezierPath bezierPathWithRect:bounds];
            [shape addClip];
            CGContextRestoreGState(context);
            NSLog(@"square");
        }
        
        
        
        
        if(self.isHollow) {
            [self.backgroundColor setFill];
            UIRectFill(bounds);
            [self.color setStroke];
            [shape stroke];
        } else {
            [self.color setFill];
            [shape fill];
            [[UIColor blackColor] setStroke];
            [shape stroke];

        }
    }
}

-(void) popContext {
    UIGraphicsPopContext();
}

@end

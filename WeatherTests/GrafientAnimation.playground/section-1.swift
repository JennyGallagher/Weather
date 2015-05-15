// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
func performAnimation {
    // Move the last color in the array to the front
    // shifting all the other colors.
    
    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *mutable = [[layer colors] mutableCopy];
    id lastColor = [[mutable lastObject] retain];
    [mutable removeLastObject];
    [mutable insertObject:lastColor atIndex:0];
    [lastColor release];
    NSArray *shiftedColors = [NSArray arrayWithArray:mutable];
    [mutable release];
    
    // Update the colors on the model layer
    [layer setColors:shiftedColors];
    
    // Create an animation to slowly move the gradient left to right.
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setToValue:shiftedColors];
    [animation setDuration:0.08];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeForwards];
    [animation setDelegate:self];
    [layer addAnimation:animation forKey:@"animateGradient"];
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    [self performAnimation];
}

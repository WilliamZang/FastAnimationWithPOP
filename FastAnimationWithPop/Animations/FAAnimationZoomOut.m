//
//  FAAnimationZoomOut.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-26.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

@interface FAAnimationZoomOut()

@property (nonatomic, strong) POPSpringAnimation *internalAnimation;
@property (nonatomic, strong) POPSpringAnimation *internalReverseAnimation;

@end

@implementation FAAnimationZoomOut

- (void)configView:(UIView *)view
{
    [super configView:view];
    self.internalAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    self.internalReverseAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    self.internalAnimation.toValue = self.scale ?: [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    self.internalAnimation.springBounciness = 10;
    self.internalReverseAnimation.toValue = self.scale ?: [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    self.internalReverseAnimation.springBounciness = 10;
    
}

- (void)startAnimation
{
    [self.bindingView.layer pop_addAnimation:self.internalAnimation forKey:SELF_IDENTIFICATION];
}

- (void)stopAnimation
{
    [self.bindingView.layer pop_removeAnimationForKey:SELF_IDENTIFICATION];
}

- (void)reverseAnimation
{
    [self.bindingView.layer pop_addAnimation:self.internalReverseAnimation forKey:[NSString stringWithFormat:@"-%@", SELF_IDENTIFICATION]];
}

- (void)stopReverse
{
    [self.bindingView.layer pop_removeAnimationForKey:[NSString stringWithFormat:@"-%@", SELF_IDENTIFICATION]];
}
@end

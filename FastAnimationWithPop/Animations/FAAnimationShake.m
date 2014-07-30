//
//  FAAnimationShake.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//
#import "FastAnimationWithPop.h"

@interface FAAnimationShake()

@property (nonatomic, strong) POPSpringAnimation *internalAnimation;

@end
@implementation FAAnimationShake

- (void)configView:(UIView *)view
{
    [super configView:view];
    self.internalAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    self.internalAnimation.velocity = self.velocity ?: @2000;
    self.internalAnimation.springBounciness = 20;
}

- (void)startAnimation
{
    [self.bindingView.layer pop_addAnimation:self.internalAnimation forKey:SELF_IDENTIFICATION];
}

- (void)stopAnimation
{
    [self.bindingView.layer pop_removeAnimationForKey:SELF_IDENTIFICATION];
}
@end

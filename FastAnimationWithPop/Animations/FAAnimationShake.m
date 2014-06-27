//
//  FAAnimationShake.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//
#import "FastAnimationWithPop.h"

@implementation FAAnimationShake

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.velocity = [view valueForKeyPath:kShakeVelocity] ? [view valueForKeyPath:kShakeVelocity] : @2000;
    animation.springBounciness = 20;
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"Shake"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"Shake"];
    }
}

+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"Shake"];
}
@end

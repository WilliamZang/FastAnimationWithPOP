//
//  FAAnimationZoomOut.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-26.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

@implementation FAAnimationZoomOut
+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];

    if ([view valueForKeyPath:kZoomOutScale]) {
        NSAssert([[view valueForKeyPath:kZoomOutScale] isKindOfClass:NSNumber.class], @"animationParams.scale must be a number.");
        animation.toValue = [view valueForKeyPath:kZoomOutScale];
    } else {
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    }
    animation.springBounciness = 10;
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"ZoomOutY"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"ZoomOutY"];
    }
}

+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"ZoomOutY"];
}

+ (void)reverseAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    animation.springBounciness = 10;
    
    [view.layer pop_addAnimation:animation forKey:@"ZoomOutYReverse"];
    
}

+ (void)stopReverse:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"ZoomOutYReverse"];
}
@end

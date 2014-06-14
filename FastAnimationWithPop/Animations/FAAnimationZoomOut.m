//
//  FAAnimationZoomOutX.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//
#import "FastAnimationWithPop.h"

@implementation FAAnimationZoomOutX

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleX];
    view.layer.transform = CATransform3DMakeScale(0.1, 1.0, 1.0);
    animation.toValue = @(1.0);
    animation.springBounciness = 10;
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"ZoomOutX"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"ZoomOutX"];
    }
}

+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"ZoomOutX"];
}
@end

@implementation FAAnimationZoomOutY

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleY];
    view.layer.transform = CATransform3DMakeScale(1.0, 0.1, 1.0);
    animation.toValue = @(1.0);
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
@end

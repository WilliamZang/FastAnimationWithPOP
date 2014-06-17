//
//  FAAnimationBounceRight.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"

void setSpringAnimation(POPSpringAnimation *animation, UIView *view) {
    if ([view valueForKeyPath:kSpringBounciness]) {
        animation.springBounciness = [[view valueForKeyPath:kSpringBounciness] floatValue];
    }
    if ([view valueForKeyPath:kSpringSpeed]) {
        animation.springSpeed = [[view valueForKeyPath:kSpringSpeed] floatValue];
    }
    if ([view valueForKeyPath:kDynamicsFriction]) {
        animation.dynamicsFriction = [[view valueForKeyPath:kDynamicsFriction] floatValue];
    }
    if ([view valueForKeyPath:kDynamicsTension]) {
        animation.dynamicsTension = [[view valueForKeyPath:kDynamicsTension] floatValue];
    }
    if ([view valueForKeyPath:kDynamicsMass]) {
        animation.dynamicsMass = [[view valueForKeyPath:kDynamicsMass] floatValue];
    }
}


@implementation FAAnimationBounceRight

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    view.layer.transform = CATransform3DMakeTranslation(-320, 0, 0);
    animation.toValue = @(0);
    
    setSpringAnimation(animation, view);
    
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"BounceRight"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"BounceRight"];
    }
}

+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_animationForKey:@"BounceRight"];
}

+ (void)reverseAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    animation.toValue = @(-320);
    
    setSpringAnimation(animation, view);
    
    [view.layer pop_addAnimation:animation forKey:@"BounceRightReverse"];
}

+ (void)stopReverse:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"BounceRightReverse"];
}
@end

@implementation FAAnimationBounceLeft

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    view.layer.transform = CATransform3DMakeTranslation(320, 0, 0);
    animation.toValue = @(0);
    
    setSpringAnimation(animation, view);
    
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"BounceLeft"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"BounceLeft"];
    }
}


+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_animationForKey:@"BounceLeft"];
}

+ (void)reverseAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    animation.toValue = @(320);
    
    setSpringAnimation(animation, view);
    
    [view.layer pop_addAnimation:animation forKey:@"BounceLeftReverse"];
}

+ (void)stopReverse:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"BounceLeftReverse"];
}
@end

@implementation FAAnimationBounceUp

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
    view.layer.transform = CATransform3DMakeTranslation(0, 568, 0);
    animation.toValue = @(0);
    
    setSpringAnimation(animation, view);
    
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"BounceUp"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"BounceUp"];
    }
}


+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_animationForKey:@"BounceUp"];
}

+ (void)reverseAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
    animation.toValue = @(568);
    
    setSpringAnimation(animation, view);
    
    [view.layer pop_addAnimation:animation forKey:@"BounceUpReverse"];
}

+ (void)stopReverse:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"BounceUpReverse"];
}

@end

@implementation FAAnimationBounceDown

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
    view.layer.transform = CATransform3DMakeTranslation(0, -568, 0);
    animation.toValue = @(0);
    
    setSpringAnimation(animation, view);
    
    if (view.delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(view.delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer pop_addAnimation:animation forKey:@"BounceDown"];
        });
    } else {
        [view.layer pop_addAnimation:animation forKey:@"BounceDown"];
    }
}


+ (void)stopAnimation:(UIView *)view
{
    [view.layer pop_animationForKey:@"BounceDown"];
}

+ (void)reverseAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
    animation.toValue = @(-568);
    
    setSpringAnimation(animation, view);
    
    [view.layer pop_addAnimation:animation forKey:@"BounceDownReverse"];
}

+ (void)stopReverse:(UIView *)view
{
    [view.layer pop_removeAnimationForKey:@"BounceDownReverse"];
}
@end

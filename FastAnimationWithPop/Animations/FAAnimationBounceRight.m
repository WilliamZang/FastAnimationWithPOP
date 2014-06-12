//
//  FAAnimationBounceRight.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FAAnimationBounceRight.h"

@implementation FAAnimationBounceRight

+ (void)performAnimation:(UIView *)view after:(NSTimeInterval)delay duration:(NSTimeInterval)duration
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.fromValue = @(-300);
    animation.toValue = @(view.frame.origin.x);
    animation.beginTime = delay;
    [view pop_addAnimation:animation forKey:@"BounceRight"];
    
}
@end

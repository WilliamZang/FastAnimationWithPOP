//
//  FAAnimationBounceRight.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FAAnimationBounceRight.h"
#import "UIView+FastAnimation.h"

@implementation FAAnimationBounceRight

+ (void)performAnimation:(UIView *)view
{
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
    animation.fromValue = @(-300);
    animation.toValue = @(0);
    animation.springBounciness = view.springBounciness;
    animation.springSpeed = view.springSpeed;
//    animation.dynamicsTension = view.dynamicsTension;
//    animation.dynamicsFriction = view.dynamicsFriction;
//    animation.dynamicsMass = view.dynamicsMass;

    [view.layer pop_addAnimation:animation forKey:@"BounceRight"];
    
}
@end

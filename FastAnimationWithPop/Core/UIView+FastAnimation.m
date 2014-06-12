//
//  UIView+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "UIView+FastAnimation.h"
#import <objc/runtime.h>

static void *AnimationTypeKey = &AnimationTypeKey;
static void *DelayKey = &DelayKey;
static void *DurationKey = &DurationKey;

@implementation UIView (FastAnimation)

- (void)setAnimationType:(NSString *)animationType
{
    objc_setAssociatedObject(self, AnimationTypeKey, animationType, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)animationType
{
    return objc_getAssociatedObject(self, AnimationTypeKey);
}

- (void)setDelay:(NSTimeInterval)delay
{
    objc_setAssociatedObject(self, DelayKey, [NSNumber numberWithDouble:delay], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)delay
{
    return [objc_getAssociatedObject(self, DelayKey) doubleValue];
}

- (void)setDuration:(NSTimeInterval)duration
{
    objc_setAssociatedObject(self, DurationKey, [NSNumber numberWithDouble:duration], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)duration
{
    return [objc_getAssociatedObject(self, DurationKey) doubleValue];
}
@end

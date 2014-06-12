//
//  UIView+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "UIView+FastAnimation.h"
#import "FastAnimationProtocol.h"
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

- (void)swizzle_awakeFromNib
{
    [self swizzle_awakeFromNib];
    if (self.animationType && self.duration > 0.0) {
        Class animationClass = NSClassFromString(self.animationType);
        if (animationClass == nil) {
            animationClass = NSClassFromString([@"FAAnimation" stringByAppendingString:self.animationType]);
        }
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        NSAssert(self.delay > -0.0000001, @"property 'delay' must > 0");
        [animationClass performAnimation:self after:self.delay duration:self.duration];


        
    }
}

+ (void)load
{
    Method original, swizzle;
    
    original = class_getInstanceMethod(self, @selector(awakeFromNib));
    swizzle = class_getInstanceMethod(self, @selector(swizzle_awakeFromNib));
    method_exchangeImplementations(original, swizzle);
}
@end

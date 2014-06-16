//
//  UIView+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"
#import <objc/runtime.h>
#import "FastAnimiationUitls.h"

typedef void(^nestedBlock)(UIView *view);
IDENTIFICATION_KEY(animationParams)

@implementation UIView (FastAnimation)

DEFINE_RW_STRING_PROP(animationType, setAnimationType)
DEFINE_RW_DOUBLE_PROP(delay, setDelay, 0.0)
DEFINE_RW_BOOL_PROP(startAnimationWhenAwakeFromNib, setStartAnimationWhenAwakeFromNib, YES)

- (NSMutableDictionary *)animationParams
{
    NSMutableDictionary *dictionary = objc_getAssociatedObject(self, animationParamsKey);
    if (dictionary == nil) {
        dictionary = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, animationParamsKey, dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dictionary;
}

- (void)startFAAnimation
{
    if (self.animationType) {
        Class animationClass = animationClassForString(self.animationType);
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"If you want to start an animation, the property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass performAnimation:self];
    }
}
- (void)stopFAAnimation
{
    if (self.animationType) {
        Class animationClass = animationClassForString(self.animationType);
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"If you want to stop an animation, the property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass stopAnimation:self];
    }
}

- (void)reverseFAAnimation
{
    if (self.animationType) {
        Class animationClass = animationClassForString(self.animationType);
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationReverseProtocol)], @"If you want to perform a reverse animation, the property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass reverseAnimation:self];
    }
}

- (void)stopReverseFAAnimation
{
    if (self.animationType) {
        Class animationClass = animationClassForString(self.animationType);
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationReverseProtocol)], @"If you want to stop a reverse animation, The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass stopReverse:self];
    }
}

- (void)performBlockNested:(nestedBlock)block
{
    block(self);
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)startFAAnimationNested
{
    [self performBlockNested:^(UIView *view) {
        [view startFAAnimation];
    }];
}
- (void)stopFAAnimationNested
{
    [self performBlockNested:^(UIView *view) {
        [view stopFAAnimation];
    }];
}
- (void)reverseFAAnimationNested
{
    [self performBlockNested:^(UIView *view) {
        [view reverseFAAnimation];
    }];
}
- (void)stopReverseFAAnimationNested
{
    [self performBlockNested:^(UIView *view) {
        [view stopReverseFAAnimation];
    }];
}


@end

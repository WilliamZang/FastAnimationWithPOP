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

static void *InternalAnimationsKey = &InternalAnimationsKey;


@implementation UIView (FastAnimation)

- (void)startFAAnimation
{
    [[self internalAnimations] enumerateObjectsUsingBlock:^(FAAnimationBase<FastAnimationProtocol> *animation, BOOL *stop) {
        if ([animation conformsToProtocol:@protocol(FastAnimationProtocol)]) {
            [animation startAnimation];
        }
    }];
}
- (void)stopFAAnimation
{
    [[self internalAnimations] enumerateObjectsUsingBlock:^(FAAnimationBase<FastAnimationProtocol> *animation, BOOL *stop) {
        if ([animation conformsToProtocol:@protocol(FastAnimationProtocol)]) {
            [animation stopAnimation];
        }
    }];
}

- (void)reverseFAAnimation
{
    [[self internalAnimations] enumerateObjectsUsingBlock:^(FAAnimationBase<FastAnimationReverseProtocol> *animation, BOOL *stop) {
        if ([animation conformsToProtocol:@protocol(FastAnimationReverseProtocol)]) {
            [animation reverseAnimation];
        }
    }];
}

- (void)stopReverseFAAnimation
{
    [[self internalAnimations] enumerateObjectsUsingBlock:^(FAAnimationBase<FastAnimationReverseProtocol> *animation, BOOL *stop) {
        if ([animation conformsToProtocol:@protocol(FastAnimationReverseProtocol)]) {
            [animation stopReverse];
        }
    }];
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

- (void)addAnimation:(FAAnimationBase *)animation
{
    NSMutableSet *animations = [self internalMutableAnimations];
    [animations addObject:animation];
    [animation configView:self];
}

- (void)removeAnimation:(FAAnimationBase *)animation
{
    NSMutableSet *animations = [self internalMutableAnimations];
    [animations removeObject:animation];
}

- (NSSet *)internalAnimations
{
    NSMutableSet *animations = objc_getAssociatedObject(self, InternalAnimationsKey);
    if (animations == nil) {
        animations = [NSMutableSet set];
        objc_setAssociatedObject(self, InternalAnimationsKey, animations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return animations;
}

- (NSMutableSet *)internalMutableAnimations
{
    return (NSMutableSet *)[self internalAnimations];
}

@end

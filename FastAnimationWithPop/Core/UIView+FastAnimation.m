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
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass performAnimation:self];
    }
}
- (void)stopFAAnimation
{
    if (self.animationType) {
        Class animationClass = animationClassForString(self.animationType);
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass stopAnimation:self];
    }
}


@end

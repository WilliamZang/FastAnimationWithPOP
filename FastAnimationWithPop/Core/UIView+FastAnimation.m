//
//  UIView+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"
#import <objc/runtime.h>

#define DEFINE_RW_C_TYPE_WITH_DEFAULT(flag, setter, ctype, default) \
static void *flag##Key = &flag##Key;                                \
- (void)setter:(ctype)value {                                       \
    objc_setAssociatedObject(self, flag##Key, @(value),             \
        OBJC_ASSOCIATION_RETAIN_NONATOMIC);                         \
}                                                                   \
- (ctype)flag {                                                     \

#define IDENTIFICATION_KEY(flag)       static void *flag##Key = &flag##Key;

#define SETTER(flag, setter, ctype)                                 \
- (void)setter:(ctype)value {                                       \
    objc_setAssociatedObject(self, flag##Key, @(value),             \
    OBJC_ASSOCIATION_RETAIN_NONATOMIC);                             \
}

#define GETTER(flag, ctype, ctypeGetterMethod, defaultValue)        \
- (ctype)flag {                                                     \
    id value = objc_getAssociatedObject(self, flag##Key);           \
    return value ? [value ctypeGetterMethod] : defaultValue;        \
}

#define DEFINE_RW_C_TYPE_PROP(flag, setter, ctype, ctypeGetterMethod, defaultValue) \
IDENTIFICATION_KEY(flag)                                                            \
SETTER(flag, setter, ctype)                                                         \
GETTER(flag, ctype, ctypeGetterMethod, defaultValue)

#define DEFINE_RW_BOOL_PROP(flag, setter, defaultValue)    \
DEFINE_RW_C_TYPE_PROP(flag, setter, BOOL, boolValue, defaultValue)

#define DEFINE_RW_DOUBLE_PROP(flag, setter, defaultValue)   \
DEFINE_RW_C_TYPE_PROP(flag, setter, double, doubleValue, defaultValue)

#define DEFINE_RW_CLASS_TYPE_PROP(classtype, flag, setter, asstype) \
IDENTIFICATION_KEY(flag)                                            \
- (void)setter:(classtype *)value {                                 \
    objc_setAssociatedObject(self, flag##Key, value, asstype);      \
}                                                                   \
- (classtype *)flag {                                               \
    return objc_getAssociatedObject(self, flag##Key);               \
}

#define DEFINE_RW_STRING_PROP(flag, setter)                         \
DEFINE_RW_CLASS_TYPE_PROP(NSString, flag, setter,                   \
    OBJC_ASSOCIATION_COPY_NONATOMIC)


@implementation NSObject(FastAnimation)

- (void)swizzle_awakeFromNib
{
    [self swizzle_awakeFromNib];
    UIView *view = (UIView *)self;
    if ([view isKindOfClass:UIView.class] && view.startAnimationWhenAwakeFromNib) {
        [view startFAAnimation];
    }
    
}

@end

static void *animationParamsKey = &animationParamsKey;
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
- (Class)animationClass
{
    Class animationClass = NSClassFromString(self.animationType);
    if (animationClass == nil) {
        animationClass = NSClassFromString([@"FAAnimation" stringByAppendingString:self.animationType]);
    }
    return animationClass;
}
- (void)startFAAnimation
{
    if (self.animationType) {
        Class animationClass = [self animationClass];
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass performAnimation:self];
    }
}
- (void)stopFAAnimation
{
    if (self.animationType) {
        Class animationClass = [self animationClass];
        NSAssert([animationClass conformsToProtocol:@protocol(FastAnimationProtocol)], @"The property 'animationType' must a class name and conforms protocol 'FastAnmationProtocol'");
        [animationClass stopAnimation:self];
    }
}

+ (void)load
{
    Method original, swizzle;
    
    original = class_getInstanceMethod([NSObject class], @selector(awakeFromNib));
    swizzle = class_getInstanceMethod(self, @selector(swizzle_awakeFromNib));
    method_exchangeImplementations(original, swizzle);
}
@end

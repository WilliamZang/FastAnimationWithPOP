//
//  UIView+FastAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FastAnimationWithPop.h"
#import <objc/runtime.h>

#define DEFINE_RW_FLAG(ctype, flag, setter, asstype)            \
static void *flag##Key = &flag##Key;                        \
- (void)setter:(ctype *)value {                                 \
objc_setAssociatedObject(self, flag##Key, value, asstype);  \
}                                                               \
- (ctype *)flag {                                               \
return objc_getAssociatedObject(self, flag##Key);           \
}

#define DEFINE_RW_CGFLOAT_FLAG(flag, setter)                    \
static void *flag##Key = &flag##Key;                        \
- (void)setter: (CGFloat)value {                                \
objc_setAssociatedObject(self, flag##Key,                   \
[NSNumber numberWithFloat:value],                       \
OBJC_ASSOCIATION_RETAIN_NONATOMIC);                     \
}                                                               \
- (CGFloat)flag                                                 \
{                                                               \
return [objc_getAssociatedObject(self, flag##Key)           \
floatValue];                                            \
}

#define DEFINE_RW_CGFLOAT_FLAG_WITH_DEFAULT(flag, setter, default)  \
static void *flag##Key = &flag##Key;                                \
- (void)setter: (CGFloat)value {                                    \
objc_setAssociatedObject(self, flag##Key,                           \
[NSNumber numberWithFloat:value],                                   \
OBJC_ASSOCIATION_RETAIN_NONATOMIC);                                 \
}                                                                   \
- (CGFloat)flag                                                     \
{                                                                   \
id value = objc_getAssociatedObject(self, flag##Key);               \
return value ? [value floatValue] : default;                        \
}

#define DEFINE_RW_DOUBLE_FLAG(flag, setter)                     \
static void *flag##Key = &flag##Key;                            \
- (void)setter: (double)value {                                 \
objc_setAssociatedObject(self, flag##Key,                       \
[NSNumber numberWithDouble:value],                              \
OBJC_ASSOCIATION_RETAIN_NONATOMIC);                             \
}                                                               \
- (double)flag                                                  \
{                                                               \
return [objc_getAssociatedObject(self, flag##Key)               \
doubleValue];                                                   \
}

#define DEFINE_RW_DOUBLE_FLAG_WITH_DEFAULT(flag, setter, default)   \
static void *flag##Key = &flag##Key;                                \
- (void)setter: (double)value {                                     \
objc_setAssociatedObject(self, flag##Key,                           \
[NSNumber numberWithDouble:value],                                  \
OBJC_ASSOCIATION_RETAIN_NONATOMIC);                                 \
}                                                                   \
- (double)flag                                                      \
{                                                                   \
id value = objc_getAssociatedObject(self, flag##Key);           \
return value ? [value doubleValue] : default;                   \
}

@implementation NSObject(FastAnimation)

- (void)swizzle_awakeFromNib
{
    [self swizzle_awakeFromNib];
    UIView *view = (UIView *)self;
    if ([view isKindOfClass:UIView.class]) {
        [view startFAAnimation];
    }
    
}

@end

static void *animationParamsKey = &animationParamsKey;
@implementation UIView (FastAnimation)

DEFINE_RW_FLAG(NSString, animationType, setAnimationType, OBJC_ASSOCIATION_COPY_NONATOMIC)
DEFINE_RW_DOUBLE_FLAG(delay, setDelay)

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

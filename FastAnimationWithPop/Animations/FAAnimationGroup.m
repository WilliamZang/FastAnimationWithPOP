//
//  FAAnimationGroup.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-14.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//
#import "FastAnimationWithPop.h"

Class animationClassForString(NSString *animationType);

@implementation FAAnimationGroup

+ (void)performAnimation:(UIView *)view
{
    NSString *animations = [view valueForKeyPath:kIncludeAnimations];
    NSAssert([animations isKindOfClass:NSString.class], @"animationParams.animations must exists and be a string");
    NSArray *animationClasses = [animations componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@", "]];
    for (NSString *animationClassName in animationClasses) {
        if ([animationClassName isEqualToString:@""]) {
            continue;
        }
        Class animation = animationClassForString(animationClassName);
        NSAssert(animation, @"%@ class not exists", animationClassName);
        NSAssert([animation conformsToProtocol:@protocol(FastAnimationProtocol)], @"%@ must conforms FastAnimationProtocol", animationClassName);
        [animation performAnimation:view];
    }
}

+ (void)stopAnimation:(UIView *)view
{
    NSString *animations = [view valueForKeyPath:kIncludeAnimations];
    NSAssert([animations isKindOfClass:NSString.class], @"animationParams.animations must exists and be a string");
    NSArray *animationClasses = [animations componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@", "]];
    for (NSString *animationClassName in animationClasses) {
        if ([animationClassName isEqualToString:@""]) {
            continue;
        }
        Class animation = animationClassForString(animationClassName);
        NSAssert(animation, @"%@ class not exists", animationClassName);
        NSAssert([animation conformsToProtocol:@protocol(FastAnimationProtocol)], @"%@ must conforms FastAnimationProtocol", animationClassName);
        [animation stopAnimation:view];
    }
}

@end

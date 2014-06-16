//
//  TestAnimation.m
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-12.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import "FAAnimationTest.h"

static BOOL g_animationHasPerform = NO;
static BOOL g_reverseAnimationHasPerform = NO;
@implementation FAAnimationTest

+ (BOOL)animationHasPerform
{
    return g_animationHasPerform;
}

+ (void)performAnimation:(id)view
{
    g_animationHasPerform = YES;
}

+ (void)stopAnimation:(UIView *)view
{

}

+ (void)resetHasPerform
{
    g_animationHasPerform = NO;
    g_reverseAnimationHasPerform = NO;
}
@end

@implementation FAAnimationTestReverse

+ (BOOL)reverseAnimationHasPerform
{
    return g_reverseAnimationHasPerform;
}

+ (void)reverseAnimation:(UIView *)view
{
    g_reverseAnimationHasPerform = YES;
}

+ (void)stopReverse:(UIView *)view
{
    
}
@end